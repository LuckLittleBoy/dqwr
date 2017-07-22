<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.requirement.entity.Orga,com.dqwr.model.Orgamodel, java.util.ArrayList,com.dqwr.dao.*,java.sql.*"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>机构管理</title>
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script language="javascript" src="js/jquery.js"></script>
<script language="javascript" src="../js/Calendar.js"></script>
<script type="text/javascript" >
jQuery(function(){//上来就显示所有的
	jQuery.post("/dqwr/ws/jquery/orga.jsp",
			{"pagesize":jQuery("#pagesize").val(),
				"pageno":jQuery("#pageno").val(),
				"search":jQuery("#search").val(),
				"find":jQuery("#find").val(),
			},function(response){
		jQuery("#orga").html(response);	
	});
	$("#select").click(function(){//点击确定按钮 按条件查询
		jQuery.post("/dqwr/ws/jquery/orga.jsp",
				{"pagesize":jQuery("#pagesize").val(),
					"pageno":jQuery("#pageno").val(),
					"reqpass":jQuery("#reqpass").val(),
					"search":jQuery("#search").val(),
					"find":jQuery("#find").val(),
				},function(response){
			jQuery("#orga").html(response);
		});
	});
});

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
<%
	int pageno =0;
	int pagesize =0;
	int pass=0;
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
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid" >
	<input type="hidden" value="<%=pageno %>" id="pageno">
	<input type="hidden" value="<%=pagesize %>" id="pagesize">
	<input type="hidden" value="<%=pass %>" id="reqpass">
	<div style="position: relative;min-height: 490px; " >
	<div style="background: #C0E4FA;position: relative;" align="center">欢迎来到河北大气污染防治支撑管理系统</div>
	<fieldset>
    <legend><strong  >选择筛选条件：</strong></legend>
    <div style="background-color: #ffffff; position: relative;margin-top:8px;margin-left:12px;border: #ffffff 2px solid" >
	<span style="margin-left:29px"><strong  >条件:</strong></span>
    <select class="i-text" name="search" id="search">
		<option value="OrgaId">组织编号</option>
		<option value="OrgaName">组织名称</option>
		<option value="IndustryID">所属行业</option>
	</select>
	
	<input class="demo2_class1" maxlength="15" name="find" id="find" type="text">
	<input id="select" style="height: 22px;vertical-align: middle;" type="image" src="../images/qd.gif" >
	</div>
    </fieldset>
	
	<div>机构信息：
	<div id="orga"></div>
	</div >
	</div>
</div>
</body>
</html>
