<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.ResultSet"
	import="com.dqwr.dao.*" import="java.sql.Connection" import="java.sql.PreparedStatement"
	pageEncoding="UTF-8"%>
<%
DataBaseDao db = new DataBaseDao();
Connection conn = db.connection();
String sql = "select * from PublicPic order by id desc";
PreparedStatement stmt = conn.prepareStatement(sql);
ResultSet rs = null;
rs = stmt.executeQuery();

request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

int pageno =0;
int pagesize =0;
String size=request.getParameter("pagesize");
if(size!=null){
	pagesize = Integer.parseInt(size);
}
if(pagesize<=0){
	pagesize = 10;
}
String no=request.getParameter("pageno");
if(no!=null){
	pageno = Integer.parseInt(no);
}

if(pageno<=0){
	pageno = 1;
}
int pageCount = 2;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全文检索</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mystyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jPages.css">
<style type="text/css">
.holder {
    margin: 15px 0;
  }
  .holder a {
    font-size: 12px;
    cursor: pointer;
    margin: 0 5px;
    color: #333;
  }
  .holder a:hover {
    background-color: #222;
    color: #fff;
  }
  .holder a.jp-previous { margin-right: 15px; }
  .holder a.jp-next { margin-left: 15px; }
  .holder a.jp-current, a.jp-current:hover {
    color: #FF4242;
    font-weight: bold;
  }
  .holder a.jp-disabled, a.jp-disabled:hover {
    color: #bbb;
  }
  .holder a.jp-current, a.jp-current:hover,
  .holder a.jp-disabled, a.jp-disabled:hover {
    cursor: default;
    background: none;
  }
  .holder span { margin: 0 5px; }
  li{padding:20px;}
  .btn {
	background-color: #D2340F;
	color: white;
	text-decoration: none;
	font-family: Arial;
	font-weight: 900;
	font-size: 15px;
	padding: 5px 6px;
	border-radius: 3px;
}

.btn-buynow {
	background-color: #D2340F;
}

.btn-buynow:hover {
	background-color: #EF411A;
}

.btn-buyre {
	background-color: #00340F;
}

.btn-buyre:hover {
	background-color: #00411A;
}

.btn-signup {
	background-color: #006DCC;
}

.btn-signup:hover {
	background-color: rgb(0, 74, 204);
}

.btn-login {
	background-color: rgb(113, 181, 27);
}

.btn-login:hover {
	background-color: rgb(147, 199, 25);
}
li img{width:150px;height:170px;}
li a{text-decoration:none;}
li a:visited{text-decoration:none;}
li a:hover{text-decoration:none;}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jPages.js"></script>
<script>
$(function() {
	$("div.holder").jPages({
		containerID: "itemContainer",
		perPage : 5
	});
});
function check(){
	var img=$("#img_file").val();
	if(img==""||img==null)
	{
		alert("请先选择上传图片");
	    return false;
	}
	else{
	    return true;
	}
}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA" style="text-align:center">
	<div align="center" id="msgDiv" class="msg-div" style="display: none;">发布图片</div>
	<div>
		<form method="post" onsubmit="return check()" action="/dqwr/PublicPic" enctype="multipart/form-data">
			<center>
				<br> <br> <label><h2>请选择需要前台发布的图片</h2>
				</label><br> <input type="file" name="file" id="img_file"> 
				<input type="submit" value="导入">
			</center>
		</form>
	</div>
	<div id="container" class="clearfix" style="width:100%;">
       <div id="content" class="defaults" style="width:100%;">
      	
    <ul id="itemContainer">
    	<%
			//崔娜电脑部署为89，自己电脑部署为80 截取的字符串到\dqwr的斜杠之前
			int i = 0,cursor=0;
			int id;
			while (rs.next())
			{
				i++;
				cursor++;
				String smallpath = rs.getString(3);
				int index = smallpath.lastIndexOf("\\");
				smallpath = smallpath.substring(index + 1);
				id = rs.getInt(1);
		%>
		<li>
			<a href="../qt/BigImage.jsp?id=<%=id%>"> 
						<img src="../getSmallPath?text=<%=smallpath%> " alt="image" width="285" height="261" />
					</a>
					<br>
					<a id="<%=id%>" href="javascript:void(0)" onclick="deleteImg(this.id);">删除</a>
				<% 
					if(cursor<=7)
					{
				%>
						<label style="color:red;">前台已展示</label>
				<%
					}
				%>
		</li>
		<%
			}
		 %>
    </ul>
    <div class="holder"></div>
    </div>
    </div>
	<%-- <div>
		<table style="margin:auto;text-align:center">
			<tr>
				<%
				//崔娜电脑部署为89，自己电脑部署为80 截取的字符串到\dqwr的斜杠之前
				int i = 0,cursor=0;
				int id;
				while (rs.next())
				{
					i++;
					cursor++;
					String smallpath = rs.getString(3);
					int index = smallpath.lastIndexOf("\\");
					smallpath = smallpath.substring(index + 1);
					id = rs.getInt(1);
				%>
				<td>
					<a href="../qt/BigImage.jsp?id=<%=id%>"> 
						<img src="../getSmallPath?text=<%=smallpath%> " width="285" height="261" />
					</a>
					<br>
					<a id="<%=id%>" href="javascript:void(0)" onclick="deleteImg(this.id);">删除</a>
				<% 
					if(cursor<=7)
					{
				%>
						<label style="color:red;">前台已展示</label>
					
				</td>
				<%
					}
					if(i/5==1){
						i=0;
				%>
				</tr>
				<%
					}
				}
				%>
		</table>
		<div style="background: #C0E4FA;position: relative;" >
			<div style="background: #C0E4FA;position:absolute;" align="left"> 共有 <%=cursor %> 条最新记录，当前页第<%=pageno %>/<%=pageCount %>页 &nbsp;&nbsp;
	
			<a href="public_info.jsp?ispass=1&pageno=<%if((pageno+1)<1) out.print(1);else out.print(pageno-1); %>">上一页</a>&nbsp;&nbsp;
			<a href="public_info.jsp?ispass=1&pageno=<%if((pageno+1)>pageCount) out.print(pageCount);else out.print(pageno+1); %>">下一页</a></div>
			<form name="form1" method="post" action="public_info.jsp?ispass=1">
				<div align="right">
				   <a href="public_info.jsp?ispass=1&pageno=1">首页</a>&nbsp;&nbsp;
				   <a href="public_info.jsp?ispass=1&pageno=<%=pageCount %>">尾页</a>  跳转到
				   <input type="text" size="1"  style="width: 20px;height: 15px;" name="pageno" id="jumpPageNo"></input>页&nbsp;&nbsp;<a href="#" onclick="form1submit()">跳转</a>
				</div>
			</form>
		</div>
	</div> --%>
</body>
<script type="text/javascript">
function deleteImg(e)
{
	if(confirm("确定要删除该图片吗？"))
	{
		window.location.href="../deleteImage?id="+e;
		return true;
	}
	return false;
}
</script>
<%
rs.close();
stmt.close();
db.closeConnection(conn);
%>
</html>