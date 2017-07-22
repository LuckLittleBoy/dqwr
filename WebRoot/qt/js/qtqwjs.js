querys={};
history="";//记录加入历史记录的政策文号
str_query="";//检索条件
function querymsg(id){
	str_query=document.getElementById("str_many_query").value;
	str_query=dowithURL(str_query);
	if(str_query==""){
		alert("请输入检索内容。");
		document.getElementById("str_many_query").focus();
		return;
	}
	if(progress!=0){
		alert("检索正在进行中，请等待...");
		return;
	}
	if(id==1)getQueryMsg(str_query);
	else querymsgresult(str_query);

}
function querymsgresult(){
	var requestmsg;
	var xhr=getxmlhttp();
	var arrwh='';
	for(var i in querys.querys){
		arrwh+=querys.querys[i].id+",";
	}
	//alert(arrwh);
	//return;
	//开始时间
	starttime=new Date().getTime();
	$("wrap").style.display='block';
	updateprogress();
	//准备连接
	var url="../IndexServlet";
	//处理含有中文的url
	url=encodeURI(url); 
	url=encodeURI(url);
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				querys=eval('('+requestmsg+')');
				addPageButton();
			
				var msg=""; 
				if(querys.querys[0]==null){
					 msg="<div style='color:#0099FF; font-size: 18px'>没有检索到任何信息</div>";
					document.getElementById("tablemag").innerHTML=msg;		
					progressComplete();
					return;
				}
				else
				{
					var n=(querys.querys.length>10?10:querys.querys.length);				
					for(var i=0;i<n;i++ ){
						var astr="zccxzclook.do?pno="+querys.querys[i].id;
						msg+="<div class='divpostion_content'>"+
						"		<div><a href='"+astr+"'   style='font-size:18px' >"+querys.querys[i].title+"</a></div>"+
						"		<div  class='divpostion' style='font-size:14px'>发布时间：<span>"+querys.querys[i].date.substr(0,10)+"</span> 类别：<span>"+querys.querys[i].classtify+"</span></div>"+
						"        <div  class='divpostion' style='font-size:12px;line-height:20px; '>"+querys.querys[i].content+"</div>"+
						"</div><br/>";			
						}
					}
					//显示新的查询历史
					document.getElementById("tablemag").innerHTML=msg;	
					progressComplete();
					if(str_query.length>10)
						document.getElementById("sostr").innerHTML=str_query.substr(0,10)+"...";				
					else document.getElementById("sostr").innerHTML=str_query;
					document.getElementById("soresult").innerHTML="";
				}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("str_query="+str_query+"&arrwh="+arrwh);
}
function getQueryMsg(str_query){
	var requestmsg;
	var xhr=getxmlhttp();
	//开始时间
	starttime=new Date().getTime();
	$("wrap").style.display='block';
	updateprogress();
	//准备连接
	var url="../IndexServlet";
	//处理含有中文的url
	url=encodeURI(url); 
	url=encodeURI(url);
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				querys=eval('('+requestmsg+')');
				addPageButton();
			
				var msg=""; 
				if(querys.querys[0]==null){
					 msg="<div style='color:#0099FF; font-size: 18px'>没有检索到任何信息</div>";
					document.getElementById("tablemag").innerHTML=msg;		
					progressComplete();
					return;
				}
				else
				{
					var n=(querys.querys.length>10?10:querys.querys.length);				
					for(var i=0;i<n;i++ ){
						var astr="zccxzclook.do?pno="+querys.querys[i].id;
						msg+="<div class='divpostion_content'>"+
						"		<div><a href='"+astr+"'   style='font-size:18px' >"+querys.querys[i].title+"</a></div>"+
						"		<div  class='divpostion' style='font-size:14px'>发布时间：<span>"+querys.querys[i].date.substr(0,10)+"</span> 类别：<span>"+querys.querys[i].classtify+"</span></div>"+
						"        <div  class='divpostion' style='font-size:12px;line-height:20px; '>"+querys.querys[i].content+"</div>"+
						"</div><br/>";			
						}
					}
					//显示新的查询历史
					document.getElementById("tablemag").innerHTML=msg;	
					progressComplete();
					if(str_query.length>10)
						document.getElementById("sostr").innerHTML=str_query.substr(0,10)+"...";				
					else document.getElementById("sostr").innerHTML=str_query;
					document.getElementById("soresult").innerHTML="";
				}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("str_query="+str_query);
}

