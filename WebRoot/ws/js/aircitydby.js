//download by http://www.codefans.net
//获取xmlhttprequest
function ztcms(){
	var requestmsg;

	var xhr=getxmlhttp();
	//准备连接
	var url="getztc";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{		
				requestmsg=xhr.responseText;
				
				ztc=eval('('+requestmsg+')');
				//alert(trees.menu[0].l1id);		
			}
		}
	};
	
	xhr.open("get",url,false);//方式、请求url，是否异步
	xhr.send(null);
	

}

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
function tzlymsg(){
	var requestmsg;

	var xhr=getxmlhttp();
	//准备连接
	var url="gettzly";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{		
				requestmsg=xhr.responseText;
				
				tzly=eval('('+requestmsg+')');
				//alert(trees.menu[0].l1id);		
			}
		}
	};
	
	xhr.open("get",url,false);//方式、请求url，是否异步
	xhr.send(null);
	

}


function bbxsmsg(){
		var requestmsg;

		var xhr=getxmlhttp();
		//准备连接
		var url="getbbxs";
		//响应函数，请求时调用
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				
				if(xhr.status==200||xhr.status==304)
				{		
					requestmsg=xhr.responseText;
					
					bbxs=eval('('+requestmsg+')');
					//alert(trees.menu[0].l1id);		
				}
			}
		};
		
		xhr.open("get",url,false);//方式、请求url，是否异步
		xhr.send(null);
		
	
}



function zcflmsg(){
		var requestmsg;

		var xhr=getxmlhttp();
		//准备连接
		var url="getzcfl";
		//响应函数，请求时调用
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				
				if(xhr.status==200||xhr.status==304)
				{		
					requestmsg=xhr.responseText;
					
					zcfl=eval('('+requestmsg+')');
					//alert(trees.menu[0].l1id);		
				}
			}
		};
		
		xhr.open("get",url,false);//方式、请求url，是否异步
		xhr.send(null);
		
	
}
	

function sxfwmsg(){
		var requestmsg;

		var xhr=getxmlhttp();
		//准备连接
		var url="getsxfw";
		//响应函数，请求时调用
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				
				if(xhr.status==200||xhr.status==304)
				{		
					requestmsg=xhr.responseText;
					
					sxfw=eval('('+requestmsg+')');
					//alert(trees.menu[0].l1id);		
				}
			}
		};
		
		xhr.open("get",url,false);//方式、请求url，是否异步
		xhr.send(null);
		
	
}

function zdjgmsg(){
	var requestmsg;
	
	var xhr=getxmlhttp();
	//准备连接
	var url="getzdjg";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{		
				requestmsg=xhr.responseText;
				zdjg=eval('('+requestmsg+')');
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


tzlymsg();
zdjgmsg();
sxfwmsg();
zcflmsg();
bbxsmsg();
zcmsg();
ztcms();
//实行范围
var commonsxfws=new Array();
for(var i =0 ;sxfw.sxfw[i]!=null&&i<10;i++){
	commonsxfws[i]=new Array(sxfw.sxfw[i].sxfwid,sxfw.sxfw[i].sxfwmc,sxfw.sxfw[i].sxfwqp,sxfw.sxfw[i].sxfwjc);
}
var sxfws=new Array();
for(var i =0 ;sxfw.sxfw[i]!=null||i<10;i++){
	sxfws[i]=new Array(sxfw.sxfw[i].sxfwid,sxfw.sxfw[i].sxfwmc,sxfw.sxfw[i].sxfwqp,sxfw.sxfw[i].sxfwjc);	
}
//制定机关
var commonzdjgs=new Array();
for(var i=0;zdjg.zdjg[i]!=null&&i<10;i++){
	commonzdjgs[i]=new Array(zdjg.zdjg[i].zdjgid,zdjg.zdjg[i].zdjgmc,zdjg.zdjg[i].zdjgpy,zdjg.zdjg[i].zdjgjc);
}
var zdjgs = new Array();
for(var i=0;zdjg.zdjg[i]!=null ;i++){
	zdjgs[i]=new Array(zdjg.zdjg[i].zdjgid,zdjg.zdjg[i].zdjgmc,zdjg.zdjg[i].zdjgpy,zdjg.zdjg[i].zdjgjc);
}
//政策分类
var commonzcfls=new Array();
for(var i=0;zcfl.zcfl[i]!=null&&i<10;i++){
	commonzcfls[i]=new Array(zcfl.zcfl[i].zid,zcfl.zcfl[i].zmc,zcfl.zcfl[i].zjc,zcfl.zcfl[i].zqp);
}
var zcfls = new Array();
for(var i=0;zcfl.zcfl[i]!=null ;i++){
	zcfls[i]=new Array(zcfl.zcfl[i].zid,zcfl.zcfl[i].zmc,zcfl.zcfl[i].zjc,zcfl.zcfl[i].zqp);
}
//颁布形式
var commonbbxss=new Array();
for(var i=0;bbxs.bbxs[i]!=null&&i<10;i++){
	commonbbxss[i]=new Array(bbxs.bbxs[i].bid,bbxs.bbxs[i].bmc,bbxs.bbxs[i].bjc,bbxs.bbxs[i].bqp);
}
var bbxss = new Array();
for(var i=0;bbxs.bbxs[i]!=null ;i++){
	bbxss[i]=new Array(bbxs.bbxs[i].bid,bbxs.bbxs[i].bmc,bbxs.bbxs[i].bjc,bbxs.bbxs[i].bqp);
}
//
var commonzcs=new Array();
for(var i=0;zc.zc[i]!=null&&i<10;i++){
	commonzcs[i]=new Array(zc.zc[i].ZCWH,zc.zc[i].ZCMC,zc.zc[i].ZCWH,zc.zc[i].ZCWH);
}
var zcs = new Array();
for(var i=0;zc.zc[i]!=null ;i++){
	zcs[i]=new Array(zc.zc[i].ZCWH,zc.zc[i].ZCMC,zc.zc[i].ZCWH,zc.zc[i].ZCWH);
}
//
var commontzlys=new Array();
for(var i=0;tzly.tzly[i]!=null;i++){
	commontzlys[i]=new Array(tzly.tzly[i].tid,tzly.tzly[i].tmc,tzly.tzly[i].tqp,tzly.tzly[i].tjc);
}
var tzlys = new Array();
for(var i=0;tzly.tzly[i]!=null ;i++){
	tzlys[i]=new Array(tzly.tzly[i].tid,tzly.tzly[i].tmc,tzly.tzly[i].tqp,tzly.tzly[i].tjc);
}
var commonztcs=new Array();
for(var i=0;ztc.ztc[i]!=null&&i<10;i++){
	commonztcs[i]=new Array(ztc.ztc[i].ztcid,ztc.ztc[i].ztc,ztc.ztc[i].ztc,ztc.ztc[i].ztcid);
}
var ztcs = new Array();
for(var i=0;ztc.ztc[i]!=null ;i++){
	ztcs[i]=new Array(ztc.ztc[i].ztcid,ztc.ztc[i].ztc,ztc.ztc[i].ztc,ztc.ztc[i].ztcid);
}