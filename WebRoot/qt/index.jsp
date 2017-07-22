<%@ page language="java" contentType="text/html; charset=GBK"
	import="java.util.*,com.satp.entity.*, java.util.ArrayList"
	import="com.dqwr.entity.*" import="com.dqwr.publishinfo.dao.impl.*"
	import="com.dqwr.expert.daoimpl.*"
	import="com.dqwr.topic.dao.impl.*"
	import="com.dqwr.requirement.dao.impl.*"
	import="com.dqwr.technology.dao.impl.*"
	import="com.dqwr.technology.dao.impl.*" import="java.sql.ResultSet"
	import="com.dqwr.dao.*" import="java.sql.Connection"
	import="java.sql.PreparedStatement" import="java.text.SimpleDateFormat"
	import="java.io.File"
	import="com.dqwr.servlet.TranCharset"
	pageEncoding="GBK"%>
<% 
String path = request.getContextPath();    
%>
<html>
<head>
<script language="JavaScript" src="js/jquery.js"></script>
<title>河北省大气污染防治技术成果支撑管理与应用服务系统——前台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<style type="text/css" media="all">
.d1 {
	width: 285px;
	height: 261px;
	overflow: hidden;
	border: #666666 2px solid;
	background-color: #000000;
	position: relative;
}

.loading {
	width: 285px;
	border: #666666 2px solid;
	background-color: #000000;
	color: #FFCC00;
	font-size: 12px;
	height: 179px;
	text-align: center;
	padding-top: 30px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
}

.d2 {
	width: 285px;
	height: 240px;
	overflow: hidden;
}

img {
	border: 0px;
}

ul {
	display: none;
}

.button {
	z-index: 1000;
	right: 0px;
	bottom: 0px;
	font-size: 13px;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
}

.b1, .b2 {
	background-color: #666666;
	display: block;
	float: left;
	padding: 2px 6px;
	margin-right: 3px;
	color: #FFFFFF;
	text-decoration: none;
	cursor: pointer;
}

.b2 {
	color: #FFCC33;
	background-color: #FF6633;
}
</style>

<style type="text/css">
<!--
#demo {
	background: #FFF;
	overflow: hidden;
	border: 1px dashed #CCC;
	width: 665px;
}

#demo img {
	border: 3px solid #F2F2F2;
}

#indemo {
	float: left;
	width: 800%;
}

#demo1 {
	float: left;
}

#demo2 {
	float: left;
}
-->
</style>
<style type="text/css">


body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/indexbg.jpg);
	background-repeat: repeat-x;
	font: 14px/1.5 Tahoma, Helvetica, Arial, sans-serif;
	
 }

.STYLE1 {
	font-size: 13px;
	color: #000033;
	font-weight: bold;
}

.STYLE2 {
	font-size: 12px;
	color: #FFFFFF;
}

.STYLE3 {
	font-size: 12px;
	color: #205490;
}

