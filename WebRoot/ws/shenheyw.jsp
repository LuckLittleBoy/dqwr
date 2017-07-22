<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dqwr.entity.*,com.dqwr.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="ws/js/xdyw.js"></script>
<script type="text/javascript" src="ws/js/jquery.js"></script>
<script type="text/javascript" src="ws/js/shenheyw.js"></script>
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
	<form action = "/dqwr/shenhe" method="post">
	
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
        		<tr><td><strong>政策名称：</strong></td><td colspan="5" ><%=policy.getZCMC() %></td></tr>
      		
        		<tr>
        		<td><strong>序号文号：</strong></td><td><%=policy.getZCWH() %></td>
        		<td><strong>政策分类：</strong></td><td><%=policy.getZCFLMC() %></td>
        		<td><strong>施行范围：</strong></td><td><%=policy.getSxfwmc() %></td>
        		</tr>
        		<tr>
        		<td><strong>颁布形式：</strong></td><td><%=policy.getBBBXSMC() %></td>
        		<td><strong>制定机关：</strong></td><td><%=policy.getZdjgmc() %></td>
        		<td><strong>所属专题：</strong></td><td><%=policy.getTTZLYMC() %></td>
        		</tr>
        	     
        	</table>
        </div>
        <div id="con2" style="display: none">

        <table >
        		<tr><td><strong>上位政策：</strong></td><td colspan="3" ><%=policy.getSwzcmc() %></td></tr>
        		<tr><td><strong>前趋政策：</strong></td><td colspan="3" ><%=policy.getQqzcmc() %> </td></tr>
        		<tr><td><strong>公布日期：</strong></td><td><%=policy.getBGBRQ() %></td><td align="right"><strong>施行日期：&nbsp;&nbsp;</strong></td><td><%=policy.getBSXRQ() %></td></tr>
        		<tr><td><strong>时效状态：</strong></td>
        		<td>
        		<%
        			if(policy.getZSXZTW().equals("1")){
        			out.println("有效");
        			}else out.println("失效");
        		%>
        		
        		</td>
        		
        		
        		<td align="right"><strong>废止日期：&nbsp;&nbsp; </strong></td><td><%=policy.getBFZRQ() %></td></tr>
        	</table>
        	
        
          
		</div>
     <div id="con3" style="display: none">
		<strong>主题词：</strong>
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
     	<strong>关键字：</strong>
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
					<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
				<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

			<%
			}
		}
		%>
    </div>
	</div>
	

	<div style="background: #C0E4FA;position: relative;" align="center">政策内容</div>
	<div style="width:730px;height:360px;overflow:auto;background: #ffffff;padding-left:200px;padding-right:200px;" align="left"><%=policy.getZcnr() %></div>
	<div style="background: #C0E4FA;position: relative;" align="center">审核操作</div>
	<div style="width:700px;" align="center">
	</div>
	<input style="display: none;" type="hidden" value='<%=policy.getZCID() %>' name = "zcid" > 	
	<input style="display: none;" type="hidden" value='<%=policy.getBQQZC() %>' name = "qqzc" > 		
	审核：<select name="shenhe" id="shenhe">
		<option value="1" selected>通过</option>
		<option value="2">退回</option>
		</select>
	<br>
	<div id="yijian" style="display: none">
	退回原因:<br>
	<textarea rows="5" cols="80" name="yjnr" id="yjnr" ></textarea>
	</div>
	<input type="image"  src="images/config.gif" >
	
	<br>
	<br>
	<br>
	<br>
	</form>	
	</div>
	</div>

</body>


</html>