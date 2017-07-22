<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<title>File Upload</title>
<script type="text/javascript">
function addFile(){
var upFile = '<input type="file" name="file1"><br>';
document .getElementById ("files").insertAdjacentHTML("beforeEnd",upFile);
}

function deleteFile(){
var file = document .getElementById ("files").lastChild;
if(file == null)
return;
document .getElementById ("files").removeChild(file);
file = document .getElementById ("files").lastChild; //移除换行符<br>所以要移两次
document .getElementById ("files").removeChild(file); //如果在表格里面不加<br>就自动换行的，可以去掉，自己把握
}
</script>
</head>
<body>
<h3>基于jsp smart upload组件的文件上传下载</h3>
<form action="UploadServlet" method="post" enctype="multipart/form-data">
选择文件：<div id="files"><input type="file" name="file1"><br></div>
<input type="submit" value="上传">
<input type="button" value="增加文件" onclick="addFile()"> 
<input type="button" value="删除文件" onclick="deleteFile()">
<input type="reset" value="重置">
</form>
<br>
<form action="servlet/DownloadServlet" method="post">
下载文件的名称：
<input type="text" name="downloadFileName" size="20" maxlength="80">
<input type="submit" value="下载">
</form>
</body>
</html>