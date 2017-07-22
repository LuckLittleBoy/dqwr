<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dqwr.entity.*,com.dqwr.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="ws/js/xdshyw.js"></script>
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
	System.out.println("qqtag"+policy.getQqtag());
%>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">



<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid" >
	
	<div style="position: relative;min-height: 490px; " align="center">
	<form action = "../dqwr/xdshenhe" method="post">
	
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
		<tr >
		
		<td>上位政策</td><td><%=policy.getYswzcmc() %></td>
		</tr>
		<%
		}else{
			System.out.println("ssss"+policy.getSwtag());
		%>
		<tr style="color: red">		
		<td >修订前上位政策</td><td><%=policy.getYswzcmc() %></td>
		</tr>
		<tr style="color: red">		
		<td >修订后上位政策</td>
		<td>
		<%=policy.getSwzcmc() %>
		</td>
		</tr>
		<%
		}
		%>
		
		<%if("0".equals(policy.getQqtag())){
		%>
		<tr>
			<td>前趋政策</td><td><%=policy.getYqqzcmc() %></textarea></td>
		</tr>
		<%
		}else{
		%>
		<tr style="color: red;">
			<td>修改前前驱政策</td><td><%=policy.getYqqzcmc() %></td>
		</tr>
		<tr style="color: red;">
		<td>修改前后驱政策</td>
		<td>
		<%=policy.getQqzcmc() %>
		</td>
			
		</tr>
		<%
		}
		%>
			
		<tr>
			<td>时效状态</td><td>
			
		<%
			if(("0").equals(policy.getZSXZTW())){	
		%>				
				失效	
		<%
			}else{
		%>
				有效
		<%
			}
		%>
		</td></tr>
		<tr>
			<td>废止日期</td><td><%=policy.getBFZRQ() %>               
			</td>
		</tr>			
		
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
	</div>
	<input type="hidden" value="<%=policy.getZCID() %>" name = "zcid" > 
	<input type="hidden" value="<%=policy.getQqtag() %>" name="qqtag" >
	<input type="hidden" value="<%=policy.getSwtag() %>" name="swtag" >
	<input type="hidden" value="<%=policy.getBSWZC() %>" name="swzc"  >
	<input type="hidden" value="<%=policy.getBQQZC() %>" name="qqzc"  >
		 		
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