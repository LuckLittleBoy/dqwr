jQuery(function(){
	jQuery("#type").load("/satp/typeselect/selecttype.jsp");
});

jQuery.post("/satp/jquery/typeselect2.jsp",{"pagesize":jQuery("#pagesize").val(),"pageno":jQuery("#pageno").val(),"sql":jQuery("#sql").val()},function(response){
	jQuery("#typeselect2").html(response);
});

