jQuery(function(){
	$("#shuaxin").click(function (){
		$("#shuaxin").attr("src","images/randCode.jsp?"+Math.random());
	});
	$("#zctj").click(function(){
		var username = $("#username").val();
		var pwd = $("#pwd").val();
		var s1 = $("#s1").val();
		var s2 = $("#s2").val();
		var gzdw = $("#gzdw").val();
		var zyfx = $("#zyfx").val();
		var rspwd = $("#rspwd").val();
		var szhy = $("#szhy").val();
		var sj = $("#sj").val();
		var yx = $("#yx").val();
		var qq = $("#qq").val();
		
		function containSpecial( s )      
		{      
		    var containSpecial = RegExp(/[(\ )(\~)(\!)(\#)(\$)(\%)(\^)(\&)(\*)(\()(\))(\-)(\_)(\+)(\=)(\[)(\])(\{)(\})(\|)(\\)(\;)(\:)(\')(\")(\,)(\.)(\/)(\<)(\>)(\?)(\)]+/);      
		    return ( containSpecial.test(s) );      
		}
		if(username==""){
			alert("用户名不能为空");
		}else if(pwd==""){
			alert("密码不能为空");
		}else if(s1=="省份"){
			alert("请选择省市");
		}else if(gzdw==""){
			alert("工作单位没填写");
		}else if(zyfx==""){
			alert("专业方向没有填写");
		}else if(pwd.length>20||pwd.length<6){
			alert("<font color='red'>密码应大于6位且小于20位</font>");
		}else if(rspwd!=pwd){
			alert("两次密码不同");
		}else if(containSpecial(username)){
			alert("用户名存在特殊字符，请检查");
		}else if(szhy==""){
			alert("所在行业不能为空");
		}else if(sj==""){
			alert("手机号码不能为空");
		}else if(yx==""){
			alert("邮箱不能为空");	
		}else if(qq==""){
			alert("QQ号码不能为空");
		}else{
			jQuery.post("../zhuce",
					{
						"username":$("#username").val(),
						"pwd":$("#pwd").val(),
						"name":$("#name").val(),
						"sex":$('input[name="sex"]:checked').val(),
						"city":($("#s1").val()+$("#s2").val()),
						"gzdw":$("#gzdw").val(),
						"szhy":$("#szhy").val(),
						"jycd":$("#jycd").val(),
						"zc":$("#jycd").val(),
						"txdz":$("#txdz").val(),
						"yzbm":$("#yzbm").val(),
						"sj":$("#sj").val(),
						"gddh":$("#gddh").val(),
						"yx":$("#yx").val(),
						"qq":$("#qq").val(),
						"msn":$("#msn").val(),
						"zyfx":$("#zyfx").val(),
						"randcode":$("#randcode").val()
					},
					function(response){
						alert(response);
						if(response=="注册成功"){
							window.location.href="index.jsp";							
						}
			})
		}
	})
});