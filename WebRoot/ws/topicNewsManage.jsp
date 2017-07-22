<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="com.dqwr.topic.dao.impl.*,com.dqwr.topic.entity.*,java.sql.Connection,java.sql.ResultSet,com.dqwr.dao.DataBaseDao"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" >
jQuery(function(){//上来就显示所有的
	jQuery.post("/dqwr/ws/jquery/topicNewsManage.jsp",
			{"pagesize":jQuery("#pagesize").val(),
				"pageno":jQuery("#pageno").val(),
				"search":jQuery("#search").val(),
				"allname":jQuery("#allname").val(),
				"find":jQuery("#find").val(),
			},function(response){
		jQuery("#xdsh").html(response);	
	});
	$("#select").click(function(){//点击确定按钮 按条件查询
		jQuery.post("/dqwr/ws/jquery/topicNewsManage.jsp",
				{"pagesize":jQuery("#pagesize").val(),
					"pageno":jQuery("#pageno").val(),
					"search":jQuery("#search").val(),
					"allname":jQuery("#allname").val(),
					"find":jQuery("#find").val(),
				},function(response){
			jQuery("#xdsh").html(response);
		});
	});
});
 
 function show(){
	 var topicname=document.getElementById("search").value;
	 var allname=document.getElementById("allname");
	 var find=document.getElementById("find");
	 if(topicname=="topicname"){
		 if(allname.style.visibility=="hidden"){
			 allname.style.visibility="visible";
		 }
		 if(find.type=="hidden"){
			 find.type="text";
		 }else{
			 find.type="hidden"; 
		 }	 
	 }else{
		if(allname.style.visibility=="visible"){
			allname.style.visibility="hidden";
		} 
		if(find.type=="hidden"){
			find.type="text";
		}
	 }
 }
</script>
<script language="javascript" src="js/jquery.js"></script>
<script language="javascript" src="../js/Calendar.js"></script>
<% String result = (String) request.getAttribute("result");%>
<script type="text/javascript">
<%if(result!=null){ %>
	alert('<%=result %>');
<%}
%> 
</script>
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
</style>
<title>Insert title here</title>
<%

	int pageno =0;
	int pagesize =0;
	String size=request.getParameter("pagesize");
	if(size!=null){
		pagesize = Integer.parseInt(size);
	}
	if(pagesize<=0){
		pagesize = 10;
		}
	String no=request.getParameter("pageno");
	if(no!=null){
		pageno = Integer.parseInt(no);
	}
	
	if(pageno<=0){
		 pageno = 1;
		}
%>
<%
 Topic topic=new Topic();
 TopicDaoImpl topicimpl=new TopicDaoImpl();
 ResultSet rs=null;
 DataBaseDao db=new DataBaseDao();
 Connection con=db.connection();
 rs=topicimpl.selecttopic(con);
%>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
<div id="show" style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid" >
	<input type="hidden" value="<%=pageno %>" id="pageno" name="pageno">
	<input type="hidden" value="<%=pagesize %>" id="pagesize" name="pagesize">
	<div style="position: relative;min-height: 490px; " >
	<div style="background: #C0E4FA;position: relative;" align="center">欢迎来到河北大气污染防治支撑管理系统</div>
	<fieldset>
    <legend><strong  >选择筛选条件：</strong></legend>
    <div style="background-color: #ffffff; position: relative;margin-top:8px;margin-left:12px;border: #ffffff 2px solid" >
	<span style="margin-left:29px"><strong  >条件:</strong></span>
    <select class="i-text" name="search" id="search" onchange="show();">
			   <option value="Title">活动标题</option>
			   <option value="topicname">专题名称</option>
			   <option value="Publisher">发布人</option>
			   <option value="Time">时间</option>
	</select>
	<input class="demo2_class1" maxlength="15" name="find" id="find" type="text">
	<select class="i-text" name="allname" id="allname" style="visibility:hidden">
	<%
	  while(rs.next()){
	%>
	 <option value=<%=rs.getString(1) %>><%=rs.getString(1) %></option>
	<%	  
	  }
	%>
	</select>
	<input  id="select" style="height: 22px;vertical-align: middle;" type="image"  src="../images/qd.gif" >
	</div>
    </fieldset>
	<div>动态信息：
	<div id="xdsh"></div>
	</div >
	</div>
</div>
</body>
</html>