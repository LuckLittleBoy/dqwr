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

function switchTab(ProTag, ProBox) {
           for (i = 1; i < 5; i++) {
               if ("tab" + i == ProTag) {
                   document.getElementById(ProTag).getElementsByTagName("a")[0].className = "on";
               } else {
                   document.getElementById("tab" + i).getElementsByTagName("a")[0].className = "";
               }
               if ("con" + i == ProBox) {
                   document.getElementById(ProBox).style.display = "";
               } else {
                   document.getElementById("con" + i).style.display = "none";
               }
           }
       }
