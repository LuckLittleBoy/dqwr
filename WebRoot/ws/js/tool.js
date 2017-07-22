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

//设置cookie
function addCookie(name,value,expiresHours){
	//重复的不再写入
	var is=true;
	var strCookie=document.cookie; 
	var arrCookie=strCookie.split(";"); 
	for(var i=0;i<arrCookie.length;i++){ 
		var arr=arrCookie[i].split("="); 
		if(arr[1]==value){
			is=false;
			return;
		}
		} 
	if(is==false)return;
	var cookieString=name+"="+value; 
	//判断是否设置过期时间 
	if(expiresHours>0){ 
	var date=new Date(); 
	date.setTime(date.getTime+expiresHours*3600*1000); 
	cookieString=cookieString+"; expires="+date.toGMTString(); 
	} 
	document.cookie=cookieString; 
	
}
//获取cookie
function getCookie(name){ 
	var strCookie=document.cookie; 
	var arrCookie=strCookie.split("; "); 
	for(var i=0;i<arrCookie.length;i++){ 
		
	var arr=arrCookie[i].split("="); 
	if(arr[0]==name)return arr[1]; 
	} 
	return ""; 
}
//删除cookie
function deleteCookie(name){ 
	var date=new Date(); 
	date.setTime(date.getTime()-10000); 
	document.cookie=name+"=v; expires="+date.toGMTString(); 
	} 
//清除历史记录
function clearHistory(){
	var strCookie=document.cookie; 
	var arrCookie=strCookie.split("; "); 
	for(var i=0;i<arrCookie.length;i++){ 
	var arr=arrCookie[i].split("="); 
	deleteCookie(arr[0]);
	} 
	hideSecrchList();
}

//信息框的输出
function showmsgDiv(s){
	var msgObj=document.getElementById("msgDiv");
	  var pos=0;
	  if(document.documentElement.scrollTop==0&&document.getElementsByTagName("body")[0].scrollTop==0){
		  pos=0;
	  }
	  else if(document.documentElement.scrollTop!=0)pos=document.documentElement.scrollTop;
	  else pos=document.getElementsByTagName("body")[0].scrollTop;
	  msgObj.style.marginTop = 200+ pos+ "px";
	  document.getElementById("msgDiv").style.display="block";
	document.getElementById("msgDiv").innerHTML="<br>"+s;
	msgDivcount();
}
var myCount = 20;
function msgDivcount() { 
    myCount--;
    if (myCount == 0) {
        document.getElementById("msgDiv").style.display="none";
        myCount = 20;
        clearInterval(timea);
        return;
    }
    document.getElementById("msgDiv").style.opacity=(0.9-(20-myCount)/30);
    var timea=setTimeout("msgDivcount()", 100);
 }