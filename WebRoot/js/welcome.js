
jQuery(function(){
	
	jQuery.post("/satp/jquery/dongtai.jsp",{"pagesize":jQuery("#pagesize").val(),"pageno":jQuery("#pageno").val()},function(response){
		jQuery("#dongtai").html(response);
	});
	
	jQuery.post("/satp/jquery/deletezc.jsp",{"pagesize":jQuery("#pagesize").val(),"pageno":jQuery("#pageno").val()},function(response){
		jQuery("#delete").html(response);
	});
	
	jQuery.post("/satp/jquery/alterzc.jsp",{"pagesize":jQuery("#pagesize").val(),"pageno":jQuery("#pageno").val()},function(response){
		jQuery("#alter").html(response);
	});
	jQuery.post("/satp/jquery/examine.jsp",{"pagesize":jQuery("#pagesize").val(),"pageno":jQuery("#pageno").val()},function(response){
		jQuery("#examine").html(response);
	});
	jQuery.post("/satp/jquery/prescription.jsp",{"pagesize":jQuery("#pagesize").val(),"pageno":jQuery("#pageno").val()},function(response){
		jQuery("#prescription").html(response);
	});
	jQuery.post("/satp/jquery/brose.jsp",{"pagesize":jQuery("#pagesize").val(),"pageno":jQuery("#pageno").val(),"typeid":jQuery("#typeid").val()},function(response){
		jQuery("#brose").html(response);
	});
});
