// options: {width,height,editareaId,htmlHiddenVaueId,sourceEditorId,toolbars}
// htmlHiddenValueId - 在父页面中存放正在编辑的HTML内容的隐藏输入框
// toolbar: {name,src}
var RichEditor = Class.create({
	_options: {},
	_fontFamilyPickerId: null,
	_fontSizePickerId: null,
	_foreColorPickerId: null,
	_backColorPickerId: null,
	_tableCreatorId: null,

	_getEditAreaFrame: function(){ return window.frames[this._options.editareaId]; },

	// 关闭除当前操作窗口之外的所有对话窗口（包括菜单和层）
	_closeDialogsButCurrent: function(event){
		[this._fontFamilyPickerId, this._fontSizePickerId, this._foreColorPickerId, this._backColorPickerId].each(function(dialog){
				var e = Event.element(event);
				if(dialog && e.id != dialog && !e.up('#' + dialog)){
					$(dialog).hide();
				}
			});
	},

	// 关闭所有对话窗口（包括菜单和层）
	_closeDialogs: function(event){
		[this._fontFamilyPickerId, this._fontSizePickerId, this._foreColorPickerId, this._backColorPickerId].each(function(dialog){
				if(dialog && $(dialog)) $(dialog).hide();
			});
	},

	initialize: function(options){
		this._options = options;

		Event.observe(window, 'load', function(){
			var fdoc = this._getEditAreaFrame().document;
			// 打开编辑模式
			fdoc.designMode = "on";
			if(!Prototype.Browser.IE) fdoc.execCommand("useCSS", false, true);

			// 初始化编辑区
			var html = parent.document.getElementById(options.htmlHiddenVaueId).value;
			if(html){
				fdoc.open();
				fdoc.write('<html><head><link rel="stylesheet" type="text/css" href="editorArea.css" /></head><body monospace>');
				fdoc.write(html);
				fdoc.write('</body></html>');
				fdoc.close();
			}
			f = null; html = null;

			// 注册弹出菜单和弹出层的关闭脚本
			Event.observe(document, 'click', this._closeDialogsButCurrent.bind(this));
			Event.observe(fdoc, 'click', this._closeDialogs.bind(this));
		}.bind(this));
	},

	// 为按钮加上动态效果
	decorateIcon: function(img){
		Event.observe(img, 'mouseover', function(event){
				Event.element(event).setStyle({borderRight:"1px solid #aaa", borderBottom:"1px solid #aaa", borderTop:"1px solid #fff", borderLeft:"1px solid #fff"});
			});
		Event.observe(img, 'mousedown', function(event){
				Event.element(event).setStyle({borderRight:"1px solid #f3f8fc", borderBottom:"1px solid #f3f8fc", borderTop:"1px solid #cccccc", borderLeft:"1px solid #cccccc"});
			});
		Event.observe(img, 'mouseout', function(event){
				Event.element(event).setStyle({border:"none"});
			});
	},
	
	// 格式化（执行格式相关命令）
	format: function(cmd, arg){
		// 获取编辑区页面（嵌入帧iframe）
		var f = this._getEditAreaFrame();
		f.focus();
		// 带参数执行和不带参数两种方式
		if(arg){
			f.document.execCommand(cmd,false,arg);
		}else{
			if(Prototype.Browser.IE){
				f.document.execCommand(cmd)
			}else{
				f.document.execCommand(cmd,false,false);
			}
		}
	},
	
	// 获取当前内容（注意：根据编辑模式的不同，分别从HTML编辑器或者源码编辑器中获取内容）
	getContent: function(){
		var htmlEditorPanel = $(this._options.htmlEditorPanel);
		var sourceEditorPanel = $(this._options.sourceEditorPanel);
		if(htmlEditorPanel.visible()){
			var htmlEditor = this._getEditAreaFrame();
			return htmlEditor.document.body.innerHTML;
		}else{
			var sourceEditor = $(this._options.sourceEditorId);
			return $F(sourceEditor);
		}
	},

	// 演习运行预览
	dryRun: function(){
		var win = window.open('', "_blank", '');
		var doc = win.document;
		doc.open('text/html', 'replace');
		win.opener = null;
		var content = this.getContent();
		doc.write(testCode);
		doc.close();
	},

	// 切换编辑模式
	switchEditMode: function(mode){
		var htmlEditorPanel = $(this._options.htmlEditorPanel);
		var htmlEditor = this._getEditAreaFrame();
		var sourceEditor = $(this._options.sourceEditorId);
		var sourceEditorPanel = $(this._options.sourceEditorPanel);
		var fdoc = htmlEditor.document;
		if(mode == 'Source'){
			sourceEditor.value = fdoc.body.innerHTML;
			sourceEditorPanel.show();
			htmlEditorPanel.hide();
		}else{
			fdoc.body.innerHTML = sourceEditor.value;
			sourceEditorPanel.hide();
			htmlEditorPanel.show();
		}
	},
	
	// 设置字体
	fontFamily: function(event){
		if(!this._fontFamilyPickerId) this._fontFamilyPickerId = this._createFontFamilyPicker();
		$(this._fontFamilyPickerId).show().setStyle({left:(Event.pointerX(event) - 10)+'px', top:(Event.pointerY(event)-10)+'px'});
		Event.stop(event);
	},
	
	// 创建字体选择器
	_createFontFamilyPicker: function(event){
		var div = new Element('div');
		div.setStyle({display:'none', width:'100px', position:'absolute', border:'2px solid #c3c9cf', padding:'1px 1px 1px 1px', backgroundColor:'#f8f8f8'});
		div.innerHTML = new RichEditor.FontFamilyPicker().draw();
		document.body.insertBefore(div, null);

		// 鼠标移开时自动隐藏
		Event.observe(div, 'mouseout', function(event){
				if(!Position.within(div, event.pointerX(), event.pointerY())) div.hide();
			}.bind(this));

		// 动态加入样式表，IE和Firefox的方式有较大区别
		if(Prototype.Browser.IE){
			var sheet = document.createStyleSheet();
			sheet.addRule('#' + div.identify() + ' a','background-color:#f8f8f8;');
			sheet.addRule('#' + div.identify() + ' a:hover','background-color:#e3e6e9;');
		}else{
			var styleSheet = new Element('style');
			styleSheet.innerHTML = '\n#' + div.identify() + ' a:hover {background-color:#e3e6e9;}\n'
				+ '#' + div.identify() + ' a {background-color:#f8f8f8;}\n';
			div.insertBefore(styleSheet, null);
		}

		Event.observe(div, 'click', function(event){
				var c = Event.element(event);
				if(c.tagName == 'A'){
					var td = c.up(0);
					if (td && td.id == div.identify()){
						this.format("fontname", c.innerHTML);
						div.hide();
					}
				}
			}.bindAsEventListener(this));

		return div.identify();
	},

	// 设置字体大小
	fontSize: function(event){
		if(!this._fontSizePickerId) this._fontSizePickerId = this._createFontSizePicker();
		$(this._fontSizePickerId).show().setStyle({left:(Event.pointerX(event) - 15)+'px', top:(Event.pointerY(event)-10)+'px'});
		Event.stop(event);
	},

	// 创建字体大小选择器
	_createFontSizePicker: function(event){
		var div = new Element('div');
		div.setStyle({display:'none', width:'100px', position:'absolute', border:'2px solid #c3c9cf', padding:'1px 1px 1px 1px', backgroundColor:'#fff'});
		div.innerHTML = new RichEditor.FontSizePicker().draw();
		document.body.insertBefore(div, null);

		Event.observe(div, 'mouseout', function(event){
				if(!Position.within(div, event.pointerX(), event.pointerY())) div.hide();
			}.bind(this));

		if(Prototype.Browser.IE){
			var sheet = document.createStyleSheet();
			sheet.addRule('#' + div.identify() + ' a','background-color:#f8f8f8;');
			sheet.addRule('#' + div.identify() + ' a:hover','background-color:#e3e6e9;');
		}else{
			var styleSheet = new Element('style');
			styleSheet.innerHTML = '\n#' + div.identify() + ' a:hover {background-color:#e3e6e9;}\n'
				+ '#' + div.identify() + ' a {background-color:#f8f8f8;}\n';
			div.insertBefore(styleSheet, null);
		}

		Event.observe(div, 'click', function(event){
				var c = Event.element(event);
				if(c.tagName == 'A'){
					var td = c.up(0);
					if (td && td.id == div.identify()){
						this.format("fontsize", c.readAttribute('sizevalue'));
						div.hide();
					}
				}
			}.bindAsEventListener(this));

		return div.identify();
	},

	// 设置前景色
	foreColor: function(event){
		if(!this._foreColorPickerId) this._foreColorPickerId = this._createColorPicker('forecolor');
		$(this._foreColorPickerId).show().setStyle({left:(Event.pointerX(event) - 140)+'px', top:(Event.pointerY(event)-10)+'px'});
		Event.stop(event);
	},

	// 设置背景色
	backColor: function(event){
		if(!this._backColorPickerId) this._backColorPickerId = this._createColorPicker(Prototype.Browser.IE?'backcolor':'hilitecolor');
		$(this._backColorPickerId).show().setStyle({left:(Event.pointerX(event) - 140)+'px', top:(Event.pointerY(event)-10)+'px'});
		Event.stop(event);
	},
	
	// 创建颜色拾取器
	_createColorPicker: function(cmd){
		var div = new Element('div');
		div.setStyle({display:'none', width:'216px', position:'absolute', border:'2px solid #c3c9cf', padding:'1px 1px 1px 1px', backgroundColor:'#fff'});
		div.innerHTML = new RichEditor.ColorPicker().draw();
		document.body.insertBefore(div, null);

		Event.observe(div, 'mouseout', function(event){
				if(!Position.within(div, event.pointerX(), event.pointerY())) div.hide();
			}.bind(this));
		
		var cube = div.getElementsByClassName('Cube')[0];
		var colorView = div.getElementsByClassName('ColorView')[0];
		var colorCode = div.getElementsByClassName('ColorCode')[0];
		Event.observe(cube, 'mousemove', function(event){
				var c = Event.element(event);
				if(c.tagName == 'IMG'){
					var td = c.up(0);
					if (td && td.className == 'ColorSelectorCell'){
						colorView.setStyle({backgroundColor:td.bgColor});
						colorCode.innerHTML = td.bgColor;
					}
				}
			}.bind(this));

		Event.observe(cube, 'click', function(event){
				var c = Event.element(event);
				if(c.tagName == 'IMG'){
					var td = c.up(0);
					if (td && td.className == 'ColorSelectorCell'){
						this.format(arguments[1], td.bgColor);
						div.hide();
					}
				}
			}.bindAsEventListener(this, cmd));

		return div.identify();
	},

	// 清除格式
	removeFormat: function(){
		this.format("removeFormat");
	},

	// 简单方式创建超链接
	createHyperlink: function(){
		var url = window.prompt("请输入网址（例如：http://www.unigc.com）：", "http://");
		if ((url != null) && (url != "http://")){
			this.format("CreateLink", url);
		}
	},

	// 简单方式创建图片
	createImage: function(){
		var url = window.prompt("请输入图片地址（例如：http://www.unigc.com/logo.gif）：", "http://");
		if ((url != null) && (url != "http://")){
			this.format("InsertImage", url);
		}
	},
		
	// 创建表格
	createTable: function(event){
		if(!this._tableCreatorId) this._tableCreatorId = this._createTableCreator();
		$(this._tableCreatorId).show().setStyle({left:(Event.pointerX(event)-10)+'px', top:(Event.pointerY(event)-10)+'px'});
		Event.stop(event);
	},

	// 创建表格创建器
	_createTableCreator: function(){
		var div = new Element('div');
		div.setStyle({display:'none', width:'176px', position:'absolute', border:'2px solid #c3c9cf', padding:'1px 1px 1px 1px', backgroundColor:'#f8f8f8'});
		div.innerHTML = new RichEditor.TableCreator().draw();
		document.body.insertBefore(div, null);

		// 鼠标移开时自动隐藏
		Event.observe(div, 'mouseout', function(event){
				if(!Position.within(div, event.pointerX(), event.pointerY())) div.hide();
			}.bind(this));

		Event.observe(div, 'click', function(event){
				var current = Event.element(event);
				var submit = div.down('.submit');
				var cancel = div.down('.cancel');
				if(current!=submit){
					if(current==cancel) div.hide();
					return;
				}

				var rows = $F(div.down('.rows'));
				var cols = $F(div.down('.cols'));
				var width = $F(div.down('.width'));

				var html = this._createTable(rows, cols, width);
				this._insertHTML(html);
				div.hide();
			}.bindAsEventListener(this));

		return div.identify();
	},
	
	_createTable: function(rows, cols, width){
		var builder = [];
		builder.push('<table border="1" width="');builder.push(width);builder.push('">');
		for(var r = 0; r < rows; r++){
			builder.push('<tr>');
			for(var c = 0; c < cols; c++){
				builder.push('<td>&nbsp;</td>');
			}
			builder.push('</tr>');
		}
		builder.push('</table>');
		return builder.join('');
	},

	// 插入指定的HTML到当前位置
	_insertHTML: function(html){
		var f = this._getEditAreaFrame();
		f.focus();
		if(Prototype.Browser.IE){
			f.document.selection.createRange().pasteHTML(html);
		}else{
			// Firefox的插入方式要复杂得多
			var selection = f.window.getSelection();
			var range;
			if (selection) { range = selection.getRangeAt(0);}
			else { range = editor.document.createRange();}

			var fragment = f.document.createDocumentFragment();
			var div = f.document.createElement('div');
			div.innerHTML = html;

			while(div.firstChild) {
				fragment.appendChild(div.firstChild);
			}

			selection.removeAllRanges();
			range.deleteContents();

			var node = range.startContainer;
			var pos = range.startOffset;

			switch (node.nodeType) {
				case 3:
					if (fragment.nodeType == 3) {
						node.insertData(pos, fragment.data);
						range.setEnd(node, pos + fragment.length);
						range.setStart(node, pos + fragment.length);
					} else {
						node = node.splitText(pos);
						node.parentNode.insertBefore(fragment, node);
						range.setEnd(node, pos + fragment.length);
						range.setStart(node, pos + fragment.length);
					}
					break;

				case 1:
					node = node.childNodes[pos];
					node.parentNode.insertBefore(fragment, node);
					range.setEnd(node, pos + fragment.length);
					range.setStart(node, pos + fragment.length);
					break;
			}
			selection.addRange(range);
		}
	}
});

