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
    			alert("必填项不能为空!");
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
    	 $('#orgaidlabel').html("<font color='red'>"+msg+"</font>");//msg就是一个jsp页面数据,直接嵌入<div id="text">
    	 },
    	 error:function(){
    	 alert('加载信息失败...');
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
   <font color="red">(*必填)</font>
  </td>
  </tr>
    <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;技术名称</td>
      <td><input type="text" name="techname" id="techname" style="width: 433px; "/>
      </td>
      </tr>
      <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;机构代码</td>
      <td><input type="text" name="orgaid" id="orgaid" style="width: 434px; "/><label name="orgaidlabel" id="orgaidlabel"></label></td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;单位名称</td>
      <td><input type="text" name="organame" id="organame" style="width: 434px; "/></td>
     </tr>
     <tr>
      <td>单位法人</td>
      <td><input type="text" name="legalperson"/>&nbsp;&nbsp;联系人&nbsp&nbsp&nbsp&nbsp<input type="text" name="contacts"/></td>
     </tr>
     <tr>
      <td>地址</td>
      <td><input type="text" name="address"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱&nbsp&nbsp&nbsp&nbsp<input type="text" name="email"/></td>
     </tr>
     <tr>
      <td>联系电话</td>
      <td>固话：<input type="text" name="tel"/>&nbsp&nbsp&nbsp&nbsp手机：&nbsp<input type="text" name="cel"/></td>
     </tr>
     <tr>
     <td>&nbsp;<label style="color:red;">*</label>&nbsp;单位性质</td>
     <td><input type="radio" name="natureid" id="natureid" value="企业">企业
         <input type="radio" name="natureid" id="natureid" value="高等院校">高等院校
         <input type="radio" name="natureid" id="natureid" value="研究机构">研究机构
         <input type="radio" name="natureid" id="natureid" value="其他">其他，请注明<input type="text" name="othernature" style="width: 117px; ">
     </td>
     </tr>
     <tr>
     <td>单位简介</td>
     <td>
		<textarea cols="80" rows="8" name="introduction" placeholder="(包括：结构成立时间、规模、主要产品等)"></textarea>
	</td>
     </tr>
      <tr>
     <td>&nbsp;<label style="color:red;">*</label>&nbsp;技术来源</td>
     <td><input type="radio" name="sourceid" value="自主研发">自主研发
         <input type="radio" name="sourceid" value="合作开发">合作开发
         <input type="radio" name="sourceid" value="技术引进吸收再创新">技术引进吸收再创新</br>
         <input type="radio" name="sourceid" value="技术引进">技术引进，请注明技术持有单位<input type="text" name="techowner" style="width: 117px; "></br>
         <input type="radio" name="sourceid" value="其他">其他，请注明<input type="text" name="othersource" style="width: 117px; ">
     </td>
     </tr>
      <tr>
     <td>&nbsp;<label style="color:red;">*</label>&nbsp;技术领域</td>
     <td><input type="checkbox" name="fieldid" id="fieldid" value="新能源技术">新能源技术
         <input type="checkbox" name="fieldid" id="fieldid" value="大气污染治理技术">大气污染治理技术
         <input type="checkbox" name="fieldid" id="fieldid" value="污水处理技术">污水处理技术</br>
         <input type="checkbox" name="fieldid" id="fieldid" value="固废处理技术">固废处理技术
         <input type="checkbox" name="fieldid" id="fieldid" value="污染场地修复技术">污染场地修复技术
         <input type="checkbox" name="fieldid" id="fieldid" value="建筑节能技术">建筑节能技术</br>
         <input type="checkbox" name="fieldid" id="fieldid" value="工业节能技术">工业节能技术
         <input type="checkbox" name="fieldid" id="fieldid" value="余热利用技术">余热利用技术
         <input type="checkbox" name="fieldid" id="fieldid" value="其他">其他，请注明(可多选)<input type="text" name="otherfield" style="width: 117px; ">
     </td>
     </tr>
       <tr>
     <td>技术简介</td>
     <td>
		<textarea cols="80" rows="8" name="techoverview" placeholder="(包括：技术原理、指标、关键设备及先进/创新性描述等)"></textarea>
	</td>
     </tr>
     <tr>
     <td>适用范围</td>
     <td>
		<textarea cols="80" rows="8" name="scope" placeholder="(包括：行业、使用限定条件等)（行业参见国民经济行业分类三级目录）"></textarea>
	</td>
     </tr>
     <tr>
     <td>先进度</td>
     <td><input type="radio" name="progressid" value="国际领先">国际领先
         <input type="radio" name="progressid" value="国际先进">国际先进
         <input type="radio" name="progressid" value="国内领先">国内领先
         <input type="radio" name="progressid" value="国内先进">国内先进
     </td>
     </tr>
     <tr>
     <td>成熟度</td>
     <td><input type="radio" name="stateid" value="示范应用">示范应用
         <input type="radio" name="stateid" value="规模化应用">规模化应用
         <input type="radio" name="stateid" value="未产业化">未产业化
     </td>
     </tr> 
     <tr>
     <td>经济指标</td>
     <td>
		<textarea cols="80" rows="8" name="econindicator" placeholder="(包括：投资、运行维护费用、投资回收期、预期效益等)"></textarea>
	</td>
     </tr>
     <tr>
     <td>节能减排预期效果</td>
     <td>
		<textarea cols="80" rows="8" name="result" placeholder="(包括：能有效提高比例/污染物减排量/温室气体消减量/副产能源利用量/新能源所占比例等具体指标)"></textarea>
	</td>
     </tr>
      <tr>
     <td>成果转发方式</td>
     <td><input type="radio" name="transid" value="技术转让">技术转让
         <input type="radio" name="transid" value="技术授权">技术授权
         <input type="radio" name="transid" value="技术服务">技术服务
         <input type="radio" name="transid" value="已转让">已转让（受合约约束不能转让）<br>
         <input type="radio" name="transid" value="其他"> 其他，请注明<input type="text" name="othertransfrom" style="width: 117px; ">
     </td>
     </tr>
      <tr>
     <td>成果融资需求</td>
     <td><input type="radio" name="finaneedid" value="股权融资">股权融资
         <input type="radio" name="finaneedid" value="债权融资">债权融资
         <input type="radio" name="finaneedid" value="其他"> 其他，请注明<input type="text" name="otherneed" style="width: 117px; ">
     </td>
     </tr>
     <tr>
       <td>成果的融资需<br>求金额（万元）</td>
       <td><input type="text" name="money" style="height: 32px; width: 142px"></td>
     </tr>
      <tr>
       <td style="width: 152px; height: 14px"><strong>典型案例情况：</strong></td>
     </tr>
      <tr>
     <td>&nbsp;<label style="color:red;">*</label>&nbsp;案例数量</td>
     <td>
         <input type="radio" name="casenumber" id="casenumber" value="0" onclick="select0()">无
         <input type="radio" name="casenumber" id="casenumber" value="1" onclick="select1()">1个
         <input type="radio" name="casenumber" id="casenumber" value="2" onclick="select2()">2个
         <input type="radio" name="casenumber" id="casenumber" value="3" onclick="select3()">3个
         <input type="radio" name="casenumber" id="casenumber" value="多个">多个
     </td>
     </tr>
     
     <!--案例1开始  -->
      <tbody id="case1" name="case1">
     <tr>
       <td>
       <h3>案例1</h3>
       <input type="hidden" name="num1" id="num1" value="1">
       </td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;案例名称</td>
      <td><input type="text" name="casename" id="casename"/>&nbsp&nbsp&nbsp&nbsp起始时间&nbsp<input type="text" name="starttime"/></td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;实施单位</td>
      <td><input type="text" name="implement" id="implement">&nbsp&nbsp&nbsp&nbsp合作方式&nbsp<input type="text" name="cooperation"/></td>
     </tr>
     <tr>
      <td>联系人</td>
      <td><input type="text" name="contact"/>&nbsp&nbsp&nbsp&nbsp联系电话&nbsp<input type="text" name="casetel"/></td>
     </tr>
     <tr>
     <td>项目情况</td>
     <td>
		<textarea cols="80" rows="8" name="caseoverview" placeholder="（包括：主要工艺原理、流程、一次性投资、运行和维护成本等）"></textarea>
	</td>
	 <tr>
     <td>项目实施后节能减排效果</td>
     <td>
		<textarea cols="80" rows="8" name="effect" placeholder="(包括：能有效提高比例/污染物减排量/温室气体消减量/副产能源利用量/新能源所占比例等具体指标)"></textarea>
	</td>
     </tr>
     <tr>
     <td>项目实施后企业效益及经济效益</td>
     <td>
		<textarea cols="80" rows="8" name="benefit"></textarea>
	</td>
     </tr>
     <tr>
     <td>用户对本项技术的综合性评价</td>
     <td>
		<textarea cols="80" rows="8" name="appraisal" placeholder="(包括：实施的效果、存在的问题及有待改进的地方)"></textarea>
	</td>
     </tr>
	<tr>
     <td>相关证明材料</td>
     <td id="more1">
		上传附件（图片或者文档）</br>
		 <input name="file" type="file" label="上传附件（图片或者文档）" theme="simple" >
		 <input type="button" value="添加更多..." onclick="addMore1()"></br>
	</td>
	</tr>
	</tbody>
	<!--案例1结束  -->
	
	
	 <!--案例2开始  -->
      <tbody id="case2" name="case2">
     <tr>
       <td>
       <h3>案例2</h3>
       <input type="hidden" name="num2" id="num2" value="1">
       </td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;案例名称</td>
      <td><input type="text" name="casename2"/>&nbsp&nbsp&nbsp&nbsp起始时间&nbsp<input type="text" name="starttime2"/></td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;实施单位</td>
      <td><input type="text" name="implement2"/>&nbsp&nbsp&nbsp&nbsp合作方式&nbsp<input type="text" name="cooperation2"/></td>
     </tr>
     <tr>
      <td>联系人</td>
      <td><input type="text" name="contact2"/>&nbsp&nbsp&nbsp&nbsp联系电话&nbsp<input type="text" name="casetel2"/></td>
     </tr>
     <tr>
     <td>项目情况</td>
     <td>
		<textarea cols="80" rows="8" name="caseoverview2" placeholder="（包括：主要工艺原理、流程、一次性投资、运行和维护成本等）"></textarea>
	</td>
	 <tr>
     <td>项目实施后节能减排效果</td>
     <td>
		<textarea cols="80" rows="8" name="effect2" placeholder="(包括：能有效提高比例/污染物减排量/温室气体消减量/副产能源利用量/新能源所占比例等具体指标)"></textarea>
	</td>
     </tr>
     <tr>
     <td>项目实施后企业效益及经济效益</td>
     <td>
		<textarea cols="80" rows="8" name="benefit2"></textarea>
	</td>
     </tr>
     <tr>
     <td>用户对本项技术的综合性评价</td>
     <td>
		<textarea cols="80" rows="8" name="appraisal2" placeholder="(包括：实施的效果、存在的问题及有待改进的地方)"></textarea>
	</td>
     </tr>
	<tr>
     <td>相关证明材料</td>
     <td id="more2">
		上传附件（图片或者文档）</br>
		 <input name="file" type="file" label="上传附件（图片或者文档）" theme="simple" >
		 <input type="button" value="添加更多..." onclick="addMore2()"></br>
	</td>
	</tr>
	</tbody>
	<!--案例2结束  -->
	
	 <!--案例3开始  -->
      <tbody id="case3" name="case3">
     <tr>
       <td>
       <h3>案例3</h3>
       <input type="hidden" name="num3" id="num3" value="1">
       </td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;案例名称</td>
      <td><input type="text" name="casename3"/>&nbsp&nbsp&nbsp&nbsp起始时间&nbsp<input type="text" name="starttime3"/></td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;实施单位</td>
      <td><input type="text" name="implement3"/>&nbsp&nbsp&nbsp&nbsp合作方式&nbsp<input type="text" name="cooperation3"/></td>
     </tr>
     <tr>
      <td>联系人</td>
      <td><input type="text" name="contact3"/>&nbsp&nbsp&nbsp&nbsp联系电话&nbsp<input type="text" name="casetel3"/></td>
     </tr>
     <tr>
     <td>项目情况</td>
     <td>
		<textarea cols="80" rows="8" name="caseoverview3" placeholder="（包括：主要工艺原理、流程、一次性投资、运行和维护成本等）"></textarea>
	</td>
	 <tr>
     <td>项目实施后节能减排效果</td>
     <td>
		<textarea cols="80" rows="8" name="effect3" placeholder="(包括：能有效提高比例/污染物减排量/温室气体消减量/副产能源利用量/新能源所占比例等具体指标)"></textarea>
	</td>
     </tr>
     <tr>
     <td>项目实施后企业效益及经济效益</td>
     <td>
		<textarea cols="80" rows="8" name="benefit3"></textarea>
	</td>
     </tr>
     <tr>
     <td>用户对本项技术的综合性评价</td>
     <td>
		<textarea cols="80" rows="8" name="appraisal3" placeholder="(包括：实施的效果、存在的问题及有待改进的地方)"></textarea>
	</td>
     </tr>
	<tr>
     <td>相关证明材料</td>
     <td id="more3">
		上传附件（图片或者文档）</br>
		 <input name="file1" type="file" label="上传附件（图片或者文档）" theme="simple" >
		 <input type="button" value="添加更多..." onclick="addMore3()"></br>
	</td>
	</tr>
	</tbody>
	<!--案例3结束  -->
		
	<tr>
	   <td>填报时间</td>
	   <td><input type="text" name="filltime" style="width: 215px; " onclick="new Calendar().show(this);"></td>
	</tr>              
  </table>
  <br>
   <center>
   <input type="submit" id="btnSubmit" value="提交" style="height: 30px; width: 65px; background-color: #408080;">&nbsp&nbsp&nbsp<input type="reset" value="取消" style="height: 30px; width: 65px; background-color: #408080;">
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
    button.value = "移除";
    
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
    button.value = "移除";
    
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
    button.value = "移除";
    
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
