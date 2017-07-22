var xmlHttp;
function IMG1_onclick() {
		CheckIsValid();

}
function CheckIsValid()
{
  CreatXmlHttpRequest();
  var user=document.getElementById("user");
  var pwd=document.getElementById("pwd");
  var randcode=document.getElementById("randcode");
  var url="login?user="+escape(user.value)+"&pwd="+escape(pwd.value)+"&randcode="+escape(randcode.value);
  if(user.value==""){
		alert("用户名不能为空");
		
	}else if(pwd.value==""){
		alert("密码不能为空");
		
	}else if(user.value.length>20||user.value.length<6){
		alert("用户名小于6位或大于20位");
		
	}else if(pwd.value.length>20||pwd.value.length<6){
		alert("密码小于6位或大于20位");
		
	}else if(randcode.value==""){
		alert("验证码不能为空");
		
	}else{
		  xmlHttp.open("GET",url,true);
		  xmlHttp.onreadystatechange=callback;
		  xmlHttp.send(null);
	}
  
}


function CreatXmlHttpRequest()
{
try {
   xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
   try {
     xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
   } catch (e2) {
     xmlHttp = false;
   }
}
if (!xmlHttp && typeof XMLHttpRequest != "undefined") {
   xmlHttp = new XMLHttpRequest();
} 
}
function callback()
{
  if(xmlHttp.readyState==4)
  {
    if(xmlHttp.status==200)
    {
      requestmsg=xmlHttp.responseText;
      if(requestmsg=="true"){
    	  window.location.href="index.jsp";
      }
      else{
    	  alert(requestmsg);
      }
    }
  }
}