/*
 * 颜色拾取器，用于前景色、背景色的拾取
 */
RichEditor.ColorPicker = Class.create({
	_hex: ['FF', 'CC', '99', '66', '33', '00'],

	// 呈现一个颜色格
	_drawCell: function(builder, red, green, blue){
		builder.push('<td bgcolor="');
		builder.push('#' + red + green + blue);
		builder.push('" style="height:12px;width:12px;" Class="ColorSelectorCell"><img src="place.gif" height="12" width="12" border="0"></td>');
	},

	// 呈现一行颜色
	_drawRow: function(builder, red, blue){
		builder.push('<tr>');
		for (var i = 0; i < 6; ++i) {
			this._drawCell(builder, red, this._hex[i], blue)
		}
		builder.push('</tr>');
	},

	// 呈现六个颜色区之一
	_drawTable: function(builder, blue){
		builder.push('<table cellpadding="0" cellspacing="0" border="0">');
		for (var i = 0; i < 6; ++i) {
			this._drawRow(builder, this._hex[i], blue)
		}
		builder.push('</table>');
	},

	// 获取拾取器的HTML代码
	draw: function(){
		var builder = [];

		builder.push('<table class="Cube" cellpadding=0 cellspacing=0 style="border:0px #888888 solid"><tr>');
		for (var i = 0; i < 3; ++i) {
			builder.push('<td bgcolor="#FFFFFF">');
			this._drawTable(builder, this._hex[i]);
			builder.push('</td>');
		}
		builder.push('</tr><tr>');
		for (var i = 3; i < 6; ++i) {
			builder.push('<td bgcolor="#FFFFFF">');
			this._drawTable(builder, this._hex[i])
			builder.push('</td>');
		}
		builder.push('</tr></table>');
		builder.push('<table height="25" cellSpacing="0" cellPadding="0" border="0" width="216" style="margin-top:2px">');
		builder.push('<tbody><tr><td class="ColorView" width=110>&nbsp;</td>')
		builder.push('<td class="ColorCode" style="background-color:#eee;text-align:center;font-weight:700;color:#666;font-size:16px"></td></tr></tbody></table>');
		return builder.join('');
	}
});

