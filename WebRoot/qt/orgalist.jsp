 <%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.satp.entity.*, java.util.ArrayList"
	import="com.dqwr.entity.*,com.dqwr.model.*"
	import="com.dqwr.requirement.dao.impl.*" import="java.sql.ResultSet"
	import="com.dqwr.dao.*" import="java.sql.Connection"
	import="java.text.SimpleDateFormat"
	import="com.dqwr.requirement.dao.impl.*"
	import="com.dqwr.requirement.entity.*" pageEncoding="UTF-8"%>
	<% 
	 String path=request.getContextPath();
	%>
<html>
<head>

<title>河北省大气污染防治技术成果支撑管理与应用服务系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery.js"></script>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script language="JavaScript" src="js/jquery-1.9.1.min.js">
	
</script>

<script type="text/javascript">
	function check() {
		var num = document.getElementById("num");
		if (num.value == "1") {
			if (document.getElementById('q0').value == "") {
				alert("首项查询条件不能为空");
				thisform.q0.focus();
				return false;
			}
		}
		if (num.value == "2") {
			if (document.getElementById('q0').value == "") {
				alert("首项查询条件不能为空");
				thisform.q0.focus();
				return false;
			} else {
				if (document.getElementById('q1').value == "") {
					alert("第二项查询条件不能为空");
					thisform.q1.focus();
					return false;
				}
			}
		}
		if (num.value == "3") {
			if (document.getElementById('q0').value == "") {
				alert("首项查询条件不能为空");
				thisform.q0.focus();
				return false;
			}
			if (document.getElementById('q1').value == "") {
				alert("第二项查询条件不能为空");
				thisform.q1.focus();
				return false;
			}
			if (document.getElementById('q2').value == "") {
				alert("第三项查询条件不能为空");
				thisform.q2.focus();
				return false;
			}
		}
		if (num.value == "4") {
			if (document.getElementById('q0').value == "") {
				alert("首项查询条件不能为空");
				thisform.q0.focus();
				return false;
			}
			if (document.getElementById('q1').value == "") {
				alert("第二项查询条件不能为空");
				thisform.q1.focus();
				return false;
			}
			if (document.getElementById('q2').value == "") {
				alert("第三项查询条件不能为空");
				thisform.q2.focus();
				return false;
			}
			if (document.getElementById('q3').value == "") {
				alert("第四项查询条件不能为空");
				thisform.q3.focus();
				return false;
			}
		}
		if (num.value == "5") {
			if (document.getElementById('q0').value == "") {
				alert("首项查询条件不能为空");
				thisform.q0.focus();
				return false;
			}
			if (document.getElementById('q1').value == "") {
				alert("第二项查询条件不能为空");
				thisform.q1.focus();
				return false;
			}
			if (document.getElementById('q2').value == "") {
				alert("第三项查询条件不能为空");
				thisform.q2.focus();
				return false;
			}
			if (document.getElementById('q3').value == "") {
				alert("第四项查询条件不能为空");
				thisform.q3.focus();
				return false;
			}
			if (document.getElementById('q4').value == "") {
				alert("第五项查询条件不能为空");
				thisform.q4.focus();
				return false;
			}
		}
	}

	function addRow() {
		var obj = document.getElementById("num");
		var t = document.getElementById("sTable");
		if (t.rows.length >= 4) {
			alert('最多只能有3个条件');
			return;
		}
		var strId = t.rows.length;

		var e = document.createElement("select");
		e.name = "logic" + strId;
		e.id = "logic" + strId;
		e.size = 1;
		e.options[0] = new Option("并且", "AND");
		e.options[1] = new Option("或者", "OR");
		e.options[2] = new Option("不含", "NOT");

		var e2 = document.createElement("select");
		e2.name = "sType" + strId;
		e2.id = "sType" + strId;
		e2.size = 1;
		e2.options[0] = new Option("需求名称", "RequName");
		e2.options[1] = new Option("技术领域", "FieldId");
		e2.options[2] = new Option("关键词", "Keyword");
		e2.options[3] = new Option("发布时间", "FillTime");

		var q1 = document.createElement("input");
		q1.type = "text";
		q1.size = 50;
		q1.maxlength = 60;
		q1.name = "q" + strId;
		q1.id = "q" + strId;

		var row = t.insertRow(t.rows.length);
		var c0 = row.insertCell(0);
		c0.appendChild(e);

		var c1 = row.insertCell(1);
		c1.appendChild(e2);
		c1.appendChild(q1);
		obj.value = parseInt(obj.value) + 1;
	}

	function removeRow() {
		var obj = document.getElementById("num");
		tr = document.getElementById("sTable").rows;
		if (tr.length > 1) {
			var row = tr[tr.length - 1];
			if (row.parentNode)
				row.parentNode.removeChild(row);
			obj.value = parseInt(obj.value) - 1;
		}
	}
</script>
<script type="text/javascript">
	function form1submit() {

		document.form1.submit();
	}
