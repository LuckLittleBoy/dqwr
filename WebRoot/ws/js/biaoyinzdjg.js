//jquery自动补全

//定义全局变量

var highlightindex = -1; 	//表示高亮的节点
var timeoutId;				//表示延時向服务器发送请的时间
/*Ajax 自动补全*/

//注册页面装在时执行的方法
$(document).ready(function () {
	//得到文本框对象
	var zdjgInput = $("#zdjg");
	
	//得到文本框距离屏幕左边距和上边的距离
	var zdjgInputOffset = zdjgInput.offset();
	
	//自动补全框最开始隐藏起来
	//添加样式必须现价 css("position","absolute")属性
	$("#zdjgdiv").hide().css("border", "1px black solid").css("position", "absolute").css("top", zdjgInputOffset.top + zdjgInput.height() + 6 + "px").css("left", zdjgInputOffset.left + "px").width(zdjgInput.width() + 2);
	
	//给文本框添加键盘按下并弹起的事件
	$("#zdjg").keyup(function (event) {
		
		//处理文本框中的键盘事件
		//得到弹出框对象
		var zdjgdivNode = $("#zdjgdiv");
		//得到当前按键的code值
		var myEvent = event || window.evnet;
		var keyCode = myEvent.keyCode;
		
		//如果输入的是字母，应该将文本框最新的信息发送给服务器
		//如果输入的是退格键或删除键，也应该将文本框的信息发送给服务器
		if (keyCode >= 65 || keyCode <= 90 || keyCode == 8 || keyCode == 46) {
			//1、首先获取文本框的内容
			var zdjgText = $("#zdjg").val();
			
			//文本内容不为空才将文本框内容发给服务器
			if (zdjgText != "") {
				//2、将文本框的内容发给服务器
				//对上次未执行的延时做清除操作
				clearTimeout(timeoutId);
			
				//对服务器端进行交互延迟500ms,避免快速打字造成的频繁请求
				timeoutId = setTimeout(function(){
					zdjgText=encodeURI(zdjgText);
					zdjgText=encodeURI(zdjgText);
					
					$.post("/kjzc/AutomaticZdjg", {zdjg:zdjgText}, function (data) {
			
						//将dom对象data转换成JQuery的对象
					var jqueryobj = $(data);
					//找到所有zdjg节点
					var zdjgNodes = jqueryobj.find("zdjg");
					//遍历所有的zdjg节点，取出单词内容，然后将单词内容添加到弹出框中
					//清空div里原来的内容
					zdjgdivNode.html("");
					zdjgNodes.each(function (i) {
						//获取单词
						var zdjgNode = $(this);
						//新建div节点,将单词内容加入到新建的节点中
						//将新建的节点加入到弹出框的节点中
						var newDivNode = $("<div>").attr("id",i);
						newDivNode.html(zdjgNode.text()).appendTo(zdjgdivNode);
						//添加鼠标进入事件,高亮节点
						newDivNode.mouseover(function(){
							//将原来高亮的节点取消
							if(highlightindex != -1){
								$("#zdjgdiv").children("div").eq(highlightindex).css("background-color","white");
							}
							//记录新的高亮节点
							highlightindex =  $(this).attr("id");
							$(this).css("background-color","red");
						});
						//鼠标移出，取消高亮
						newDivNode.mouseout(function(){
							//取消节点的高亮
							$(this).css("background-color","white");
						});
						//鼠标补全
						newDivNode.click(function(){											
							//文本框的内容变成高亮显示的内容
							$("#zdjg").val($(this).text());
							
							//隐藏弹出窗体
							$("#zdjgdiv").hide();
						});
					});
					//如果服务服务器端有数据,则显示弹出框
					if (zdjgNodes.length > 0) {
						zdjgdivNode.show();
					} else {
						zdjgdivNode.hide();
						
						//弹出框隐藏时没有高亮显示的节点
						highlightindex = -1;
					}
				}, "xml");
				},500); 
				
				
			} else {
				zdjgdivNode.hide();
				//弹出框隐藏时没有高亮显示的节点
				highlightindex = -1;
			}
		} else if(keyCode == 38) {		//向上键			
			//得到弹出框的所有子节点
			var zdjgdivNodes = $("#zdjg").children("div");
			if(highlightindex != -1){
				//如果原来存在高亮显示节点，则将背景色改为白色
				zdjgdivNodes.eq(highlightindex).css("background-color","white");
				//将highlightindex等于零的情况单独拿出来处理
				if(highlightindex == 0){
					highlightindex = zdjgdivNodes.length - 1;
				}else{
					highlightindex--;
				}			
			}else{
				highlightindex = zdjgdivNodes.length - 1;
			}
			
			//让现在高亮的内容变成红色
			zdjgdivNodes.eq(highlightindex).css("background-color","red");
		}else if(keyCode == 40){ 	//向下键		
			//得到弹出框的所有子节点
			var zdjgdivNodes = $("#zdjgdiv").children("div");
			if(highlightindex != -1){
				//如果原来存在高亮显示节点，则将背景色改为白色
				zdjgdivNodes.eq(highlightindex).css("background-color","white");				
			}	
			highlightindex++;	
			
			if(highlightindex == zdjgdivNodes.length){
				highlightindex = 0;
			}
			//让现在高亮的内容变成红色
			zdjgdivNodes.eq(highlightindex).css("background-color","red");
		}else if (keyCode == 13) {
			//如果输入的是回车
			
			if(highlightindex != -1){
				//取出高亮显示下拉框的内容
				var comText = $("#zdjgdiv").hide().children("div").eq(highlightindex).text();
				//文本框的内容变成高亮显示的内容
				$("#zdjg").val(comText);
				
				highlightindex = -1;
			}else{
			  	var obj = $("#zdjg");
			  	var count = obj.val();
				obj.val("");
			
				
				//让文本框失去焦点
				obj.get(0).blur();
			}			
		}
	});
	
	//给按钮添加事件，表示文本框中的数据被提交
});

