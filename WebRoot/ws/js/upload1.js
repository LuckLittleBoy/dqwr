$(document).ready(function(){
	 $("#upload_file").change(function(){
		 if($("#upload_file").val() != '') $("#file_form").submit();
	  });
	  $("#file_upload_return").load(function(){
          var data = $(window.frames['file_upload_return'].document.body).find("font").html();
          if(data != null){
              $("#file_upload_return_img").append(data.replace(/&lt;/g,'<').replace(/&gt;/g,'>'));
              $("#upload_file").val('');
          }
      });
	  
 });
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
			catch(e){
				
			}
		}
	}
	return xmlhttp;
}
function addFile()
{
 var str = '<br/><INPUT type="file" size="50" NAME="uploadfile">'
 document.getElementById('MyFile').insertAdjacentHTML("beforeEnd",str)
}

function fileuploaddiv_isShow(){
	if(document.getElementById("fileuploaddiv").style.display=='block'){
	document.getElementById("fileuploaddiv").style.display="none";
	}else{
	document.getElementById("fileuploaddiv").style.display="block";
	}
}
function fujianuploaddiv_isShow(){
	if(document.getElementById("fujiandiv").style.display=='block'){
	document.getElementById("fujiandiv").style.display="none";
	}else{
	document.getElementById("fujiandiv").style.display="block";
	}
}
function kescfj(){
	
	 $.ajaxSetup({
			async:false
		});
	
	 configmsg2()
	
	setTimeout(function(){location.replace("biaoyin.jsp?tag=0")},500)
	
}

function getuploadpregress(){
	 $.ajaxSetup({
			async:false
		});
	if("success"==getmsg()){
		configmsg();
	}
	location.replace("biaoyin.jsp?tag=0");
}
function configmsg(){
	var requestmsg="";
var xhr=getxmlhttp();
//准备连接

var url="../../../PdfToText";

//响应函数，请求时调用
xhr.onreadystatechange=function(){	
	if(xhr.readyState==4){
		
		if(xhr.status==200||xhr.status==304)
		{				
			requestmsg=xhr.responseText;	
			var s=requestmsg.toString();
		
		}
	}
};	
xhr.open("post",url,false);//方式、请求url，是否异步
	xhr.send(null);
	
}
function changeit(str)
{
var reg1 = new RegExp("&nbsp;","gi"); 
var reg2=new RegExp("&#177;","gi");
var reg3=new RegExp("&lt;","gi");
var reg4=new RegExp("&gt;","gi");
var reg5=new RegExp("&amp;","gi");
var reg6=new RegExp("&quot;","gi");
var reg7=new RegExp("<br>","gi");
var reg8=new RegExp("&#215;","gi");
var str1;
str1=str.replace(reg1," ");
str1=str1.replace(reg2,"±");
str1=str1.replace(reg3,"<");
str1=str1.replace(reg4,">");
str1=str1.replace(reg5,"&");
str1=str1.replace(reg6,"\"");
str1=str1.replace(reg7,"\r\n");
str1=str1.replace(reg8,"×");
return str1;
}
function configmsg2(){
	var requestmsg="";
	var xhr=getxmlhttp();
	//准备连接
	var content=$("#content1").text();
	var url="${pageContext.request.contextPath}/FJinput";
	content= changeit(content)

	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;	
				var s=requestmsg.toString();
	
				$("#content1").text(requestmsg);
			
			}
		}
	};	
	xhr.open("post",url,true);//方式、请求url，是否异步
	 xhr.setRequestHeader("Content-Type",
     "application/x-www-form-urlencoded")
	 xhr.send('content1='+content);
	
}



function getmsg(){
	var requestmsg="";
var xhr=getxmlhttp();
var s=document.uploadform.uploadfile.value.split('\\');
var filename=s[s.length-1];
//准备连接
var url="../../../CheckLoaded?filename="+filename;

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

KindEditor.ready(function(K) {
	var path = "${pageContext.request.contextPath}/ws/";
	var editor1 = K.create('textarea[name="content1"]', {
		cssPath : '../../kjzc/ws/kindeditor-4.1.7/plugins/code/prettify.css',
		uploadJson : '../../kjzc/ws/kindeditor-4.1.7/jsp/upload_json.jsp',
		fileManagerJson : '../../kjzc/ws/kindeditor-4.1.7/jsp/file_manager_json.jsp',
		allowFileManager : true,
		
		afterBlur: function(){this.sync();},
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
			
		}
	
	});
	prettyPrint();
	
});
