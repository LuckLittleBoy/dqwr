<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,com.satp.entity.*, java.util.ArrayList"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script language="javascript" src="js/jquery.js"></script>
	<script language="javascript" src="js/Calendar.js"></script>
	<script language="javascript" src="js/fenye.js"></script>
	<style type="text/css">
	body { font:14px/1.5  宋体,宋体, \5b8b\4f53, sans-serif; }
	ul { margin:0; padding:0; list-style:none; }
	a { margin-left:5px; color:#07F; text-decoration:none; }
	a:hover { text-decoration:underline; }
	input { border:1px solid #ccc; margin:2px; }
	table { border-collapse:collapse; border-spacing:0; }
	th{
		border-color: #666666;
		background-color: #dedede;
	}
	td { margin:0; padding:10px; border:1px solid #ccc; }
    </style>
    <script language="javascript">
	//设置cookie
	function addCookie(name,expiresHours){
		//重复的不再写入
		var value=$(".pno").val();
		var is=true;
		var strCookie=document.cookie; 
		var arrCookie=strCookie.split(";"); 
		for(var i=0;i<arrCookie.length;i++){ 
			var arr=arrCookie[i].split("="); 
			if(arr[1]==value){
				alert(value);
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
	function resultReach(id){
		var result=document.getElementById("result");
		if(id==2)
			{
			result.value="2";
			}
		else if(id==1)
			{
			result.value="1";
			}
		form1.submit();
	}
	</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
 	<div style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 550px;"">
 <%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String type =(String)request.getAttribute("type");
String keyword =(String)request.getAttribute("keyword");

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
	
	<%
	pageno=1;
}

%>
<form name="form1" method="post" action="ZcFindServlet">
<fieldset>
    <legend><strong  >选择检索条件：</strong></legend>
    <div style="background-color: #ffffff; position: relative;margin-top:8px;margin-left:12px;border: #ffffff 2px solid" >
    <strong  >时效状态:</strong>
    <select class="i-text" name="sxzt">
		 <option value="2" selected="selected">选择</option>
		 <option value="1">有效</option>
		 <option value="0">失效</option>
	</select>
	<span style="margin-left:29px"><strong  >标引条件:</strong></span>
    <select class="i-text" name="Search">
			   <option value="pname" selected="selected">政策名称</option>
			   <option value="pcategories">政策分类</option>
			   <option value="pBBXS">颁布形式</option>
			   <option value="pno" >序号或文号</option>
			   <option value="field">所属专题</option>
			   <option value="ZTC" >主题词</option>
			   <option value="GJZ">关键字</option>
	</select>
	<input class="demo2_class1" maxlength="15" name="find" type="text">
	<select class="i-text" name="fangshi">
			   <option value="1">精确查询</option>
			   <option selected="selected" value="2">模糊查询</option>
		   </select>
	</div>
	<div style="background-color: #ffffff; position: relative;margin-top:6px;margin-left:12px;border: #ffffff 2px solid" >
	<strong  >日期条件:</strong>
	<select class="i-text" name="timeSearch">
		<option value="publishtime">公布日期</option>
		<option selected="selected" value="applytime">施行日期</option>
		<option value="breaktime">废止日期</option>
	</select>:
		         从<input class="demo2_class1" maxlength="15" name="startT" id="startT" type="text" onclick="new Calendar().show(this);" readonly="readonly">
		        到<input class="demo2_class2" maxlength="15" name="endT" id="endT" type="text" onclick="new Calendar().show(this);" readonly="readonly">
		     <input type="hidden" value="1" id="result" name="result">   
    <input type="image" src="images/seach.gif" height="22px"  style="vertical-align: middle;"   onclick="resultReach(1)"/>
    <input type="image" src="images/jgzjs.gif" height="22px"  style="vertical-align: middle;"    onclick="resultReach(2)"/>
    </div>
    </fieldset>
    <br/>
    <fieldset>
	<div style="background-color: #ffffff; position: relative;margin-top:8px;border: #ffffff 2px solid" >
		<input type="hidden" value="<%=pageno %>" id="pageno" name="pageno">
		<input type="hidden" value="<%=pagesize %>" id="pagesize" name="pagesize">
		<input type="hidden" value="<%=type %>" id="type" name="type" class="types">
		<div style="position: relative;min-height: 490px; " >
		<table   width='98%' >
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
						<td align="left"><a href=ZCLookServlet?pno=<%=policy.getPno() %>><%=policy.getPname() %></a></td>
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
			<div style="background: #C0E4FA;position: relative;width: 98%;"  >
		<div style="background: #C0E4FA;position:absolute;" align="left"> 共有 <%=i %> 条最新记录，当前页第<%=pageno %>/<%=pageCount %>页 &nbsp;&nbsp; 
		<%if(pageno>1){ %>
		<a href="ZcFindServlet?pageno=<%if((pageno+1)<1) out.print(1);else out.print(pageno-1); %>&type=<%=type %>">上一页</a>
		 <%} %>&nbsp;&nbsp;
		  <%if(pageno<pageCount){ %>
		 <a href="ZcFindServlet?pageno=<%if((pageno+1)>pageCount) out.print(pageCount);else out.print(pageno+1); %>&type=<%=type %>">下一页</a>
		 <%} %></div>
		<div align="right">
		<%if(pageno>1){ %>
		<a href="ZcFindServlet?pageno=1&type=<%=type %>">首页</a><%} %>&nbsp;&nbsp;
		<%if(pageno<pageCount){ %><a href="ZcFindServlet?pageno=<%=pageCount%>&type=<%=type %>">尾页</a><%} %>
		  跳转到
		 <input type="text" size="1"  class="pageno" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" onclick="goes()">跳转</a></div>
		</div>
		</div>
	</div>
	</fieldset>
	</form>
	</div>
	</body>
</html>