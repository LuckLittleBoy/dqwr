function getzcfl(){
	var requestmsg;

	var xhr=getxmlhttp();
	//准备连接
	var url="../qtzcfl";
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
getzcfl();

var strzcfl=""
var tag=-1;
var bigtag=2;
var zcflleft="";
var zcflright="";
var maxtag = 0;
var strnews="";
strzcfl+='<center><select name="search" style="height:30px;"><option>作者</option><option>关键词</option><option>期刊名称</option><option>发布单位</option></select>&nbsp;&nbsp;<input type="text" name="search" style="height:25px;width:250px;">&nbsp;&nbsp;<input type="button" value="检索" style="height:32px;width:50px"></center><br>';
strzcfl+='<table width="785" height="300" border="0"  cellpadding="0" cellspacing="0">';
strzcfl+='<tr>';	
strzcfl+='<td height="935" background="images/2temp_13.jpg">&nbsp;</td>';
strzcfl+='<td valign="top"  >';
strzcfl+='<div  style="margin-top: 20px">';
	strzcfl+='<font size="4"></font>';
	strzcfl+='<table border="0" width="100%" class="news">';
	strzcfl+='<tr align="left">';
	strzcfl+='<td><table ><tr><td><font color="blue">1、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
	strzcfl+='</tr>';
	strzcfl+='<tr align="left">';
	strzcfl+='<td><table ><tr><td><font color="blue">2、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
	strzcfl+='</tr>';
	strzcfl+='<tr align="left">';
	strzcfl+='<td><table ><tr><td><font color="blue">3、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
	strzcfl+='</tr>';
	strzcfl+='<tr align="left">';
	strzcfl+='<td><table ><tr><td><font color="blue">4、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
	strzcfl+='</tr>';
	strzcfl+='<tr align="left">';
	strzcfl+='<td><table ><tr><td><font color="blue">5、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
	strzcfl+='</tr>';
	strzcfl+='</table>';
	strzcfl+='</div>';
var tag6=0
for(var i=0;zc.zc[i]!=null;i++){
	if(tag6<6){
		if(zc.zc[i].zcfl!=''&&tag!=zc.zc[i].zcfl){
			
			if(tag!=-1){
				tag6=tag6+1
				strzcfl+='</ul>';
				strzcfl+='</div>';
				strzcfl+='</div>';
			}
			if(tag6<6){
				tag=zc.zc[i].zcfl;
				maxtag = 0
				bigtag = bigtag+1;
				strzcfl+='<div class="hyyw" style="margin-left:10px;float:left">';
				strzcfl+='<h1><span>'+zc.zc[i].zcflmc+'</span><a class="more zcdh" id='+zc.zc[i].zcflmc+' href="#" >更多>></a></h1>';
				strzcfl+='<div class="list">';
				strzcfl+='<ul >';
				strzcfl+='<li><img src="images/dian.png" width="5px" height="5px" alt="" /><div style="width:298px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/zcflzclook.do?pno='+zc.zc[i].zcwh+'"><a href="../qt/zcflzclook.do?pno='+zc.zc[i].zcwh+'">'+zc.zc[i].zcmc+'</a></div></li>';
			}
		}else if(zc.zc[i].zcfl!=''&&tag==zc.zc[i].zcfl){
			if(maxtag<5){
				strzcfl+='<li><img src="images/dian.png" width="5px" height="5px" alt="" /><div style="width:298px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/zcflzclook.do?pno='+zc.zc[i].zcwh+'"><a href="../qt/zcflzclook.do?pno='+zc.zc[i].zcwh+'">'+zc.zc[i].zcmc+'</a></div></li>';
				maxtag=maxtag+1;
			}
			
		}
	}
}




$(document).ready(function () {
	

	if(strzcfl!=""){
		strzcfl+='</ul>';
		strzcfl+='</div>';
		strzcfl+='</div>';
      	strzcfl+='</td>';
      	strzcfl+='<td background="images/2temp_15.jpg">&nbsp;</td>';
      	strzcfl+='</tr>';
      	strzcfl+='<tr>';
      	strzcfl+='<td height="14"><img src="images/2temp_17.jpg" width="21" height="14"></td>';
      	strzcfl+='<td height="14" background="images/2temp_18.jpg"></td>';
      	
      	strzcfl+='<td><img src="images/2temp_19.jpg" width="17" height="14"></td>';
      	strzcfl+='</tr>';
      	strzcfl+='</table>';
	}

	$("#centerright").html(strzcfl);	
	$(document).on('click',	"#tiaozhuan",function(){
		jQuery.post("../qtzcfl",
				{"lb":$("#lb").val(),
					"fl":$("#type").val(),
				},function(response){
					var gjlfzc=eval("("+response+")");
					var strgjlf="";
					var fl = $("#type").val();
					strgjlf+='<table width="785"  height="606" border="0" cellpadding="0" cellspacing="0">';
					strgjlf+='<tr>';
					strgjlf+='<td width="21" height="41"><img src="images/2temp_10.jpg" width="21" height="41"></td>';
			      	
					strgjlf+='<td width="748" background="images/2temp_11.jpg" ><font color="#FFFFFF"><img src="images/Developer_Icons_064.png" style="vertical-align: middle;" width="32" height="32"><span class="STYLE22">'+fl+'</span></font><span class="STYLE22">&nbsp;</span></td>';
					strgjlf+='<td width="16"><img src="images/2temp_12.jpg" width="17" height="41"></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr>';
					strgjlf+='<td height="935"  background="images/2temp_13.jpg">&nbsp;</td>';
					strgjlf+='<td class="center"   valign="top" >';
					strgjlf+='<div  style="margin-top: 20px">';
					strgjlf+='<font size="4"></font>';
					strgjlf+='<table border="0" width="100%" class="news">';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">1、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">2、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">3、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">4、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">5、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='</table>';
					strgjlf+='</div>';
					var count = 0;
					var pagecount= 0 ;
					for(var i=0;gjlfzc.zc[i]!=null;i++){
						count=count+1;
							if(i>(($("#pageno2").val()-1)*15-1)&&i<($("#pageno2").val()*15)){
							
								pagecount=pagecount+1;
								
								strgjlf += '<tr  >';
								strgjlf += '<td style="border-top:1px solid #F3F3F3;" width="40%" align="left">';
								strgjlf += '<div  style="width:320px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/zcflzclook.do?pno='+gjlfzc.zc[i].zcwh+'">'+gjlfzc.zc[i].zcmc+'</a></div></td>';
								strgjlf +=	'<td style="border-top:1px solid #F3F3F3;"   >'+gjlfzc.zc[i].sx+'</td>';
								strgjlf +=	'<td style="border-top:1px solid #F3F3F3;"  align="left" ><div style="margin-left:20px;">'+gjlfzc.zc[i].zcwh+'</div></td>';
								if(gjlfzc.zc[i].gbrq!=null){
									strgjlf +=	'<td style="border-top:1px solid #F3F3F3;" >['+gjlfzc.zc[i].gbrq+']</td>';
								}
								else{
									strgjlf +=	'<td style="border-top:1px solid #F3F3F3;" >&nbsp;</td>';
								}
								strgjlf += '</tr>';
							
							
						}
					}
					
					
					
					
					strgjlf+='</table>';
					strgjlf+='</div>';
					
					strgjlf+='<hr>';
					strgjlf+='<div >';
					strgjlf+='<div align="center"> 共有'+pagecount;
					
					strgjlf+='条最新记录，当前页第'+$("#pageno2").val()+'/'+$("#pageCount").val()+'页 &nbsp;&nbsp; ';
					strgjlf+='';
					strgjlf+='<a href="#" class="previous">上一页</a>';
					strgjlf+='&nbsp;&nbsp;';
					strgjlf+='';
					strgjlf+='<a href="#" class="next">下一页</a>';
					strgjlf+='</div>';
					strgjlf+='<div align="right">';
					strgjlf+='跳转到';
					strgjlf+='<input type="text" size="1"  class="pageno2" id="pageno2" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
					strgjlf+='</div>';
					
					
					strgjlf+='</td>';
					strgjlf+='<td background="images/2temp_15.jpg">&nbsp;</td>';
					strgjlf+='</tr>';
					strgjlf+='<tr>';
					strgjlf+='<td height="14"><img src="images/2temp_17.jpg" width="21" height="14"></td>';
					strgjlf+='<td height="14" background="images/2temp_18.jpg"></td>';
			      	
					strgjlf+='<td><img src="images/2temp_19.jpg" width="17" height="14"></td>';
					strgjlf+='</tr>';
					strgjlf+='</table>';
					
					
			jQuery("#centerright").html(strgjlf);
			jQuery("#pageCount").html(Math.ceil(count/pagecount));
		});
	});
	
	
	$(document).on('click',	".previous",function(){
		jQuery.post("../qtzcfl",
				{"lb":$("#lb").val(),
					"fl":$("#type").val(),
				},function(response){
					var gjlfzc=eval("("+response+")");
					var strgjlf="";
					var fl = $("#type").val();
					strgjlf+='<table width="785" height="606" border="0" cellpadding="0" cellspacing="0">';
					strgjlf+='<tr>';
					strgjlf+='<td width="21" height="41"><img src="images/2temp_10.jpg" width="21" height="41"></td>';
			      	
					strgjlf+='<td width="748" background="images/2temp_11.jpg" ><font color="#FFFFFF"><img src="images/Developer_Icons_064.png" style="vertical-align: middle;" width="32" height="32"><span class="STYLE22">'+fl+'</span></font><span class="STYLE22">&nbsp;</span></td>';
					strgjlf+='<td width="16"><img src="images/2temp_12.jpg" width="17" height="41"></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr>';
					strgjlf+='<td height="935" background="images/2temp_13.jpg">&nbsp;</td>';
					strgjlf+='<td class="center" valign="top"  >';
					strgjlf+='<div  style="margin-top: 20px">';
					strgjlf+='<font size="4"></font>';
					strgjlf+='<table border="0" width="100%" class="news">';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">1、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">2、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">3、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">4、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">5、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='</table>';
					strgjlf+='</div>';
					var count = 0;
					var pagecount= 0 ;
					for(var i=0;gjlfzc.zc[i]!=null;i++){
						
						
						count=count+1;
							if(i>(($("#pageno").val()-2)*15-1)&&i<(($("#pageno").val()-1)*15)){
							
								pagecount=pagecount+1;
							
									strgjlf += '<tr  >';
									strgjlf += '<td style="border-top:1px solid #F3F3F3;" width="40%" align="left">';
									strgjlf += '<div  style="width:320px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/zcflzclook.do?pno='+gjlfzc.zc[i].zcwh+'">'+gjlfzc.zc[i].zcmc+'</a></div></td>';
									strgjlf +=	'<td style="border-top:1px solid #F3F3F3;"   >'+gjlfzc.zc[i].sx+'</td>';
									strgjlf +=	'<td style="border-top:1px solid #F3F3F3;"  align="left" ><div style="margin-left:20px;">'+gjlfzc.zc[i].zcwh+'</div></td>';
									if(gjlfzc.zc[i].gbrq!=null){
										strgjlf +=	'<td style="border-top:1px solid #F3F3F3;" >['+gjlfzc.zc[i].gbrq+']</td>';
									}
									else{
										strgjlf +=	'<td style="border-top:1px solid #F3F3F3;" >&nbsp;</td>';
									}
									strgjlf += '</tr>';
								
							
						}
					}
					
					
					
					
					strgjlf+='</table>';
					strgjlf+='</div>';
					
					strgjlf+='<hr>';
					strgjlf+='<div >';
					strgjlf+='<div align="center"> 共有'+pagecount;
					$("#pageno").val(parseInt($("#pageno").val())-1)
					strgjlf+='条最新记录，当前页第'+$("#pageno").val()+'/'+$("#pageCount").val()+'页 &nbsp;&nbsp; ';
					strgjlf+='';
					strgjlf+='<a href="#" class="previous">上一页</a>';
					strgjlf+='&nbsp;&nbsp;';
					strgjlf+='';
					strgjlf+='<a href="#" class="next">下一页</a>';
					strgjlf+='</div>';
					strgjlf+='<div align="right">';
					strgjlf+='跳转到';
					strgjlf+='<input type="text" size="1"  class="pageno2" id="pageno2" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
					strgjlf+='</div>';
					
					
					
					strgjlf+='</td>';
					strgjlf+='<td background="images/2temp_15.jpg">&nbsp;</td>';
					strgjlf+='</tr>';
					strgjlf+='<tr>';
					strgjlf+='<td height="14"><img src="images/2temp_17.jpg" width="21" height="14"></td>';
					strgjlf+='<td height="14" background="images/2temp_18.jpg"></td>';
			      	
					strgjlf+='<td><img src="images/2temp_19.jpg" width="17" height="14"></td>';
					strgjlf+='</tr>';
					strgjlf+='</table>';
					
					
			jQuery("#centerright").html(strgjlf);
			jQuery("#pageCount").html(Math.ceil(count/pagecount));
		});
	});
	$(document).on('click',	".next",function(){
		jQuery.post("../qtzcfl",
				{"lb":$("#lb").val(),
					"fl":$("#type").val(),
				},function(response){
					var gjlfzc=eval("("+response+")");
					var strgjlf="";
					var fl = $("#type").val();
					strgjlf+='<table width="785" height="606" border="0" cellpadding="0" cellspacing="0">';
					strgjlf+='<tr>';
					strgjlf+='<td width="21" height="41"><img src="images/2temp_10.jpg" width="21" height="41"></td>';
			      	
					strgjlf+='<td width="748" background="images/2temp_11.jpg" ><font color="#FFFFFF"><img src="images/Developer_Icons_064.png" style="vertical-align: middle;" width="32" height="32"><span class="STYLE22">'+fl+'</span></font><span class="STYLE22">&nbsp;</span></td>';
					strgjlf+='<td width="16"><img src="images/2temp_12.jpg" width="17" height="41"></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr>';
					strgjlf+='<td height="935" background="images/2temp_13.jpg">&nbsp;</td>';
					strgjlf+='<td class="center" valign="top"  >';
					strgjlf+='<div  style="margin-top: 20px">';
					strgjlf+='<font size="4"></font>';
					strgjlf+='<table border="0" width="100%" class="news">';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">1、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">2、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">3、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">4、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">5、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='</table>';
					strgjlf+='</div>';
					var count = 0;
					var pagecount= 0 ;
					for(var i=0;gjlfzc.zc[i]!=null;i++){
						count=count+1;
							if(i>(($("#pageno").val())*15-1)&&i<(($("#pageno").val()*1+1)*15)){
								pagecount=pagecount+1;
									strgjlf += '<tr  >';
									strgjlf += '<td style="border-top:1px solid #F3F3F3;" width="40%" align="left">';
									strgjlf += '<div  style="width:320px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/zcflzclook.do?pno='+gjlfzc.zc[i].zcwh+'">'+gjlfzc.zc[i].zcmc+'</a></div></td>';
									strgjlf +=	'<td style="border-top:1px solid #F3F3F3;"   >'+gjlfzc.zc[i].sx+'</td>';
									strgjlf +=	'<td style="border-top:1px solid #F3F3F3;"  align="left" ><div style="margin-left:20px;">'+gjlfzc.zc[i].zcwh+'</div></td>';
									if(gjlfzc.zc[i].gbrq!=null){
										strgjlf +=	'<td style="border-top:1px solid #F3F3F3;" >['+gjlfzc.zc[i].gbrq+']</td>';
									}
									else{
										strgjlf +=	'<td style="border-top:1px solid #F3F3F3;" >&nbsp;</td>';
									}
									strgjlf += '</tr>';
							
						}
					}
					
					
					
					
					strgjlf+='</table>';
					strgjlf+='</div>';
					
					strgjlf+='<hr>';
					strgjlf+='<div  >';
					strgjlf+='<div  align="center"> 共有'+pagecount;
					$("#pageno").val(parseInt($("#pageno").val())+1)
					strgjlf+='条最新记录，当前页第'+$("#pageno").val()+'/'+$("#pageCount").val()+'页 &nbsp;&nbsp; ';
					strgjlf+='';
					strgjlf+='<a href="#" class="previous">上一页</a>';
					strgjlf+='&nbsp;&nbsp;';
					strgjlf+='';
					strgjlf+='<a href="#" class="next">下一页</a>';
					strgjlf+='</div>';
					strgjlf+='<div align="right">';
					strgjlf+='跳转到';
					strgjlf+='<input type="text" size="1"  class="pageno2" id="pageno2" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
					strgjlf+='</div>';
					
					
					strgjlf+='</td>';
					strgjlf+='<td background="images/2temp_15.jpg">&nbsp;</td>';
					strgjlf+='</tr>';
					strgjlf+='<tr>';
					strgjlf+='<td height="14"><img src="images/2temp_17.jpg" width="21" height="14"></td>';
					strgjlf+='<td height="14" background="images/2temp_18.jpg"></td>';
			      	
					strgjlf+='<td><img src="images/2temp_19.jpg" width="17" height="14"></td>';
					strgjlf+='</tr>';
					strgjlf+='</table>';
					
					
			jQuery("#centerright").html(strgjlf);
			jQuery("#pageCount").html(Math.ceil(count/pagecount));
		});
	});
	
	$(".sxfw").click(function(){
		var fl =""+$(this).attr('id');
		$("#d").html("您的位置：首页->政策导航->"+fl);
		jQuery.post("../qtzcfl",
				{"lb":"BSXFWMC",
					"fl":fl,
				},function(response){
					var gjlfzc=eval("("+response+")");
					
					var strgjlf="";
					
					strgjlf+='<table width="785" height="606" border="0" cellpadding="0" cellspacing="0">';
					strgjlf+='<tr>';
					strgjlf+='<td width="21" height="41"><img src="images/2temp_10.jpg" width="21" height="41"></td>';
			      	
					strgjlf+='<td width="748" background="images/2temp_11.jpg" ><font color="#FFFFFF"><img src="images/Developer_Icons_064.png" style="vertical-align: middle;" width="32" height="32"><span class="STYLE22">'+fl+'</span></font><span class="STYLE22">&nbsp;</span></td>';
					strgjlf+='<td width="16"><img src="images/2temp_12.jpg" width="17" height="41"></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr>';
					strgjlf+='<td height="935" background="images/2temp_13.jpg">&nbsp;</td>';
					strgjlf+='<td class="center" valign="top"  >';
					strgjlf+='<div  style="margin-top: 20px">';
					strgjlf+='<font size="4"></font>';
					strgjlf+='<table border="0" width="100%" class="news">';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">1、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">2、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">3、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">4、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">5、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='</table>';
					strgjlf+='</div>';
					var count = 0;
					var pagecount= 0 ;
					for(var i=0;gjlfzc.zc[i]!=null;i++){
						
						
						count=count+1;
						if(i<15){
							pagecount=pagecount+1;
							
								strgjlf += '<tr  >';
								strgjlf += '<td style="border-top:1px solid #F3F3F3;" width="40%" align="left">';
								strgjlf += '<div  style="width:320px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/zcflzclook.do?pno='+gjlfzc.zc[i].zcwh+'">'+gjlfzc.zc[i].zcmc+'</a></div></td>';
								strgjlf +=	'<td style="border-top:1px solid #F3F3F3;"   >'+gjlfzc.zc[i].sx+'</td>';
								strgjlf +=	'<td style="border-top:1px solid #F3F3F3;"  align="left" ><div style="margin-left:20px;">'+gjlfzc.zc[i].zcwh+'</div></td>';
								if(gjlfzc.zc[i].gbrq!=null){
									strgjlf +=	'<td style="border-top:1px solid #F3F3F3;" >['+gjlfzc.zc[i].gbrq+']</td>';
								}
								else{
									strgjlf +=	'<td style="border-top:1px solid #F3F3F3;" >&nbsp;</td>';
								}
								strgjlf += '</tr>';
							
						}
					}
					
					
					
					
					strgjlf+='</table>';
					strgjlf+='</div>';
					
					strgjlf+='<hr>';
					strgjlf+='<div   >';
					strgjlf+='<div  align="center"> 共有'+pagecount;
					
					strgjlf+='条最新记录，当前页第1/'+Math.ceil(count/pagecount)+'页 &nbsp;&nbsp; ';
					$("#pageno").val(1);
					strgjlf+='';
					strgjlf+='<a href="#" class="previous">上一页</a>';
					strgjlf+='&nbsp;&nbsp;';
					strgjlf+='';
					strgjlf+='<a href="#" class="next">下一页</a>';
					strgjlf+='<a href="#">首页</a>&nbsp;&nbsp;';
					strgjlf+='<a href="#">尾页</a>';
					strgjlf+='</div>';
					strgjlf+='<div align="right">';
					strgjlf+='跳转到';
					strgjlf+='<input type="text" size="1"  class="pageno2" id="pageno2" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
					strgjlf+='</div>';
					
					
					strgjlf+='</td>';
					strgjlf+='<td background="images/2temp_15.jpg">&nbsp;</td>';
					strgjlf+='</tr>';
					strgjlf+='<tr>';
					strgjlf+='<td height="14"><img src="images/2temp_17.jpg" width="21" height="14"></td>';
					strgjlf+='<td height="14" background="images/2temp_18.jpg"></td>';
			      	
					strgjlf+='<td><img src="images/2temp_19.jpg" width="17" height="14"></td>';
					strgjlf+='</tr>';
					strgjlf+='</table>';
					
					
			jQuery("#centerright").html(strgjlf);
			jQuery("#type").val(fl);
			jQuery("#pageno").val(1);
			jQuery("#lb").val("BSXFWMC");
			jQuery("#pageCount").val(Math.ceil(count/pagecount));
		});
	})
	$(document).on('click',	".zcdh",function(){
		
		var fl =""+$(this).attr('id');
		$("#d").html("您的位置：首页->政策导航->"+fl);
		jQuery.post("../qtzcfl",
				{"lb":"zcflmc",
					"fl":fl,
				},function(response){
					var gjlfzc=eval("("+response+")");
					
					var strgjlf="";
					
					strgjlf+='<table width="785" height="606" border="0" cellpadding="0" cellspacing="0">';
					strgjlf+='<tr>';
					strgjlf+='<td width="21" height="41"><img src="images/2temp_10.jpg" width="21" height="41"></td>';
					
					strgjlf+='<td width="748" background="images/2temp_11.jpg" ><font color="#FFFFFF"><img src="images/Developer_Icons_064.png" style="vertical-align: middle;" width="32" height="32"><span class="STYLE22">'+fl+'</span></font><span class="STYLE22">&nbsp;</span></td>';
					strgjlf+='<td width="16"><img src="images/2temp_12.jpg" width="17" height="41"></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr>';
					strgjlf+='<td height="935" background="images/2temp_13.jpg">&nbsp;</td>';
					strgjlf+='<td class="center" valign="top"  >';
					strgjlf+='<div  style="margin-top: 20px">';
					strgjlf+='<font size="4"></font>';
					strgjlf+='<table border="0" width="100%" class="news">';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">1、煤炭烟气脱硫设备.第二部分：燃煤烟气干法/半干法脱硫设备</font></td></tr><tr><td>【标准编号】GB/T 19229.2-2011</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">2、煤炭烟气脱硫设备.第二部分：燃煤烟气干法/半干法脱硫设备</font></td></tr><tr><td>【标准编号】GB/T 19229.2-2011</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">3、煤炭烟气脱硫设备.第二部分：燃煤烟气干法/半干法脱硫设备</font></td></tr><tr><td>【标准编号】GB/T 19229.2-2011</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">4、煤炭烟气脱硫设备.第二部分：燃煤烟气干法/半干法脱硫设备</font></td></tr><tr><td>【标准编号】GB/T 19229.2-2011</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">5、煤炭烟气脱硫设备.第二部分：燃煤烟气干法/半干法脱硫设备</font></td></tr><tr><td>【标准编号】GB/T 19229.2-2011</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='</table>';
					strgjlf+='</div>';
					var count = 0;
					var pagecount= 0 ;
					for(var i=0;gjlfzc.zc[i]!=null;i++){
						
						
						count=count+1;
						if(i<15){
							pagecount=pagecount+1;
							
								strgjlf += '<tr style="border-top:1px solid #F3F3F3;" >';
								strgjlf += '<td style="border-top:1px solid #F3F3F3;" width="40%" align="left">';
								strgjlf += '<div  style="width:320px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/zcflzclook.do?pno='+gjlfzc.zc[i].zcwh+'">'+gjlfzc.zc[i].zcmc+'</a></div></td>';
								strgjlf +=	'<td style="border-top:1px solid #F3F3F3;"   >'+gjlfzc.zc[i].sx+'</td>';
								strgjlf +=	'<td style="border-top:1px solid #F3F3F3;"  align="left" ><div style="margin-left:20px;">'+gjlfzc.zc[i].zcwh+'</div></td>';
								if(gjlfzc.zc[i].gbrq!=null){
									strgjlf +=	'<td style="border-top:1px solid #F3F3F3;" >['+gjlfzc.zc[i].gbrq+']</td>';
								}
								else{
									strgjlf +=	'<td style="border-top:1px solid #F3F3F3;" >&nbsp;</td>';
								}
								strgjlf += '</tr>';
							
						}
					}
					
					
					
					
					strgjlf+='</table>';
					strgjlf+='</div>';
					
					strgjlf+='<hr>';
					strgjlf+='<div   >';
					strgjlf+='<div  align="center"> 共有'+pagecount;
					
					strgjlf+='条最新记录，当前页第1/'+Math.ceil(count/pagecount)+'页 &nbsp;&nbsp; ';
					$("#pageno").val(1);
					strgjlf+='';
					strgjlf+='<a href="#" class="previous">上一页</a>';
					strgjlf+='&nbsp;&nbsp;';
					strgjlf+='';
					strgjlf+='<a href="#" class="next">下一页</a>';
					strgjlf+='<a href="#">首页</a>&nbsp;&nbsp;';
					strgjlf+='<a href="#">尾页</a>';
					strgjlf+='</div>';
					strgjlf+='<div align="right">';
					strgjlf+='跳转到';
					strgjlf+='<input type="text" size="1"  class="pageno2" id="pageno2" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
					strgjlf+='</div>';
					
					
					strgjlf+='</td>';
					strgjlf+='<td background="images/2temp_15.jpg">&nbsp;</td>';
					strgjlf+='</tr>';
					strgjlf+='<tr>';
					strgjlf+='<td height="14"><img src="images/2temp_17.jpg" width="21" height="14"></td>';
					strgjlf+='<td height="14" background="images/2temp_18.jpg"></td>';
			      	
					strgjlf+='<td><img src="images/2temp_19.jpg" width="17" height="14"></td>';
					strgjlf+='</tr>';
					strgjlf+='</table>';
			jQuery("#centerright").html(strgjlf);
			jQuery("#type").val(fl);
			jQuery("#pageno").val(1);
			jQuery("#lb").val("zcflmc");
			jQuery("#pageCount").val(Math.ceil(count/pagecount));
		});
	})
	$(document).on('click',	".zcflmc",function(){
		var fl =""+$(this).attr('id');
		$("#d").html("您的位置：首页->政策导航->"+fl);
		jQuery.post("../qtzcfl",
				{"lb":"zcflmc",
					"fl":fl,
				},function(response){
					var gjlfzc=eval("("+response+")");
					
					var strgjlf="";
					
					strgjlf+='<table width="785" height="606" border="0" cellpadding="0" cellspacing="0">';
					strgjlf+='<tr>';
					strgjlf+='<td width="21" height="41"><img src="images/2temp_10.jpg" width="21" height="41"></td>';
			      	
					strgjlf+='<td width="748" background="images/2temp_11.jpg" ><font color="#FFFFFF"><img src="images/Developer_Icons_064.png" style="vertical-align: middle;" width="32" height="32"><span class="STYLE22">'+fl+'</span></font><span class="STYLE22">&nbsp;</span></td>';
					strgjlf+='<td width="16"><img src="images/2temp_12.jpg" width="17" height="41"></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr>';
					strgjlf+='<td height="935" background="images/2temp_13.jpg">&nbsp;</td>';
					strgjlf+='<td class="center" valign="top"  >';
					strgjlf+='<div  style="margin-top: 20px">';
					strgjlf+='<font size="4"></font>';
					strgjlf+='<table border="0" width="100%" class="news">';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">1、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">2、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">3、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">4、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">5、大气对流程平流程交换（STE）研究进展</font></td></tr><tr><td>【作者】胡宁，张超林，忠烈，李玉刚</td></tr><tr><td>【期刊名称】《地球科学进展》</td></tr><tr><td>【摘要】大气平流层对流程交换包括平流层向对流层的输送和对流层向平流层的输送2个过程...</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='</table>';
					strgjlf+='</div>';
					var count = 0;
					var pagecount= 0 ;
					for(var i=0;gjlfzc.zc[i]!=null;i++){
						
						count=count+1;
						if(i<15){
							pagecount=pagecount+1;
							
								strgjlf += '<tr style="border-top:1px solid #F3F3F3;" >';
								strgjlf += '<td style="border-top:1px solid #F3F3F3;" width="40%" align="left">';
								strgjlf += '<div  style="width:320px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/zcflzclook.do?pno='+gjlfzc.zc[i].zcwh+'">'+gjlfzc.zc[i].zcmc+'</a></div></td>';
								strgjlf +=	'<td style="border-top:1px solid #F3F3F3;"  >'+gjlfzc.zc[i].sx+'</td>';
								strgjlf +=	'<td style="border-top:1px solid #F3F3F3;" align="left" ><div style="margin-left:20px;">'+gjlfzc.zc[i].zcwh+'</div></td>';
								if(gjlfzc.zc[i].gbrq!=null){
									strgjlf +=	'<td style="border-top:1px solid #F3F3F3;">['+gjlfzc.zc[i].gbrq+']</td>';
								}
								else{
									strgjlf +=	'<td style="border-top:1px solid #F3F3F3;">&nbsp;</td>';
								}
								strgjlf += '</tr>';
							
							
						}
					}
					
					
					
					
					strgjlf+='</table>';
					strgjlf+='</div>';
					
					strgjlf+='<hr>';
					strgjlf+='<div >';
					strgjlf+='<div align="center"> 共有'+pagecount;
					
					strgjlf+='条最新记录，当前页第1/'+Math.ceil(count/pagecount)+'页 &nbsp;&nbsp; ';
					$("#pageno").val(1);
					strgjlf+='';
					strgjlf+='<a href="#" class="previous">上一页</a>';
					strgjlf+='&nbsp;&nbsp;';
					strgjlf+='';
					strgjlf+='<a href="#" class="next">下一页</a>';
					strgjlf+='<a href="#">首页</a>&nbsp;&nbsp;';
					strgjlf+='<a href="#">尾页</a>';
					strgjlf+='</div>';
					strgjlf+='<div align="right">';
					strgjlf+='跳转到';
					strgjlf+='<input type="text" size="1"  class="pageno2" id="pageno2" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
					strgjlf+='</div>';
					
					
					
					strgjlf+='</td>';
					strgjlf+='<td background="images/2temp_15.jpg">&nbsp;</td>';
					strgjlf+='</tr>';
					strgjlf+='<tr>';
					strgjlf+='<td height="14"><img src="images/2temp_17.jpg" width="21" height="14"></td>';
					strgjlf+='<td height="14" background="images/2temp_18.jpg"></td>';
			      	
					strgjlf+='<td><img src="images/2temp_19.jpg" width="17" height="14"></td>';
					strgjlf+='</tr>';
					strgjlf+='</table>';
			jQuery("#centerright").html(strgjlf);
			jQuery("#type").val(fl);
			jQuery("#pageno").val(1);
			jQuery("#lb").val("zcflmc");
			jQuery("#pageCount").val(Math.ceil(count/pagecount));
		});
	})
	$(document).on('click',	".tzly",function(){
		var fl =""+$(this).attr('id');
		$("#d").html("您的位置：首页->政策导航->"+fl);
		jQuery.post("../qtzcfl",
				{"lb":"TTZLYMC",
					"fl":fl,
				},function(response){
					var gjlfzc=eval("("+response+")");
					
					var strgjlf="";
					
					strgjlf+='<table width="785" height="606" border="0" cellpadding="0" cellspacing="0">';
					strgjlf+='<tr>';
					strgjlf+='<td width="21" height="41"><img src="images/2temp_10.jpg" width="21" height="41"></td>';
			      	
					strgjlf+='<td width="748" background="images/2temp_11.jpg" ><font color="#FFFFFF"><img src="images/Developer_Icons_064.png" style="vertical-align: middle;" width="32" height="32"><span class="STYLE22">'+fl+'</span></font><span class="STYLE22">&nbsp;</span></td>';
					strgjlf+='<td width="16"><img src="images/2temp_12.jpg" width="17" height="41"></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr>';
					strgjlf+='<td height="935" background="images/2temp_13.jpg">&nbsp;</td>';
					strgjlf+='<td class="center" valign="top"  >';
					strgjlf+='<div  style="margin-top: 20px">';
					strgjlf+='<font size="4"></font>';
					strgjlf+='<table border="0" width="100%" class="news">';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">1、大气污染防治行动计划</font></td></tr><tr><td>【颁布部门】环保部     【颁布时间】2014-8-15</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">2、大气污染防治行动计划</font></td></tr><tr><td>【颁布部门】环保部     【颁布时间】2014-8-15</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">3、大气污染防治行动计划</font></td></tr><tr><td>【颁布部门】环保部     【颁布时间】2014-8-15</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">4、大气污染防治行动计划</font></td></tr><tr><td>【颁布部门】环保部     【颁布时间】2014-8-15</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr align="left">';
					strgjlf+='<td><table ><tr><td><font color="blue">5、大气污染防治行动计划</font></td></tr><tr><td>【颁布部门】环保部     【颁布时间】2014-8-15</td></tr></table></td>';
					strgjlf+='</tr>';
					strgjlf+='</table>';
					strgjlf+='</div>';
					var count = 0;
					var pagecount= 0 ;
					for(var i=0;gjlfzc.zc[i]!=null;i++){
						
						count=count+1;
						if(i<15){
							pagecount=pagecount+1;
							
								strgjlf += '<tr  >';
								strgjlf += '<td style="border-top:1px solid #F3F3F3;" width="40%" align="left">';
								strgjlf += '<div  style="width:320px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/zcflzclook.do?pno='+gjlfzc.zc[i].zcwh+'">'+gjlfzc.zc[i].zcmc+'</a></div></td>';
								strgjlf +=	'<td style="border-top:1px solid #F3F3F3;"  >'+gjlfzc.zc[i].sx+'</td>';
								strgjlf +=	'<td style="border-top:1px solid #F3F3F3;" align="left" ><div style="margin-left:20px;">'+gjlfzc.zc[i].zcwh+'</div></td>';
								if(gjlfzc.zc[i].gbrq!=null){
									strgjlf +=	'<td style="border-top:1px solid #F3F3F3;" >['+gjlfzc.zc[i].gbrq+']</td>';
								}
								else{
									strgjlf +=	'<td style="border-top:1px solid #F3F3F3;" >&nbsp;</td>';
								}
								strgjlf += '</tr>';
					
						}
					}
					
					
					
					
					strgjlf+='</table>';
					strgjlf+='</div>';
					
					strgjlf+='<hr>';
					strgjlf+='<div>';
					strgjlf+='<div align="center"> 共有'+pagecount;
					
					strgjlf+='条最新记录，当前页第1/'+Math.ceil(count/pagecount)+'页 &nbsp;&nbsp; ';
					$("#pageno").val(1);
					strgjlf+='';
					strgjlf+='<a href="#" class="previous">上一页</a>';
					strgjlf+='&nbsp;&nbsp;';
					strgjlf+='';
					strgjlf+='<a href="#" class="next">下一页</a>';
					strgjlf+='<a href="#">首页</a>&nbsp;&nbsp;';
					strgjlf+='<a href="#">尾页</a>';
					strgjlf+='</div>';
					strgjlf+='<div align="right">';
					strgjlf+='跳转到';
					strgjlf+='<input type="text" size="1"  class="pageno2" id="pageno2" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
					strgjlf+='</div>';
					
					
					
					strgjlf+='</td>';
					strgjlf+='<td background="images/2temp_15.jpg">&nbsp;</td>';
					strgjlf+='</tr>';
					strgjlf+='<tr>';
					strgjlf+='<td height="14"><img src="images/2temp_17.jpg" width="21" height="14"></td>';
					strgjlf+='<td height="14" background="images/2temp_18.jpg"></td>';
			      	
					strgjlf+='<td><img src="images/2temp_19.jpg" width="17" height="14"></td>';
					strgjlf+='</tr>';
					strgjlf+='</table>';
			jQuery("#centerright").html(strgjlf);
			jQuery("#type").val(fl);
			jQuery("#pageno").val(1);
			jQuery("#lb").val("TTZLYMC");
			jQuery("#pageCount").val(Math.ceil(count/pagecount));
		});
	})


});

