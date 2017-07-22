<%@page isErrorPage="true" %>
<%@page errorPage="/login.jsp" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/menu.css">
<link rel="stylesheet" href="../css/index.css" type="text/css" />

<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="../js/dtree.js"></script>
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<style type="text/css"> 
</style>
</head>
<body class="panel"  background="#B1D8EA" bgcolor="3">
<div id="body"  >
<!-- OA树开始-->
<div style="background: #3FA0F1;;position: relative;height: 30px;" align="center">
<font color="#ffffff" style="top: 4px;position: relative;">系统菜单</font>

</div>
<ul id="menu">
  
</ul>
<br>
<br><br>
<br><br>

</div>
<font ></font>
<script type="text/javascript">

	for(var i =0 ;trees.menu[i]!=null;i++){
		
		document.getElementById("menu").innerHTML+="<li class='L1'><a href='javascript:c(m"+trees.menu[i].cdid+",\""+trees.menu[i].url+"\");' id='m"+trees.menu[i].cdid+"'><span> &nbsp;&nbsp;&nbsp;&nbsp;"+trees.menu[i].cdnc+"</span></a></li><ul id='m"+trees.menu[i].cdid+"d' style='display:none;' class='U1'></ul>";
		
	for (var j = 0; trees.menu[i].cd21[j] != null; j++) {
			document.getElementById("m" + trees.menu[i].cdid + "d").innerHTML += "<li class='L21'><a href='javascript:c(m"
					+ trees.menu[i].cd21[j].cdid
					+ ");' id='m"
					+ trees.menu[i].cd21[j].cdid
					+ "'><span>&nbsp;&nbsp;&nbsp;&nbsp;"
					+ trees.menu[i].cd21[j].cdnc
					+ "</span></a></li> <ul id='m"+trees.menu[i].cd21[j].cdid+"d' style='display:none;'>";
			for (var z = 0; trees.menu[i].cd21[j].cd3[z] != null; z++) {
				document.getElementById("m" + trees.menu[i].cd21[j].cdid + "d").innerHTML += "<li class='L3'><a href='javascript:a(\""
						+ trees.menu[i].cd21[j].cd3[z].curl
						+ "\",\""
						+ trees.menu[i].cd21[j].cd3[z].cdid
						+ "\");' id='f"
						+ trees.menu[i].cd21[j].cd3[z].cdid
						+ "'><span> &nbsp;&nbsp;&nbsp;&nbsp;"
						+ trees.menu[i].cd21[j].cd3[z].cdnc
						+ "</span></a></li>";
			}

		}
		for (var j = 0; trees.menu[i].cd22[j] != null; j++) {
			document.getElementById("m" + trees.menu[i].cdid + "d").innerHTML += "<li class='L22'><a href='javascript:a(\""
					+ trees.menu[i].cd22[j].curl
					+ "\",\""
					+ trees.menu[i].cd22[j].cdid
					+ "\");' id='f"
					+ trees.menu[i].cd22[j].cdid
					+ "'><span> "
					+ trees.menu[i].cd22[j].cdnc + "</span></a></li>";
		}

	}
</script>
<script language="JavaScript">
var cur_id="";
var flag=0,sflag=0;

//-------- 菜单点击事件 -------
function c(srcelement,URL)
{
  var targetid,srcelement,targetelement;
  var strbuf;
	
  //-------- 如果点击了展开或收缩按钮---------
  
  targetid=srcelement.id+"d";
  targetelement=document.getElementById(targetid);
 
  if (targetelement.style.display=="none")
  {
	  var links=document.getElementsByTagName("A");
	 	/* for (i=0; i<links.length; i++)
	 	{
	 		srcelement2=links[i];
	 		if(srcelement2.parentNode.className.toUpperCase()=="L1" || srcelement2.parentNode.className.toUpperCase()=="L21")
	 		{
	 			targetelement2=document.getElementById(srcelement2.id+"d");
	 			targetelement2.style.display="none";
	 			srcelement2.className="";
	 		}
		}  */
	  
	 if(URL.substr(0,7)!="http://" && URL.substr(0,6)!="ftp://")
		  if("#"!=URL)
	 	    parent.document.getElementById("manFrame").src=URL;
     srcelement.className="active";
     targetelement.style.display='';
     menu_flag=0;
	
  }
  else
  {
     srcelement.className="";
     targetelement.style.display="none";

     menu_flag=1;
     
     var links=document.getElementsByTagName("A");
     for (i=0; i<links.length; i++)
     {
       srcelement=links[i];
       if(srcelement.parentNode.className.toUpperCase()=="L1" && srcelement.className=="active" && srcelement.id.substr(0,1)=="m")
       {
          menu_flag=0;

          break;
       }
     }
  }
}
function set_current(id)
{
	
   cur_link=document.getElementById("f"+cur_id);
   if(cur_link)
      cur_link.className="";
   cur_link=document.getElementById("f"+id);
   if(cur_link)
      cur_link.className="active";
   cur_id=id;
}
//-------- 打开网址 -------
function a(URL,id)
{
	
	   set_current(id);
	   if(URL.substr(0,7)!="http://" && URL.substr(0,6)!="ftp://")
	  
	    parent.document.getElementById("manFrame").src=URL;
}
//add by YZQ 2008-03-05 begin
//-------- 菜单全部展开/收缩 -------
//-------- 打开windows程序 -------
</script>

</body>
</html>