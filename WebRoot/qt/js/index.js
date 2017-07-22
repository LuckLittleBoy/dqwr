function getnews(){
	var requestmsg;

	var xhr=getxmlhttp();
	//准备连接
	var url="../qtnew";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{		
				requestmsg=xhr.responseText;
				
				news=eval('('+requestmsg+')');
				
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
getnews()
var strnews="";
for(var i=0;i<15&&news.news[i]!=null;i++){
	
	if(i%2==0){
		strnews += '<tr >';
		strnews += '<td width="70%" style="border-top:1px solid #F3F3F3;" style="margin-left: 30px;">';
		strnews += '<div  style="width:520px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/qtzclook.do?pno='+news.news[i].zcwh+'">'+news.news[i].zcmc+'</a></div></td>';
		
		if(news.news[i].gbrq!=null){
			strnews +=	'<td style="border-top:1px solid #F3F3F3;" align="right" >['+news.news[i].gbrq+']</td>';
		}
		else{
			strnews +=	'<td border-top:1px solid #F3F3F3;>&nbsp;</td>';
		}
		strnews += '</tr>';
	}
	else if(i%2==1){
		strnews += '<tr width="100%" >';
		strnews += '<td width="70%"  style="border-top:1px solid #F3F3F3;margin-left: 30px;">';
		strnews += '<div  style="width:520px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/qtzclook.do?pno='+news.news[i].zcwh+'">'+news.news[i].zcmc+'</a></div></td>';
		if(news.news[i].gbrq!=null){
			strnews +=	'<td style="border-top:1px solid #F3F3F3;" align="right">['+news.news[i].gbrq+']</td>';
		}
		else{
			strnews +=	'<td border-top:1px solid #F3F3F3;>&nbsp;</td>';
		}
		strnews += '</tr>';
	}
	
}

$(document).ready(function () {
	
	$("#news").html(strnews);
	
	
});

var xmlHttp;
/*function IMG1_onclick2() {
	
	CheckIsValid();
}
function CheckIsValid()
{
  CreatXmlHttpRequest();
  alert('111');
  var user=document.getElementById("username");
  out.println("user");
  var pwd=document.getElementById("userpassword");
  out.println("userpassword");
  var randcode=document.getElementById("randcode");
  out.println("randcode");
  var url="/qtlogin?user="+escape(user.value)+"&pwd="+escape(pwd.value)+"&randcode="+escape(randcode.value);
  
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
		 xmlHttp.open("POST",url,true);
		  xmlHttp.onreadystatechange=callback;
		  xmlHttp.send(null);
	}
  
}

*/
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
    	  showDialog();
      }
      else{
    	  alert(requestmsg);
      }
    }
  }
}

function showDialog(){  
    var dialog=document.createElement("div");  
    dialog.id="myDialog";  
    dialog.innerHTML="登录成功.正在跳转...";  
    //设置层显示的样式  
    dialog.style.position="absolute";     
    //设置五秒钟后自动关闭.  
    setTimeout("document.getElementById('myDialog')","10000");  
}  


function IMG1_onclick3() {
	
	CheckIsValid2();
}
function CheckIsValid2()
{
  CreatXmlHttpRequest();
  var url="../qtlogin";
  
  xmlHttp.open("GET",url,true);
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
if (!xmlHttp && typeof XMLHttpRequest != "undefined") {
   xmlHttp = new XMLHttpRequest();
} 
}


$(document).ready(function () {
	$("#zx").click(function(){
		alert("注销成功");
		jQuery.post("../qtzx",
				function(response){
			location.replace('index.jsp');
		});
		
	});
	$("#zxbtn").click(function(){
		alert("注销成功");
		jQuery.post("../qtzx",
				function(response){
			location.replace('index.jsp');
		});
		
	});
	$("#zcbtn").click(function(){
		location.replace("zhuce.jsp");
	})
});

function redirect(u, n, g){
    location.href = g + '?url=' + u + '&pn=' + encodeURI(n);
}