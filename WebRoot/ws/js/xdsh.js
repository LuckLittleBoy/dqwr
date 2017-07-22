
jQuery(function(){//上来就显示所有的
	jQuery.post("/kjzc/ws/jquery/xdsh.jsp",
			{"pagesize":jQuery("#pagesize").val(),
				"pageno":jQuery("#pageno").val(),
				"search":jQuery("#search").val(),
				"find":jQuery("#find").val(),
			},function(response){
		jQuery("#xdsh").html(response);
	
	});
	$("#select").click(function(){//点击确定按钮 按条件查询
		jQuery.post("/kjzc/ws/jquery/xdsh2.jsp",
				{"pagesize":jQuery("#pagesize").val(),
					"pageno":jQuery("#pageno").val(),
					"search":jQuery("#search").val(),
					"find":jQuery("#find").val(),
				},function(response){
			jQuery("#xdsh").html(response);
		});
	});
	

});
function xiaye(){//下一页
	jQuery("#pageno").val(parseInt(jQuery("#pageno").val())+1);
	jQuery.post("/kjzc/ws/jquery/xdsh2.jsp",
			{"pagesize":jQuery("#pagesize").val(),
				"pageno":jQuery("#pageno").val(),
				"search":jQuery("#search").val(),
				"find":jQuery("#find").val(),
			},function(response){
		jQuery("#xdsh").html(response);
	});
}
function shangye(){//上一页
	jQuery("#pageno").val(parseInt(jQuery("#pageno").val())-1);
	jQuery.post("/kjzc/ws/jquery/xdsh2.jsp",
			{"pagesize":jQuery("#pagesize").val(),
				"pageno":jQuery("#pageno").val(),
				"search":jQuery("#search").val(),
				"find":jQuery("#find").val(),
			},function(response){
		jQuery("#xdsh").html(response);
	});
}
function tiaozhuan(){//跳转
	jQuery("#pageno").val(parseInt(jQuery("#pageno2").val()));
	jQuery.post("/kjzc/ws/jquery/xdsh2.jsp",
			{"pagesize":jQuery("#pagesize").val(),
				"pageno":jQuery("#pageno").val(),
				"search":jQuery("#search").val(),
				"find":jQuery("#find").val(),
			},function(response){
		jQuery("#xdsh").html(response);
	});
}
function sy(){//所有
	jQuery("#pageno").val(0);
	jQuery.post("/kjzc/ws/jquery/xdsh2.jsp",
			{"pagesize":jQuery("#pagesize").val(),
				"pageno":jQuery("#pageno").val(),
				"search":jQuery("#search").val(),
				"find":jQuery("#find").val(),
			},function(response){
		jQuery("#xdsh").html(response);
	});
}
function my(){//我的列表
	jQuery("#pageno").val(parseInt(jQuery("#max").val()));
	jQuery.post("/kjzc/ws/jquery/xdsh2.jsp",
			{"pagesize":jQuery("#pagesize").val(),
				"pageno":jQuery("#pageno").val(),
				"search":jQuery("#search").val(),
				"find":jQuery("#find").val(),
			},function(response){
		jQuery("#xdsh").html(response);
	});
}