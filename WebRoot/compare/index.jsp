<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>政策比对</title>
<style type="text/css">
.juzi{background-color: #FFFFFF;white-space:normal; }
.juzi:hover{background-color: #EF411A;white-space:normal; }
div{  
word-wrap: break-word;  
word-break: normal;  
} 
</style>
<script src="../js/jquery.min.js"></script> 
<script type="text/javascript">
str="";
function searchmsg(){
	var s=document.getElementById("3").innerHTML;
	var reg=new RegExp(s,"g"); 
	var s2=document.getElementById("wordslist2").innerHTML;
	str=s2;
	s2=s2.replace(reg,"<font color='#FA6060' id='foucw'>"+s+"</font>");
	document.getElementById("wordslist2").innerHTML=s2;
	
	//alert(document.getElementById("foucw").innerHTML);
	e=document.getElementById("foucw")
	//  x=$("foucw").offset();
	// alert(getTop(e));
	document.getElementById("wordslist2").scrollTop=getTop(e);;
}
function nostylemsg(){
	document.getElementById("wordslist2").innerHTML=str;
}
a={};
jQuery(document).ready(function (a1) {
	a=a1;
});
function getTop(e){ 
	var offset=e.offsetTop; 
	if(e.offsetParent!=null) offset+=getTop(e.offsetParent); 
	return offset; 
	} 
	//获取元素的横坐标 
	function getLeft(e){ 
	var offset=e.offsetLeft; 
	if(e.offsetParent!=null) offset+=getLeft(e.offsetParent); 
	return offset; 
	} 
</script>

</head>
<body>

<table width="100%">
<tr>
	<td>
	<div id="wordslist" style="white-space:normal; width:600px; overflow:auto;line-height:22px;   height:560px; border:1px solid;">
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddddasddddddddddddddddddddddddddddddasddddddddddddddddddddddddddddddasddddddddddddddddddddddddddddddasddddddddddddddddddddddddddddddasddddddddddddddddddddddddddddddasddddddddddddddddddddddddddddddasddddddddddddddddddddddddddddddasddddddddddddddddddddddddddddddasddddddddddddddddddddddddddddddasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font id="3" onmouseover="searchmsg()"  onmouseout="nostylemsg()" class="juzi" >ssssssss</font>
</div>
	
	</td>
	<td>
	<div  id="wordslist2" style=" overflow:auto;line-height:22px;  width:90%; height:560px; border:1px solid;">
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">dasddddddddddddddddddddddddddddd</font>
<font class="juzi">dasddddddddddddddddddddddddddddd</font><font class="juzi">ssssssss</font>
</div>
	</td>
</tr>
</table>


</body>
</html>