//加入我的历史
function addmyhistory(i){
	var checkboxid= "zhengce"+i;
	var reg=new RegExp("<font color='#FA6060'>","g"); 
	var str=querys.querys[i].title;
	str=str.replace(reg,"");
	reg=new RegExp('</font>',"g"); 
	str=str.replace(reg,"");
	//alert(str);
	var insertstr="";
	if(str.length>13){
		insertstr=str.substr(0,13)+"...<br>";
	}
	else insertstr=str+"<br>";
	if($(checkboxid).checked){
			document.getElementById("soresult").innerHTML+=insertstr;
			history+=querys.querys[i].id+";";
	}
	else{
		var s=document.getElementById("soresult").innerHTML;
		reg=new RegExp(insertstr,"g"); 
		s=s.replace(reg,"");
		document.getElementById("soresult").innerHTML=s;
		var v=querys.querys[i].id+";";
		reg2=new RegExp(v,"g"); 
		history=history.replace(reg2,"");
	}
	
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
		//进度条更新
	progress=0;
	function updateprogress (){
		$("br_div").style.display='none';
		if(progress>78){
			progress_time= setTimeout("updateprogress()",2000);
			progress+=1;
			}
		else {
			
			progress+=Math.floor(Math.random()*3);
			progress_time= setTimeout("updateprogress()",100);
		}
		if(progress>99)progress=99;
		$("progress_bar").style.width=progress+"%";
		$("progress_text").innerHTML="正在检索请稍等，进度："+progress+"%";
		
	}
	function progressComplete(){
		clearTimeout(progress_time);
		$("progress_bar").style.width="100%";
		$("progress_text").innerHTML="正在检索请稍等，进度：100%";
		//隐藏进度条
		setTimeout("noneProgress()",300);
		progress=0;//把进度值置为0
		
	} 
	function noneProgress(){
		$("wrap").style.display='none';
		 var endtime=new Date().getTime();
		$("br_div").innerHTML="检索用时:"+(endtime-starttime)/1000+"秒";
		$("br_div").style.display='block';
		
	} 
	
	
	
	//动态增加button
	function addPageButton(){
		var buttonNum=0;
		var count =querys.querys.length;
		if(count%10==0)buttonNum=count/10;
		else buttonNum=count/10+1;
		var str_buttons="";
		for(var i=1; i<=buttonNum;i++){
			 buttonid="pagebutton"+i;
			if(i==1)str_buttons+="<button style='width:30px' disabled='disabled' id="+buttonid+" onclick='interThisPage(this)'>"+i+"</button>";
			else str_buttons+="<button style='width:30px' id="+buttonid+"  onclick='interThisPage(this)'>"+i+"</button>";
		}
		$("buttons").innerHTML=str_buttons;
		//记录当前页的按钮
		ablebutton=$("pagebutton1");
		
	}
	//显示每页的内容数据
	function interThisPage(obj){
		
		obj.disabled=true;
		ablebutton.disabled=false;
		ablebutton=obj;
		var e=obj.innerHTML;
		var msg="";
		var n=e*10>querys.querys.length?querys.querys.length:e*10;
		for(var i=(e-1)*10;i<n;i++ ){
			var astr="zccxzclook.do?pno="+querys.querys[i].id;
			msg+="<div class='divpostion_content'>"+
			"		<div><a href='"+astr+"'   style='font-size:18px' >"+querys.querys[i].title+"</a></div>"+
			"		<div  class='divpostion' style='font-size:14px'>发布时间：<span>"+querys.querys[i].date.substr(0,10)+"</span> 类别：<span>"+querys.querys[i].classtify+"</span></div>"+
			"       <div  class='divpostion' style='font-size:14px'>"+querys.querys[i].content+"</div>"+
			"</div><br/>";
			}

		document.getElementById("tablemag").innerHTML=msg;
		window.scroll(0,20);
		
		
	}
function addHistory(){

	if(history==""||str_query==""){
		showmsgDiv("新的历史结果集为空，无法增加");
		return;
	}
	var requestmsg;
	var xhr=getxmlhttp();
	var url="../AddHistory";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				querys=eval('('+requestmsg+')');
				if(querys.add=="success"){
					showmsgDiv("历史数据增加成功");
				}else{
					showmsgDiv("<font color=red>历史数据增加失败</font>");
				}
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("history="+history+"&str_query="+str_query);
}
function getoldhistorymsg(){	
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../GetWDLS";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				var wdls =eval('('+requestmsg+')');
				if(wdls.wdls=="fail"){
					showmsgDiv("数据获取失败");
				}else{				
					var msg="";
					var n=wdls.wdls.length>3?3:wdls.wdls.length;
					for(var i=0;i<n;i++){			
							msg+=(i+1)+":"+wdls.wdls[i].serchstr+"<br/><hr/>";						
					}

				document.getElementById("oldsoresult").innerHTML=msg;
					
				}

			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	xhr.send(null);
}
function lookHistory(){
	window.location.href="../search/myhistory.jsp";
}
