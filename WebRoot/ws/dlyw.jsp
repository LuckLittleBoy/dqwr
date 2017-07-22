<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dqwr.entity.*,com.dqwr.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/dqwr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dqwr/ws/js/xdyw.js"></script>
<script type="text/javascript" src="/dqwr/ws/js/shenheyw.js"></script>
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
<link rel="stylesheet" type="text/css" href="/dqwr/ws/css/xdyw.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>政策内容</title>
<%
	com.dqwr.entity.ZC policy = (com.dqwr.entity.ZC)request.getAttribute("policy");
%>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
	
<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid" >
	
	<div style="position: relative;min-height: 490px; " align="center">
	
	<div style="background: #C0E4FA;position: relative;" align="center">政策标引</div>
			<div id="tabContainer">
        <ul>
            <li id="tab1"><a href="#" class="on" onclick="switchTab('tab1','con1');this.blur();return false;">
              	  基本信息</a></li>
            <li id="tab2"><a href="#" onclick="switchTab('tab2','con2');this.blur();return false;">
               	 政策状态</a></li>
            <li id="tab3"><a href="#" onclick="switchTab('tab3','con3');this.blur();return false;">
                	主题词关键字</a></li>
        </ul>
        <div style="clear: both">
        </div>
        <div id="con1">
        	<br>
        	<table>
				<tr><td>政策名称：</td><td><%=policy.getZCMC() %></td></tr>
        		<tr><td>序号文号：</td><td><%=policy.getZCWH() %></td></tr>
        		<tr><td>政策分类：</td><td><%=policy.getZCFLMC() %></td></tr>
        		<tr><td>施行范围：</td><td><%=policy.getSxfwmc() %></td></tr>
        		<tr><td>颁布形式： </td><td><%=policy.getBBBXSMC() %></td></tr>
        		<tr><td>制定机关：</td><td><%=policy.getZdjgmc() %></td></tr>
        		<tr><td>所属专题：</td><td><%=policy.getTTZLYMC() %></td></tr>        	</table>
        </div>
        <div id="con2" style="display: none">
        	<table>
        		<tr><td>上位政策：</td><td><%=policy.getSwzcmc() %></td></tr>
        		<tr><td>前趋政策：</td><td><%=policy.getQqzcmc() %></td></tr>
        		<tr><td>公布日期：</td><td><%=policy.getBGBRQ() %></td></tr>
        		<tr><td>施行日期：</td><td><%=policy.getBSXRQ() %></td></tr>
        		<tr><td>时效状态：</td>
        		<td>
        		<%
        			if(policy.getZSXZTW().equals("1")){
        			out.println("有效");
        			}else out.println("失效");
        		%>
        		</td>
        		</tr>
        		<tr><td>废止日期： </td><td><%=policy.getBFZRQ() %></td></tr>
        	</table>
          
		</div>
     <div id="con3" style="display: none">
		主题词：
		<%
		int k = 0;
		if(policy.getZtc()!=null){
			for(ZTC ztc :policy.getZtc()){
			%>
				<input type="text" style="width:79px;" size="8" readonly value="<%=ztc.getZtc() %>" name = "gjz2">
			<%
				k++;
			}
		}
		for(int j=k;j<5;j++){
		%>
			<input style="width:79px;" readonly value=" " type="text" size="8" name = "ztc1">
		<%
		}
		%>	
		<br>	
     	关键字：
		<%
		int i = 0;
		if(policy.getGjz()!=null){
			for(GJZ gjz :policy.getGjz()){
				
			%>
				<input type="text" style="width:79px;" size="8" readonly value="<%=gjz.getGjz() %>">
			<%
				i++;
				if((i)%5==0){
				%>
					<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%
				}
			}
		}
		for(int j=i;j<10;j++){
		%>
			
			<input type="text" style="width:79px;" size="8" readonly value=" ">
		<%
			if((j+1)%5==0){
			%>
				<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

			<%
			}
		}
		%>
    </div>
	

	</div>
	<div style="background: #C0E4FA;position: relative;" align="center">政策内容</div>
	<div style="width:700px;;background: #ffffff;; position: relative;" align="left"><%=policy.getZcnr() %></div>

	<div style="width:700px;" align="center">
	</div>
	<div style="width:700px;" align="center">
	<form action="/dqwr/delete">
	<input style="display: none;" type="hidden" value='<%=policy.getZCID() %>' name = "zcid" >
	<input type="image" height="22px" src="images/del.gif" >
	</form>
	</div>
	</div>
	</div>

</body>
</html>