/*
 * 字体选择器，用于选择字体
 */
RichEditor.FontFamilyPicker = Class.create({

	_fontFamilies: ['宋体', '黑体', '楷体', '隶书', '幼圆', 'Arial', 'Arial Narrow', 'Arial Black', 'Comic Sans MS', 'Courier', 'System', 'New Roman', 'Times', 'Verdana'],

	// 呈现一行（一行就是一种字体）
	_drawRow: function(builder, fontFamily){
		builder.push('<a style="font:12px \'');
		builder.push(fontFamily);
		builder.push('\';display:block;text-decoration:none;color:#000000;padding:2px 2px 2px 2px;" href="javascript:void(0)">');
		builder.push(fontFamily);
		builder.push("</a>");
	},

	draw: function(){
		var builder = [];
		this._fontFamilies.each(function(fontFamily){
				this._drawRow(builder, fontFamily);
			}.bind(this));
		return builder.join('');
	}
});

/*
 * 字号选择器，用于选择字号
 */
RichEditor.FontSizePicker = Class.create({

	_fontSizes: [[1, 'xx-small', '最小'],
		[2, 'x-small', '特小'],
		[3, 'small', '小'],
		[4, 'medium', '中'],
		[5, 'large', '大'],
		[6, 'x-large', '特大'],
		[7, 'xx-large', '最大']],

	// 呈现一行（一行就是一种字号）
	_drawRow: function(builder, fontSize){
		builder.push('<a style="font-size:');
		builder.push(fontSize[1]);
		builder.push(';display:block;text-decoration:none;color:#000000;padding:2px 2px 2px 2px;" href="javascript:void(0)" sizevalue="');
		builder.push(fontSize[0]);
		builder.push('">');
		builder.push(fontSize[2]);
		builder.push("</a>");
	},

	draw: function(){
		var builder = [];
		var size = 1;
		this._fontSizes.each(function(fontSize){
				this._drawRow(builder, fontSize);
			}.bind(this));
		return builder.join('');
	}
});


