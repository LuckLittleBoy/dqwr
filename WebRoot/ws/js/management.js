
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
	    // �����ѡ��Ĭ���������ѡ��ģ���ɫ.  
		$('.cssraindemo2 input[type="checkbox"]:checked').parents('tr').addClass('selected');  
		// ��ѡ��  
		$('.cssraindemo2 tbody tr').click(  
		 function() {  
		  if ($(this).hasClass('selected')) {  
		   $(this).removeClass('selected');  
		   $(this).find('input[type="checkbox"]').removeAttr('checked');  
		  } else {  
		   $(this).addClass('selected');  
		   $(this).find('input[type="checkbox"]').attr('checked','checked');  //find ȡ�õ�ǰԪ�ؼ��ϵ�ÿ��Ԫ�صĺ��  
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