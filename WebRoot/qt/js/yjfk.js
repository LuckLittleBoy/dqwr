jQuery(function(){
	$("#tj").click(function(){
		if($("#user").val()==null||$("#user").val()==""){
			alert("请登录");
			$("#shuaxin").attr("src","images/randCode.jsp?"+Math.random());
		}else if($("#yzm").val()==null||$("#yzm").val()==""){
			alert("请填写验证码");
			$("#shuaxin").attr("src","images/randCode.jsp?"+Math.random());
		}else if($("#fs").val()==null||$("#fs").val()==""){
			alert("请填写带*号的");
			$("#shuaxin").attr("src","images/randCode.jsp?"+Math.random());
		}else if($("#ljxx").val()==null||$("#ljxx").val()==""){
			alert("请填写带*号的");
			$("#shuaxin").attr("src","images/randCode.jsp?"+Math.random());
		}else if($("#xq").val()==null||$("#xq").val()==""){
			alert("请填写带*号的");
			$("#shuaxin").attr("src","images/randCode.jsp?"+Math.random());
		}else if($("#xw").val()==null||$("#xw").val()==""){
			alert("请填写带*号的");
			$("#shuaxin").attr("src","images/randCode.jsp?"+Math.random());
		}else if($("#lxfs").val()==null||$("#lxfs").val()==""){
			alert("请填写带*号的");
			$("#shuaxin").attr("src","images/randCode.jsp?"+Math.random());
		}else {
			jQuery.post("../add.YjfkServlet",
					{"fs":$("#fs").val()
					,"yzm":$("#yzm").val(),
					"lxfs":$("#lxfs").val(),
					"xw":$("#xw").val(),
					"xq":$("#xq").val(),
					"jyyq":$("#jyyq").val(),
					"ljxx":$("#ljxx").val(),
					"user":$("#user").val()},
					function(response){
				alert(response);
				$("#shuaxin").attr("src","images/randCode.jsp?"+Math.random());
			});
		}
		
	})
	$("#shuaxin").click(function (){
		$("#shuaxin").attr("src","images/randCode.jsp?"+Math.random());
	});

})