/*
 * 表格创建器，设置表格的行和列
 */
RichEditor.TableCreator = Class.create({

	// 呈现Input
	_drawInput: function(builder, name, value){
		builder.push('<input style="border:1px solid #69f;width:80px;height:14px;line-height:12px;font-size:12px;" class="');
		builder.push(name);
		builder.push('" value="');builder.push(value);builder.push('" />');
	},

	draw: function(){
		var builder = [];

		builder.push('<table style="margin:10px 10px 5px 10px">');

		// 标题
		builder.push('<tr><td colspan="2" style="font-size:12px;color:#777;background-color:#eee;">');
		builder.push('插入表格');
		builder.push('</td></tr>');

		// 行数
		builder.push('<tr><td style="font-size:12px;color:#777;">行数</td><td style="font-size:12px">');
		this._drawInput(builder, 'rows', 3);
		builder.push('</td></tr>');

		// 列数
		builder.push('<tr><td style="font-size:12px;color:#777;">列数</td><td style="font-size:12px">');
		this._drawInput(builder, 'cols', 5);
		builder.push('</td></tr>');

		// 宽度
		builder.push('<tr><td style="font-size:12px;color:#777;">宽度</td><td style="font-size:12px">');
		this._drawInput(builder, 'width', 300);
		builder.push('</td></tr>');

		// 提交
		builder.push('<tr><td colspan="2" style="font-size:12px;color:#777;text-align:center;padding-top:6px;">');
		builder.push('<input style="font-size:12px;color:#777;border:1px solid #777;background-color:#f4f4f4;margin-right:10px;" type="button" class="submit" value="提交" />');
		builder.push('<input style="font-size:12px;color:#777;border:1px solid #777;background-color:#f4f4f4;" type="button" class="cancel" value="取消" />');
		builder.push('</td></tr>');

		builder.push('</table>');
		
		return builder.join('');
	}
});