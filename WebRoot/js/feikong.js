function Check()
{
  CreatXmlHttpRequest();
  var find=document.getElementById("find");
  var startT=document.getElementById("startT");
  var endT=document.getElementById("endT");
  
  if(find==""){
		alert("������������Ϊ��");
		
	}else if(startT==""){
		alert("��ʼ���ڲ���Ϊ��");	
	}else if(endT==""){
		alter("�������ڲ���Ϊ��");
		
	}
}