
jQuery(function(){
	
	jQuery("#roles").load("management/selectroles.jsp");
	
	jQuery("#roles").change(function(event){
		var roles=jQuery("#roles").val();
		if(!roles){
			return false;
		}
		jQuery.post("allmenu",{"rolesid":roles},function(response){
			jQuery("#authority").html(response);
			
		});
	});
	
	function table(){  
		
		$('.cssraindemo2 tbody tr:even').addClass('odd');  
		$('.cssraindemo2 tbody tr').hover(  
		 function() {$(this).addClass('highlight');},  
		 function() {$(this).removeClass('highlight');}  
	);  
	    // 如果复选框默认情况下是选择的，变色.  
		$('.cssraindemo2 input[type="checkbox"]:checked').parents('tr').addClass('selected');  
		// 复选框  
		$('.cssraindemo2 tbody tr').click(  
		 function() {  
		  if ($(this).hasClass('selected')) {  
		   $(this).removeClass('selected');  
		   $(this).find('input[type="checkbox"]').removeAttr('checked');  
		  } else {  
		   $(this).addClass('selected');  
		   $(this).find('input[type="checkbox"]').attr('checked','checked');  //find 取得当前元素集合的每个元素的后代  
		  }  
		 })

	}; 
	
	
	
	
	jQuery("#cno").change(function(event){
		var cno=jQuery("#cno").val();
		if(!cno){
			return false;
		}
		jQuery.post("../../selecttplan",{"cno":cno},function(reponse){
			jQuery("#cno").html(response);
		});
		fundocument.getElementById("no").value=fundocument.getElementById("cno").value;
	});
	
	
});