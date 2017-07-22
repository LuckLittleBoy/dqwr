$(document).ready(function(){
	$(".loading").hide();
	var ZCFLSelect = $(".ZCFL").children("select");
	var TypeSelect = $(".cartype").children("select");
	var carimg = $(".carimg");
	ZCFLSelect.change(function(){
		var ZcflSelect = $(this).val();
		carimg.hide().attr("src","");
		if(ZcflSelect!=""){
			if(ZCFLSelect.data(ZcflSelect)) {
				var data = ZCFLSelect.data(ZcflSelect);
				TypeSelect.html("");
				if(data.length!=0){
					$("<option value='' selected='selected'>"+'请选择 '+"</option>").appendTo(TypeSelect);
					for(var i=0;i<data.length;i++){
						$("<option value='"+data[i]+"'>"+data[i]+"</option>").appendTo(TypeSelect);
					}
					ZCFLSelect.next().show();
					TypeSelect.parent().show();
				}else{
					ZCFLSelect.next().hide();
					TypeSelect.parent().hide();
				}
			}else {
				$.post("qtTypeBrowse",{keyword:ZcflSelect,type:"top"},function(data){
					TypeSelect.html("");
					if(data.length!=0){
						$("<option value='' selected='selected'>"+'请选择'+"</option>").appendTo(TypeSelect);
						for(var i=0;i<data.length;i++){
							$("<option value='"+data[i]+"'>"+data[i]+"</option>").appendTo(TypeSelect);
						}
						ZCFLSelect.next().show();
						TypeSelect.parent().show();
					}else{
						ZCFLSelect.next().hide();
						TypeSelect.parent().hide();
						
					}
					ZCFLSelect.data(ZcflSelect,data);
				},"json");
			}
		}else{
			ZCFLSelect.next().hide();
			TypeSelect.parent().hide();
			
		}
	});
	
	TypeSelect.change(function(){
		carimg.hide().attr("src","");
		var ZcTypeSelect = $(this).val();
		var ZcflSelect=$(".ZCFL").children("select").val();
		if(ZcTypeSelect !=""){
			if(TypeSelect.data(ZcTypeSelect)) {
				var data = TypeSelect.data(ZcTypeSelect);
				if(data.length!=0){
					TypeSelect.next().show();
				}else{
					TypeSelect.next().hide();
				}
			}else {
				 window.location="ZCTypeServlet?keyword="+ZcTypeSelect+"&type="+ZcflSelect;
			}
		}else{
			TypeSelect.next().hide();
		}
	});
	
	$(".loading").ajaxStart(function(){
		$(".loading").css("visibility","visible");
		$(".loading").animate({
			opacity: 1
		},0);
	}).ajaxStop(function(){
		$(".loading").animate({
			opacity: 0
		},500);
	});
	
});

function go(){
	var pageNum = $(".pageno").val();
	var type = $(".types").val();
	var keyword=$(".keywords").val();;
       if(pageNum ==0){
           pageNum = 1;
       }
       window.location="ZCTypeServlet?pageNo="+pageNum+"&type="+type+"&keyword="+keyword;
}