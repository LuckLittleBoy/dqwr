<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.satp.entity.*, java.util.ArrayList"
	import="com.dqwr.entity.*,com.dqwr.model.*"
	import="com.dqwr.technology.dao.impl.*" import="java.sql.ResultSet"
	import="com.dqwr.dao.*" import="java.sql.Connection"
	import="com.dqwr.technology.dao.impl.*"
	import="java.text.SimpleDateFormat"
	import="com.dqwr.technology.entity.Technology" pageEncoding="UTF-8"
	import="com.dqwr.requirement.dao.impl.*"
	
%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<title>河北省大气污染防治技术成果支撑管理与应用服务系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery.js"></script>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script language="JavaScript" src="js/jquery-1.9.1.min.js"></script>
<style>
  .table-c table{border-top:4px solid #3299cc;border-left:1px solid #3299cc}
  .table-c table td{border-right:1px solid #3299cc;border-bottom:1px solid #3299cc}
  .table-c table tr{height:50px;}
  .table-cc table{border-top:4px solid #3299cc;border-left:1px solid #3299cc}
  .table-cc table td{border-right:1px solid #3299cc;border-bottom:1px solid #3299cc;width: 540px;}
  .table-cc table tr{height:50px;}
  h3{font-style: italic;color:navy;}
  .title{font-weight:bold;width:20%;} 
  </style>
<script type="text/javascript">
	function form1submit() {

		document.form1.submit();
	}
</script>
 
<script language="JavaScript" src="js/qtcx.js"></script>

<script language="JavaScript" src="js/time.js"></script>

<style type="text/css">
.test img{
float:right;
}
br{
clear:both;
}
<!--
.center {
	font-size: 12px;
}

.news tr {
	height: 30px
}

.news td, th {
	background: expression(( this.parentNode.rowIndex)%2==0?"#3DB7CC":"#B3F4FF");
}

.news a {
	color: #000000;
}

.tag ul {
	list-style: none;
}

.tag li {
	float: left;
	margin-left: 50px;
}

.left li {
	margin-top: 10px;
}

a {
	text-decoration: none
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/indexbg.jpg);
	background-repeat: repeat-x;
	background-color: #F3F3F3;;
}

.STYLE1 {
	font-size: 13px;
	font-weight: bold;
	color: #FFFFFF;
}

.STYLE11 {
	font-size: 13px;
	color: #000033;
	font-weight: bold;
}

.STYLE22 {
	color: #fffff;
	font-size: 20px;
	font-weight: bold;
}

.STYLE2 {
	font-size: 12px;
	color: #ffffff;
}

.STYLE3 {
	color: #FFFFFF;
	font-size: 12px;
	line-height: 25px;
}

a:link {
	color: black;
	text-decoration: none
}

a:visited {
	color: black;
	text-decoration: none
}

a:hover {
	color: red;
	text-decoration: none
}

.STYLE5 {
	font-size: 20px;
	font-weight: bold;
	color: #FFFFFF;
}

.leftul li {
	width: 180px;
	line-height: 29px;
	text-align: left;
	background: url(images/dot.gif) repeat-X bottom; e;
	font-size: 14px;
	height: 29px;
}

.leftul li.line {
	margin-left: -10px;
	padding-left: 30px;
	font-size: 0px;
	height: 1px;
	background: #e5e5e5;
}
-->
</style>
</head>
<body>
	<div align="center">
		<!-- Save for Web Slices (首页new切割好.psd) -->
		<table id="__01" width="1046" height="968" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td colspan="26"><img src="images/index_01.jpg" width="1046"
					height="193" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="193" alt=""></td>
			</tr>
			<tr>
				<td colspan="26" background="images/index_02.gif"><div
						align="center" class="STYLE11">
						<a href="<%=path %>/qt/index.jsp">首&nbsp;&nbsp;页</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path %>/qt/zcfl.jsp">文献资源</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path %>/qt/qtcx.jsp?Type=0&Scope=2" >工作动态</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path %>/qt/qtcx.jsp?Type=1&Scope=0">行业动态</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path %>/qt/qttjfx.jsp?tag=1">技术需求</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path %>/qt/qtcx1.jsp?tag=1">成熟技术</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path %>/qt/qtcx2.jsp?look=1">创新要素</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path %>/qt/qtzthd.jsp" style='text-decoration: none;'>专题活动</a>&nbsp;&nbsp;|&nbsp;&nbsp;
							<a
							href="<%=path %>/qt/lxwm.jsp">联系我们</a>
					</div></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="31" alt=""></td>
			</tr>
			<!-- 	  时间动态显示 -->
			
		   
				<%
					YH wbuser= (YH) session.getAttribute("wbuser");
					String show;
					Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String dateNowStr = sdf.format(date);
				%>
				<%
         ResultSet orgars,techrs,casers;
         int TechId=Integer.parseInt(request.getParameter("TechId"));
         String orgaid=request.getParameter("OrgaId");   
         DataBaseDao db=new DataBaseDao();
         Connection conn=db.connection();
         OrgaDaoImpl orgaimpl=new OrgaDaoImpl();
         TechnologyDaoImpl techimpl=new TechnologyDaoImpl();
         CaseDaoImpl caseimpl=new CaseDaoImpl();
         orgars=orgaimpl.SelectOrgaById(conn,orgaid);
         orgars.next();
         techrs=techimpl.selectTechById(conn, TechId);
         techrs.next();
         casers=caseimpl.selectCaseById(conn, TechId);
         //casers.next();
      %> 
			<tr>
				<td   height="25"  colspan="30" background="images/index_03.jpg"  class="STYLE2"><div
						align="center">
						<div id="nowtime"  ></div>
						<div style="float: left;">
						<a href="JavaScript:history.back(-1)" style="color: white">&nbsp;&nbsp;&nbsp;&nbsp;返回</a>
						</div>
						<%
							if (wbuser != null) {
						%>
						<div style="float: left;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=wbuser.getUsername()%>&nbsp;您好，今天是<%=dateNowStr %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div align="right">
							<a href="#" id="zx" style="color: white">注销</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<%
							}
							else{
								%>
							<div style="float: left;">
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;游客您好，今天是<%=dateNowStr %>,想浏览更多内容或提交信息请先登陆&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>	
							<%
							}
						   %>
					</div></td>
			</tr>
			<!--  时间动态显示结束 --> 
			<tr>
				 <td colspan="26"><img src="images/index_04.jpg" width="1047"
					height="3" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="3" alt=""></td>
			</tr>

			<tr bgcolor="#FEFEFE">
				<td colspan="2" border="0" valign="top" bgcolor="#ffffff"> 
				</td> 
				<td colspan="2" valign="top" style="margin-left: 4px">
					<!-- 内容 -->
					<div  style="margin-left:20px" class="table-c">
 <br>
   <center><h2><font color="navy">成熟技术</font></h2></center>
    <table border="0" width="72%" align="center" bgcolor="#FFFFFF">
    <tr>
      <td class="title">技术名称</td>
      <td><%=techrs.getString(3) %>
      </td>
    </tr>
      <tr>
     <td class="title">技术来源</td>
     <%
       String sourcename="";
       if(techrs.getBytes(4)!=null){
       byte[] source=techrs.getBytes(4);
       int sourceflag=0;

       for(int i=0;i<source.length;i++)
       {
    	   if(source[i]==1){
    		   sourceflag=i;
    	   } 
       }
       switch(sourceflag){
       case 0:
    	   sourcename=techrs.getString(6);
    	   
    	   break;
       case 1:
    	   sourcename=techrs.getString(5);
    	   
    	   break;
       case 2:
    	   sourcename="技术引进吸收再创新";
    	   break;
       case 3:
    	   sourcename="合作开发";
    	   break;
       case 4:
    	   sourcename="自主研发";
    	   break;
       }
       }
     %>
     <td><%=sourcename%></td>
     </tr>
     <tr>
     <td class="title">技术领域</td>
     <% 
      String field="";
      String[] fields=techrs.getString(7).split(";");
      for(int i=0;i<fields.length;i++){
    	 if(fields[i].equals("其他")){
    		 field+=techrs.getString(8);
    	 }else{
    		 field+=fields[i]+";";
    	 } 
      }
      %>
      <td><%=field%></td>
     </tr>
     
       <tr>
     <td class="title">技术简介</td>
     <td>
		<%=techrs.getString(9) %>
	</td>
     </tr>
     <tr>
     <td class="title">适用范围</td>
     <td>
		<%=techrs.getString(10) %>
	</td>
     </tr>
     <tr>
     <td class="title">先进度</td>
     <%
       String processname="";
       if(techrs.getBytes(11)!=null){
       byte[] process=techrs.getBytes(11);
       int processflag=0;
       for(int i=0;i<process.length;i++)
       {
    	   if(process[i]==1){
    		   processflag=i;
    	   } 
       }
       switch(processflag){
       case 0:
    	   processname="国内先进";
    	   break;
       case 1:
    	   processname="国内领先";
    	   break;
       case 2:
    	   processname="国际先进";
    	   break;
       case 3:
    	   processname="国际领先";
    	   break;
       }
       }
     %>
     <td><%=processname%></td>
     </tr>
     <tr>
     <td class="title">成熟度</td>
      <%
       String statename="";
       if(techrs.getBytes(12)!=null){
       byte[] state=techrs.getBytes(12);
       int stateflag=0;
       
       for(int i=0;i<state.length;i++)
       {
    	   if(state[i]==1){
    		   stateflag=i;
    	   } 
       }
       switch(stateflag){
       case 0:
    	   statename="示范应用";
    	   break;
       case 1:
    	   statename="规模化应用";
    	   break;
       case 2:
    	   statename="示范应用";
    	   break;
       }
       }
     %>
     <td><%=statename%></td>
     </tr> 
     <tr>
     <td class="title">经济指标</td>
     <td>
		<%=techrs.getString(13) %>
	</td>
     </tr>
     <tr>
     <td class="title">节能减排预期效果</td>
     <td>
		<%=techrs.getString(14) %>
	</td>
     </tr>
      <tr>
     <td class="title">成果转发方式</td>
     <%
       String tranname="";
       if(techrs.getBytes(15)!=null){
       byte[] tran=techrs.getBytes(15);
       int tranflag=0;
      
       for(int i=0;i<tran.length;i++)
       {
    	   if(tran[i]==1){
    		   tranflag=i;
    	   } 
       }
       switch(tranflag){
       case 0:
    	   tranname=techrs.getString(16);
    	   break;
       case 1:
    	   tranname="已转让";
    	   break;
       case 2:
    	   tranname="技术服务";
    	   break;
       case 3:
    	   tranname="技术授权";
    	   break;
       case 4:
    	   tranname="技术转让";
    	   break;
       }
       }
     %>
     <td><%=tranname%></td>
     </tr>
      <tr>
     <td class="title">成果融资需求</td>
     <%
      String finaneename="";
       if(techrs.getBytes(17)!=null){
       byte[] finanee=techrs.getBytes(17);
       int finaneeflag=0;
       
       for(int i=0;i<finanee.length;i++)
       {
    	   if(finanee[i]==1){
    		   finaneeflag=i;
    	   } 
       }
       System.out.println("i="+finaneeflag);
       switch(finaneeflag){
       case 0:
    	   finaneename=techrs.getString(18);
    	   break;
       case 1:
    	   finaneename="债权融资";
    	   break;
       case 2:
    	   finaneename="股权融资";
    	   break;
       }
       }
     %>
     <td><%=finaneename%></td>
     </tr>
     <tr>
       <td class="title">成果的融资需<br>求金额（万元）</td>
       <td><%=techrs.getString(19) %></td>
     </tr>
    <tr>
	   <td class="title">填报时间</td>
	   <td colspan="3"><%=techrs.getString(21) %></td>
	</tr>        
     </table>     
      <br>
      </div>
      <div class="table-cc">
      
     <% 
        int casenum=0;
     	int pathFlag=0;
     	ArrayList<String> paths = new ArrayList<String>();
        while(casers.next()){
         casenum++;
         if(!casers.getString(13).isEmpty()){
        	 //使用flag来标记路径是否存在
        	 pathFlag =1;//存在标记为1
        	 for(int a=0;a<casers.getString(13).split(";").length;a++){
         	 	paths.add(casers.getString(13).split(";")[a]); 
        	 }
         }else{
        	 pathFlag =0;//不存在标记为0
         }
      %>
     <center><h2><font color="navy">典型案例<%=casenum %></font></h2></center>
    <table border="0" width="72%" align="center" bgcolor="#FFFFFF">  
     <tr>
      <td class="title">案例名称</td>
      <td><%=casers.getString(3) %></td><td class="title">起始时间</td><td><%=casers.getString(4)%></td>
     </tr>
     <tr>
      <td class="title">实施单位</td>
      <td><%=casers.getString(5) %></td><td class="title">合作方式</td><td><%=casers.getString(6) %></td>
     </tr>
     <tr>
      <td class="title">联系人</td>
      <td><%=casers.getString(7) %></td><td class="title">联系电话</td><td><%=casers.getString(8) %></td>
     </tr>
     <tr>
     <td class="title">项目情况</td>
     <td colspan="3">
		<%=casers.getString(9) %>
	</td>
	 <tr>
     <td class="title">项目实施后节能减排效果</td>
     <td colspan="3">
		<%=casers.getString(10) %>
	</td>
     </tr>
     <tr>
     <td class="title">项目实施后企业效益及经济效益</td>
     <td colspan="3">
		<%=casers.getString(11) %>
	</td>
     </tr>
     <tr>
     <td class="title">用户对本项技术的综合性评价</td>
     <td colspan="3">
		<%=casers.getString(12) %>
	</td>
     </tr>
	 <tr>
     <td class="title">相关证明材料</td>
     <td colspan="3">
       <%
         if(pathFlag == 1){
         	for(int i=0;i<paths.size();i++){
        	 	String name=null;
        	  	name=paths.get(i).substring(8);
       %>
        <a href="/dqwr/LoadFile?path=<%=paths.get(i) %>"><%=name %></a>
        <br>
       <%}
         }else{
        		 %>
        		 <a href="#">无</a>
        <br>
		<%}%>
     </td>
	</tr>   
</table>
      <%   	
        }   
      %>  	
  <!--单位信息  -->
   <br>
     <center><h2><font color="navy">单位信息</font></h2></center>
   <table border="0" width="72%" align="center" bgcolor="#FFFFFF">
   <tr>
     <td class="title">机构代码</td>
     <td colspan="3"><%=orgars.getString(1)%></td>
   </tr>
   <tr>
   <td class="title">单位名称</td>
   <td colspan="3"><%=orgars.getString(2) %></td>
   </tr>
   <tr>
   <td class="title">单位法人</td>
   <td><%=orgars.getString(5) %></td><td class="title">联系人</td><td><%=orgars.getString(6)%></td>
   </tr>
   <tr>
      <td class="title">地址</td>
      <td><%=orgars.getString(9) %></td><td class="title">邮箱</td><td><%=orgars.getString(10)%></td>
     </tr>
     <tr>
      <td class="title">固话</td>
      <td><%=orgars.getString(7)%></td><td class="title">手机</td><td><%=orgars.getString(8)%></td>
     </tr>
     <tr>
     <td class="title">单位性质</td>
     <%
       byte[] nature=orgars.getBytes(12);
       int flag=0;
       String name=null;
       for(int i=0;i<nature.length;i++)
       {
    	   if(nature[i]==1){
    		   flag=i;
    	   } 
       }
       switch(flag){
       case 3:
    	   name="企业";
    	   break;
       case 2:
    	   name="高等院校";
    	   break;
       case 1:
    	   name="研究机构";
    	   break;
       case 0:
    	   name=orgars.getString(13);
    	   break;
       }
     %>
     <td colspan="3"><%=name%></td>
     </tr>
     <tr>
     <td class="title">单位简介</td>
     <td colspan="3">
		<%=orgars.getString(14)%>
	</td>
     </tr>
   </table>
   
  </div><br /> <!-- 内容 --> 
				</td>
				
			</tr>  <!-- 链接部分 --> 
			<tr>
				<td height="29" colspan="4"><div align="center">
						<font color=#000099 size="4"><strong>友情链接</strong></font> <select
							onChange="window.open(this.options[this.selectedIndex].value)">
							<option selected>--政府网站--</option>
							<option value="http://www.hebei.gov.cn/">中国.河北</option>
							<option value="http://www.hebstd.gov.cn/">省科学技术厅</option>
							<option value="http://www.ii.gov.cn/">省信息产业厅</option>
							<option value="http://www.hbdrc.gov.cn/">省发改委</option>
							<option value="http://www.hee.cn/">省教育厅</option>
							<option>------------</option>
							<option value="http://www.most.gov.cn/">科学技术部</option>
							<option value="http://www.sdpc.gov.cn/">国家发改委</option>
							<option value="http://www.moe.edu.cn/">教育部</option>
							<option value="http://www.sipo.gov.cn/">国家知识产权局</option>
							<option value="http://www.cas.cn/">中国科学院</option>
						</select> <select
							onChange="window.open(this.options[this.selectedIndex].value)">
							<option selected>--本省科技--</option>
							<option
								value="http://www.sjzkj.gov.cn/cyportal/template/site00_index.jsp">石家庄</option>
							<option value="http://www.chengde.gov.cn/">承德市</option>
							<option value="http://www.zjkkj.gov.cn/">张家口市</option>
							<option value="http://www.tskj.com.cn/">唐山市</option>
							<option value="http://www.lfinfo.gov.cn/">廊坊市</option>
						</select> <select
							onChange="window.open(this.options[this.selectedIndex].value)">
							<option selected>--各省科技--</option>
							<option value="http://www.heinfo.gov.cn/Home/Index.asp">河北科技信息网</option>
							<option value="http://www.bjkw.gov.cn/n8785584/index.html">北京市科委</option>
							<option value="http://www.tisti.ac.cn/">天津科技网</option>
							<option value="http://www.sxinfo.gov.cn/">中国山西之窗</option>
							<option value="http://www.nmsti.com/2014/">内蒙古科技信息网</option>
							<option value="http://www.lninfo.gov.cn/">辽宁科技信息网</option>
							<option value="http://kjt.jl.gov.cn/kjt/4/tindex.shtml">吉林科学技术厅</option>
							<option value="http://www.hljkjt.gov.cn/">黑龙江科技厅</option>
							<option value="http://www.jsinfo.gov.cn/">江苏科技信息网</option>
							<option value="http://www.zjinfo.gov.cn/">浙江科技网</option>
							<option value="http://www.ahinfo.gov.cn/">安徽科技网</option>
							<option value="http://www.fjinfo.gov.cn/">福建科技网</option>
							<option value="http://www.jxinfo.gov.cn/">江西科技信息网</option>
							<option value="http://www.sdstc.gov.cn/">山东科学技术厅</option>
							<option value="http://www.hnkjt.gov.cn/new/index.eiip">河南科技网</option>
							<option value="http://www.hbstd.gov.cn/">湖北科学技术厅</option>
							<option value="http://www.sti.gd.cn/">广东金科网</option>
							<option value="http://www.cstc.gov.cn/">重庆市科委</option>
							<option
								value="http://www.sninfo.gov.cn:8083/initSnFirstPageList.do?method=initSnFirstPageList">陕西科技信息网</option>
							<option value="http://www.xjinfo.gov.cn/">新疆科技信息网</option>
							<option value="http://www.scst.gov.cn/info/">四川省科学技术厅</option>
							<option value="http://www.gsinfo.net.cn/">甘肃科技信息网</option>
							<option value="http://www.ynst.net.cn/">云南科技信息网</option>

						</select> <select
							onChange="window.open(this.options[this.selectedIndex].value)">
							<option selected>--其他科技--</option>
							<option value="http://www.cast.org.cn/">中国科学技术协会</option>
							<option value="http://www.stdaily.com/">科技日报</option>
							<option value="http://www.stdaily.com/">中国科普网</option>
							<option value="http://www.istic.ac.cn/">中国科技信息研究</option>
							<option value="http://www.chinainfo.gov.cn/">中国科技信息</option>
							<option value="http://www.cstec.org/zh/index.aspx">中国科技交流中心</option>
							<option>-----------</option>
							<option value="http://www.picmg.com.cn/">中国计算机行业网</option>
							<option value="http://www.clii.com.cn/">中国轻工信息网</option>
							<option value="http://www.aptchina.com/">中国应用技术网</option>
						</select> <select
							onChange="window.open(this.options[this.selectedIndex].value)">
							<option selected>--资源网站--</option>
							<option value="http://scitech.people.com.cn/policy/#1">中国科技政策网</option>
							<option value="http://policy.tech110.net/">国家科技成果网</option>
							<option value="http://www.most.gov.cn/dqwr/gjdqwr/">国家科技政策</option>
							<option value="http://www.chinalaw.gov.cn/article/fgkd/xfg/">国务院法制办公室</option>
							<option
								value="http://www.sninfo.gov.cn:8083/initSnZcfgTwoPageList.do?method=initSnZcfgTwoPageList">陕西省科技信息网</option>
							<option value="http://www.51policy.cn/">江苏省科技政策服务网</option>
							<option value="http://zc.k8008.com/">科易网科技政策服务中心</option>
							<option value="http://www.kjzj.org.cn/">中关村科技服务平台</option>
							<option value="http://www.dqwrfg.com/html/sort/sort3/index.html">贵州省科技政策法规服务平台</option>
						</select> <select
							onChange="window.open(this.options[this.selectedIndex].value)">
							<option selected>--搜索引擎--</option>
							<option value="http://www.sohu.com/">搜狐</option>
							<option value="http://www.sina.com.cn/">新浪</option>
							<option value="http://www.163.com/">网易</option>
							<option value="http://www.baidu.com/">百度</option>
							<option value="http://www.google.com/">goole</option>
						</select>

					</div></td>
			</tr>
			<tr>
				<td height="29" colspan="4" background="images/index_0900.jpg"
					class="STYLE1"><div align="center">
						<a style="color: #FFFFFF" href="lxwm.jsp">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;设为首页&nbsp;&nbsp;|&nbsp;&nbsp;加入收藏&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="mzsm.jsp" style="color: #ffffff">免责声明</a>
					</div></td>
			</tr>
			<tr>
				<td colspan="4" rowspan="2" background="images/index_651.jpg"><div
						align="center" class="STYLE3">
						版权所有 @ 河北省科学技术情报研究院科技政策服务平台 <br> 地址: 河北省石家庄市青园街233号 邮编：050021
					</div></td>
			</tr>

		</table>
		<!-- End Save for Web Slices -->
	</div>
	<script type="text/javascript">
$(document).ready(function () {
	$("#zx").click(function(){
		alert("注销成功");
		jQuery.post("../qtzx",
				function(response){
			location.replace('index.jsp');
		});
		
	});
	$("#zcbtn").click(function(){
		location.replace("zhuce.jsp");
	})
});
</script>
	<map name="Map">
		<area shape="rect" coords="21,1,117,37" href="#">
		<area shape="rect" coords="127,2,227,37" href="#">
		<area shape="rect" coords="23,49,143,75" href="#">
		<area shape="rect" coords="152,45,231,82" href="#">
	</map>
</body>
</html>