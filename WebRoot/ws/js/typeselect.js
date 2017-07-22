jQuery(function(){
	jQuery("#type").load("/satp/typeselect/selecttype.jsp");
});

jQuery.post("/satp/jquery/dongtai.jsp",{"pagesize":jQuery("#pagesize").val(),"pageno":jQuery("#pageno").val()},function(response){
	jQuery("#dongtai").html(response);
});

