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
file = document .getElementById ("files").lastChild; //�Ƴ����з�<br>����Ҫ������
document .getElementById ("files").removeChild(file); //����ڱ�����治��<br>���Զ����еģ�����ȥ�����Լ�����
}
</script>
</head>
<body>
<h3>����jsp smart upload������ļ��ϴ�����</h3>
<form action="UploadServlet" method="post" enctype="multipart/form-data">
ѡ���ļ���<div id="files"><input type="file" name="file1"><br></div>
<input type="submit" value="�ϴ�">
<input type="button" value="�����ļ�" onclick="addFile()"> 
<input type="button" value="ɾ���ļ�" onclick="deleteFile()">
<input type="reset" value="����">
</form>
<br>
<form action="servlet/DownloadServlet" method="post">
�����ļ������ƣ�
<input type="text" name="downloadFileName" size="20" maxlength="80">
<input type="submit" value="����">
</form>
</body>
</html>