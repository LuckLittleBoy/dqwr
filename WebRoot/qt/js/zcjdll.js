jQuery(function(){
	$(document).ready(function(){
		jQuery.post("../all.zcjd",{"currentpage":"1","pagesize":"15"},function(response){
			if(response=="超出范围"){
				alert("超出范围");
			}else{
				var zcjdlist=eval("("+response+")");
				var strjd="";
				var strbottom="";
				for(var i=0;i<zcjdlist.zcjdlist.length;i++){
					strjd+="<tr>" +
							"<td width='70%' style='border-top:1px solid #F3F3F3;' style='margin-left: 30px;'>" +
							"<div  style='width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;'><img src='images/greeddian.png' style='margin-right:15px;' width='10px' height='10px' /><a href='../jdywqt.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"'><font size='3'>"+zcjdlist.zcjdlist[i].jdtitle+"</font></a><font color='#B2B8C5'>(阅览</font><font color=red>"+zcjdlist.zcjdlist[i].click+"</font><font color='#B2B8C5'>次)</font></div></td>"+
							"</td>" +
							"<td  align='right' style='border-top:1px solid #F3F3F3;'>"+zcjdlist.zcjdlist[i].jdtimes+"</td>" +
							"</tr>";
					
				}
				strbottom+='<div>';
				strbottom+='<div align="center"> 每页 15 条，当前页第 1/'+zcjdlist.allpage+'页 &nbsp;&nbsp; &nbsp;&nbsp;<a href="#" id="next">下一页</a>';
				strbottom+='<a href="#" id="sy">首页</a>&nbsp;&nbsp;<a href="#" id="my">尾页</a>  跳转到';
				strbottom+='<input type="text" size="1"  style="width: 20px;height: 15px;" id="pageno2"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
				strbottom+="</div>";
				$("#zcjdtable").html(strjd);
				$("#bottom").html(strbottom);
				$("#allpage").val(zcjdlist.allpage);
				$("#currentpage").val(1);
				crossColor()
			}
			
		})
	});
		
	$(document).on('click',	"#previous",function(){
		var currentpage = parseInt($("#currentpage").val())-1;
		var searchhd = $("#searchhd").val();
		jQuery.post("../all.zcjd",{"searchnr":searchhd,"currentpage":currentpage,"pagesize":"15"},function(response){
			if(response=="超出范围"){
				alert("超出范围");
			}else{
				var zcjdlist=eval("("+response+")");
				var strjd="";
				var strbottom="";
				for(var i=0;i<zcjdlist.zcjdlist.length;i++){
					strjd+="<tr>" +
					"<td width='70%' style='border-top:1px solid #F3F3F3;' style='margin-left: 30px;'>" +
					"<div  style='width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;'><img src='images/greeddian.png' style='margin-right:15px;' width='10px' height='10px' /><a href='../jdywqt.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"'><font size='3'>"+zcjdlist.zcjdlist[i].jdtitle+"</font></a><font color='#B2B8C5'>(阅览</font><font color=red>"+zcjdlist.zcjdlist[i].click+"</font><font color='#B2B8C5'>次)</font></div></td>"+
					"</td>" +
					"<td align='right' style='border-top:1px solid #F3F3F3;'>"+zcjdlist.zcjdlist[i].jdtimes+"</td>" +
					"</tr>";
				}
				strbottom+='<div  >';
				strbottom+='<div align="center"> 每页 15 条，当前页第 1/'+zcjdlist.allpage+'页 &nbsp;&nbsp; ';
				if(currentpage!=1){
					strbottom+='<a href="#" id="previous">上一页</a>';
				}
				strbottom+='&nbsp;&nbsp;<a href="#" id="next">下一页</a>';
				strbottom+='<a href="#" id="sy">首页</a>&nbsp;&nbsp;<a href="#" id="my">尾页</a>  跳转到';
				strbottom+='<input type="text" size="1"  style="width: 20px;height: 15px;" id="pageno2"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
				strbottom+="</div>";
				$("#zcjdtable").html(strjd);
				$("#bottom").html(strbottom);
				$("#allpage").val(zcjdlist.allpage);
				$("#currentpage").val(currentpage);
				crossColor()
			}
			
		})
	});
	$(document).on('click',	"#next",function(){
		var currentpage = parseInt($("#currentpage").val())+1;
		var searchhd = $("#searchhd").val();
		jQuery.post("../all.zcjd",{"searchnr":searchhd,"currentpage":currentpage,"pagesize":"15"},function(response){
			if(response=="超出范围"){
				alert("超出范围");
			}else{
				var zcjdlist=eval("("+response+")");
				var strjd="";
				var strbottom="";
				
				for(var i=0;i<zcjdlist.zcjdlist.length;i++){
					strjd+="<tr>" +
					"<td width='70%' style='border-top:1px solid #F3F3F3;' style='margin-left: 30px;'>" +
					"<div  style='width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;'><img src='images/greeddian.png' style='margin-right:15px;' width='10px' height='10px' /><a href='../jdywqt.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"'><font size='3'>"+zcjdlist.zcjdlist[i].jdtitle+"</font></a><font color='#B2B8C5'>(阅览</font><font color=red>"+zcjdlist.zcjdlist[i].click+"</font><font color='#B2B8C5'>次)</font></div></td>"+
					"</td>" +
					"<td align='right' style='border-top:1px solid #F3F3F3;'>"+zcjdlist.zcjdlist[i].jdtimes+"</td>" +
					"</tr>";
				}
				strbottom+='<div >';
				strbottom+='<div align="center"> 每页 15 条，当前页第 '+currentpage+'/'+zcjdlist.allpage+'页 &nbsp;&nbsp; <a href="#" id="previous">上一页</a>&nbsp;&nbsp;';
				if(currentpage!=zcjdlist.allpage){
					strbottom+='<a href="#" id="next">下一页</a>';
				}
				strbottom+='<a href="#" id="sy">首页</a>&nbsp;&nbsp;<a href="#" id="my">尾页</a>  跳转到';
				strbottom+='<input type="text" size="1"  style="width: 20px;height: 15px;" id="pageno2"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
				strbottom+="</div>";
				$("#zcjdtable").html(strjd);
				$("#bottom").html(strbottom);
				$("#allpage").val(zcjdlist.allpage);
				$("#currentpage").val(currentpage);
				crossColor()
			}
		})
	});
	$(document).on('click',	"#my",function(){
		var searchhd = $("#searchhd").val();
		jQuery.post("../all.zcjd",{"searchnr":searchhd,"currentpage":$("#allpage").val(),"pagesize":"15"},function(response){
			if(response=="超出范围"){
				alert("超出范围");
			}else{
				var zcjdlist=eval("("+response+")");
				var strjd="";
				var strbottom="";
				
				for(var i=0;i<zcjdlist.zcjdlist.length;i++){
					strjd+="<tr>" +
					"<td width='70%' style='border-top:1px solid #F3F3F3;' style='margin-left: 30px;'>" +
					"<div  style='width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;'><img src='images/greeddian.png' style='margin-right:15px;' width='10px' height='10px' /><a href='../jdywqt.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"'><font size='3'>"+zcjdlist.zcjdlist[i].jdtitle+"</font></a><font color='#B2B8C5'>(阅览</font><font color=red>"+zcjdlist.zcjdlist[i].click+"</font><font color='#B2B8C5'>次)</font></div></td>"+
					"</td>" +
					"<td align='right' style='border-top:1px solid #F3F3F3;'>"+zcjdlist.zcjdlist[i].jdtimes+"</td>" +
					"</tr>";
				}
				strbottom+='<div >';
				strbottom+='<div align="center"> 每页 15 条，当前页第 '+$("#allpage").val()+'/'+zcjdlist.allpage+'页 &nbsp;&nbsp; <a href="#" id="previous">上一页</a>&nbsp;&nbsp;';
				
				strbottom+='<a href="#" id="sy">首页</a>&nbsp;&nbsp;<a href="#" id="my">尾页</a>  跳转到';
				strbottom+='<input type="text" size="1"  style="width: 20px;height: 15px;" id="pageno2"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
				strbottom+="</div>";
				$("#zcjdtable").html(strjd);
				$("#bottom").html(strbottom);
				$("#allpage").val(zcjdlist.allpage);
				$("#currentpage").val($("#allpage").val());
				crossColor()
			}
			
		})
	});
	$(document).on('click',	"#sy",function(){
		var searchhd = $("#searchhd").val();
		jQuery.post("../all.zcjd",{"searchnr":searchhd,"currentpage":"1","pagesize":"15"},function(response){
			if(response=="超出范围"){
				alert("超出范围");
			}else{
				var zcjdlist=eval("("+response+")");
				var strjd="";
				var strbottom="";
				
				for(var i=0;i<zcjdlist.zcjdlist.length;i++){
					strjd+="<tr>" +
					"<td width='70%' style='border-top:1px solid #F3F3F3;' style='margin-left: 30px;'>" +
					"<div  style='width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;'><img src='images/greeddian.png' style='margin-right:15px;' width='10px' height='10px' /><a href='../jdywqt.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"'><font size='3'>"+zcjdlist.zcjdlist[i].jdtitle+"</font></a><font color='#B2B8C5'>(阅览</font><font color=red>"+zcjdlist.zcjdlist[i].click+"</font><font color='#B2B8C5'>次)</font></div></td>"+
					"</td>" +
					"<td align='right' style='border-top:1px solid #F3F3F3;'>"+zcjdlist.zcjdlist[i].jdtimes+"</td>" +
					"</tr>";
				}
				strbottom+='<div >';
				strbottom+='<div align="center"> 每页 15 条，当前页第 '+1+'/'+zcjdlist.allpage+'页 &nbsp;&nbsp; &nbsp;&nbsp;';
				strbottom+='<a href="#" id="next">下一页</a>';
				strbottom+='<a href="#" id="sy">首页</a>&nbsp;&nbsp;<a href="#" id="my">尾页</a>  跳转到';
				strbottom+='<input type="text" size="1"  style="width: 20px;height: 15px;" id="pageno2"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
				strbottom+="</div>";
				$("#zcjdtable").html(strjd);
				$("#bottom").html(strbottom);
				$("#allpage").val(zcjdlist.allpage);
				$("#currentpage").val(1);
				crossColor()
			}
			
		})
	});
	$(document).on('click',	"#tiaozhuan",function(){
		var currentpage = $("#pageno2").val();
		var searchhd = $("#searchhd").val();
		jQuery.post("../all.zcjd",{"searchnr":searchhd,"currentpage":currentpage,"pagesize":"15"},function(response){
			if(response=="超出范围"){
				alert("超出范围");
			}else{
				var zcjdlist=eval("("+response+")");
				var strjd="";
				var strbottom="";
				
				for(var i=0;i<zcjdlist.zcjdlist.length;i++){
					strjd+="<tr>" +
					"<td width='70%' style='border-top:1px solid #F3F3F3;' style='margin-left: 30px;'>" +
					"<div  style='width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;'><img src='images/greeddian.png' style='margin-right:15px;' width='10px' height='10px' /><a href='../jdywqt.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"'><font size='3'>"+zcjdlist.zcjdlist[i].jdtitle+"</font></a><font color='#B2B8C5'>(阅览</font><font color=red>"+zcjdlist.zcjdlist[i].click+"</font><font color='#B2B8C5'>次)</font></div></td>"+
					"</td>" +
					"<td align='right' style='border-top:1px solid #F3F3F3;'>"+zcjdlist.zcjdlist[i].jdtimes+"</td>" +
					"</tr>";
				}
				strbottom+='<div  >';
				strbottom+='<div align="center"> 每页 15 条，当前页第 '+currentpage+'/'+zcjdlist.allpage+'页 &nbsp;&nbsp; &nbsp;&nbsp;';
				if(currentpage!=1){
					strbottom+='<a href="#" id="previous">上一页</a>&nbsp;&nbsp;';
				}
				if(currentpage!=zcjdlist.allpage){
					strbottom+='<a href="#" id="next">下一页</a>';
				}
				strbottom+='<a href="#" id="sy">首页</a>&nbsp;&nbsp;<a href="#" id="my">尾页</a>  跳转到';
				strbottom+='<input type="text" size="1"  style="width: 20px;height: 15px;" id="pageno2"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
				strbottom+="</div>";
				$("#zcjdtable").html(strjd);
				$("#bottom").html(strbottom);
				$("#allpage").val(zcjdlist.allpage);
				$("#currentpage").val(currentpage);
				crossColor()
			}
			
		})
	});
	$(document).on('click',	"#search",function(){
		var searchnr = $("#searchnr").val();
		jQuery.post("../all.zcjd",{"searchnr":searchnr,"currentpage":"1","pagesize":"15"},function(response){
			if(response=="超出范围"){
				alert("没有结果");
			}else{
				var zcjdlist=eval("("+response+")");
				var strjd="";
				var strbottom="";
				
				for(var i=0;i<zcjdlist.zcjdlist.length;i++){
					strjd+="<tr>" +
					"<td width='70%' style='border-top:1px solid #F3F3F3;' style='margin-left: 30px;'>" +
					"<div  style='width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;'><img src='images/greeddian.png' style='margin-right:15px;' width='10px' height='10px' /><a href='../jdywqt.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"'><font size='3'>"+zcjdlist.zcjdlist[i].jdtitle+"</font></a><font color='#B2B8C5'>(阅览</font><font color=red>"+zcjdlist.zcjdlist[i].click+"</font><font color='#B2B8C5'>次)</font></div></td>"+
					
					"</td>" +
					"<td align='right' style='border-top:1px solid #F3F3F3;'>"+zcjdlist.zcjdlist[i].jdtimes+"</td>" +
					"</tr>";
				}
				strbottom+='<div >';
				strbottom+='<div align="center"> 每页 15 条，当前页第 1/'+zcjdlist.allpage+'页 &nbsp;&nbsp; &nbsp;&nbsp;<a href="#" id="next">下一页</a>';
				strbottom+='<a href="#" id="sy">首页</a>&nbsp;&nbsp;<a href="#" id="my">尾页</a>  跳转到';
				strbottom+='<input type="text" size="1"  style="width: 20px;height: 15px;" id="pageno2"></input>页&nbsp;&nbsp;<a href="#" id="tiaozhuan">跳转</a></div>';
				strbottom+="</div>";
				$("#zcjdtable").html(strjd);
				$("#bottom").html(strbottom);
				$("#allpage").val(zcjdlist.allpage);
				$("#currentpage").val(1);
				$("#searchhd").val($("#searchnr").val())
				crossColor()
			}
			
		})
	});
});

function crossColor(){
	var tab = document.getElementById("zcjdtable");
	var trs = tab.rows;
	for(var i=1;i<trs.length;i++){
		if(i%2==1) trs[i].className = "one";
		else trs[i].className = "two";

		var name;
		trs[i].onmouseover = function(){
			name = this.className;
			this.className = "over";
		}
		trs[i].onmouseout = function(){
			this.className = name;
		}
	}
}
