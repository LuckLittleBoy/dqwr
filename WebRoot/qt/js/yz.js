$(document).ready(function(){ 
	
	 $("#username").blur(function(){
		 var str=$("#username").val();
		 if(str.length>20||str.length<6){
			 $("#user2").html("<font color='red'>用户名应大于6位且小于20位</font>");
		 }else if(isNaN(str.substr(0,1))){			 
			 jQuery.post("../checkwbuser",
						{"user":jQuery("#username").val(),
						},function(response){
					jQuery("#user2").html(response);
				});
		 }else{
		 }
    });
	 $("#pwd").blur(function(){
		 var str=$("#pwd").val();
		 if(str==""){
			 $("#pwd2").html("<font color='red'>密码不能为空</font>");
		 }else if(str.length>20||str.length<6){
			 $("#pwd2").html("<font color='red'>密码应大于6位且小于20位</font>");
		 }
		 else{
			 if(isNaN(str.substr(0,1))){
				 $("#pwd2").html("");
			 }
		 }
    });
	 $("#rspwd").blur(function(){
		 var str1=$("#rspwd").val();
		 var str2=$("#pwd").val();
		 if(str1!=str2){
			 $("#rspwd2").html("<font color='red'>两次密码不同</font>");
		 }else{
			 $("#rspwd2").html("");
		 }
    });
	 $("#yhnc").blur(function(){
		 var str=$("#yhnc").val();
		 if(str==""){
			 $("#yhnc2").html("<font color='red'>昵称不能为空</font>");
		 }else{
			 
			 if(isNaN(str.substr(0,1))){
				 $("#yhnc2").html("");
			 }else{
				 $("#yhnc2").html("<font color='red'>首字母不能为数字</font>");
			 }
			 
		 }
    });
	 $("#yhyx").blur(function(){
		 var str=$("#yhyx").val();
		 if(str!=""){
		     reg=/^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/gi;
		     if(!reg.test(str))
		     {
		    	 $("#yhyx2").html("<font color='red'>非法的电子邮件</font>");
		     }
		 }
		 else{
			 $("#yhyx2").html("");
		 }
		 
    });
	
})

function checkform1(){
	var user2=document.getElementById("user2");
	var pwd2=document.getElementById("pwd2");
	var rspwd2=document.getElementById("rspwd2");
	var yhyx2=document.getElementById("yhyx2");
	var yhnc2=document.getElementById("yhnc2");
	if(user2.innerHTML!=""){
		alert("用户名有误");
		return false;
	}else if(pwd2.innerHTML!=""){
		alert("密码有误");
		return false;
	}else if(rspwd2.innerHTML!=""){
		alert("两次密码不同");
		return false;
	}else if(yhnc2.innerHTML!=""){
		alert("用户昵称有误");
		return false;
	}
}