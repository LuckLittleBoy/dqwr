$(document).ready(function(){ 
	$("#shenhe").change(function(){
		if($(this).val()==2){
			$("#yijian").slideToggle();
		}
		if($(this).val()==1){
			$("#yijian").slideToggle();	
		}
		
	});
	
});
