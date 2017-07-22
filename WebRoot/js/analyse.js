	jQuery.post("/satp/jquery/analyse.jsp",{"pagesize":jQuery("#pagesize").val(),"pageno":jQuery("#pageno").val()},function(response){
		jQuery("#analyse").html(response);
	});
	