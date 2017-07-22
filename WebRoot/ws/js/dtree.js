////////////////////////////////////
	function checkmsg(){
		var requestmsg;
		
		var xhr=getxmlhttp();
		//准备连接
		var url="../gettree";
		//响应函数，请求时调用
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				
				if(xhr.status==200||xhr.status==304)
				{		
					requestmsg=xhr.responseText;
					
					trees=eval('('+requestmsg+')');
					if(!trees.menu[0]){
						windows.location.href="../login.html";
					};		
				}
			}
		};
		
		xhr.open("get",url,false);//方式、请求url，是否异步
		xhr.send(null);
		
	
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
	checkmsg();
	
	
	
	//////////////////
	