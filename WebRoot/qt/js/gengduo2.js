$(document).ready(function () {
	//左边
	jQuery.post("../zcztServlet",
		function(response){
			var gjlfzc=eval("("+response+")");
			var fl = "";
			var strgjlf = "";
			for(var i=0;gjlfzc.tzly[i]!=null;i++){
				if(i!=0){
					strgjlf+='<li class="line"></li>';
					
				}else{
					fl = gjlfzc.tzly[i].TMC;
				}
				strgjlf+='<li><img style="margin-left: -10px;"';
				strgjlf+='src="images/bluedian.png" width="10px" height="10px;">&nbsp;&nbsp;';
				strgjlf+='<a href="#" class="tzly" id='+gjlfzc.tzly[i].TMC+'>'+gjlfzc.tzly[i].TMC+'</a></li>';
			}
		jQuery("#leftzczt").html(strgjlf);
		jQuery("#type").val(fl);
		jQuery("#lb").val("TTZLYMC");
	});
	//右边
	
	//跳转
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
					strgjlf+='<table border="0"    width="100%" class="news" >';
					strgjlf+="<tr><th>政策</th><th>有效性</th><th>文号</th><th>公布日期</th>";
					strgjlf+="<tr><td colspan=4><hr><td>";
					var count = 0;
					var pagecount= 0 ;
					for(var i=0;gjlfzc.zc[i]!=null;i++){
						
						
						count=count+1;
							if(i>(($("#pageno2").val()-1)*15-1)&&i<($("#pageno2").val()*15)){
							
								pagecount=pagecount+1;
								
									strgjlf += '<tr  >';
									strgjlf += '<td style="border-top:1px solid #F3F3F3;" width="40%" align="left">';
									strgjlf += '<div  style="width:320px; text-overflow:ellipsis;white-space:nowrap; overflow:hidden;"><a href="../qt/zcztzclook.do?pno='+gjlfzc.zc[i].zcwh+'">'+gjlfzc.zc[i].zcmc+'</a></div></td>';
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
	
	//上一页
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
					strgjlf+='<table border="0"    width="100%" class="news" >';
			      	
					strgjlf+="<tr><th>政策</th><th>有效性</th><th>文号</th><th>公布日期</th>";
					strgjlf+="<tr><td colspan=4><hr><td>";
					var count = 0;
					var pagecount= 0 ;
					for(var i=0;gjlfzc.zc[i]!=null;i++){
						
						
						count=count+1;
							if(i>(($("#pageno").val()-2)*15-1)&&i<(($("#pageno").val()-1)*15)){
							
								pagecount=pagecount+1;
							
									strgjlf += '<tr  >';
									strgjlf += '<td style="border-top:1px solid #F3F3F3;" width="40%" align="left">';
									strgjlf += '<div  style="width:320px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/zcztzclook.do?pno='+gjlfzc.zc[i].zcwh+'">'+gjlfzc.zc[i].zcmc+'</a></div></td>';
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
	//下一页
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
					strgjlf+='<table border="0"    width="100%" class="news" >';
			      	
					strgjlf+="<tr><th>政策</th><th>有效性</th><th>文号</th><th>公布日期</th>";
					strgjlf+="<tr><td colspan=4><hr><td>";
					var count = 0;
					var pagecount= 0 ;
					for(var i=0;gjlfzc.zc[i]!=null;i++){
						
						
						count=count+1;
							if(i>(($("#pageno").val())*15-1)&&i<(($("#pageno").val()+1)*15)){
							
								pagecount=pagecount+1;
								if(i%2==0){
									strgjlf += '<tr  >';
									strgjlf += '<td style="border-top:1px solid #F3F3F3;" width="40%" align="left">';
									strgjlf += '<div  style="width:320px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/zcztzclook.do?pno='+gjlfzc.zc[i].zcwh+'">'+gjlfzc.zc[i].zcmc+'</a></div></td>';
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
	//点击调整领域
	$(document).on('click',	".tzly",function(){
		var fl =""+$(this).attr('id');
		$("#d").html("您的位置：首页->政策导航->政策专题->"+fl);
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
					strgjlf+='<table border="0"    width="100%" class="news" >';
			      	
					strgjlf+="<tr><th>政策</th><th>有效性</th><th>文号</th><th>公布日期</th>";
					strgjlf+="<tr><td colspan=4><hr><td>";
					var count = 0;
					var pagecount= 0 ;
					for(var i=0;gjlfzc.zc[i]!=null;i++){
						
						count=count+1;
						if(i<15){
							pagecount=pagecount+1;
							
								strgjlf += '<tr  >';
								strgjlf += '<td style="border-top:1px solid #F3F3F3;" width="40%" align="left">';
								strgjlf += '<div  style="width:320px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/zcztzclook.do?pno='+gjlfzc.zc[i].zcwh+'">'+gjlfzc.zc[i].zcmc+'</a></div></td>';
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
					strgjlf+='跳转到';
					strgjlf+='<input type="text" size="1" id="pageno2" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
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

