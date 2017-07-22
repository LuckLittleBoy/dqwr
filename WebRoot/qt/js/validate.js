var xmlHttp;
function CheckIsValid()
{
  CreatXmlHttpRequest();
  var user=document.getElementById("user");
  var pwd=document.getElementById("pwd");
  var randcode=document.getElementById("randcode");
  var url="/kjzc/login?user="+escape(user.value)+"&pwd="+escape(pwd.value)+"&randcode="+escape(randcode.value);
  alert(url);
  xmlHttp.open("POST",url,true);
  xmlHttp.onreadystatechange=callback;
  xmlHttp.send(null); 
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
if (!xmlHttp && typeof XMLHttpRequest== "undefined") {
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
    	  window.location.href="zcfl.jsp";
      }
      else{
    	  alert(requestmsg);
      }
    }
  }
}



