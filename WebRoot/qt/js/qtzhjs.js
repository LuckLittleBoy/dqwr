$(document).ready(function () {
	$("#cxtj").click(function(){
		var condition = {};
		var conditiontag = 0;
		result.value="1";
		res.value="1";
		$("#result").val(1);
		$("#res").val(1);
		console.info($("form").serialize());
		//alert($("input[name='condition']").val);
		jQuery.post("../qtzhjs",
				//{
					
					//"sxzt":$("#sxzt").val(),
					//"pboundary":$("#pboundary").val(),
					//"poffice":$("#poffice").val(),
					
				//},
				$("form").serialize(),
				function(response){
			jQuery("#centerright").html(response);
		});
	});
});