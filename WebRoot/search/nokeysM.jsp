<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全文检索</title>
<script src="../js/jquery.min.js"></script> 
<script type="text/javascript">
allwords=[];
oldselectedid="";
newselectedid="";
function getwords(){	
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../GetNoKeysWord";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				var msg="";
				var words =eval('('+requestmsg+')');
				allwords=words.words;
				var n=0;
				for(var i=0;i<words.words.length;i++){
					if(words.words[i].zimu=="a"){
						if(n==0){
							msg+="<div  style='background:#CDCDCD' onclick='changeSleected("+allwords[i].id+")' id="+allwords[i].id+">"+allwords[i].keys+"</div>";
							n=1;
							oldselectedid=allwords[i].id;
						}
						else msg+="<div  onclick='changeSleected("+allwords[i].id+")' id="+allwords[i].id+">"+allwords[i].keys+"</div>";
					}
				}
				document.getElementById("wordslist").innerHTML=msg;
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
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
			catch(e){
				
			}
		}
	}
	return xmlhttp;
}
getwords();
function showWordClassity(id){
	var calss='a';
	if(id==1)calss='a';
	else if(id==2)calss='b';
	else if(id==3)calss='c';
	else if(id==4)calss='d';
	else if(id==5)calss='e';
	else if(id==6)calss='f';
	else if(id==7)calss='g';
	else if(id==8)calss='h';
	else if(id==9)calss='i';
	else if(id==10)calss='j';
	else if(id==11)calss='k';
	else if(id==12)calss='l';
	else if(id==13)calss='m';
	else if(id==14)calss='n';
	else if(id==15)calss='o';
	else if(id==16)calss='p';
	else if(id==17)calss='q';
	else if(id==18)calss='r';
	else if(id==19)calss='s';
	else if(id==20)calss='t';
	else if(id==21)calss='u';
	else if(id==22)calss='v';
	else if(id==23)calss='w';
	else if(id==24)calss='x';
	else if(id==25)calss='y';
	else if(id==26)calss='z';
	var msg="";
	var n=0;
	for(var i=0;i<allwords.length;i++){
		
		if(allwords[i].zimu==calss){
			if(n==0){
				msg+="<div  style='background:#CDCDCD' onclick='changeSleected("+allwords[i].id+")' id="+allwords[i].id+">"+allwords[i].keys+"</div>";
				n=1;
				oldselectedid=allwords[i].id;
			}
			else msg+="<div  onclick='changeSleected("+allwords[i].id+")' id="+allwords[i].id+">"+allwords[i].keys+"</div>";
		}
	}
	document.getElementById("wordslist").innerHTML=msg;
}
function changeSleected(id){
	document.getElementById(id).style.background="#CDCDCD";
	document.getElementById(oldselectedid).style.background="#ffffff";
	oldselectedid=id;
}
function deletekey(){
	if(confirm("确定删除'"+document.getElementById(oldselectedid).innerHTML+"''？")){	
		var xhr=getxmlhttp();
		//准备连接
		var url="../DeleteNoKeysWord";
		//响应函数，请求时调用
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				if(xhr.status==200||xhr.status==304)
				{				
					getwords();
				}
			}
		};
		xhr.open("post",url,false);//方式、请求url，是否异步
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("word="+document.getElementById(oldselectedid).innerHTML);
	}
}
function addkeysword(){
	if(!document.getElementById("addkeyswoed").value){
		alert("请输入增加内容。");
		return;
	}
	 if(!(/[\u4e00-\u9fa5]+/).test(document.getElementById("addkeyswoed").value.charAt(0))){ 
		  alert("关键词首字必须是汉字。");
		  return;
	  }
	var xhr=getxmlhttp();
	//准备连接
	var url="../AddNoKeysWord";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{				
				getwords();
			}
		}
	};
	xhr.open("post",url,false);//方式、请求url，是否异步
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("word="+document.getElementById("addkeyswoed").value);
}
function updatekeysword(){
	if(!document.getElementById("updatekeysword").value){
		 alert("请输入修改内容。");
		  return;
	}
	if(confirm("确定将  '"+document.getElementById(oldselectedid).innerHTML+"' 修改为：'"+document.getElementById("updatekeysword").value+"'?")){	
		  if(!(/[\u4e00-\u9fa5]+/).test(document.getElementById("updatekeysword").value.charAt(0))){ 
			  alert("修改失败，关键词首字必须是汉字。");
			  return;
		  }
		
		var xhr=getxmlhttp();
		//准备连接
		var url="../UpdateNokeysword";
		//响应函数，请求时调用
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				if(xhr.status==200||xhr.status==304)
				{				
					getwords();
				}
			}
		};
		xhr.open("post",url,false);//方式、请求url，是否异步
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("word1="+document.getElementById(oldselectedid).innerHTML+"&word2="+document.getElementById("updatekeysword").value);
	}
}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
	
	<div style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;">
	<fieldset class="fieldset_style"  >
		<div align="center">
			<button onclick="showWordClassity(1)" >A</button>
			<button onclick="showWordClassity(2)">B</button>
			<button onclick="showWordClassity(3)">C</button>
			<button  onclick="showWordClassity(4)">D</button>
			<button onclick="showWordClassity(5)">E</button>
			<button onclick="showWordClassity(6)">F</button>
			<button onclick="showWordClassity(7)">G</button>
			<button onclick="showWordClassity(8)">H</button>
			<button onclick="showWordClassity(9)">I</button>
			<button onclick="showWordClassity(10)">J</button>
			<button onclick="showWordClassity(11)">K</button>
			<button onclick="showWordClassity(12)">L</button>
			<button onclick="showWordClassity(13)">M</button>
			<button onclick="showWordClassity(14)">N</button>
			<button onclick="showWordClassity(15)">O</button>
			<button onclick="showWordClassity(16)">P</button>
			<button onclick="showWordClassity(17)">Q</button>
			<button onclick="showWordClassity(18)">R</button>
			<button onclick="showWordClassity(19)">S</button>
			<button onclick="showWordClassity(20)">T</button>
			<button onclick="showWordClassity(21)">U</button>
			<button onclick="showWordClassity(22)">V</button>
			<button onclick="showWordClassity(23)">W</button>
			<button onclick="showWordClassity(24)">X</button>
			<button onclick="showWordClassity(25)">Y</button>
			<button onclick="showWordClassity(26)">Z</button>
			
			<table width="100%">
			<tr>
				<td width="25%">
				</td >
				<td width="30%">
					<div id="wordslist" style=" overflow:auto;line-height:22px;  width:100%; height:360px; border:1px solid;"></div>
				</td>
				<td width="25%">
					<div>	
						<input type="text" id="updatekeysword"  style="height: 38px;width: 120px;font-size: 20px;">
						<button style="width: 100px;height: 40px;" onclick="updatekeysword()">修改</button><br><br>
					</div>
					<div>	
						<input type="text" id="addkeyswoed" style="height: 38px;width: 120px;font-size: 20px;">
						<button style="width: 100px;height: 40px;" onclick="addkeysword()">增加</button><br><br>
					</div>
					<button style="width: 100px;height: 40px;" onclick="deletekey()">删除</button><br><br>	
				
				</td >
			</tr>
			</table>
			<div align="left" style="margin-left: 40%">
				<font color="blue" size="2px">说明：1、关键词首字必须是汉字。<br/>
				2、选中关键词后，可删除、修改。<br/>
				3、可增加关键词。<br/>
				4、操作成功后页面自动刷新，关键字按中文拼音顺序排序。<br/>
				</font>
			
			</div>
			
		</div>
		
	</fieldset>	
	</div>
</body>
</html>