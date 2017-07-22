jQuery(function(){
	$(document).ready(function(){
		jQuery.post("../all.zcjd",{"currentpage":"1","pagesize":"15"},function(response){
			if(response=="超出范围"){
				alert("超出范围");
			}else{
				var zcjdlist=eval("("+response+")");
				var strjd="";
				var strbottom="";
				strjd+="<tr align='center'><th width='40px'>序号</th><th>标题</th><th>录入人</th><th width='100px'>录入时间</th><th>操作</th></tr>";
				for(var i=0;i<zcjdlist.zcjdlist.length;i++){
					strjd+="<tr>" +
							"<td>"+parseInt(i+1)+"</td>" +
							"<td><a href='../jdyw.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"'>"+zcjdlist.zcjdlist[i].jdtitle+"</a></td>" +
							"<td>"+zcjdlist.zcjdlist[i].jdwhos+"</td>" +
							"<td>"+zcjdlist.zcjdlist[i].jdtimes+"</td>" +
							"<td><a href='#' class='delete' id='"+zcjdlist.zcjdlist[i].jdid+"' >删除</a>&nbsp;<a href='../jdbjyw.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"' >编辑</a></td>" +
							"</tr>";
				}
				strbottom+='<div style="background: #C0E4FA;position: relative;" >';
				strbottom+='<div style="background: #C0E4FA;position:absolute;" align="left"> 每页 15 条，当前页第 1/'+zcjdlist.allpage+'页 &nbsp;&nbsp; &nbsp;&nbsp;<a href="#" id="next">下一页</a></div>';
				strbottom+='<div align="right"><a href="#" id="sy">首页</a>&nbsp;&nbsp;<a href="#" id="my">尾页</a>  跳转到';
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
		
	$(document).on('click',	".delete",function(){
		var jdid=""+$(this).attr('id');
		jQuery.post("../delete.zcjd",{"jdid":jdid},function(response){
			alert(response);
			location.reload();
		});
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
				strjd+="<tr align='center'><th width='40px'>序号</th><th>标题</th><th>录入人</th><th width='100px'>录入时间</th><th>操作</th></tr>";
				for(var i=0;i<zcjdlist.zcjdlist.length;i++){
					strjd+="<tr>" +
							"<td>"+parseInt(i+1)+"</td>" +
							"<td><a href='../jdyw.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"'>"+zcjdlist.zcjdlist[i].jdtitle+"</a></td>" +
							"<td>"+zcjdlist.zcjdlist[i].jdwhos+"</td>" +
							"<td>"+zcjdlist.zcjdlist[i].jdtimes+"</td>" +
							"<td><a href='#' class='delete' id='"+zcjdlist.zcjdlist[i].jdid+"' >删除</a>&nbsp;<a href='../jdbjyw.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"' >编辑</a></td>" +
							"</tr>";
				}
				strbottom+='<div style="background: #C0E4FA;position: relative;" >';
				strbottom+='<div style="background: #C0E4FA;position:absolute;" align="left"> 每页 15 条，当前页第 1/'+zcjdlist.allpage+'页 &nbsp;&nbsp; ';
				if(currentpage!=1){
					strbottom+='<a href="#" id="previous">上一页</a>';
				}
				strbottom+='&nbsp;&nbsp;<a href="#" id="next">下一页</a></div>';
				strbottom+='<div align="right"><a href="#" id="sy">首页</a>&nbsp;&nbsp;<a href="#" id="my">尾页</a>  跳转到';
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
				strjd+="<tr align='center'><th width='40px'>序号</th><th>标题</th><th>录入人</th><th width='100px'>录入时间</th><th>操作</th></tr>";
				for(var i=0;i<zcjdlist.zcjdlist.length;i++){
					strjd+="<tr>" +
							"<td>"+parseInt(i+1)+"</td>" +
							"<td><a href='../jdyw.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"'>"+zcjdlist.zcjdlist[i].jdtitle+"</a></td>" +
							"<td>"+zcjdlist.zcjdlist[i].jdwhos+"</td>" +
							"<td>"+zcjdlist.zcjdlist[i].jdtimes+"</td>" +
							"<td><a href='#' class='delete' id='"+zcjdlist.zcjdlist[i].jdid+"' >删除</a>&nbsp;<a href='../jdbjyw.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"' >编辑</a></td>" +
							"</tr>";
				}
				strbottom+='<div style="background: #C0E4FA;position: relative;" >';
				strbottom+='<div style="background: #C0E4FA;position:absolute;" align="left"> 每页 15 条，当前页第 '+currentpage+'/'+zcjdlist.allpage+'页 &nbsp;&nbsp; <a href="#" id="previous">上一页</a>&nbsp;&nbsp;';
				if(currentpage!=zcjdlist.allpage){
					strbottom+='<a href="#" id="next">下一页</a>';
				}
				strbottom+='</div><div align="right"><a href="#" id="sy">首页</a>&nbsp;&nbsp;<a href="#" id="my">尾页</a>  跳转到';
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
				strjd+="<tr align='center'><th width='40px'>序号</th><th>标题</th><th>录入人</th><th width='100px'>录入时间</th><th>操作</th></tr>";
				for(var i=0;i<zcjdlist.zcjdlist.length;i++){
					strjd+="<tr>" +
							"<td>"+parseInt(i+1)+"</td>" +
							"<td><a href='../jdyw.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"'>"+zcjdlist.zcjdlist[i].jdtitle+"</a></td>" +
							"<td>"+zcjdlist.zcjdlist[i].jdwhos+"</td>" +
							"<td>"+zcjdlist.zcjdlist[i].jdtimes+"</td>" +
							"<td><a href='#' class='delete' id='"+zcjdlist.zcjdlist[i].jdid+"' >删除</a>&nbsp;<a href='../jdbjyw.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"' >编辑</a></td>" +
							"</tr>";
				}
				strbottom+='<div style="background: #C0E4FA;position: relative;" >';
				strbottom+='<div style="background: #C0E4FA;position:absolute;" align="left"> 每页 15 条，当前页第 '+$("#allpage").val()+'/'+zcjdlist.allpage+'页 &nbsp;&nbsp; <a href="#" id="previous">上一页</a>&nbsp;&nbsp;';
				
				strbottom+='</div><div align="right"><a href="#" id="sy">首页</a>&nbsp;&nbsp;<a href="#" id="my">尾页</a>  跳转到';
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
				strjd+="<tr align='center'><th width='40px'>序号</th><th>标题</th><th>录入人</th><th width='100px'>录入时间</th><th>操作</th></tr>";
				for(var i=0;i<zcjdlist.zcjdlist.length;i++){
					strjd+="<tr>" +
							"<td>"+parseInt(i+1)+"</td>" +
							"<td><a href='../jdyw.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"'>"+zcjdlist.zcjdlist[i].jdtitle+"</a></td>" +
							"<td>"+zcjdlist.zcjdlist[i].jdwhos+"</td>" +
							"<td>"+zcjdlist.zcjdlist[i].jdtimes+"</td>" +
							"<td><a href='#' class='delete' id='"+zcjdlist.zcjdlist[i].jdid+"' >删除</a>&nbsp;<a href='../jdbjyw.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"' >编辑</a></td>" +
							"</tr>";
				}
				strbottom+='<div style="background: #C0E4FA;position: relative;" >';
				strbottom+='<div style="background: #C0E4FA;position:absolute;" align="left"> 每页 15 条，当前页第 '+1+'/'+zcjdlist.allpage+'页 &nbsp;&nbsp; &nbsp;&nbsp;';
				strbottom+='<a href="#" id="next">下一页</a>';
				strbottom+='</div><div align="right"><a href="#" id="sy">首页</a>&nbsp;&nbsp;<a href="#" id="my">尾页</a>  跳转到';
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
				strjd+="<tr align='center'><th width='40px'>序号</th><th>标题</th><th>录入人</th><th width='100px'>录入时间</th><th>操作</th></tr>";
				for(var i=0;i<zcjdlist.zcjdlist.length;i++){
					strjd+="<tr>" +
							"<td>"+parseInt(i+1)+"</td>" +
							"<td><a href='../jdyw.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"'>"+zcjdlist.zcjdlist[i].jdtitle+"</a></td>" +
							"<td>"+zcjdlist.zcjdlist[i].jdwhos+"</td>" +
							"<td>"+zcjdlist.zcjdlist[i].jdtimes+"</td>" +
							"<td><a href='#' class='delete' id='"+zcjdlist.zcjdlist[i].jdid+"' >删除</a>&nbsp;<a href='../jdbjyw.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"' >编辑</a></td>" +
							"</tr>";
				}
				strbottom+='<div style="background: #C0E4FA;position: relative;" >';
				strbottom+='<div style="background: #C0E4FA;position:absolute;" align="left"> 每页 15 条，当前页第 '+currentpage+'/'+zcjdlist.allpage+'页 &nbsp;&nbsp; &nbsp;&nbsp;';
				if(currentpage!=1){
					strbottom+='<a href="#" id="previous">上一页</a>&nbsp;&nbsp;';
				}
				if(currentpage!=zcjdlist.allpage){
					strbottom+='<a href="#" id="next">下一页</a>';
				}
				strbottom+='</div><div align="right"><a href="#" id="sy">首页</a>&nbsp;&nbsp;<a href="#" id="my">尾页</a>  跳转到';
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
				strjd+="<tr align='center'><th width='40px'>序号</th><th>标题</th><th>录入人</th><th width='100px'>录入时间</th><th>操作</th></tr>";
				for(var i=0;i<zcjdlist.zcjdlist.length;i++){
					strjd+="<tr>" +
							"<td>"+parseInt(i+1)+"</td>" +
							"<td><a href='../jdyw.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"'>"+zcjdlist.zcjdlist[i].jdtitle+"</a></td>" +
							"<td>"+zcjdlist.zcjdlist[i].jdwhos+"</td>" +
							"<td>"+zcjdlist.zcjdlist[i].jdtimes+"</td>" +
							"<td><a href='#' class='delete' id='"+zcjdlist.zcjdlist[i].jdid+"' >删除</a>&nbsp;<a href='../jdbjyw.zcjd?jdid="+zcjdlist.zcjdlist[i].jdid+"' >编辑</a></td>" +
							"</tr>";
				}
				strbottom+='<div style="background: #C0E4FA;position: relative;" >';
				strbottom+='<div style="background: #C0E4FA;position:absolute;" align="left"> 每页 15 条，当前页第 1/'+zcjdlist.allpage+'页 &nbsp;&nbsp; &nbsp;&nbsp;<a href="#" id="next">下一页</a></div>';
				strbottom+='<div align="right"><a href="#" id="sy">首页</a>&nbsp;&nbsp;<a href="#" id="my">尾页</a>  跳转到';
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
	var tab = document.getElementsByTagName("table")[0];
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

