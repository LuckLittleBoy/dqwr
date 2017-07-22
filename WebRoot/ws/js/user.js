
jQuery(function(){
	
	jQuery("#users").load("User/selectusers.jsp");
	
	jQuery("#users").change(function(event){
		
		jQuery("#roles").load("User/selectroles.jsp");
	});
	
	
	
});