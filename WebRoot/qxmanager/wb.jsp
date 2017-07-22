<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script language="javascript" src="../js/Calendar.js"></script>
<script type="text/javascript" src="policy.js"></script>
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
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA"id="body" style="overflow-x:auto;overflow-y:auto;">
<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid;height: 98%;min-height: 550px;" align="center">
	<div style="position: relative;min-height: 490px; " >
	
		<div>搜索用户<br/><br/>
			<div align="center">
				<form action="../wbusersearch">
					<strong  >用户账号:</strong><input type="text" name="username" id="username"><input type="submit" value="搜索">
				</form>
					</div> 
		</div>
	</div>
</div>
</body>
</html>