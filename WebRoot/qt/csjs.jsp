<%@ page language="java" import="java.util.*" contentType="text/html;charset=gbk" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="js/Calendar.js"></script>
	<meta http-equiv="description" content="This is my page">
    <script language="javascript">
     $(function(){
    	$("#btnSubmit").click(function(){
    		var orgaid=$("#orgaid").val();
    		var organame=$("#organame").val();
    		var natureid=$('input:radio[name="natureid"]:checked').val();
    		var techname=$("#techname").val();
    		var fieldid=$('input:checkbox[name="fieldid"]:checked').val();
    		var casenumber=$('input:radio[name="casenumber"]:checked').val();
    		if(orgaid==""||organame==null||natureid==null||techname==""||fieldid==null||casenumber==null){
    			alert("�������Ϊ��!");
    			return false;
    		}else{
    			return true;
    		}
    	});
     });
     function TestOrgaidIsEx(){
    	 var orgaid=document.getElementById("orgaid").value;
    	 $.ajax({
    	 type:'post',
    	 url:'orgaidisexist',
    	 data:"orgaid="+orgaid+"",
    	 success:function(msg){
    	 $('#orgaidlabel').html("<font color='red'>"+msg+"</font>");//msg����һ��jspҳ������,ֱ��Ƕ��<div id="text">
    	 },
    	 error:function(){
    	 alert('������Ϣʧ��...');
    	 }
    	 });
    	 }
     
    </script>
  </head>
  <body bgcolor="#6CA6CD">
  <div align="center" style="margin: 5px 0px 0px 0px;background-color: white;">
  <br>
  <form action="TechServlet" method="post" enctype="multipart/form-data">
  <table border="1" align="center" bgcolor="#FFFFFF">
  <tr>
  <td>
   <font color="red">(*����)</font>
  </td>
  </tr>
    <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;��������</td>
      <td><input type="text" name="techname" id="techname" style="width: 433px; "/>
      </td>
      </tr>
      <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;��������</td>
      <td><input type="text" name="orgaid" id="orgaid" style="width: 434px; "/><label name="orgaidlabel" id="orgaidlabel"></label></td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;��λ����</td>
      <td><input type="text" name="organame" id="organame" style="width: 434px; "/></td>
     </tr>
     <tr>
      <td>��λ����</td>
      <td><input type="text" name="legalperson"/>&nbsp;&nbsp;��ϵ��&nbsp&nbsp&nbsp&nbsp<input type="text" name="contacts"/></td>
     </tr>
     <tr>
      <td>��ַ</td>
      <td><input type="text" name="address"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����&nbsp&nbsp&nbsp&nbsp<input type="text" name="email"/></td>
     </tr>
     <tr>
      <td>��ϵ�绰</td>
      <td>�̻���<input type="text" name="tel"/>&nbsp&nbsp&nbsp&nbsp�ֻ���&nbsp<input type="text" name="cel"/></td>
     </tr>
     <tr>
     <td>&nbsp;<label style="color:red;">*</label>&nbsp;��λ����</td>
     <td><input type="radio" name="natureid" id="natureid" value="��ҵ">��ҵ
         <input type="radio" name="natureid" id="natureid" value="�ߵ�ԺУ">�ߵ�ԺУ
         <input type="radio" name="natureid" id="natureid" value="�о�����">�о�����
         <input type="radio" name="natureid" id="natureid" value="����">��������ע��<input type="text" name="othernature" style="width: 117px; ">
     </td>
     </tr>
     <tr>
     <td>��λ���</td>
     <td>
		<textarea cols="80" rows="8" name="introduction" placeholder="(�������ṹ����ʱ�䡢��ģ����Ҫ��Ʒ��)"></textarea>
	</td>
     </tr>
      <tr>
     <td>&nbsp;<label style="color:red;">*</label>&nbsp;������Դ</td>
     <td><input type="radio" name="sourceid" value="�����з�">�����з�
         <input type="radio" name="sourceid" value="��������">��������
         <input type="radio" name="sourceid" value="�������������ٴ���">�������������ٴ���</br>
         <input type="radio" name="sourceid" value="��������">������������ע���������е�λ<input type="text" name="techowner" style="width: 117px; "></br>
         <input type="radio" name="sourceid" value="����">��������ע��<input type="text" name="othersource" style="width: 117px; ">
     </td>
     </tr>
      <tr>
     <td>&nbsp;<label style="color:red;">*</label>&nbsp;��������</td>
     <td><input type="checkbox" name="fieldid" id="fieldid" value="����Դ����">����Դ����
         <input type="checkbox" name="fieldid" id="fieldid" value="������Ⱦ������">������Ⱦ������
         <input type="checkbox" name="fieldid" id="fieldid" value="��ˮ������">��ˮ������</br>
         <input type="checkbox" name="fieldid" id="fieldid" value="�̷ϴ�����">�̷ϴ�����
         <input type="checkbox" name="fieldid" id="fieldid" value="��Ⱦ�����޸�����">��Ⱦ�����޸�����
         <input type="checkbox" name="fieldid" id="fieldid" value="�������ܼ���">�������ܼ���</br>
         <input type="checkbox" name="fieldid" id="fieldid" value="��ҵ���ܼ���">��ҵ���ܼ���
         <input type="checkbox" name="fieldid" id="fieldid" value="�������ü���">�������ü���
         <input type="checkbox" name="fieldid" id="fieldid" value="����">��������ע��(�ɶ�ѡ)<input type="text" name="otherfield" style="width: 117px; ">
     </td>
     </tr>
       <tr>
     <td>�������</td>
     <td>
		<textarea cols="80" rows="8" name="techoverview" placeholder="(����������ԭ��ָ�ꡢ�ؼ��豸���Ƚ�/������������)"></textarea>
	</td>
     </tr>
     <tr>
     <td>���÷�Χ</td>
     <td>
		<textarea cols="80" rows="8" name="scope" placeholder="(��������ҵ��ʹ���޶�������)����ҵ�μ����񾭼���ҵ��������Ŀ¼��"></textarea>
	</td>
     </tr>
     <tr>
     <td>�Ƚ���</td>
     <td><input type="radio" name="progressid" value="��������">��������
         <input type="radio" name="progressid" value="�����Ƚ�">�����Ƚ�
         <input type="radio" name="progressid" value="��������">��������
         <input type="radio" name="progressid" value="�����Ƚ�">�����Ƚ�
     </td>
     </tr>
     <tr>
     <td>�����</td>
     <td><input type="radio" name="stateid" value="ʾ��Ӧ��">ʾ��Ӧ��
         <input type="radio" name="stateid" value="��ģ��Ӧ��">��ģ��Ӧ��
         <input type="radio" name="stateid" value="δ��ҵ��">δ��ҵ��
     </td>
     </tr> 
     <tr>
     <td>����ָ��</td>
     <td>
		<textarea cols="80" rows="8" name="econindicator" placeholder="(������Ͷ�ʡ�����ά�����á�Ͷ�ʻ����ڡ�Ԥ��Ч���)"></textarea>
	</td>
     </tr>
     <tr>
     <td>���ܼ���Ԥ��Ч��</td>
     <td>
		<textarea cols="80" rows="8" name="result" placeholder="(����������Ч��߱���/��Ⱦ�������/��������������/������Դ������/����Դ��ռ�����Ⱦ���ָ��)"></textarea>
	</td>
     </tr>
      <tr>
     <td>�ɹ�ת����ʽ</td>
     <td><input type="radio" name="transid" value="����ת��">����ת��
         <input type="radio" name="transid" value="������Ȩ">������Ȩ
         <input type="radio" name="transid" value="��������">��������
         <input type="radio" name="transid" value="��ת��">��ת�ã��ܺ�ԼԼ������ת�ã�<br>
         <input type="radio" name="transid" value="����"> ��������ע��<input type="text" name="othertransfrom" style="width: 117px; ">
     </td>
     </tr>
      <tr>
     <td>�ɹ���������</td>
     <td><input type="radio" name="finaneedid" value="��Ȩ����">��Ȩ����
         <input type="radio" name="finaneedid" value="ծȨ����">ծȨ����
         <input type="radio" name="finaneedid" value="����"> ��������ע��<input type="text" name="otherneed" style="width: 117px; ">
     </td>
     </tr>
     <tr>
       <td>�ɹ���������<br>�����Ԫ��</td>
       <td><input type="text" name="money" style="height: 32px; width: 142px"></td>
     </tr>
      <tr>
       <td style="width: 152px; height: 14px"><strong>���Ͱ��������</strong></td>
     </tr>
      <tr>
     <td>&nbsp;<label style="color:red;">*</label>&nbsp;��������</td>
     <td>
         <input type="radio" name="casenumber" id="casenumber" value="0" onclick="select0()">��
         <input type="radio" name="casenumber" id="casenumber" value="1" onclick="select1()">1��
         <input type="radio" name="casenumber" id="casenumber" value="2" onclick="select2()">2��
         <input type="radio" name="casenumber" id="casenumber" value="3" onclick="select3()">3��
         <input type="radio" name="casenumber" id="casenumber" value="���">���
     </td>
     </tr>
     
     <!--����1��ʼ  -->
      <tbody id="case1" name="case1">
     <tr>
       <td>
       <h3>����1</h3>
       <input type="hidden" name="num1" id="num1" value="1">
       </td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;��������</td>
      <td><input type="text" name="casename" id="casename"/>&nbsp&nbsp&nbsp&nbsp��ʼʱ��&nbsp<input type="text" name="starttime"/></td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;ʵʩ��λ</td>
      <td><input type="text" name="implement" id="implement">&nbsp&nbsp&nbsp&nbsp������ʽ&nbsp<input type="text" name="cooperation"/></td>
     </tr>
     <tr>
      <td>��ϵ��</td>
      <td><input type="text" name="contact"/>&nbsp&nbsp&nbsp&nbsp��ϵ�绰&nbsp<input type="text" name="casetel"/></td>
     </tr>
     <tr>
     <td>��Ŀ���</td>
     <td>
		<textarea cols="80" rows="8" name="caseoverview" placeholder="����������Ҫ����ԭ�����̡�һ����Ͷ�ʡ����к�ά���ɱ��ȣ�"></textarea>
	</td>
	 <tr>
     <td>��Ŀʵʩ����ܼ���Ч��</td>
     <td>
		<textarea cols="80" rows="8" name="effect" placeholder="(����������Ч��߱���/��Ⱦ�������/��������������/������Դ������/����Դ��ռ�����Ⱦ���ָ��)"></textarea>
	</td>
     </tr>
     <tr>
     <td>��Ŀʵʩ����ҵЧ�漰����Ч��</td>
     <td>
		<textarea cols="80" rows="8" name="benefit"></textarea>
	</td>
     </tr>
     <tr>
     <td>�û��Ա�������ۺ�������</td>
     <td>
		<textarea cols="80" rows="8" name="appraisal" placeholder="(������ʵʩ��Ч�������ڵ����⼰�д��Ľ��ĵط�)"></textarea>
	</td>
     </tr>
	<tr>
     <td>���֤������</td>
     <td id="more1">
		�ϴ�������ͼƬ�����ĵ���</br>
		 <input name="file" type="file" label="�ϴ�������ͼƬ�����ĵ���" theme="simple" >
		 <input type="button" value="��Ӹ���..." onclick="addMore1()"></br>
	</td>
	</tr>
	</tbody>
	<!--����1����  -->
	
	
	 <!--����2��ʼ  -->
      <tbody id="case2" name="case2">
     <tr>
       <td>
       <h3>����2</h3>
       <input type="hidden" name="num2" id="num2" value="1">
       </td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;��������</td>
      <td><input type="text" name="casename2"/>&nbsp&nbsp&nbsp&nbsp��ʼʱ��&nbsp<input type="text" name="starttime2"/></td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;ʵʩ��λ</td>
      <td><input type="text" name="implement2"/>&nbsp&nbsp&nbsp&nbsp������ʽ&nbsp<input type="text" name="cooperation2"/></td>
     </tr>
     <tr>
      <td>��ϵ��</td>
      <td><input type="text" name="contact2"/>&nbsp&nbsp&nbsp&nbsp��ϵ�绰&nbsp<input type="text" name="casetel2"/></td>
     </tr>
     <tr>
     <td>��Ŀ���</td>
     <td>
		<textarea cols="80" rows="8" name="caseoverview2" placeholder="����������Ҫ����ԭ�����̡�һ����Ͷ�ʡ����к�ά���ɱ��ȣ�"></textarea>
	</td>
	 <tr>
     <td>��Ŀʵʩ����ܼ���Ч��</td>
     <td>
		<textarea cols="80" rows="8" name="effect2" placeholder="(����������Ч��߱���/��Ⱦ�������/��������������/������Դ������/����Դ��ռ�����Ⱦ���ָ��)"></textarea>
	</td>
     </tr>
     <tr>
     <td>��Ŀʵʩ����ҵЧ�漰����Ч��</td>
     <td>
		<textarea cols="80" rows="8" name="benefit2"></textarea>
	</td>
     </tr>
     <tr>
     <td>�û��Ա�������ۺ�������</td>
     <td>
		<textarea cols="80" rows="8" name="appraisal2" placeholder="(������ʵʩ��Ч�������ڵ����⼰�д��Ľ��ĵط�)"></textarea>
	</td>
     </tr>
	<tr>
     <td>���֤������</td>
     <td id="more2">
		�ϴ�������ͼƬ�����ĵ���</br>
		 <input name="file" type="file" label="�ϴ�������ͼƬ�����ĵ���" theme="simple" >
		 <input type="button" value="��Ӹ���..." onclick="addMore2()"></br>
	</td>
	</tr>
	</tbody>
	<!--����2����  -->
	
	 <!--����3��ʼ  -->
      <tbody id="case3" name="case3">
     <tr>
       <td>
       <h3>����3</h3>
       <input type="hidden" name="num3" id="num3" value="1">
       </td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;��������</td>
      <td><input type="text" name="casename3"/>&nbsp&nbsp&nbsp&nbsp��ʼʱ��&nbsp<input type="text" name="starttime3"/></td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;ʵʩ��λ</td>
      <td><input type="text" name="implement3"/>&nbsp&nbsp&nbsp&nbsp������ʽ&nbsp<input type="text" name="cooperation3"/></td>
     </tr>
     <tr>
      <td>��ϵ��</td>
      <td><input type="text" name="contact3"/>&nbsp&nbsp&nbsp&nbsp��ϵ�绰&nbsp<input type="text" name="casetel3"/></td>
     </tr>
     <tr>
     <td>��Ŀ���</td>
     <td>
		<textarea cols="80" rows="8" name="caseoverview3" placeholder="����������Ҫ����ԭ�����̡�һ����Ͷ�ʡ����к�ά���ɱ��ȣ�"></textarea>
	</td>
	 <tr>
     <td>��Ŀʵʩ����ܼ���Ч��</td>
     <td>
		<textarea cols="80" rows="8" name="effect3" placeholder="(����������Ч��߱���/��Ⱦ�������/��������������/������Դ������/����Դ��ռ�����Ⱦ���ָ��)"></textarea>
	</td>
     </tr>
     <tr>
     <td>��Ŀʵʩ����ҵЧ�漰����Ч��</td>
     <td>
		<textarea cols="80" rows="8" name="benefit3"></textarea>
	</td>
     </tr>
     <tr>
     <td>�û��Ա�������ۺ�������</td>
     <td>
		<textarea cols="80" rows="8" name="appraisal3" placeholder="(������ʵʩ��Ч�������ڵ����⼰�д��Ľ��ĵط�)"></textarea>
	</td>
     </tr>
	<tr>
     <td>���֤������</td>
     <td id="more3">
		�ϴ�������ͼƬ�����ĵ���</br>
		 <input name="file1" type="file" label="�ϴ�������ͼƬ�����ĵ���" theme="simple" >
		 <input type="button" value="��Ӹ���..." onclick="addMore3()"></br>
	</td>
	</tr>
	</tbody>
	<!--����3����  -->
		
	<tr>
	   <td>�ʱ��</td>
	   <td><input type="text" name="filltime" style="width: 215px; " onclick="new Calendar().show(this);"></td>
	</tr>              
  </table>
  <br>
   <center>
   <input type="submit" id="btnSubmit" value="�ύ" style="height: 30px; width: 65px; background-color: #408080;">&nbsp&nbsp&nbsp<input type="reset" value="ȡ��" style="height: 30px; width: 65px; background-color: #408080;">
   </center>
  </form>
  </div>
  </body>
  <script type="text/javascript">
   function select0(){
	   document.getElementById("case1").style.display="none";
	   document.getElementById("case2").style.display="none";
	   document.getElementById("case3").style.display="none";
   }
   
   function select1(){
	   document.getElementById("case1").style.display="";
	   document.getElementById("case2").style.display="none";
	   document.getElementById("case3").style.display="none";
   }
   
   function select2(){
	   document.getElementById("case1").style.display="";
	   document.getElementById("case2").style.display="";
	   document.getElementById("case3").style.display="none";
   }
   
   function select3(){
	   document.getElementById("case1").style.display="";
	   document.getElementById("case2").style.display="";
	   document.getElementById("case3").style.display="";
   }
