jQuery(function(){
	 
	$("#btnSubmit").click(function(){
		var orgaid=$("#orgaid").val();
		var organame=$("#organame").val();
		var natureid=$('input:radio[name="natureid"]:checked').val();
		var requname=$("#requname").val();
		var fieldid=$('input:checkbox[name="fieldid"]:checked').val();
		var cooperationid=$('input:radio[name="cooperationid"]:checked').val();
		if(orgaid==""||organame==null||natureid==null||requname==""||fieldid==null||cooperationid==null){
			alert("必填项不能为空!");
			return false;
		}else{
			return true;
		}
	});
	 function TestOrgaidIsEx(){
    	 var orgaid=document.getElementById("orgaid").value;
    	 $.ajax({
    	 type:'post',
    	 url:'orgaidisexist',
    	 data:"orgaid="+orgaid+"",
    	 success:function(msg){
    	 $('#orgaidlabel').html("<font color='red'>"+msg+"</font>");//msg就是一个jsp页面数据,直接嵌入<div id="text">
    	 },
    	 error:function(){
    	 alert('加载信息失败...');
    	 }
    	 });
    	 }
     
		 
			 
		 
	 
});