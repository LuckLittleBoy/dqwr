<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,com.satp.entity.*, java.util.ArrayList"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<title>河北省科技政策综合检索</title>

<style type="text/css">
	body { font:14px/1.5  宋体,宋体, \5b8b\4f53, sans-serif; }
	ul { margin:0; padding:0; list-style:none; }
	a { margin-left:5px; color:#07F; text-decoration:none; }
	a:hover { text-decoration:underline; }
	input { border:1px solid #ccc; margin:2px; }       
	table { border-collapse:collapse; border-spacing:0; }
	td { margin:0; padding:10px; border:1px solid #ccc; }
	th{
		border-color: #666666;
		background-color: #dedede;
	}
	h1{margin:0;padding:20px 0;font-size:16px;}
ol{padding-left:20px;line-height:130%;}
#box{width:600px;text-align:left;margin:0 auto;padding-top:80px;}
#suggest,#suggest2{width:200px;}
.gray{color:black;}
.ac_results {background:#fff;border:1px solid #7f9db9;position:absolute;z-index:10000;display:none;}
.ac_results ul{margin:0;padding:0;list-style:none;}
.ac_results li a{white-space:nowrap;text-decoration:none;display:block;color:#05a;padding:1px 3px;}
.ac_results li{border:1px solid #fff;}
.ac_over,.ac_results li a:hover {background:#c8e3fc;}
.ac_results li a span{float:right;}
.ac_result_tip{border-bottom:1px dashed #666;padding:3px;}
</style> 
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/activeadd2.js"></script>
<script type="text/javascript" src="js/levelSelect-ajax3.js"></script>
<script type="text/javascript" src="js/Calendar.js"></script>
<script  type="text/javascript" src="js/fenye.js"></script>
<SCRIPT>
function resultReach(id){
	var result=document.getElementById("result");
	var res=document.getElementById("res");
	if(id==2)
	{
		result.value="2";
		res.value="1";		
	}
	else if(id==1)
	{
		result.value="1";
		res.value="1";
	}
	form1.submit();
}
$(function(){
	$("#test").click(function(){
		$.openLayer({
			maxItems : 5,
			pid : "0",
			returnText : "restxts",
			returnValue : "resvals",
			span_width : {d1:120,d2:150,d3:150},
			index : 1
		});
	});
	$("#test2").click(function(){
		$.openLayer({
			maxItems : 5,
			pid : "1",
			returnText : "restxts2",
			returnValue : "resvals2",
			span_width : {d1:120,d2:150,d3:150},
			index : 2
		});
	});
});
</SCRIPT>
</head>
 <%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String sql2=(String)request.getAttribute("sql");


int pageno =0;
int pagesize =0;
int pageCount=1;
String size=(String)request.getAttribute("pagesize");
if(size!=null){
	pagesize = Integer.parseInt(size);
}
if(pagesize<=0){
	pagesize = 15;
	}
pageno=(Integer)request.getAttribute("pageno");
if(pageno<=0){
	 pageno = 1;
	}
pageCount=(Integer)request.getAttribute("pageCount");

if (pageno>pageCount){
	%>
	<script type="text/javascript"></script>
	<%
	pageno=1;
}

%>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
	<div style="margin: 5px 0px 0px 10px;background-color: white;height: 98%; min-height: 550px;">
<div class="main">
    <div class="wraper">
		<form name="form1" class="form1" method="post" action="ZcSearchServlet">
		<table align="center" width="100%">
			<tbody>
				 <tr>
					  <td><strong  >控制条件</strong></td>
					  <td>
					  <strong  >时效状态 :</strong>
						   <select class="i-text" name="sxzt" style="width:90px">
							   <option value="2" selected="selected">请选择</option>
							   <option value="1">有效</option>
							   <option value="0">失效</option>
						   </select>
					  <ul id="demo5">
						  <li>
					        <select class="i-text" name="condition">
							   <option selected="selected" value="and">并含</option>
							   <option value="or">或含</option>
							   <option value="and not">不含</option>
						   </select>->
						   <select class="i-text" name="demo">
							   <option value="pname" selected="selected">政策名称</option>
							   <option value="pno" >序号或文号</option>
							   <option value="field" >所属专题</option>
							   <option value="pBBXS">颁布形式</option>
							   <option value="pcategories" >政策分类</option>
							   <option value="ZTC" >主题词</option>
							   <option value="GJZ">关键词</option>
						   </select>:
						   <input  maxlength="15" name="find"  type="text" />
						   <select class="i-text" name="fangshi">
						       <option selected="selected" value="2">模糊查询</option>
							   <option value="1">精确查询</option>
						   </select>
						  
						   </li>
					   </ul>
					   <a href="#">+ 添加（最多10项）</a>
					  <div>
					        <strong  >施行范围:</strong>
					        <select class="i-text" name="condition">
							   <option selected="selected" value="and">并含</option>
							   <option value="or">或含</option>
							   <option value="and not">不含</option>
						   </select>
					       <input  maxlength="15" type="text"  id='restxts' readonly="readonly"/>
					       <input  maxlength="15" name="pboundary"  type="hidden"  id='resvals' readonly="readonly"/>
					       <input  name="test" id="test" type="button" value="选择" />
					       <select class="i-text" name="fangshi">
							   <option  value="1">精确查询</option>
							   <option selected="selected" value="2">模糊查询</option>
						   </select>
					  </div>
					  <div>
					       <strong  >制定机关:</strong>
					       <select class="i-text" name="condition">
							   <option selected="selected" value="and">并含</option>
							   <option value="or">或含</option>
							   <option value="and not">不含</option>
						   </select>
					       <input  maxlength="15"   type="text"  id='restxts2' readonly="readonly" />
					       <input  maxlength="15" name="poffice"  type="hidden"  id='resvals2' readonly="readonly"/>
					       <input  name="test" id="test2" type="button" value="选择" />
					       <select class="i-text" name="fangshi">
							   <option value="1">精确查询</option>
							   <option selected="selected" value="2">模糊查询</option>
						   </select>
					  </div>
				 </tr>
				 <tr>
	                  <td style="width:15%;"><strong  >时间条件</strong></td>
					  <td>
						   <ul id="demo2">
							   <li>
							   <select class="i-text" name="condition">
							   <option selected="selected" value="and">并含</option>
							   <option value="or">或含</option>
							   <option value="and not">不含</option>
						   </select>->
							   <select class="i-text" name="timeSearch">
								   <option value="publishtime">公布日期</option>
								   <option selected="selected" value="applytime">施行日期</option>
								   <option value="breaktime">废止日期</option>
							   </select>:
							         从<input  maxlength="15" name="startT" type="text"  onclick="new Calendar().show(this);" readonly="readonly"/>到<input maxlength="15" name="endT" type="text" onclick="new Calendar().show(this);" readonly="readonly"/>
							   </li>
						   </ul>
					   <a href="#">+ 添加（最多3项）</a>
					  </td>
					  
				 </tr>
				 <tr>      
					  <td colspan="2" align="right">
					  <input type="hidden" value="2" name="res" id="res"/>
					  <input type="hidden" value="1" id="result" name="result">   
					  <input type="image"  src="images/tj.gif" onClick="resultReach(1);">
					  <input type="image"  src="images/jgzjs.gif" onClick="resultReach(2);" >
					  </td>
				 </tr>
			</tbody>
		</table>
		</form>
	</div>
	<div style="position: relative;min-height: 490px; " >
		<table  style="width:100%" >
			<tr align="center"><th width='40px'>序号</th><th>政策名称</th><th width='80px'>政策类别</th><th width='100px'>施行时间</th><th width='80px'>时效状态</th>
			</tr >
			<%
			ArrayList<Policy> policytaglist = (ArrayList<Policy>)request.getAttribute("policytaglist"); //结果集
				int i=0;
				for(Policy policy : policytaglist){ 
					i=i+1;
					if(i%2==1){
			%>
					<tr align="center" bgcolor="#ffffff">
						<td><%=i %></td>
						<td align="left"><a href=ZCLookServlet?pno=<%=policy.getPno()%>><%=policy.getPname() %></a></td>
						<td><%=policy.getPcategories() %></td>
						<td><%=policy.getApplytime() %></td>
						<%if(policy.getSxzt()==1) {%>
						<td>有效</td>
						<%}else {%>
						<td>无效</td>
						<%} %>
						
					</tr>
				<%}else{%>
					<tr align="center" bgcolor="#F0F0F0">
						<td><%=i %></td>
						<td align="left"><a href=ZCLookServlet?pno=<%=policy.getPno() %>><%=policy.getPname() %></a></td>
						<td><%=policy.getPcategories() %></td>
						<td><%=policy.getApplytime() %></td>
						<%if(policy.getSxzt()==1) {%>
						<td>有效</td>
						<%}else {%>
						<td>无效</td>
						<%} %>
						
					</tr>
				<%} %>
			<%}
				%>
			</table>
			<div style="background: #C0E4FA;position: relative;" >
		<div style="background: #C0E4FA;position:absolute;" align="left"> 共有 <%=i %> 条最新记录，当前页第<%=pageno %>/<%=pageCount %>页 &nbsp;&nbsp; 
		<%if(pageno>1){ %>
		<a href="ZcSearchServlet?pageno=<%if((pageno+1)<1) out.print(1);else out.print(pageno-1); %>">上一页</a>
		 <%} %>&nbsp;&nbsp;
		  <%if(pageno<pageCount){ %>
		 <a href="ZcSearchServlet?pageno=<%if((pageno+1)>pageCount) out.print(pageCount);else out.print(pageno+1); %>">下一页</a>
		 <%} %></div>
		<div align="right">
		<%if(pageno>1){ %>
		<a href="ZcSearchServlet?pageno=1">首页</a><%} %>&nbsp;&nbsp;
		<%if(pageno<pageCount){ %>
		<a href="ZcSearchServlet?pageno=<%=pageCount%>">尾页</a><%} %>
		  跳转到
		 <input type="text" size="1"  class="pageno" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" onclick="goses()">跳转</a></div>
		</div>
		</div>
</div>
</div>
</body>
</html>