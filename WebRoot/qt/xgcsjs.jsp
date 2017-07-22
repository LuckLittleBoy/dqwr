<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body bgcolor="#C0C0C0">
  <form action="insert" method="post" enctype="multipart/form-data">
  <h2 align="center">节能减排先进成熟技术情况表</h2>
  <table border="2" align="center" bgcolor="#FFFFFF">
    <tr>
      <td>技术名称</td>
      <td><input type="text" name="kjcg.cgmc" style="width: 433px;" value="煤炭二次充分利用"/>
      </td>
     </tr>
     <tr>
      <td>单位名称</td>
      <td><input type="text" name="kjcg.dwfr" style="width: 434px; " value="河北省科学院"/></td>
     </tr>
     <tr>
      <td>单位法人</td>
      <td><input type="text" name="kjcg.dz" value="赵黎明"/>&nbsp;&nbsp;联系人&nbsp&nbsp&nbsp&nbsp<input type="text" name="kjcg.yx" value="刘畅东"/></td>
     </tr>
     <tr>
      <td>地址</td>
      <td><input type="text" name="kjcg.dz" value="河北省北二环东路17号"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱&nbsp&nbsp&nbsp&nbsp<input type="text" name="kjcg.yx" value="15710322376@qq.com"/></td>
     </tr>
     <tr>
      <td>联系电话</td>
      <td>固话：<input type="text" name="kjcg.gh" value="0311-84930663"/>&nbsp&nbsp&nbsp&nbsp手机：&nbsp<input type="text" name="kjcg.sj" value="18972636474"/></td>
     </tr>
     <tr>
     <td>单位性质</td>
     <td><input type="radio" name="kjcg.dwxz" value="企业" checked="checked">企业
         <input type="radio" name="kjcg.dwxz" value="高等院校">高等院校
         <input type="radio" name="kjcg.dwxz" value="研究机构">研究机构
         <input type="radio" name="kjcg.dwxz" value="其他">其他，请注明<input type="text" name="kjcg.dwxzqt" style="width: 117px; ">
     </td>
     </tr>
     <tr>
     <td>单位简介</td>
     <td>
		<textarea cols="80" rows="8" name="kjcg.jsjj">(包括：结构成立时间、规模、主要产品等)</textarea>
	</td>
     </tr>
      <tr>
     <td>技术来源</td>
     <td><input type="radio" name="kjcg.dwxz" value="自主研发">自主研发
         <input type="radio" name="kjcg.dwxz" value="合作开发" checked="checked">合作开发
         <input type="radio" name="kjcg.dwxz" value="技术引进吸收再创新">技术引进吸收再创新</br>
         <input type="radio" name="kjcg.dwxz" value="技术引进">技术引进，请注明技术持有单位<input type="text" name="kjcg.dwxzqt" style="width: 117px; "></br>
         <input type="radio" name="kjcg.dwxz" value="其他">其他，请注明<input type="text" name="kjcg.dwxzqt" style="width: 117px; ">
     </td>
     </tr>
      <tr>
     <td>技术领域</td>
     <td><input type="checkbox" name="kjcg.jsly" value="新能源技术">新能源技术
         <input type="checkbox" name="kjcg.jsly" value="大气污染治理技术">大气污染治理技术
         <input type="checkbox" name="kjcg.jsly" value="污水处理技术">污水处理技术</br>
         <input type="checkbox" name="kjcg.jsly" value="固废处理技术" checked="checked">固废处理技术
         <input type="checkbox" name="kjcg.jsly" value="污染场地修复技术" checked="checked">污染场地修复技术
         <input type="checkbox" name="kjcg.jsly" value="建筑节能技术" checked="checked">建筑节能技术</br>
         <input type="checkbox" name="kjcg.jsly" value="工业节能技术">工业节能技术
         <input type="checkbox" name="kjcg.jsly" value="余热利用技术">余热利用技术
         <input type="checkbox" name="kjcg.jsly" value="其他">其他，请注明(可多选)<input type="text" name="kjcg.jslyqt" style="width: 117px; ">
     </td>
     </tr>
       <tr>
     <td>技术简介</td>
     <td>
		<textarea cols="80" rows="8" name="kjcg.syfw">(包括：技术原理、指标、关键设备及先进/创新性描述等)</textarea>
	</td>
     </tr>
     <tr>
     <td>适用范围</td>
     <td>
		<textarea cols="80" rows="8" name="kjcg.syfw">(包括：行业、使用限定条件等)（行业参见国民经济行业分类三级目录）</textarea>
	</td>
     </tr>
     <tr>
     <td>先进度</td>
     <td><input type="radio" name="kjcg.xjx" value="国际领先">国际领先
         <input type="radio" name="kjcg.xjx" value="国际先进" checked="checked">国际先进
         <input type="radio" name="kjcg.xjx" value="国内领先">国内领先
         <input type="radio" name="kjcg.xjx" value="国内先进">国内先进
     </td>
     </tr>
     <tr>
     <td>成熟度</td>
     <td><input type="radio" name="kjcg.csd" value="示范应用">示范应用
         <input type="radio" name="kjcg.csd" value="规模化应用" checked="checked">规模化应用
         <input type="radio" name="kjcg.csd" value="未产业化">未产业化
     </td>
     </tr> 
     <tr>
     <td>经济指标</td>
     <td>
		<textarea cols="80" rows="8" name="kjcg.jjzb">(包括：投资、运行维护费用、投资回收期、预期效益等)</textarea>
	</td>
     </tr>
     <tr>
     <td>节能减排预期效果</td>
     <td>
		<textarea cols="80" rows="8" name="kjcg.jnjpxg">(包括：能有效提高比例/污染物减排量/温室气体消减量/副产能源利用量/新能源所占比例等具体指标)</textarea>
	</td>
     </tr>
      <tr>
     <td>成果转发方式</td>
     <td><input type="radio" name="kjcg.cgzhfs" value="技术转让">技术转让
         <input type="radio" name="kjcg.cgzhfs" value="技术授权">技术授权
         <input type="radio" name="kjcg.cgzhfs" value="技术服务" checked="checked">技术服务
         <input type="radio" name="kjcg.cgzhfs" value="已转让">已转让（受合约约束不能转让）<br>
         <input type="radio" name="kjcg.cgzhfs" value="其他"> 其他，请注明<input type="text" name="kjcg.cgzhfsqt" style="width: 117px; ">
     </td>
     </tr>
      <tr>
     <td>成果融资需求</td>
     <td><input type="radio" name="kjcg.cgrzxq" value="股权融资">股权融资
         <input type="radio" name="kjcg.cgrzxq" value="债权融资" checked="checked">债权融资
         <input type="radio" name="kjcg.cgrzxq" value="其他"> 其他，请注明<input type="text" name="kjcg.cgrzxqqt" style="width: 117px; ">
     </td>
     </tr>
     <tr>
       <td>成果的融资需<br>求金额（万元）</td>
       <td><input type="text" name="kjcg.cgrzxqje" style="height: 32px; width: 142px" value="11.23"></td>
     </tr>
      <tr>
       <td style="width: 152px; height: 14px"><strong>典型案例情况：</strong></td>
     </tr>
      <tr>
     <td>案例数量</td>
     <td><input type="radio" name="kjcg.alsl" value="1">1个
         <input type="radio" name="kjcg.alsl" value="2" checked="checked">2个
         <input type="radio" name="kjcg.alsl" value="3">3个
         <input type="radio" name="kjcg.alsl" value="多个">多个
     </td>
     </tr>
     <tr>
      <td>案例名称</td>
      <td><input type="text" name="kjcg.almc" value="秦皇岛展"/>&nbsp&nbsp&nbsp&nbsp起始时间&nbsp<input type="text" name="kjcg.qssj" value="2015-2-3"/></td>
     </tr>
     <tr>
      <td>实施单位</td>
      <td><input type="text" name="kjcg.allxr"/>&nbsp&nbsp&nbsp&nbsp合作方式&nbsp<input type="text" name="kjcg.allxdh"/></td>
     </tr>
     <tr>
      <td>联系人</td>
      <td><input type="text" name="kjcg.allxr"/>&nbsp&nbsp&nbsp&nbsp联系电话&nbsp<input type="text" name="kjcg.allxdh"/></td>
     </tr>
     <tr>
     <td>项目情况</td>
     <td>
		<textarea cols="80" rows="8" name="kjcg.ssxg">（包括：主要工艺原理、流程、一次性投资、运行和维护成本等）</textarea>
	</td>
	 <tr>
     <td>项目实施后节能减排效果</td>
     <td>
		<textarea cols="80" rows="8" name="kjcg.jnjpxg">(包括：能有效提高比例/污染物减排量/温室气体消减量/副产能源利用量/新能源所占比例等具体指标)</textarea>
	</td>
     </tr>
     <tr>
     <td>项目实施后企业效益及经济效益</td>
     <td>
		<textarea cols="80" rows="8" name="kjcg.jnjpxg"></textarea>
	</td>
     </tr>
     <tr>
     <td>用户对本项技术的综合性评价</td>
     <td>
		<textarea cols="80" rows="8" name="kjcg.jnjpxg">(包括：实施的效果、存在的问题及有待改进的地方)</textarea>
	</td>
     </tr>
	<tr>
     <td>相关证明材料</td>
     <td id="more">
		<textarea cols="80" rows="8" name="kjcg.xgzmcl" >（包括：产品、技术图片、专利、获奖信息、相关检测报告、测试报告、鉴定报告等文档扫描材料）</textarea></br>
		上传附件（图片或者文档）</br>
		 <input type="file" label="上传附件（图片或者文档）" theme="simple" name="file">
		
		<input type="button" value="添加更多..." onclick="addMore()"></br>
	</td>
	</tr>	
	<tr>
	   <td>填报时间</td>
	   <td><input type="text" name="kjcg.tbsj" style="width: 215px; "></td>
	</tr>
	<tr>
	 <td></td> 
	 <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="submit" value="提交" style="height: 30px; width: 65px; background-color: #408080;">&nbsp&nbsp&nbsp<input type="reset" value="取消" style="height: 30px; width: 65px; background-color: #408080;"></td>
	</tr>                
  </table>
  </form>
  </body>
  <script type="text/javascript">        
function addMore()
{
    var td = document.getElementById("more");
    
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
    }
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
}

function addAl()
{
    var td = document.getElementById("more");
    
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
    }
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
}
</script>
</html>
