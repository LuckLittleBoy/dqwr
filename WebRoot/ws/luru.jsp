<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- 录入 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script language="javascript" src="../js/prototype.js"></script>
		<script language="javascript" src="../js/richeditor.js"></script>
<style type="text/css">
body { font:14px/1.5  宋体,宋体, \5b8b\4f53, sans-serif; }
	ul { margin:0; padding:0; list-style:none; }
	a { margin-left:5px; color:#07F; text-decoration:none; }
	a:hover { text-decoration:underline; }
	input { border:1px solid #ccc; margin:2px; }
	table { border-collapse:collapse; border-spacing:0; }
	td { margin:0; padding:10px; border:1px solid #ccc; }
	th{
		border-color: #666666;
		background-color: #dedede;
	}
</style>
<title>政策录入</title>
<SCRIPT type=text/javascript>	


	function getuploadpregress(){
		if("success"==getmsg()){
			
			configmsg();
		}
	}
	function configmsg(){
		var requestmsg="";
		var xhr=getxmlhttp();
		//准备连接
		
		var url="../PdfToText";

		//响应函数，请求时调用
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				
				if(xhr.status==200||xhr.status==304)
				{				
					requestmsg=xhr.responseText;	
					var s=requestmsg.toString();
					
					document.getElementById("content").value=s;
					document.getElementById("text").src="kindeditor-4.1.7/jsp/demo.jsp";
					var title=s.substring(1, s.indexOf("政策")+2);
					var time="";
					for(var i=0;i<10;i++)
					
					/* for(var i=0;i<100;i++){
						if(time.length<20&&time.length>5)break;
						for(var j=0;j<100;j++){
							if(s.indexOf("年",i)<s.indexOf("月",j)){
								time=s.substring(s.indexOf("年",i)-5, s.indexOf("月",j)+2);
								alert(time);
								if(time.length<20&&time.length>5)break;
							}
							
						}
					} */
					var time=s.substring(s.indexOf("年")-5, s.indexOf("月")+2);
					document.getElementById('policyname').value=title;
					document.getElementById('date').value=time;
				}
			}
		};	
		xhr.open("post",url,false);//方式、请求url，是否异步
		xhr.send(null);
		
	}
	function clearmsg(){
		document.getElementById('uploadmsg').innerHTML='<br>';
		fileuploaddiv_isShow();
		}
	function getmsg(){
		var requestmsg="";
		var xhr=getxmlhttp();
		var s=document.uploadform.uploadfile.value.split('\\');
		var filename=s[s.length-1];
		//准备连接
		var url="../CheckLoaded?filename="+filename;
		
		//处理含有中文的url
		url=encodeURI(url); 
		url=encodeURI(url);
		//响应函数，请求时调用
		xhr.open("post",url,false);//方式、请求url，是否异步
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				
				if(xhr.status==200||xhr.status==304)
				{				
					requestmsg=xhr.responseText;	
					
				}
			}
		};	
		
		xhr.send(null);
		
		return requestmsg;
	
	}
	
	function downloadpdf(){
		var requestmsg="";
		var xhr=getxmlhttp();
		var content=document.getElementById('content').value;
		//准备连接
		var url="TextToPdf";
		//处理含有中文的url
		url=encodeURI(url); 
		url=encodeURI(url);
		//响应函数，请求时调用
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				
				if(xhr.status==200||xhr.status==304)
				{				
					requestmsg=xhr.responseText;	
					//alert(requestmsg);
					startdownload()
					//document.getElementById('download').innerHTML="<a href='L:/1.pdf'>下载</a>"
				}
			}
		};	
		xhr.open("post",url,true);//方式、请求url，是否异步
		//传输大数据
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("content="+content);

		
	}
function startdownload(){
	document.getElementById('download').src="../Down";
		
	}
	
	//获取xmlhttprequest
	function getxmlhttp()
	{
		var xmlhttp=null;
		try
		{
			xmlhttp=new XMLHttpRequest();
		}catch(e)
		{
			var MSXML=['MSXML2.XMLHTTP.6.0','MSXML2.XMLHTTP.5.0',
			'MSXML2.XMLHTTP.4.0','MSXML2.XMLHTTP.3.0','MSXML2.XMLHTTP',
			'Microsoft.XMLHTTP'];
			for(var n=0;n<MSXML.length;n++)
			{
				try{
				xmlhttp=new ActiveXObject(MSXML[n]);
				break;
				}
				catch(e){}
			}
		}
		return xmlhttp;
	}
	
function gotobiaoyin(){
	parent.window.location.href="biaoyin.jsp";
}
	


</SCRIPT>

