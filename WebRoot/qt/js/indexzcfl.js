$(document).ready(function () {	
	
	
	$(document).on('click',	"#tiaozhuan",function(){
		jQuery.post("../qtzcfl",
				{"lb":$("#lb").val(),
					"fl":$("#type").val(),
				},function(response){
					var news=eval("("+response+")");
					var strnews="";
					var count = 0;
					var pagecount= 0 ;
					strnews+='<legend><strong  ><font size="4"><img src="images/Developer_Icons_032.png" width="32" height="32">'+$("#type").val()+'：</font></strong></legend>';
					strnews+='<hr>';
					strnews+='<table width="730px" border="0" background="images/erjibg.jpg" cellpadding="0" cellspacing="0" bgcolor="#FEFEFE" height="100%" id="news" width="100%" class="news" >';
					for(var i=0;news.zc[i]!=null;i++){
						count=count+1;
						if(i>(($("#pageno2").val()-1)*15-1)&&i<($("#pageno2").val()*15)){
							pagecount=pagecount+1;
							if(i%2==0){
								strnews += '<tr >';
								strnews += '<td width="70%" style="border-top:1px solid #F3F3F3" style="margin-left: 30px;">';
								strnews += '<div  style="width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/qtzclook.do?pno='+news.zc[i].zcwh+'">'+news.zc[i].zcmc+'</a></div></td>';
								
								if(news.zc[i].lasttime.substring(0,10)!=null){
									strnews +=	'<td align="right" style="border-top:1px solid #F3F3F3">['+news.zc[i].lasttime.substring(0,10)+']</td>';
								}
								else{
									strnews +=	'<td style="border-top:1px solid #F3F3F3">&nbsp;</td>';
								}
								strnews += '</tr>';
							}
							else if(i%2==1){
								strnews += '<tr width="100%" >';
								strnews += '<td width="70%"  style="border-top:1px solid #F3F3F3;margin-left: 30px;">';
								strnews += '<div  style="width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/qtzclook.do?pno='+news.zc[i].zcwh+'">'+news.zc[i].zcmc+'</a></div></td>';
								if(news.zc[i].lasttime.substring(0,10)!=null){
									strnews +=	'<td style="border-top:1px solid #F3F3F3;" align="right">['+news.zc[i].lasttime.substring(0,10)+']</td>';
								}
								else{
									strnews +=	'<td style="border-top:1px solid #F3F3F3;">&nbsp;</td>';
								}
								strnews += '</tr>';
							}
						}
						
					}
					strnews+='</table>';
					strnews+='<div >';
					strnews+='<div align="center"> 共有'+pagecount;
					
					strnews+='条最新记录，当前页第'+$("#pageno2").val()+'/'+$("#pageCount").val()+'页 &nbsp;&nbsp; ';
					strnews+='';
					strnews+='<a href="#" class="previous">上一页</a>';
					strnews+='&nbsp;&nbsp;';
					strnews+='';
					strnews+='<a href="#" class="next">下一页</a>';
					strnews+='跳转到';
					strnews+='<input type="text" size="1"  class="pageno2" id="pageno2" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
					strnews+='</div>';
			jQuery("#pageno").val($("#pageno2").val());
			jQuery("#centerright").html(strnews);
			jQuery("#pageCount").html(Math.ceil(count/pagecount));
		});
	});
	
	
	$(document).on('click',	".previous",function(){
		jQuery.post("../qtzcfl",
				{"lb":$("#lb").val(),
					"fl":$("#type").val(),
				},function(response){
					
					var news=eval("("+response+")");
					var strnews="";
					var count = 0;
					var pagecount= 0 ;
					strnews+='<legend><strong  ><font size="4"><img src="images/Developer_Icons_032.png" width="32" height="32">'+$("#type").val()+'：</font></strong></legend>';
					strnews+='<hr>';
					strnews+='<table width="730px" border="0" background="images/erjibg.jpg" cellpadding="0" cellspacing="0" bgcolor="#FEFEFE" height="100%" id="news" width="100%" class="news" >';
					for(var i=0;news.zc[i]!=null;i++){
						count=count+1;
						if(i>(($("#pageno").val()-2)*15-1)&&i<(($("#pageno").val()-1)*15)){
							pagecount=pagecount+1;
							if(i%2==0){
								strnews += '<tr >';
								strnews += '<td width="70%" style="border-top:1px solid #F3F3F3" style="margin-left: 30px;">';
								strnews += '<div  style="width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/qtzclook.do?pno='+news.zc[i].zcwh+'">'+news.zc[i].zcmc+'</a></div></td>';
								
								if(news.zc[i].lasttime.substring(0,10)!=null){
									strnews +=	'<td align="right" style="border-top:1px solid #F3F3F3">['+news.zc[i].lasttime.substring(0,10)+']</td>';
								}
								else{
									strnews +=	'<td style="border-top:1px solid #F3F3F3">&nbsp;</td>';
								}
								strnews += '</tr>';
							}
							else if(i%2==1){
								strnews += '<tr >';
								strnews += '<td width="70%"  style="border-top:1px solid #F3F3F3;margin-left: 30px;">';
								strnews += '<div  style="width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/qtzclook.do?pno='+news.zc[i].zcwh+'">'+news.zc[i].zcmc+'</a></div></td>';
								if(news.zc[i].lasttime.substring(0,10)!=null){
									strnews +=	'<td style="border-top:1px solid #F3F3F3;" align="right">['+news.zc[i].lasttime.substring(0,10)+']</td>';
								}
								else{
									strnews +=	'<td style="border-top:1px solid #F3F3F3;">&nbsp;</td>';
								}
								strnews += '</tr>';
							}
						}
						
					}
					strnews+='</table>';
					strnews+='<div >';
					strnews+='<div align="center"> 共有'+pagecount;
					$("#pageno").val(parseInt($("#pageno").val())-1)
					strnews+='条最新记录，当前页第'+$("#pageno").val()+'/'+$("#pageCount").val()+'页 &nbsp;&nbsp; ';
					strnews+='';
					strnews+='<a href="#" class="previous">上一页</a>';
					strnews+='&nbsp;&nbsp;';
					strnews+='';
					strnews+='<a href="#" class="next">下一页</a>';
					strnews+='跳转到';
					strnews+='<input type="text" size="1"  class="pageno2" id="pageno2" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
					strnews+='</div>';
			jQuery("#centerright").html(strnews);
			jQuery("#pageCount").html(Math.ceil(count/pagecount));
		});
	});
	$(document).on('click',	".next",function(){
		jQuery.post("../qtzcfl",
				{"lb":$("#lb").val(),
					"fl":$("#type").val(),
				},function(response){
					var news=eval("("+response+")");
					var strnews="";
					var count = 0;
					var pagecount= 0 ;
					strnews+='<legend><strong  ><font size="4"><img src="images/Developer_Icons_032.png" width="32" height="32">'+$("#type").val()+'：</font></strong></legend>';
					strnews+='<hr>';
					strnews+='<table width="730px" border="0" background="images/erjibg.jpg" cellpadding="0" cellspacing="0" bgcolor="#FEFEFE" height="100%" id="news" width="100%" class="news" >';
					for(var i=0;news.zc[i]!=null;i++){
						count=count+1;
						if(i>(($("#pageno").val())*15-1)&&i<(($("#pageno").val()*1+1)*15)){
							pagecount=pagecount+1;
							if(i%2==0){
								strnews += '<tr >';
								strnews += '<td width="70%" style="border-top:1px solid #F3F3F3" style="margin-left: 30px;">';
								strnews += '<div  style="width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/qtzclook.do?pno='+news.zc[i].zcwh+'">'+news.zc[i].zcmc+'</a></div></td>';
								
								if(news.zc[i].lasttime.substring(0,10)!=null){
									strnews +=	'<td align="right" style="border-top:1px solid #F3F3F3">['+news.zc[i].lasttime.substring(0,10)+']</td>';
								}
								else{
									strnews +=	'<td style="border-top:1px solid #F3F3F3">&nbsp;</td>';
								}
								strnews += '</tr>';
							}
							else if(i%2==1){
								strnews += '<tr width="100%" >';
								strnews += '<td width="70%"  style="border-top:1px solid #F3F3F3;margin-left: 30px;">';
								strnews += '<div  style="width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/qtzclook.do?pno='+news.zc[i].zcwh+'">'+news.zc[i].zcmc+'</a></div></td>';
								if(news.zc[i].lasttime.substring(0,10)!=null){
									strnews +=	'<td style="border-top:1px solid #F3F3F3;" align="right">['+news.zc[i].lasttime.substring(0,10)+']</td>';
								}
								else{
									strnews +=	'<td style="border-top:1px solid #F3F3F3;">&nbsp;</td>';
								}
								strnews += '</tr>';
							}
						}
						
					}
					strnews+='</table>';
					strnews+='<div>';
					strnews+='<div align="center"> 共有'+pagecount;
					$("#pageno").val(parseInt($("#pageno").val())+1)
					strnews+='条最新记录，当前页第'+$("#pageno").val()+'/'+$("#pageCount").val()+'页 &nbsp;&nbsp; ';
					strnews+='';
					strnews+='<a href="#" class="previous">上一页</a>';
					strnews+='&nbsp;&nbsp;';
					strnews+='';
					strnews+='<a href="#" class="next">下一页</a>';
					strnews+='跳转到';
					strnews+='<input type="text" size="1"  class="pageno2" id="pageno2" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
					strnews+='</div>';
			jQuery("#centerright").html(strnews);
			jQuery("#pageCount").html(Math.ceil(count/pagecount));
		});
	});
	
	$(".sxfw").click(function(){
		var fl =""+$(this).attr('id');
		jQuery.post("../qtzcfl",
				{"lb":"BSXFWMC",
					"fl":fl,
				},function(response){
					var gjlfzc=eval("("+response+")");
					
					var strgjlf="";
					
					strgjlf+='<table width="730px"  background="images/erjibg.jpg"  width="785" height="606" border="0" cellpadding="0" cellspacing="0">';
					strgjlf+='<tr>';
					strgjlf+='<td width="21" height="41"><img src="images/2temp_10.jpg" width="21" height="41"></td>';
			      	
					strgjlf+='<td width="748" background="images/2temp_11.jpg"><div style="margin-top: 15px"><font  color="#FFFFFF">'+fl+'</font>&nbsp;</div></td>';
					strgjlf+='<td width="16"><img src="images/2temp_12.jpg" width="17" height="41"></td>';
					strgjlf+='</tr>';
					strgjlf+='<tr>';
					strgjlf+='<td background="images/2temp_13.jpg">&nbsp;</td>';
					strgjlf+='<td class="center" valign="top" bgcolor="#FFFFFF">';
					strgjlf+='<div  style="margin-top: 20px">';
					strgjlf+='<font size="4"><img src="images/Developer_Icons_032.png" width="32" height="32"></font>';
					strgjlf+='<table width="730px" background="images/erjibg.jpg" border="0" bgcolor="#EFEFEF"  width="100%" class="news" >';
			      	
					strgjlf+="<tr><th>政策</th><th>公布日期</th></tr>";
					var count = 0;
					var pagecount= 0 ;
					
					for(var i=0;gjlfzc.zc[i]!=null;i++){
						
						
						count=count+1;
						if(i<15){
							pagecount=pagecount+1;
							if(i%2==0){
								strgjlf += '<tr >';
								strgjlf += '<td width="80%">';
								strgjlf += '<div  style="width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/zcflzclook.do?pno='+zc.zc[i].zcwh+'">'+zc.zc[i].zcmc+'</a></div></td>';
								if(gjlfzc.zc[i].gbrq!=null){
									strgjlf +=	'<td >['+gjlfzc.zc[i].gbrq+']</td>';
								}
								else{
									strgjlf +=	'<td >&nbsp;</td>';
								}
								strgjlf += '</tr>';
							}
							else if(i%2==1){
								strgjlf += '<tr width="100%" >';
								strgjlf += '<td width="80%">';
								strgjlf += '<div  style="width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/zcflzclook.do?pno='+zc.zc[i].zcwh+'">'+zc.zc[i].zcmc+'</a></div></td>';
								if(gjlfzc.zc[i].gbrq!=null){
									strgjlf +=	'<td >['+gjlfzc.zc[i].gbrq+']</td>';
								}
								else{
									strgjlf +=	'<td >&nbsp;</td>';
								}
								strgjlf += '</tr>';
							}
						}
					}
					
					
					
					
					strgjlf+='</table>';
					strgjlf+='</div>';
					
					
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
					
					
			jQuery("#centerright").html(strnews);
			jQuery("#type").val(fl);
			jQuery("#pageno").val(1);
			jQuery("#lb").val("BSXFWMC");
			jQuery("#pageCount").val(Math.ceil(count/pagecount));
		});
	})
	$(document).on('click',	".zcdh",function(){
		var fl =""+$(this).attr('id');
		jQuery.post("../qtzcfl",
				{"lb":"zcflmc",
					"fl":fl,
				},function(response){
					var news=eval("("+response+")");
					
					var strnews="";
					var count = 0;
					var pagecount= 0 ;
					strnews+='<legend><strong  ><font size="4"><img src="images/Developer_Icons_032.png" width="32" height="32">'+fl+'：</font></strong></legend>';
					strnews+='<hr>';
					strnews+='<table width="730px"   border="0" background="images/erjibg.jpg"  cellpadding="0" cellspacing="0" bgcolor="#FEFEFE" height="100%" id="news" width="100%" class="news" >';
					for(var i=0;news.zc[i]!=null;i++){
						count=count+1;
					}
					for(var i=0;i<15&&news.zc[i]!=null;i++){
						if(i<15){
							pagecount=pagecount+1;
							if(i%2==0){
								strnews += '<tr >';
								strnews += '<td width="70%" style="border-top:1px solid #F3F3F3" style="margin-left: 30px;">';
								strnews += '<div  style="width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/qtzclook.do?pno='+news.zc[i].zcwh+'">'+news.zc[i].zcmc+'</a></div></td>';
								
								if(news.zc[i].lasttime.substring(0,10)!=null){
									strnews +=	'<td align="right" style="border-top:1px solid #F3F3F3">['+news.zc[i].lasttime.substring(0,10)+']</td>';
								}
								else{
									strnews +=	'<td style="border-top:1px solid #F3F3F3">&nbsp;</td>';
								}
								strnews += '</tr>';
							}
							else if(i%2==1){
								strnews += '<tr width="100%" >';
								strnews += '<td width="70%"  style="border-top:1px solid #F3F3F3;margin-left: 30px;">';
								strnews += '<div  style="width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="../qt/qtzclook.do?pno='+news.zc[i].zcwh+'">'+news.zc[i].zcmc+'</a></div></td>';
								if(news.zc[i].lasttime.substring(0,10)!=null){
									strnews +=	'<td style="border-top:1px solid #F3F3F3;" align="right">['+news.zc[i].lasttime.substring(0,10)+']</td>';
								}
								else{
									strnews +=	'<td style="border-top:1px solid #F3F3F3;">&nbsp;</td>';
								}
								strnews += '</tr>';
							}
						}
						
					}
					strnews+='</table>';
					strnews+='<div >';
					strnews+='<div align="center"> 共有'+pagecount;
					
					strnews+='条最新记录，当前页第1/'+Math.ceil(count/pagecount)+'页 &nbsp;&nbsp; ';
					strnews+='';
					strnews+='<a href="#" class="previous">上一页</a>';
					strnews+='&nbsp;&nbsp;';
					strnews+='';
					strnews+='<a href="#" class="next">下一页</a>';
					strnews+='跳转到';
					strnews+='<input type="text" size="1"  class="pageno2" id="pageno2" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
					strnews+='</div>';
			jQuery("#centerright").html(strnews);
			jQuery("#type").val(fl);
			jQuery("#pageno").val(1);
			jQuery("#lb").val("zcflmc");
			jQuery("#pageCount").val(Math.ceil(count/pagecount));
		});
	})
});

