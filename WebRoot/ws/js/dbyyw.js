 function switchTab(ProTag, ProBox) {
            for (i = 1; i < 5; i++) {
                if ("tab" + i == ProTag) {
                    document.getElementById(ProTag).getElementsByTagName("a")[0].className = "on";
                } else {
                    document.getElementById("tab" + i).getElementsByTagName("a")[0].className = "";
                }
                if ("con" + i == ProBox) {
                    document.getElementById(ProBox).style.display = "";
                } else {
                    document.getElementById("con" + i).style.display = "none";
                }
            }
        }



$(document).ready(function () {
	//这里要修改
	$("#zdjg").focus(function(){
		var ss;
		for(var i=0;zdjg.zdjg[i]!=null;i++){

			if(i==0){
				ss=zdjg.zdjg[i].zdjgid+":"+zdjg.zdjg[i].zdjgmc;
			}else
				ss=ss+","+zdjg.zdjg[i].zdjgid+":"+zdjg.zdjg[i].zdjgmc;
		}
		_cache={"1":ss};
		$.openLayer({
			maxItems : 5,
			pid : "1",
			returnText : "zdjg",
			returnValue : "zdjghidden",
			span_width : {d1:120,d2:150,d3:150},
			index : 2
		});
		
	});
	$("#swzc").focus(function(){
		var ss;
		
		for(var i=0;zc.zc[i]!=null&&i<10;i++){
			if(i==0){
				ss=zc.zc[i].ZCWH+":"+zc.zc[i].ZCMC;
			}else
				ss=ss+","+zc.zc[i].ZCWH+":"+zc.zc[i].ZCMC;
		}
		_cache={"2":ss};
		
		$.openLayer2({
			maxItems : 5,
			pid : "2",
			returnText : "swzc",
			returnValue : "swzchidden",
			span_width : {d1:120,d2:150,d3:150},
			index : 3
		});
		document.getElementById("search").focus();
	});
	$("#qqzc").focus(function(){
		var ss;
		for(var i=0;zc.zc[i]!=null&&i<10;i++){

			if(i==0){
				ss=zc.zc[i].ZCWH+":"+zc.zc[i].ZCMC;
			}else
				ss=ss+","+zc.zc[i].ZCWH+":"+zc.zc[i].ZCMC;
		}
		_cache={"3":ss};
		$.openLayer2({
			maxItems : 5,
			pid : "3",
			returnText : "qqzc",
			returnValue : "qqzchidden",
			span_width : {d1:120,d2:150,d3:150},
			index : 4
		});
		document.getElementById("search").focus();
	});
	$("#sxfw").focus(function(){
		var ss;
		for(var i =0 ;sxfw.sxfw[i]!=null||i<10;i++){
			
			if(i==0){
				ss=sxfw.sxfw[i].sxfwid+":"+sxfw.sxfw[i].sxfwmc;
			}else
				ss=ss+","+sxfw.sxfw[i].sxfwid+":"+sxfw.sxfw[i].sxfwmc;
		}
		_cache={"0":ss};
		$.openLayer3({
			maxItems : 5,
			pid : "0",
			returnText : "sxfw",
			returnValue : "sxfwhidden",
			span_width : {d1:120,d2:150,d3:150},
			index : 1
		});
		
	});
	
	
	$("#sxzt").change(function (){
		if($("#sxzt").val()==1){
			$("#fzrq").val("失效时可填")
			$("#fzrq").attr("disabled",true)
		}
		if($("#sxzt").val()==0){
			$("#fzrq").attr("disabled",false)
			$("#fzrq").val("")
		}
	})
	
	$(function(){
		//检查上位政策
		$("#swzchidden").blur(function(){
			var errorsw="";
			swlist = new Array;
			swlist = jQuery("#swzchidden").val().split(";");
			$.ajaxSetup({
				async:false
			});
			for(var i=0;i<swlist.length;i++){
				jQuery.post("/kjzc/CheckSWQQ",{"zcwh":swlist[i]},function(response){
					if (errorsw==""){
						errorsw=response;
					}
					else
						errorsw+=response;
				});
			}
			if(errorsw!=""){
				alert("不存在的政策文号：\""+errorsw+"\"将不被录入");
			}
		});
		
		$("#qqzchidden").blur(function(){
			var errorsw="";
			swlist = new Array;
			swlist = jQuery("#qqzchidden").val().split(";");
			
			$.ajaxSetup({
				async:false
			});
			for(var i=0;i<swlist.length;i++){
				jQuery.post("/kjzc/CheckSWQQ",{"zcwh":swlist[i]},function(response){
					if (errorsw==""){
						errorsw=response;
					}
					else
						errorsw+=response;
				});
			}
			if(errorsw!=""){
				alert("不存在的政策文号：\""+errorsw+"\"将不被录入");
			}
		});
		
		
		
		//检查政策名称
		$("#zcmc").blur(function(){
			var s = jQuery("#zcmc").val().replace(" ","");
			jQuery("#zcmc").val(s);
			jQuery(".form").html("");
			if(jQuery("#zcmc").val()!=""){
				jQuery.post("/kjzc/CheckZCMC",{"zcmc":jQuery("#zcmc").val()},function(response){
					jQuery(".form").html(response);
				});
			}
			if(jQuery(".form").html()!=""){
				jQuery(".form").html("");
				$("#BgDiv").css({ display:"block",height:$(document).height()});
				var yscroll=document.documentElement.scrollTop;
				$("#DialogDiv").css("top","100px");
				$("#DialogDiv").css("display","block");
				document.documentElement.scrollTop=0;
			}
		});
		$("#zcwh").blur(function(){
			var s = jQuery("#zcwh").val().replace(" ","");
			jQuery("#zcwh").val(s);
			jQuery(".form").html("");
			if(jQuery("#zcwh").val()!=""){
				jQuery.post("/kjzc/CheckZCWH",{"zcwh":jQuery("#zcwh").val()},function(response){
					jQuery(".form").html(response);
				});
			}
			if(jQuery(".form").html()!=""){
				jQuery(".form").html("");
				$("#BgDiv").css({ display:"block",height:$(document).height()});
				var yscroll=document.documentElement.scrollTop;
				$("#DialogDiv").css("top","100px");
				$("#DialogDiv").css("display","block");
				document.documentElement.scrollTop=0;
			}
		});
		$("#btnClose").click(function(){
			$("#BgDiv").css("display","none");
			$("#DialogDiv").css("display","none");
		});
	});
})
$(function(){
	$("#zcfl").suggest(zcfls,{hot_list:zcfls,dataContainer:'#zcflhidden',attachObject:"#suggest3"});
	$("#bbxs").suggest(bbxss,{hot_list:bbxss,dataContainer:'#bbxshidden',attachObject:"#suggest4"});
	$("#tzly").suggest(tzlys,{hot_list:tzlys,dataContainer:'#tzlyhidden',attachObject:"#suggest7"});
	$("#ztc1hidden").suggest(ztcs,{hot_list:ztcs,dataContainer:'#ztc1',attachObject:"#suggest8"});
	$("#ztc2hidden").suggest(ztcs,{hot_list:ztcs,dataContainer:'#ztc2',attachObject:"#suggest9"});
	$("#ztc3hidden").suggest(ztcs,{hot_list:ztcs,dataContainer:'#ztc3',attachObject:"#suggest10"});
	$("#ztc4hidden").suggest(ztcs,{hot_list:ztcs,dataContainer:'#ztc4',attachObject:"#suggest11"});
	$("#ztc5hidden").suggest(ztcs,{hot_list:ztcs,dataContainer:'#ztc5',attachObject:"#suggest12"});
	
	
});
//匹配中文 数字 字母 下划线       


