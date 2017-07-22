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
    String caseid=(String)request.getParameter("caseid");
    String techid=request.getParameter("techid");
    String orgaid=request.getParameter("orgaid");
    String paths=request.getParameter("paths");
    String replacepath=request.getParameter("replacepath");
  %>
  <div align="left">
    <a href="javascript:history.go(-1)">返回</a>
  </div>
  <div align="center">
  <form method="post" action="/dqwr/EditCaseUpload" enctype="multipart/form-data">
  <input type="hidden" name="caseid" id="caseid" value=<%=caseid %>>
  <input type="hidden" name="techid" id="techid" value=<%=techid %>>
  <input type="hidden" name="orgaid" id="orgaid" value=<%=orgaid %>>
  <input type="hidden" name="paths" id="paths" value=<%=paths %>>
  <input type="hidden" name="replacepath" id="replacepath" value=<%=replacepath %>>
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