td {
	line-height: 16px;
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

li {
	line-height: 25px;
	list-style:
}
-->
</style>
<script type="text/JavaScript" src="../js/index_onload.js"></script>
<script language="JavaScript" src="js/yz.js"></script>
<!-- <link href="css/style.css" type="text/css" rel="stylesheet" />
 --><script language="JavaScript" src="js/gss.js"></script>
<script language="JavaScript" src="js/zhuce.js"></script>
<script language="JavaScript" src="js/index.js"></script>


</head>
<body onLoad="show()" >
    <%
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	    ResultSet rs1, rs2, rs3, rs4, rs5, rs6, rs7, rs8,rs9;
        String TopicLink=null;
        String TopicPath=null;
		DataBaseDao db = new DataBaseDao();
		Connection conn = db.connection();
		PublishHyInfoImpl publish = new PublishHyInfoImpl();
		CaseDaoImpl caseimpl = new CaseDaoImpl();
		RequireDaoImpl requireimpl = new RequireDaoImpl();
		ExpertDaoImpl expertimpl = new ExpertDaoImpl();
		TopicDaoImpl topicimpl=new TopicDaoImpl();
		OrgaDaoImpl orgaimpl = new OrgaDaoImpl();
		TechnologyDaoImpl technologyimpl = new TechnologyDaoImpl();
		rs1 = publish.selectWorkInfo(conn);//工作动态
		rs2 = publish.selectInPro(conn); //省内行业动态
		rs3 = publish.selectOutPro(conn);//省外行业动态
		rs4 = caseimpl.selectInfoAll(conn);//典型案例
		rs5 = requireimpl.AllReuqire(conn);//技术需求
		rs6 = technologyimpl.selectTechAll(conn);//成熟技术
		rs7 = expertimpl.AllExpert(conn);//专家信息
		rs8 = orgaimpl.AllOrga(conn);//机构信息
		String sql = "select top 7 * from PublicPic order by id desc";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = null;
		rs = stmt.executeQuery();
	%>
	
	<div align="center">
		<!-- Save for Web Slices (首页3切a.psd) -->
		<table id="__01" width="1006" height="1501" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td colspan="30"><img src="images/index_01.jpg" width="1005"
					height="193" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="193" alt=""></td>
			</tr>
			<tr>
				<td colspan="30" background="images/index_02.gif" width="1005"><div
						align="center" class="STYLE1">
						<a href="<%=path%>/qt/index.jsp" style='text-decoration: none;'>首&nbsp;&nbsp;页</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path%>/qt/zcfl.jsp" style='text-decoration: none;'>文献资源</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path%>/qt/qtcx.jsp?Type=0&Scope=2" style='text-decoration: none;'>工作动态</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path%>/qt/qtcx.jsp?Type=1&Scope=0" style='text-decoration: none;'>行业动态</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path%>/qt/qttjfx.jsp?tag=1" style='text-decoration: none;'>技术需求</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path%>/qt/qtcx1.jsp?tag=1" style='text-decoration: none;'>成熟技术</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path%>/qt/qtcx2.jsp?look=1" style='text-decoration: none;'>创新要素</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path%>/qt/qtzthd.jsp" style='text-decoration: none;'>专题活动</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path%>/qt/lxwm.jsp" style='text-decoration: none;'>联系我们</a>
					</div></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="31" alt=""></td>
			</tr>
			<!-- 	  时间动态显示 -->
			 
			  
			
				<% 	
				YH wbuser = (YH) session.getAttribute("wbuser");
					//获取信息类型和范围   
					String show;
					Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String dateNowStr = sdf.format(date);
 					%>
			<tr>
				 
				<td   height="25"  colspan="30" background="images/index_03.jpg"  class="STYLE2"><div
						align="center">
						<div id="nowtime"  ></div>
						<%
							if (wbuser != null) {
						%>
						<div style="float: left;">
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=wbuser.getUsername()%>&nbsp;您好，今天是<%=dateNowStr %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
						<div align="right">
							<a href="#" id="zx"
								style="color: white">注销</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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

			<!--  时间动态显示结束 --><tr>
			
				<td rowspan="7"><img src="images/index_04.jpg" width="11"
					height="316" alt=""></td>
				<td colspan="7"><img src="images/index_05.jpg" width="295"
					height="42" alt=""></td>
				<td colspan="8" rowspan="2"><img src="images/index_06.jpg"
					width="368" height="47" alt=""></td>
				<td colspan="4" rowspan="2"><a
					href="<%=path%>/qt/qtcx.jsp?Type=0&Scope=2"
					onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image114','','images/index00_07.jpg',1)"><img
						src="images/index_07.jpg" name="Image114" width="61" height="47"
						border="0"></a></td>
				<td colspan="7" rowspan="2"><img src="images/index_08.jpg"
					width="207" height="47" alt=""></td>
				<td colspan="3" rowspan="2"><a href=""
					onMouseOut="MM_swapImgRestore()"
					><img
						src="images/index_09.jpg" name="Image115" width="67" height="47"
						border="0"></a></td>
<!-- 						onMouseOver="MM_swapImage('Image115','','images/index00_09.jpg',1)"
 -->				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="42" alt=""></td>
			</tr>
			<tr>
				<td colspan="6" rowspan="5">
					<div id="fade_focus">
						<div class="loading">
							Loading...<br /> <img
								src="\dqwr\images\Publicpic\2015-06-01 20-23-08small.jpg"
								width="285" height="261" />
						</div>
						<ul>
							<%
								//崔娜电脑部署为89，自己电脑部署为80 截取的字符串到\dqwr的斜杠之前
								while (rs.next()) {
									String smallpath = rs.getString(3);
									int index = smallpath.lastIndexOf("\\");
									smallpath = smallpath.substring(index+1);	
							%>
								<li><a href="BigImage.jsp?id=<%=rs.getInt(1)%>">
								<img src="../getSmallPath?text=<%=smallpath%> " width="285" height="261" /></a></li>
							<%
								}
							%>
						</ul>
					</div>
				</td>
				<td rowspan="5"><img src="images/index_11.jpg" width="6"
					height="267" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="5" alt=""></td>
			</tr>
			<tr>
				<td rowspan="4"><img src="images/index_12.jpg" width="16"
					height="263" alt=""></td>




				<!--   工作动态 -->

				<td colspan="8" rowspan="4" bgcolor="#F7F7F7"">

					<table class="STYLE3"
						style="table-layout: fixed; margin-top: -60px; margin-bottom: -60px"
						border="0" width=100%>
						<%
							while (rs1.next()) {
						%>
						<tr>
							<td width="70%"
								style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap">
								<img style="margin-left:-5px;" src="images/bluedian.png"
								width="10px" height="10px;">&nbsp; <a
								href="ShowDetail.jsp?InfoId=<%=rs1.getInt(1)%>"><%=rs1.getString(2)%></a>
							</td>
							<td align="right"><%=rs1.getString(7)%></td>

						</tr>

						<%
							}
						%>
					</table>
				</td>

				<!--   工作动态结束 -->

				<td colspan="1" rowspan="4" background="images/index_13.jpg"></td>
				<td colspan="2" rowspan="4"><img src="images/index_14.jpg"
					width="12" height="263" alt=""></td>
				<!-- 登录模块 -->	
				<td colspan="5"><img src="images/index_15.jpg" width="92"
					height="114" alt=""></td>
				<td colspan="5" background="images/index_16.jpg">
				<table
						width="95%" height="86" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td height="20" colspan="2" align="left" valign="bottom"><input
								name="username" id="username"TYPE="text" CLASS="STYLE1"
								STYLE="width: 140 px; height: 17px; border: #336699 1px solid"
								tabindex="1" MAXLENGTH="26"></td>
						</tr>
						<tr>
							<td height="32" colspan="2" align="left" valign="bottom"><INPUT
								name="userpassword" type="password" id="userpassword"
								CLASS="STYLE1"
								STYLE="width: 140 px; height: 17px; border: #336699 1px solid"
								tabindex="1" MAXLENGTH="26"></td>
						</tr> 
						<tr>
							<td width="43%" height="34" align="left" valign="bottom"><input
								name="randcode" id="randcode" type="text" CLASS="STYLE1"
								STYLE="width: 65px; height: 17px; border: #336699 1px solid"
								tabindex="1" MAXLENGTH="26"></td>
							<td width="57%" align="left" valign="bottom"><img
								src="images/randCode.jsp" width="50" height="25">
								</td>
						</tr>
						 
					</table></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="109" alt=""></td>
			</tr>			
			
			
			<tr>
			  
				  <td colspan="6"><a   href=""
					onMouseOut="MM_swapImgRestore()"
						onclick="IMG1_onclick2()"
					onMouseOver="MM_swapImage('Image116','','images/index00_17.jpg',1)"><img
						src="images/index_17.jpg" name="Image116" width="141" height="54"
						border="0" id="dl"> </a></td>
				<td colspan="4"><a href="zhuce.jsp"
					onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image117','','images/index00_18.jpg',1)"><img
						src="images/index_18.jpg" name="Image117" width="133" height="54"
						border="0"></a></td> 
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="52" alt=""></td>
			</tr>
			<!-- 登录模块 -->
			<tr>
				<td colspan="7"><img src="images/index_19.jpg" width="207"
					height="47" alt=""></td>
				<td colspan="3"><a
					href="<%=path%>/qt/qtdxal.jsp"
					onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image118','','images/index00_20.jpg',1)"><img
						src="images/index_20.jpg" name="Image118" width="67" height="47"
						border="0"></a></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="47" alt=""></td>
			</tr>

			<tr>
				<td colspan="3" rowspan="3"><img src="images/index_21.jpg"
					width="26" height="102" alt=""> <!--    案例展示 -->
				<td colspan="6" rowspan="5" bgcolor="#F3F3F3">&nbsp;
					<table class="STYLE3"
						style="table-layout: fixed; margin-top: -50px;" border="0"
						width=100%>
						<%
							while (rs4.next()) {
						%>
						<tr>
							<td align="left" width="70%"
								style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"><img
								style="margin-left: -5px;" src="images/bluedian.png"
								width="10px" height="10px;">&nbsp; 
								<a href="ShowCase.jsp?caseid=<%=rs4.getInt(1)%>&techid=<%=rs4.getInt(2)%>"><%=rs4.getString(3)%>
							</a></td>
							<td align="right"><%=rs4.getString(14)%></td>
							<%
								}
							%>						
					</table>
				</td>
				<!--    案例展示结束 -->

				<td rowspan="5"><img src="images/index_23.jpg" width="12"
					height="243" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="48" alt=""></td>
			</tr>

			<tr>
				<td colspan="7"><img src="images/index_24.jpg" width="291"
					height="13" alt=""></td>
				<td colspan="12"><img src="images/index_25.jpg" width="429"
					height="13" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="13" alt=""></td>
			</tr>
			<tr>
				<td colspan="16"><img src="images/index_26.jpg" width="674"
					height="41" alt=""></td>

				<td colspan="4"><a href="<%=path%>/qt/qtcx.jsp" onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image119','','images/index00_27.jpg',1)"><img
						src="images/index_27.jpg" name="Image119" width="61" height="41"
						border="0"></a></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="41" alt=""></td>
			</tr>
			<tr>
				<td colspan="8"><img src="images/index_28.jpg" width="306"
					height="38" alt=""></td>
				<td colspan="3"><a
					href="<%=path%>/qt/qtcx.jsp?Type=1&Scope=0#"
					onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image120','','images/index00_29.jpg',1)"><img
						src="images/index_29.jpg" name="Image120" width="65" height="38"
						border="0"></a></td>
				<td colspan="5"><img src="images/index_30.jpg" width="303"
					height="38" alt=""></td>
				<td colspan="5"><a
					href="<%=path%>/qt/qtcx.jsp?Type=1&Scope=1"
					onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image121','','images/index00_31.jpg',1)"><img
						src="images/index_31.jpg" name="Image121" width="62" height="38"
						border="0"></a></td>
				<td colspan="2" rowspan="2"><img src="images/index_32.jpg"
					width="25" height="141" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="38" alt=""></td>
			</tr>
			<tr>
				<td colspan="2" rowspan="4"><img src="images/index_33.jpg"
					width="13" height="208" alt=""></td>
				<td colspan="8" rowspan="3" background="images/index_34.jpg">&nbsp;
					<table class="STYLE3"
						style="table-layout: fixed; margin-top: -45px;" border="0"
						width=100%>
						<%
							while (rs2.next()) {
						%>
						<tr>
							<td align="left" width="70%"
								style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"><img
								style="margin-left: -5px;" src="images/bluedian.png"
								width="10px" height="10px;">&nbsp; <a
								href="ShowDetail.jsp?InfoId=<%=rs2.getInt(1)%>"><%=rs2.getString(2)%></a></td>
							<td align="right"><%=rs2.getString(7)%></td>

							<%
								}
							%>
						
					</table>
				</td>
				<td colspan="2" rowspan="3"><img src="images/index_35.jpg"
					width="21" height="186" alt=""></td>
				<td colspan="6" rowspan="3" background="images/index_34.jpg">&nbsp;
					<table class="STYLE3"
						style="table-layout: fixed; margin-top: -45px;" border="0"
						width=100%>
						<%
							while (rs3.next()) {
						%>
						<tr>
							<td align="left" width="70%"
								style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"><img
								style="margin-left: -5px;" src="images/bluedian.png"
								width="10px" height="10px;">&nbsp; <a
								href="ShowDetail.jsp?InfoId=<%=rs3.getInt(1)%>"><%=rs3.getString(2)%></a></td>
							<td align="right"><%=rs3.getString(7)%></td>

							<%
								}
							%>
						
					</table>
				</td>
				<td colspan="3" rowspan="3"><img src="images/index_37.jpg"
					width="13" height="185" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="103" alt=""></td>
			</tr>
			<tr>
				<td colspan="6"><img src="images/index_38.jpg" width="206"
					height="45" alt=""></td>
				<td colspan="3"><a href="#" onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image122','','images/index00_39.jpg',1)"><img
						src="images/index_39.jpg" name="Image122" width="67" height="45"
						border="0"></a></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="45" alt=""></td>
			</tr>
			<tr>
				<td colspan="9"><a href="http://www.most.gov.cn/"
					onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image123','','images/index00_40.jpg',1)"><img
						src="images/index_40.jpg" name="Image123" width="273" height="37"
						border="0"></a></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="37" alt=""></td>
			</tr>
			<tr>
				<td colspan="19"><img src="images/index_41.jpg" width="719"
					height="22" alt=""></td>
				<td colspan="9" rowspan="2"><a
					href="http://www.nstrs.cn/ZhuanTi/daqiwuran/default.aspx"
					onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image124','','images/index00_42.jpg',1)"><img
						src="images/index_42.jpg" name="Image124" width="273" height="41"
						border="0"></a></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="22" alt=""></td>
			</tr>
			<tr>
				<td colspan="21" rowspan="3">
					<a href=<%=TopicLink%>>
						<img src="../getTopicPath" width="732" height="111" alt="专题图片">
					</a>
				</td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="19" alt=""></td>
			</tr>
			<tr>
				<td colspan="9"><a href="http://www.hebstd.gov.cn/"
					onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image125','','images/index00_44.jpg',1)"><img
						src="images/index_44.jpg" name="Image125" width="273" height="39"
						border="0"></a></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="39" alt=""></td>
			</tr>
			<tr>
				<td colspan="9"><a
					href="http://www.heinfo.gov.cn/Home/Index.asp"
					onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image126','','images/index00_45.jpg',1)"><img
						src="images/index_45.jpg" name="Image126" width="273" height="53"
						border="0"></a></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="53" alt=""></td>
			</tr>
			<tr>
				<td colspan="4"><img src="images/index_46.jpg" width="205"
					height="53" alt=""></td>
				<td colspan="2"><a href="<%=path%>/qt/qtcx2.jsp?look=3" onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image127','','images/index00_47.jpg',1)"><img
						src="images/index_47.jpg" name="Image127" width="64" height="53"
						border="0"></a></td>
				<td colspan="7"><img src="images/index_48.jpg" width="186"
					height="53" alt=""></td>
				<td colspan="2"><a href="<%=path%>/qt/qtcx2.jsp?look=4" onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image128','','images/index00_49.jpg',1)"><img
						src="images/index_49.jpg" name="Image128" width="67" height="53"
						border="0"></a></td>
				<td colspan="2"><img src="images/index_50.jpg" width="187"
					height="53" alt=""></td>
				<td colspan="7"><a href="<%=path%>/qt/qtcx2.jsp?look=2" onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image129','','images/index00_51.jpg',1)"><img
						src="images/index_51.jpg" name="Image129" width="64" height="53"
						border="0"></a></td>
				<td colspan="4"><img src="images/index_52.jpg" width="182"
					height="53" alt=""></td>
				<td colspan="2"><a href="<%=path%>/qt/qtcx2.jsp?look=1" onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image130','','images/index00_53.jpg',1)"><img
						src="images/index_53.jpg" name="Image130" width="54" height="53"
						border="0"></a></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="53" alt=""></td>
			</tr>
			<!-- 添加用户名登录后找合作、找技术、找专家、找机构的不同显示 -->
			<%
				if (wbuser != null) {
			%>
				<tr>
					<td colspan="2"><img src="images/index_54.jpg" width="13"
						height="179" alt=""></td>
					<td colspan="3" background="images/index_61.jpg">
						<table class="STYLE3" style="table-layout: fixed; margin-top: 0px;"
							border="0" width=100%>
							<%
								while (rs5.next()) {
								String cooperation = rs5.getString(10);
								String strcooperation = "未注明";
								if(cooperation.equals("01000000"))
								{
									strcooperation = "技术引进";
								}
								if(cooperation.equals("00010000"))
								{
									strcooperation = "委托研发";
								}
								if(cooperation.equals("00000100"))
								{
									strcooperation = "合作研发";
								}
								if(cooperation.equals("00000001"))
								{
									cooperation = rs5.getString(11);
									strcooperation = cooperation;
								}
							%>
							<tr>
								<td align="left" width="70%"
									style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"><img
									style="margin-left: -5px;" src="images/bluedian.png"
									width="10px" height="10px;">&nbsp;<a id="href1" href="ShowRequireDetailqt.jsp?requid=<%=rs5.getInt(1)%>"> <%=rs5.getString(3)%></a></td>
								<td align="right"><a id="href1" href="ShowRequireDetailqt.jsp?requid=<%=rs5.getInt(1)%>"><%=strcooperation%></a></td>
                            <%
									}
							%>
							
						</table>
					</td>
					<td rowspan="2"><img src="images/index_56.jpg" width="23"
						height="223" alt=""></td>
					<td colspan="8" background="images/index_61.jpg">
						<table class="STYLE3" style="table-layout: fixed; margin-top: 0px;"
							border="0" width=100%>
							<%
								String techName="";
								while (rs6.next()) {
								
									techName=rs6.getString(3);
							%>
							<tr>
								<td align="left" width="70%"
									style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"><img
									style="margin-left: -5px;" src="images/bluedian.png"
									width="10px" height="10px;">&nbsp; <a id="href1" href="ShowTechTestqt.jsp?TechId=<%=rs6.getString(1)%>&OrgaId=<%=rs6.getString(2)%>"> <%=techName%></a></td>

								<%
									}
								%>
							
						</table>
					</td>
					<td rowspan="2"><img src="images/index_58.jpg" width="25"
						height="223" alt=""></td>
					<td colspan="7" background="images/index_61.jpg">
						<table class="STYLE3" style="table-layout: fixed; margin-top: 0px;"
							border="0" width=100%>
							<%
								while (rs7.next()) {
							%>
							<tr>
								<td align="left" width="70%"
									style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"><img
									style="margin-left: -5px;" src="images/bluedian.png"
									width="10px" height="10px;">&nbsp; <a id="href1" href="showExpertqt.jsp?expertid=<%=rs7.getInt(1)%>"><%=rs7.getString(8)%></a></td>
								<td align="right"><a id="href1" href="showExpertqt.jsp?expertid=<%=rs7.getInt(1)%>"> <%=rs7.getString(2)%></a></td>

								<%
									}
								%>
							
						</table>
					</td>
					<td colspan="2" rowspan="2"><img src="images/index_60.jpg"
						width="28" height="223" alt=""></td>
					<td colspan="5" background="images/index_61.jpg">
						<table class="STYLE3" style="table-layout: fixed; margin-top: 0px;"
							border="0" width=100%>
							<%
								while (rs8.next()) {
							%>
							<tr>
								<td align="left" width="70%"
									style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"><img
									style="margin-left: -5px;" src="images/bluedian.png"
									width="10px" height="10px;">&nbsp;<a id="href1" href="showOrgaqt.jsp?OrgaId=<%=rs8.getString(1)%>"><%=rs8.getString(2)%></a></td>
								<%
									}
								%>
							
						</table>
					</td>
					<td><img src="images/index_62.jpg" width="12" height="179"
						alt=""></td>
					<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
						height="179" alt=""></td>
				</tr>
			<%  }
				else{
			%>
					<tr>
					<td colspan="2"><img src="images/index_54.jpg" width="13"
						height="179" alt=""></td>
					<td colspan="3" background="images/index_61.jpg">
						<table class="STYLE3" style="table-layout: fixed; margin-top: 0px;"
							border="0" width=100%>
							<%
								while (rs5.next()) {
								String cooperation = rs5.getString(10);
								String strcooperation = "未注明";
								if(cooperation.equals("01000000"))
								{
									strcooperation = "技术引进";
								}
								if(cooperation.equals("00010000"))
								{
									strcooperation = "委托研发";
								}
								if(cooperation.equals("00000100"))
								{
									strcooperation = "合作研发";
								}
								if(cooperation.equals("00000001"))
								{
									cooperation = rs5.getString(11);
									strcooperation = cooperation;
								}
							%>
							<tr>
								<td align="left" width="70%"
									style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"><img
									style="margin-left: -5px;" src="images/bluedian.png"
									width="10px" height="10px;">&nbsp;<a id="zz" onClick="return confirm('您还未登录，请登录后查看');"> <%=rs5.getString(3)%></a></td>
								<td align="right"><a id="zz" onClick="return confirm('您还未登录，请登录后查看');"><%=strcooperation%></a></td>
                      
								<%
									}
								%>
							
						</table>
					</td>
					<td rowspan="2"><img src="images/index_56.jpg" width="23"
						height="223" alt=""></td>
					<td colspan="8" background="images/index_61.jpg">
						<table class="STYLE3" style="table-layout: fixed; margin-top: 0px;"
							border="0" width=100%>
							<%
								String techName = "";
								while (rs6.next()) {
								
									techName=rs6.getString(3);
							%>
							<tr>
								<td align="left" width="70%"
									style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"><img
									style="margin-left: -5px;" src="images/bluedian.png"
									width="10px" height="10px;">&nbsp; <a id="zz" onClick="return confirm('您还未登录，请登录后查看');"> <%=techName%></a></td>

								<%
									}
								%>
							
						</table>
					</td>
					<td rowspan="2"><img src="images/index_58.jpg" width="25"
						height="223" alt=""></td>
					<td colspan="7" background="images/index_61.jpg">
						<table class="STYLE3" style="table-layout: fixed; margin-top: 0px;"
							border="0" width=100%>
							<%
								while (rs7.next()) {
							%>
							<tr>
								<td align="left" width="70%"
									style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"><img
									style="margin-left: -5px;" src="images/bluedian.png"
									width="10px" height="10px;">&nbsp; <a id="zz" onClick="return confirm('您还未登录，请登录后查看');"> <%=rs7.getString(8)%></a></td>
								<td align="right"><a id="zz" onClick="return confirm('您还未登录，请登录后查看');"> <%=rs7.getString(2)%></a></td>

								<%
									}
								%>
							
						</table>
					</td>
					<td colspan="2" rowspan="2"><img src="images/index_60.jpg"
						width="28" height="223" alt=""></td>
					<td colspan="5" background="images/index_61.jpg">
						<table class="STYLE3" style="table-layout: fixed; margin-top: 0px;"
							border="0" width=100%>
							<%
								while (rs8.next()) {
							%>
							<tr>
								<td align="left" width="70%"
									style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"><img
									style="margin-left: -5px;" src="images/bluedian.png"
									width="10px" height="10px;">&nbsp;<a id="zz" onClick="return confirm('您还未登录，请登录后查看');"> <%=rs8.getString(2)%></a></td>
								<%
									}
								%>
							
						</table>
					</td>
					<td><img src="images/index_62.jpg" width="12" height="179"
						alt=""></td>
					<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
						height="179" alt=""></td>
				</tr>
				<% 
				}
				%>
			
			<tr>
				<td colspan="5"><img src="images/index_63.jpg" width="246"
					height="44" alt=""></td>
				<td colspan="8"><img src="images/index_64.jpg" width="228"
					height="44" alt=""></td>
				<td colspan="7"><img src="images/index_65.jpg" width="223"
					height="44" alt=""></td>
				<td colspan="6" rowspan="3"><img src="images/index_66.jpg"
					width="236" height="179" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="44" alt=""></td>
			</tr>
			<tr>
				<td colspan="3" rowspan="2"><img src="images/index_67.jpg"
					width="59" height="135" alt=""></td>
				<td colspan="16">
					<div id="demo">
						<div id="indemo">
							<div id="demo1">
								<a href="<%=path%>/qt/qtdxal.jsp#"><img src="image/wall_s1.jpg" border="0" /></a> <a
									href="<%=path%>/qt/qtdxal.jsp#"><img src="image/wall_s2.jpg" border="0" /></a> <a
									href="<%=path%>/qt/qtdxal.jsp#"><img src="image/wall_s3.jpg" border="0" /></a> <a
									href="<%=path%>/qt/qtdxal.jsp#"><img src="image/wall_s4.jpg" border="0" /></a> <a
									href="<%=path%>/qt/qtdxal.jsp#"><img src="image/wall_s5.jpg" border="0" /></a> <a
									href="<%=path%>/qt/qtdxal.jsp#"><img src="image/wall_s6.jpg" border="0" /></a>
							</div>
							<div id="demo2"></div>
						</div>
					</div>
				</td>
				<td colspan="5" rowspan="2"><img src="images/index_69.jpg"
					width="45" height="135" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="113" alt=""></td>
			</tr>
			<tr>
				<td colspan="16"><img src="images/index_70.jpg" width="665"
					height="22" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="22" alt=""></td>
			</tr>
			 
			<tr>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="11"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="2"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="46"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="142"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="41"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="23"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="31"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="6"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="16"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="38"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="11"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="10"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="74"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="42"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="25"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="152"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="35"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="14"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="5"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="7"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="9"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="16"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="12"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="54"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="49"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="66"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="13"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="42"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="12"
					height="1" alt=""></td>
				<td></td>
			</tr>
		 <tr><td colspan="35" height="35" background="">&nbsp;</td> </tr> 	
      <tr style="margin-top:-200px;">
				<td height="16" colspan="120">
				<div align="center">
						<font color=#000099 size="4"><strong>友情链接</strong></font> <select
							onChange="window.open(this.options[this.selectedIndex].value)">
							<option selected>--政府网站--</option>
							<option value="http://www.hebei.gov.cn/">中国 .河北</option>
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

					</div>
				</td>
			</tr>
			<tr style="color: #FFFFFF">
				<td height="29" colspan="120" background="images/index_0900.jpg"
					class="STYLE1"><div align="center">
						<a style="color: #FFFFFF" href="lxwm.jsp">联系我们&nbsp;&nbsp;|
						</a><a style="color: #FFFFFF" href="">&nbsp;&nbsp;设为首页&nbsp;&nbsp;|
						</a><a style="color: #FFFFFF" href="">&nbsp;&nbsp;加入收藏|&nbsp;&nbsp;</a>
						<a href="mzsm.jsp" style="color: #ffffff">&nbsp;&nbsp;免责声明</a>
					</div></td>
			</tr>
			<tr>
				<td colspan="120" rowspan="2" background="images/index_651.jpg"><div
						align="center" class="STYLE3">
						<font style="color: #FFFFFF">版权所有 @ 河北省科学技术情报研究院科技政策服务平台 <br></font> 
						<font style="color: #FFFFFF">地址: 河北省石家庄市青园街233号 邮编：050021<br><br></font>
					</div></td>
 					
			</tr>
  			 
		</table>
		<!-- End Save for Web Slices -->
	</div>
</body>
<script>
	var speed = 20;
	var tab = document.getElementById("demo");
	var tab1 = document.getElementById("demo1");
	var tab2 = document.getElementById("demo2");
	tab2.innerHTML = tab1.innerHTML;
	function Marquee() {
		if (tab2.offsetWidth - tab.scrollLeft <= 0)
			tab.scrollLeft -= tab1.offsetWidth
		else {
			tab.scrollLeft++;
		}
	}
	var MyMar = setInterval(Marquee, speed);
	tab.onmouseover = function() {
		clearInterval(MyMar)
	};
	tab.onmouseout = function() {
		MyMar = setInterval(Marquee, speed)
	};

</script>
</html>
