function Check()
{
  CreatXmlHttpRequest();
  var find=document.getElementById("find");
  var startT=document.getElementById("startT");
  var endT=document.getElementById("endT");
  
  if(find==""){
		alert("检索条件不能为空");
		
	}else if(startT==""){
		alert("开始日期不能为空");	
	}else if(endT==""){
		alter("结束日期不能为空");
		
	}
}