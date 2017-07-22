<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
</head>
<body>
  <% 
    String empid=(String)request.getParameter("empid");
    String pageno=request.getParameter("pageno");
    String item=request.getParameter("item");
    String operateid=request.getParameter("operateid");
  %>
  <div align="left">
    <a href="javascript:history.go(-1)">返回</a>
  </div>
  <div align="center">
  <form method="post" action="/dqwr/ProcessMonitor" enctype="multipart/form-data">
  <input type="hidden" name="empid" id="empid" value=<%=empid %>>
  <input type="hidden" name="pageno" id="pageno" value=<%=pageno %>>
  <input type="hidden" name="item" id="item" value=<%=item %>>
  <input type="hidden" name="operateid" id="operateid" value=<%=operateid %>>
  <br>
  <br>
  <br>
             <h2>请选择需要上传的文档</h2><br>
  <br>
     <input type="file" name="file">
     <input type="submit" value="确定"> 
    </form>
  </div>
</body>
</html>