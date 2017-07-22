<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dqwr.entity.*,com.dqwr.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="ws/js/xdyw.js"></script>
<script type="text/javascript" src="ws/js/aircityxd.js"></script>
<script type="text/javascript" src="ws/js/jquery.suggest3.js"></script> 
<script type="text/javascript" src="ws/js/jquery-levelSelect-ajax2.js"></script> 

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
<script type="text/javascript" src="ws/js/time.js"></script>
<link rel="stylesheet" type="text/css" href="ws/css/xdyw.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="ws/js/jquery.suggest.js"></script> 
<script type="text/javascript" src="ws/js/jquery.suggest2.js"></script> 
<script type="text/javascript" src="ws/js/jquery.suggest3.js"></script> 
<title>政策内容</title>
<%
	com.dqwr.entity.ZC policy = (com.dqwr.entity.ZC)request.getAttribute("policy");
%>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">



<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid" >
	
	<div style="position: relative;min-height: 490px; " align="center">
	<form action = "../dqwr/xd" method="post">
	
	<div style="background: #C0E4FA;position: relative;" align="center">政策标引</div>
	
	<div id="tabContainer">
        <ul>
            <li id="tab1"><a href="#" class="on" onclick="switchTab('tab1','con1');this.blur();return false;">
              	  修订信息</a></li>
            <li id="tab2"><a href="#" onclick="switchTab('tab2','con2');this.blur();return false;">
               	 其他信息</a></li>
            <li id="tab3"><a href="#" onclick="switchTab('tab3','con3');this.blur();return false;">
                	主题词关键字</a></li>
     	</ul>
        <div style="clear: both">
        </div>
        <div id="con1">
        <table>
        <tr>
			<td>政策名称</td><td><%=policy.getZCMC() %></td>
		<tr>
		<tr>
			<td>政策文号</td><td><%=policy.getZCWH() %></td>
		</tr>
		<%
		if("0".equals(policy.getSwtag())){
		%>
		<tr style="color: red;">
		
		<td>上位政策</td><td><textarea  style="width:460px;" id="swzc" onKeyDown="if(event.keyCode==13) return false;"><%=policy.getSwzcmc().replace("<br />", "\n") %></textarea></td>		</tr>
		<tr>
			<td></td><td><input type="hidden" value="<%=policy.getBSWZC() %>" style="width:160px;"  id="swzchidden" name="swzc" /></td> 
		</tr>
		<%
		}else{
		%>
		<tr >
		
		<td>上位政策</td><td><%=policy.getSwzcmc() %></td>
		</tr>
		<%
		}
		%>
		
		<%if("0".equals(policy.getQqtag())){
		%>
		<tr style="color: red;">
			<td>前趋政策</td><td><textarea  style="width:460px;"   id="qqzc"><%=policy.getQqzcmc().replace("<br />", "\n") %></textarea></td>
		</tr>
		<tr>
			<td></td><td><input type="hidden" value="<%=policy.getBQQZC() %>" style="width:160px;" name="qqzc" id="qqzchidden" /></td>
		</tr>
		<%
		}else{
		%>
		<tr>
			<td>前趋政策</td><td><%=policy.getQqzcmc() %></td>
		</tr>
		<%
		}
		%>
			
		<%if(("0").equals(policy.getSxtag())){
		%>
		<tr style="color: red;">
			<td>时效状态</td><td><select  style="width:163px;"  name="sxzt" id="sxzt" onchange="changesx() ">
		<%
			if(("0").equals(policy.getZSXZTW())){
		%>
			<option value="1">有效</option>
			<option value="0" selected>失效</option>
		<%
			}else{
		%>
			
			<option value="1" selected>有效</option>
			<option value="0">失效</option>
		
		<%
			}
		%>
		
		</select>
		</td>
		</tr>
		<tr style="color: red;">
			<td>废止日期</td><td>
			
				<%if(("0").equals(policy.getZSXZTW())){ %>
			<input  style="width:160px;"  value="<%=policy.getBFZRQ() %>" id="fzrq" name="fzrq" type="text" id="control_date" size="20"
                        maxlength="10" onclick="new Calendar().show(this);" readonly="readonly" onKeyDown="if(event.keyCode==13) return false;"/>&nbsp;&nbsp;
        <%}else{ %>
     	   	<input  style="width:160px;" disabled value="" id="fzrq" name="fzrq" type="text" id="control_date" size="20"
        	            maxlength="10" onclick="new Calendar().show(this);" readonly="readonly" onKeyDown="if(event.keyCode==13) return false;"/>&nbsp;&nbsp;
        <%} %>
                        </td>
        </tr>
		<%
		}
		else{
		%>
		<tr>
			<td>时效状态</td><td><select  style="width:163px;" id="sxzt" disabled="disabled">
			
		<%
			if(("0").equals(policy.getZSXZTW())){
				
		%>
				
			<option value="1">有效</option>
			<option value="0" selected>失效</option>
		
		<%
			}else{
		%>
			
			<option value="1" selected>有效</option>
			<option value="0">失效</option>
			
		<%
			}
		%>
		</select></td></tr>
		<tr>
			<td>废止日期</td><td>
			<%if(("0").equals(policy.getZSXZTW())){ %>
			<input  style="width:160px;" disabled value="<%=policy.getBFZRQ() %>" id="fzrq" name="fzrq" type="text" id="control_date" size="20"
                        maxlength="10" onclick="new Calendar().show(this);" readonly="readonly" onKeyDown="if(event.keyCode==13) return false;"/>&nbsp;&nbsp;
        <%}else{ %>
     	   <input  style="width:160px;" disabled value="" id="fzrq" name="fzrq" type="text" id="control_date" size="20"
        	            maxlength="10" onclick="new Calendar().show(this);" readonly="readonly" onKeyDown="if(event.keyCode==13) return false;"/>&nbsp;&nbsp;
        <%} %>			</td>
		</tr>			
		<%		
		}
		%>
		</table>
        </div>
        <div id="con2" style="display: none">
		<table>
		<tr><td>政策分类：</td><td><%=policy.getZCFLMC()%></td></tr>
		<tr><td>施行范围：</td><td><%=policy.getSxfwmc() %></td></tr>
		<tr><td>颁布形式：</td><td><%=policy.getBBBXSMC() %></td></tr>
		<tr><td>制定机关：</td><td><%=policy.getZdjgmc() %></td></tr>
		<tr><td>所属专题：</td><td><%=policy.getTTZLYMC() %></td></tr>
		<tr><td>公布日期：</td><td><%=policy.getBGBRQ() %></td></tr>
		<tr><td>施行日期：</td><td><%=policy.getBSXRQ() %></td></tr>
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
					<br>
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
	
	
	
	
	<div id = "mark" style="width: 540px " align="left" style="overflow:auto;overflow-x:hidden">&nbsp;&nbsp;&nbsp;&nbsp;<br><br>		
			
		

	</div>
	<div style="background: #C0E4FA;position: relative;" align="center">政策内容</div>
	<div style="width:730px;height:360px;overflow:auto;background: #ffffff;padding-left:200px;padding-right:200px;" align="left"><%=policy.getZcnr() %></div>
	<div style="background: #C0E4FA;position: relative;" align="center">审核操作</div>
	<div style="width:700px;" align="center">
	<input style="display: none;" type="hidden" value='<%=policy.getZCID() %>' name = "zcid" > 	
	<input type="image" height="22px" src="images/xd.gif" >
	
	</div>	
	<br>
	<br>
	<br>
	<br>
	</form>	
	</div>

	</div>
<div id="box">
<div class="ac_results" id="suggest1">&nbsp;</div>
<div class="ac_results" id="suggest2">&nbsp;</div>
</div>

</body>


</html>