</script>
<script language="JavaScript" src="js/qtcx.js"></script>
<script language="javascript">
	//设置cookie
	function addCookie(name, expiresHours) {
		//重复的不再写入
		var value = $(".pno").val();
		var is = true;
		var strCookie = document.cookie;
		var arrCookie = strCookie.split(";");
		for (var i = 0; i < arrCookie.length; i++) {
			var arr = arrCookie[i].split("=");
			if (arr[1] == value) {
				alert(value);
				is = false;
				return;
			}
		}
		if (is == false)
			return;
		var cookieString = name + "=" + value;
		//判断是否设置过期时间 
		if (expiresHours > 0) {
			var date = new Date();
			date.setTime(date.getTime + expiresHours * 3600 * 1000);
			cookieString = cookieString + "; expires=" + date.toGMTString();
		}
		document.cookie = cookieString;

	}

	function resultReach(id) {
		var result = document.getElementById("result");
		var Find = document.getElementById("ermao").value;
		var containSpecial = RegExp(/[(\ )(\~)(\!)(\#)(\$)(\%)(\^)(\&)(\*)(\()(\))(\-)(\_)(\+)(\=)(\[)(\])(\{)(\})(\|)(\\)(\;)(\:)(\')(\")(\,)(\.)(\/)(\<)(\>)(\?)(\)]+/);
		var a = containSpecial.test(Find);
		if (a == true) {
			alert("输入存在特殊字符，请检查");
		} else {
			if (id == 2)

			{
				result.value = "2";
			} else if (id == 1) {
				result.value = "1";
			}
			form1.submit();
		}
	}

	$(function() {
		$(".href1").click(function() {
			var href_val = $(this).attr("href");
			$(".show").html(href_val);
		});
	});
</script>
<script language="JavaScript" src="js/time.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String keyword = (String) request.getAttribute("keyword");
	int pageno = 0;
	int pagesize = 0;
	int pageCount = 1;
	String size = (String) request.getAttribute("pagesize");
	if (size != null) {
		pagesize = Integer.parseInt(size);
	}

	if (pagesize <= 0) {
		pagesize = 15;
	}

	if (request.getAttribute("pageno") != null) {
		pageno = (Integer) request.getAttribute("pageno");
		if (pageno <= 0) {
	pageno = 1;
		}
	}
	if (request.getAttribute("pageCount") != null) {
		pageCount = (Integer) request.getAttribute("pageCount");
		if (pageno > pageCount) {
	pageno = 1;
		}
	}
%>
<style type="text/css">
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

					 <!-- 嵌入刷新区域 标记id-->
					<div id="refresh">
						<!-- 内容 -->
						<form name="thisform" action="qttjfx.jsp" method="get"
							onsubmit="return check();">
							<div class="search"
								style="border-style: groove; border-width: 0px; width: 90%; margin-left: 5%;">
								<table width="95%" border="0" cellpadding="3" cellspacing="1"
									bgcolor="#FFFFFF">
									<caption style="color: red;">请输入查询条件:</caption>
									<tbody>
										<input type="hidden" id="num" name="num" value="1" />
										<tr>
											<td colspan="2" align="left" bgcolor="#FFFFFF"
												style="padding-left: 20px;">
												<table bgcolor="#FFFFFF" cellspacing="1" cellpadding="0"
													id="sTable">
													<tbody>
														<tr id="row1">
															<td style="width: 60px;" align="center"><img
																src="images/11.gif" title="增加限制条件" onclick="addRow()"
																style="cursor: hand;"> <img src="images/22.gif"
																title="移除限制条件" onclick="removeRow()"
																style="cursor: hand;"></td>
															<td><select name="sType0" size="1">
																	<option value="RequName">需求名称</option>
																	<option value="FieldId">技术领域</option>
																	<option value="Keyword">关键词</option>
																	<option value="FillTime">发布时间</option>
															</select> <input type="text" size="50" maxlength="80" name="q0"
																id="q0"></td>
															<td><input type="submit" class="submit"
																value="&nbsp;查&nbsp;询&nbsp;" size="30"></td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</div>							
						</form>						
						<div style="height: 500px; width: 855px; margin-left: 10px"
							id="show">
							<!-- 删除开始-->
							<%
								DataBaseDao database = new DataBaseDao();
								String sType0 = null, q0 = null;
								String logic1 = null, sType1 = null, q1 = null;
								String logic2 = null, sType2 = null, q2 = null;
								String logic3 = null, sType3 = null, q3 = null;
								String logic4 = null, sType4 = null, q4 = null;
								request.setCharacterEncoding("utf-8");
								response.setCharacterEncoding("utf-8");
								String num = request.getParameter("num");
								System.out.println("num--" + num);
							%>
			<%
				int pageno1 = 0;
															int pagesize1 = 0;
				int requid = 0;
				String size1 = request.getParameter("pagesize");
				if (size1 != null) {
					pagesize1 = Integer.parseInt(size1);
				}
				if (pagesize1 <= 0) {
					pagesize1 = 15;
				}
				String no = request.getParameter("pageno");
				if (no != null) {
					pageno1 = Integer.parseInt(no);
				}

				if (pageno1 <= 0) {
					pageno1 = 1;
				}
				Connection con = database.connection();

				ArrayList<Orga> orgalist;
				int pageCount1;

				if (num == null) {
					System.out.println("你进入无num操作");
					orgalist = Orgamodel.OrgaList1(con, pageno1, pagesize1);
					pageCount1 = Orgamodel.OrgaPagecount1(con, pageno1, pagesize1);
					if (pageno1 > pageCount1) {
						pageno1 = 1;
						orgalist = Orgamodel.OrgaList1(con, pageno1, pagesize1);
						pageCount1 = Orgamodel.OrgaPagecount1(con, pageno1,
								pagesize1);
					}

				} else {
					System.out.println("你进入有num操作");

					sType0 = request.getParameter("sType0");
					if (request.getParameter("q0") != null) {
						q0 = new String(request.getParameter("q0").getBytes(
								"iso8859-1"), "UTF-8");
					}

					logic1 = request.getParameter("logic1");
					sType1 = request.getParameter("sType1");
					if (request.getParameter("q1") != null) {
						q1 = new String(request.getParameter("q1").getBytes(
								"iso8859-1"), "UTF-8");
					}

					logic2 = request.getParameter("logic2");
					sType2 = request.getParameter("sType2");
					if (request.getParameter("q2") != null) {
						q2 = new String(request.getParameter("q2").getBytes(
								"iso8859-1"), "UTF-8");
					}

					logic3 = request.getParameter("logic3");
					sType3 = request.getParameter("sType3");
					if (request.getParameter("q3") != null) {
						q3 = new String(request.getParameter("q3").getBytes(
								"iso8859-1"), "UTF-8");
					}

					orgalist = Orgamodel.OrgaList2(con, pageno1, pagesize1, num,
							sType0, q0, logic1, sType1, q1, logic2, sType2, q2);
					pageCount1 = Orgamodel
							.OrgaPagecount2(con, pageno1, pagesize1, num,
									sType0, q0, logic1, sType1, q1, logic2, sType2,
									q2);
					if (pageno1 > pageCount1) {
						pageno1 = 1;
						orgalist = Orgamodel.OrgaList2(con, pageno1, pagesize1,
								num, sType0, q0, logic1, sType1, q1, logic2,
								sType2, q2);
						pageCount1 = Orgamodel.OrgaPagecount2(con, pageno1,
								pagesize1, num, sType0, q0, logic1, sType1, q1,
								logic2, sType2, q2);
					}
				}
				con.close();
			%>
			<table width='100%'>
								<tr align="center" bgcolor="#c0e4fa">
									<th width='40px'>序号</th>
									<th width='200px'>组织编号</th>
									<th>组织名称</th>
									<th>联系电话</th>
								</tr>
								<%
									int i = 0;
									for (Orga orga : orgalist) {
										i = i + 1;
										String bg = null;
										if (i % 2 == 1) {
											bg = "#ffffff";
								%>

								<tr align="left" bgcolor="<%=bg%>">
									<td align="center"><%=i%></td>
									<td align="center"><%=orga.getOrgaId()%></td>
									<td align="center"><%=orga.getOrgaName()%></td>
									<td align="center"><%=orga.getCel()%></td>
								</tr>
								<%
									} else {
																	bg = "#F0F0F0";
								%>

								<tr align="left" bgcolor="<%=bg%>">

									<td align="center"><%=i%></td>
									<td align="center"><%=orga.getOrgaId()%></td>
									<td align="center"><%=orga.getOrgaName()%></td>
									<td align="center"><%=orga.getCel()%></td>
								</tr>
								<%
									}
								%>
								<%
									}
								%>
							</table>
							<div style="background: #C0E4FA; position: relative;">
								<div style="background: #C0E4FA; position: absolute;"
									align="left">
									共有
									<%=i%>
									条最新记录，当前页第<%=pageno1%>/<%=pageCount%>页 &nbsp;&nbsp; <a
										href="xdsh.jsp?pageno=<%if ((pageno1 + 1) < 1)
				out.print(1);
			else
				out.print(pageno1 - 1);%>">上一页</a>&nbsp;&nbsp;<a
										href="xdsh.jsp?pageno=<%if ((pageno1 + 1) > pageCount)
				out.print(pageCount);
			else
				out.print(pageno1 + 1);%>">下一页</a>
								</div>
								<form name="form1" method="post" action="xdsh.jsp">
									<div align="right">
										<a href="xdsh.jsp?pageno=1">首页</a>&nbsp;&nbsp;<a
											href="xdsh.jsp?pageno=<%=pageCount%>">尾页</a> 跳转到 <input
											type="text" size="1" style="width: 20px; height: 15px;"
											name="pageno"></input>页&nbsp;&nbsp;<a href="#"
											onclick="form1submit()">跳转</a>
									</div>
								</form>
							</div>

							<!-- 删除结束-->
						</div> <br /> <!-- 内容 -->
					</div>		
		</table>
		<!-- End Save for Web Slices -->
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#zx").click(function() {
				alert("注销成功");
				jQuery.post("../qtzx", function(response) {
					location.replace('denglu.jsp');
				});

			});
			$("#zcbtn").click(function() {
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