function addMore1()
{   
    var td = document.getElementById("more1");
    
    
    var num1=document.getElementById("num1");
	num1.value=parseInt(num1.value)+1;
	
    var br = document.createElement("br");
    var input = document.createElement("input");
    var button = document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "�Ƴ�";
    
    button.onclick = function()
    {
        td.removeChild(br);
        td.removeChild(input);
        td.removeChild(button);
        num1.value=parseInt(num1.value)-1;
    }
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
}

function addMore2()
{   
    var td = document.getElementById("more2");
    
    var num2=document.getElementById("num2");
	num2.value=parseInt(num2.value)+1;
	
    var br = document.createElement("br");
    var input = document.createElement("input");
    var button = document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "�Ƴ�";
    
    button.onclick = function()
    {
        td.removeChild(br);
        td.removeChild(input);
        td.removeChild(button);
        num2.value=parseInt(num2.value)-1;
    }
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
}

function addMore3()
{   
    var td = document.getElementById("more3");
    
    var num3=document.getElementById("num3");
	num3.value=parseInt(num3.value)+1;
	
    var br = document.createElement("br");
    var input = document.createElement("input");
    var button = document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "�Ƴ�";
    
    button.onclick = function()
    {
        td.removeChild(br);
        td.removeChild(input);
        td.removeChild(button);
        num3.value=parseInt(num3.value)-1;
    }
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
}
</script>
</html>
