<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全文检索</title>
<style type="text/css">
.btn{background-color: #D2340F;color:white;text-decoration: none;font-family:Arial;font-weight: 900;font-size: 15px;padding:5px 6px;border-radius: 3px;}
.btn-buynow{background-color: #D2340F;}
.btn-buynow:hover{background-color: #EF411A;}
.btn-buyre{background-color: #00340F;}
.btn-buyre:hover{background-color: #00411A;}
.btn-signup{background-color: #006DCC;}
.btn-signup:hover{background-color: rgb(0,74,204);}
.btn-login{background-color: rgb(113,181,27);}
.btn-login:hover{background-color: rgb(147,199,25);}
</style>
<script src="../js/jquery.min.js"></script> 
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">	
<div align="center"  id="msgDiv" class="msg-div"  style="display: none;">信息提示</div>
<div>
 <form action="/dqwr/requireimport" method="post" enctype="multipart/form-data">
	<center>
	   <br>
	   <br>
	   <label><h2>请选择需要导入的技术需求Excel表</h2></label><br>
	   <input type="file" name="file" accept="application/vnd.ms-excel">&nbsp;&nbsp;&nbsp;
	   <input type="submit" value="导入">
	</center>
</form>
</div>	
</body>
</html>