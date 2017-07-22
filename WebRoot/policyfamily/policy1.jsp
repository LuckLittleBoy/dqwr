<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script language="javascript" src="../js/Calendar.js"></script>
<script type="text/javascript" src="policy1.js"></script>
<style type="text/css">
body{font:14px/1.5  宋体,宋体, \5b8b\4f53, sans-serif;}
ul { margin:0; padding:0; list-style:none; }
a { margin-left:5px; color:#07F; text-decoration:none; }
a:hover { text-decoration:underline; }
input { border:1px solid #ccc; margin:2px; }
table { border-collapse:collapse; border-spacing:0; }
td { margin:0; padding:10px; border:1px solid #ccc; }
   </style>
<style type="text/css">	
  .black_overlay{ 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 100%; 
            background-color: black; 
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.80; 
            filter: alpha(opacity=88); 
        } 
        .white_content { 
            display: none; 
            position: absolute; 
            top: 5%; 
            left: 15%; 
            width: 70%; 
            height: 70%; 
            padding: 20px; 
            border: 10px solid orange; 
            background-color: white; 
            z-index:1002; 
            overflow: auto; 
        } 
</style>
<title>Insert title here</title>
</head>
<body style="text-align:center;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA"id="body">
<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid;height: 98%;min-height: 550px;" align="center" >
	<div style="position: relative;min-height: 490px; " >
		
		<div>请输入想要查询的政策信息<br/><br/>
			<div>
				<strong  >政策文号:</strong>
				<input type="text" name="policyId" id="policyId"/> 
				或
				<strong  >政策名称:</strong><input type="text" name="name" id="name"/><br/><br/>
				<strong  >日期条件:</strong>
				<select class="i-text" name="timeSearch" id="timeSearch">
					<option value="publishtime">公布日期</option>
					<option selected="selected" value="applytime">施行日期</option>
					<option value="breaktime">废止日期</option>
				</select>:<input class="demo2_class1" maxlength="15" name="startT" id="startT" type="text" onclick="new Calendar().show(this);" readonly="readonly">-<input class="demo2_class2" maxlength="15" name="endT" id="endT" type="text" onclick="new Calendar().show(this);" readonly="readonly"><br/><br/>
				<input type="image"  src="../images/config.gif"  onclick="policySubmit();">
				<input type="image"  src="../images/qc.gif"  onclick="location.reload();">
				<!-- 
				<input name="button" type="button" value="提交" id="submit" onclick="policySubmit();"/>
				<input name="button" type="button" value="清除" id="submit" onclick="location.reload();"/> -->
			</div>
			<div>
				<table id="policyTable" width="700" height="57" border="0" cellpadding="0" cellspacing="0" style="font-size:12px;">
	    		</table>
			</div>
		</div >
		<div id="family" align="center"></div>
		<div style="clear:both;" align="center"></div>
		<div id="child" align="center"></div>
		<div id="showDiv" style="border:1px solid #FF3030;background:#FFFACD;color:#EE4000;display:none;position:absolute;width:100px;height:auto;"></div>
		<div id="light" class="white_content">政策详细信息：<a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">点这里关闭本窗口</a>
        </div> 
        <div id="fade" class="black_overlay"></div> 
	</div>
</div>
</body>
</html>