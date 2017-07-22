 function go(){
	var pageNum = $(".pageno").val();
	var type = $(".types").val();
	var keyword=$(".keywords").val();;
       if(pageNum ==0){
           pageNum = 1;
       }
       window.location="qtZCTypeServlet?pageno="+pageNum+"&type="+type+"&keyword="+keyword;
}
 function goes(){
		var pageNum = $(".pageno").val();
		var type = $(".types").val();
	       if(pageNum ==0){
	           pageNum = 1;
	       }
	       window.location="qtZcSearchServlet?pageno="+pageNum;
	}
function goses(){
		var pageNum = $(".pageno").val();
	       if(pageNum ==0){
	           pageNum = 1;
	       }
	       window.location="qtZcFindServlet?pageno="+pageNum;
	}
function gosesa(){
	var pageNum = $(".pageno").val();
       if(pageNum ==0){
           pageNum = 1;
       }
       window.location="ZcDetailed?pageno="+pageNum;
}