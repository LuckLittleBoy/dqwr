function Sonclick() {
	window.location="ZcFindServlet";

}
function callback()
{
  if(xmlHttp.readyState==4)
  {
    if(xmlHttp.status==200)
    {
      requestmsg=xmlHttp.responseText;
      if(requestmsg=="true"){
    	  window.location="ZcFindServlet";
      }
      else{
    	  alert(requestmsg);
      }
    }
  }
}