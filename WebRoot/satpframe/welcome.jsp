<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script language="javascript" src="../js/Calendar.js"></script>
<script type="text/javascript" src="policy.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="../css/index.css" type="text/css" />
<script type="text/javascript">
$.ajax({
	url : "${pageContext.request.contextPath}/tj",
	dataType : "text",
	success : function(r) {
		r=$.parseJSON(r);
		$("#dby").text(r[0].dby);
		$("#th").text(r[0].th);
		$("#dsh").text(r[0].dsh);
	}
})
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">

<div align="center" style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 550px;">
	<div align="center">
	<br/><br/><br/>
	</br>
	</br>
	</br>
	</br>
	<font size="6.5" color="blue"><b>欢迎进入河北省大气污染防治技术成果</b></br>
	 <b>支撑管理与应用服务系统—后台</b>
	</font>
	<div align="left"><br/>
			<div align="left" >
			
					</div> 
		</div>
	</div>
</div>
</body>
</html>