function stripscript(s) {
    var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）&mdash;—|{}【】‘；：”“'。，、？]")
        var rs = "";
    for (var i = 0; i < s.length; i++) {
        rs = rs + s.substr(i, 1).replace(pattern, '');
    }
    return rs;
}



/**
 * 校验所有输入域是否含有特殊符号
 * 所要过滤的符号写入正则表达式中，注意，一些符号要用'\'转义.
 * 试例：
 * if(checkAllTextValid(document.forms[0]))
 * alert("表单中所有文本框通过校验！");
 */
function checkAllTextValid(form) {
	if(jQuery("#text").text()==""||jQuery("#text").text()==null){
		alert("政策内容不能为空");
		return false;
	}
	if(jQuery("#zcmc").val()==""||jQuery("#zcmc").val()==null){
		alert("政策名称不能为空");
		return false;
	}
	if(jQuery("#zcwh").val()==""||jQuery("#zcwh").val()==null){
		alert("政策文号不能为空");
		return false;
	}
	var sxrq=$("#sxrq").val();
	var gbrq=$("#gbrq").val();
	if(sxrq!=null&&gbrq!=null){
		var tag = duibi2(gbrq,sxrq);
		alert(tag);
		if(tag=="false"){
			return false;
		}
	}
	//记录不含引号的文本框数量
    var resultTag = 0;
    //记录所有text文本框数量
    var flag = 0;
    for (var i = 0; i < form.elements.length; i++) {
        if (form.elements[i].type == "text") {
            flag = flag + 1;
            //此处填写所要过滤的特殊符号
            //注意：修改####处的字符，其它部分不许修改.
            //if(/^[^####]*$/.test(form.elements[i].value))
            if (/^[^\|"'<>]*$/.test(form.elements[i].value))
                resultTag = resultTag + 1;
            else
                form.elements[i].select();
        }
    }
    
    /**
     * 如果含引号的文本框等于全部文本框的值，则校验通过
     */
    if (resultTag == flag)
        return true;
    else {
        alert("文本框中不能含有\n\n 1 单引号: ' \n 2 双引号: \" \n 3 竖 杠: | \n 4 尖角号: < > \n\n请检查输入！");
        return false;
    }
}
function duibi(a, b) {
    var arr = a.split("-");
    var starttime = new Date(arr[0], arr[1], arr[2]);
    var starttimes = starttime.getTime();

    var arrs = b.split("-");
    var lktime = new Date(arrs[0], arrs[1], arrs[2]);
    var lktimes = lktime.getTime();

    if (starttimes >= lktimes) {

        
        return true;
    }
    else{
        return false;
    }
}
function duibi2(a, b) {
    var arr = a.split("-");
    var starttime = new Date(arr[0], arr[1], arr[2]);
    var starttimes = starttime.getTime();

    var arrs = b.split("-");
    var lktime = new Date(arrs[0], arrs[1], arrs[2]);
    var lktimes = lktime.getTime();

    if (starttimes > lktimes) {

        return true;
    }
    else{
        return false;
    }
}


function show_tijiao(shzt){
	var shzt1 = shzt;
	
	CheckIsValid(shzt1);
}
function CheckIsValid(shzt)
{
	var qqtag;
	var swtag;
	var sxtag;
	if(document.getElementById("qqtag").checked)qqtag=1;
	else qqtag=0;
	if(document.getElementById("swtag").checked)swtag=1;
	else swtag=0;
	if(document.getElementById("sxtag").checked)sxtag=1;
	else sxtag=0;
	var sxfwmc=$("#sxfw").val();
	var zdjgmc=$("#zdjg").val();
	var zcmc=$("#zcmc").val();
	var sxfw=$("#sxfwhidden").val();
	var zcwh=$("#zcwh").val();
	var zcfl=$("#zcflhidden").val();
	var zdjg=$("#zdjghidden").val();
	var bbxs=$("#bbxshidden").val();
	var gbrq=$("#gbrq").val();
	var sxrq=$("#sxrq").val();
	var tzly=$("#tzlyhidden").val();
	var swzc=$("#swzchidden").val();
	var qqzc=$("#qqzchidden").val();
	var sxzt=$("#sxzt").val();
	var fzrq=$("#fzrq").val();
	var gjz1=$("#gjz1").val();
	var gjz2=$("#gjz2").val();
	var gjz3=$("#gjz3").val();
	var gjz4=$("#gjz4").val();
	var gjz5=$("#gjz5").val();
	var gjz6=$("#gjz6").val();
	var gjz7=$("#gjz7").val();
	var gjz8=$("#gjz8").val();
	var gjz9=$("#gjz9").val();
	var gjz10=$("#gjz10").val();
	var ztc1=$("#ztc1").val();
	var ztc2=$("#ztc2").val();
	var ztc3=$("#ztc3").val();
	var ztc4=$("#ztc4").val();
	var ztc5=$("#ztc5").val();
	var zcnr=$("#content1").val();
	var zcid=$("#zcid").val();
	var shzt1=shzt;
	if(jQuery("#content1").val()==""||jQuery("#content1").val()==null){
		alert("政策内容不能为空");
		
	}else if(jQuery("#zcmc").val()==""||jQuery("#zcmc").val()==null){
		alert("政策名称不能为空");
		$("#zcmc").focus();
	}else if(jQuery("#zcwh").val()==""||jQuery("#zcwh").val()==null){
		alert("政策文号不能为空");
		$("#zcwh").focus();
	}else if(duibi2(gbrq,sxrq)&&gbrq!=null&&sxrq!=null){
		alert('公布日期只能在施行日期之前！');
	}else if(duibi(sxrq,fzrq)&&sxrq!=null&&fzrq!=null){
		alert('施行日期只能在废止之前！');
	}else if(jQuery("#zcfl").val()==""||jQuery("#zcfl").val()==null){
		alert('政策分类不能为空');
	}else if(jQuery("#zcfl").val()!=""&&jQuery("#zcflhidden").val()==null){
		alert('无效政策分类！');
	}else{
		$.ajax({
			type: 'POST',
			url : "zcluru",
			data : {
				"qqtag":qqtag,
				"swtag":swtag,
				"sxtag":sxtag,
				"zcmc":zcmc,
				"sxfw":sxfw,
				"zcwh":zcwh,
				"zcfl":zcfl,
				"zdjg":zdjg,
				"bbxs":bbxs,
				"gbrq":gbrq,
				"sxrq":sxrq,
				"tzly":tzly,
				"swzc":swzc,
				"qqzc":qqzc,
				"sxzt":sxzt,
				"fzrq":fzrq,
				"gjz1":gjz1,
				"gjz2":gjz2,
				"gjz3":gjz3,
				"gjz4":gjz4,
				"gjz5":gjz5,
				"gjz6":gjz6,
				"gjz7":gjz7,
				"gjz8":gjz8,
				"gjz9":gjz9,
				"gjz10":gjz10,
				"ztc1":ztc1,
				"ztc2":ztc2,
				"ztc3":ztc3,
				"ztc4":ztc4,
				"zcnr":zcnr,
				"ztc5":ztc5,
				"shzt":shzt1,
				"sxfwmc":sxfwmc,
				"zdjgmc":zdjgmc,
				"zcid":zcid,
			},
			dataType : "text",
			success : function(r) {
			if(r=="true"){
					alert("添加成功");
					window.location.href="ws/dbyzc.jsp";
		      }
		      else{
		    	  alert(r);
		      }
			}
		})
	}	
}


