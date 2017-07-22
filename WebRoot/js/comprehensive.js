jQuery(function(){
	jQuery("#type").load("/satp/typeselect/selecttype.jsp");
});
jQuery(function(){
	jQuery("#categories").load("/satp/typeselect/selectcategories.jsp");
});
jQuery(function(){
	jQuery("#place").load("/satp/typeselect/selectplace.jsp");
});
jQuery(function(){
	jQuery("#scope").load("/satp/typeselect/selectscope.jsp");
});
jQuery(function(){
	jQuery("#draft").load("/satp/typeselect/selectdraft.jsp");
});



jQuery.post("/satp/jquery/dongtai.jsp",{"pagesize":jQuery("#pagesize").val(),"pageno":jQuery("#pageno").val()},function(response){
	jQuery("#dongtai").html(response);
});

