//download by http://www.codefans.net
//获取xmlhttprequest

function zcmsg(){
		var requestmsg;

		var xhr=getxmlhttp();
		//准备连接
		var url="getzc";
		//响应函数，请求时调用
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				
				if(xhr.status==200||xhr.status==304)
				{		
					requestmsg=xhr.responseText;
					
					zc=eval('('+requestmsg+')');
					//alert(trees.menu[0].l1id);		
				}
			}
		};
		
		xhr.open("get",url,false);//方式、请求url，是否异步
		xhr.send(null);
		
	
}
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


zcmsg();
//实行范围
var commonzcs=new Array();
for(var i=0;zc.zc[i]!=null&&i<10;i++){
	commonzcs[i]=new Array(zc.zc[i].ZCWH,zc.zc[i].ZCMC,zc.zc[i].ZCWH,zc.zc[i].ZCWH);
}
var zcs = new Array();
for(var i=0;zc.zc[i]!=null;i++){
	zcs[i]=new Array(zc.zc[i].ZCWH,zc.zc[i].ZCMC,zc.zc[i].ZCWH,zc.zc[i].ZCWH);
}
//