<style type="text/css">
body {margin:0px}

.ico {vertical-align:middle; width:24px; height:24px; text-align:center}
.ico2 {vertical-align:middle; width:27px; height:24px; text-align:center}
.ico3 {vertical-align:middle; width:25px; height:24px; text-align:center}
.ico4 {vertical-align:middle; width:8px; height:24px; text-align:center}

.icons{width:20px;height:20px;background-image:url(images/icons.gif);background-repeat:no-repeat;}
.iconRemoveFormat{background-position:-343px 0}
.iconFontFamily{width:25px;background-position:-293px 0}
.iconFontSize{width:25px;background-position:-318px 0}
.iconBold{background-position:-4px 0}
.iconItalic{background-position:-24px 0}
.iconUnderline{background-position:-44px 0}
.iconJustifyLeft{background-position:-64px 0}
.iconJustifyCenter{background-position:-84px 0}
.iconJustifyRight{background-position:-104px 0}
.iconInsertOrderedList{background-position:-124px 0}
.iconInsertUnorderedList{background-position:-144px 0}
.iconIndent{background-position:-164px 0}
.iconOutdent{background-position:-184px 0}
.iconInsertHyperlink{background-position:-204px 0}
.iconInsertImage{background-position:-227px 0}
.iconForeColor{background-position:-246px 0}
.iconBackColor{background-position:-269px 0}
.iconFontFamily{background-position:-293px 0}
.iconFontSize{background-position:-318px 0}
.iconInsertTable{background-position:-363px 0}

.fieldset_style{


margin:0px 0px 0px 0px;
}
#fieldset_style_inner{
background-color:#F6F6F6;
margin:5px 0px 5px 0px;
}
#fieldset_style{
background-color:#F6F6F6;
width:676px;
margin:5px 0px 5px 0px;
}
#fieldset_style_inner{
background-color:#F6F6F6;
margin:5px 0px 5px 0px;
}
#left_span{
margin-left:8px;
}
#right_span{
margin:8px 10px 8px 250px;
}
span{
	margin:5px 10px 5px 10px;
}

.span_left{

width:676px;
 float:left; 
}
.span_right{
border:thin;
width:208px;
float:right; 

}
.odd_tr{
	background-color:#ffffff;
}
even_tr{
	background-color:#F6F6F6
}
.left_title{
width:215px;
background-color:#CCE8F2;
border:solid 1px #43A3D4; 
margin:5px 10px 0px 10px;

}
.left_msg{
width:215px;
background-color:#F6F6F6;
border:solid 1px #43A3D4;
margin:0px 10px 5px 10px;
}
</style>
<link rel="stylesheet" href="../css/index.css" type="text/css" />
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
<!--头  -->
<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid" >
<div style="position: relative;min-height: 490px; " >
	<div style="background: #C0E4FA;position: relative;" align="center">录入信息</div>
	<div class="fieldset_style" >
		 <!-- 文件上传 -->
	     <div  id="fileuploaddiv"  style=" margin:10px 0px 10px 80px  ;width:800px;background-color:#ffffff;display: none; "><br/>
	     	<center>
		     <!-- 承接页面跳转  -->
		     <font size="-1" color="blue">选择文件可自动完成部分录入信息,支持word、pdf<br/></font><br/>
			<iframe name="upload" str="#" style="display: none;"></iframe>
			<form action="../FileUpLoad" name="uploadform" enctype="multipart/form-data" method="post" target="upload">
		             <span id="query_type" >请选择文件:</span> <input type="file" name="uploadfile">
		             <input type="submit" value="确定" onclick="getuploadpregress()"/>
		     </form>
		     <div id="uploadmsg"><br></div>	
		     </center>
		     
	    </div>		
	    <!-- **********内容，正文*********** -->
		<div style="margin: 10px 10px 5px 60px;">
			
		<div style="margin: 5px 10px 0px 60px;">
		<form action="biaoyin.jsp" name="biaoyin.jsp" method="post" >
		<iframe id = "text" src = "kindeditor-4.1.7/jsp/demo.jsp" frameborder="no" border="0" framespacing="0" style="width: 930px;height: 550px;"></iframe>
		<div  style=" margin-left:640px;">
		<input type="hidden" id="content">
		
		</div>
		</form>
		</div>
	</div>
	</div>
		<div id="main">

	


	
</div>
<script>
	function fileuploaddiv_isShow(){
		if(document.getElementById("fileuploaddiv").style.display=='block'){
		document.getElementById("fileuploaddiv").style.display="none";
		}else{
		document.getElementById("fileuploaddiv").style.display="block";
		}
	}
</script>
</div>
</body>
</html>