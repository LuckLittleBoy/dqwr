	$(function(){
		//检查上位政策
		$("#swzc").focus(function(){
			var ss;
			
			for(var i=0;zc.zc[i]!=null&&i<10;i++){
				if(i==0){
					ss=zc.zc[i].ZCWH+":"+zc.zc[i].ZCMC;
				}else
					ss=ss+","+zc.zc[i].ZCWH+":"+zc.zc[i].ZCMC;
			}
			_cache={"2":ss};
			
			$.openLayer2({
				maxItems : 5,
				pid : "2",
				returnText : "swzc",
				returnValue : "swzchidden",
				span_width : {d1:120,d2:150,d3:150},
				index : 3
			});
			document.getElementById("search").focus();
		});
		$("#qqzc").focus(function(){
			var ss;
			for(var i=0;zc.zc[i]!=null&&i<10;i++){

				if(i==0){
					ss=zc.zc[i].ZCWH+":"+zc.zc[i].ZCMC;
				}else
					ss=ss+","+zc.zc[i].ZCWH+":"+zc.zc[i].ZCMC;
			}
			_cache={"3":ss};
			$.openLayer2({
				maxItems : 5,
				pid : "3",
				returnText : "qqzc",
				returnValue : "qqzchidden",
				span_width : {d1:120,d2:150,d3:150},
				index : 4
			});
			document.getElementById("search").focus();
		});
		
		$("#swzchidden").blur(function(){
			var errorsw="";
			swlist = new Array;
			swlist = jQuery("#swzchidden").val().split(";");
			$.ajaxSetup({
				async:false
			});
			for(var i=0;i<swlist.length;i++){
				jQuery.post("/kjzc/CheckSWQQ",{"zcwh":swlist[i]},function(response){
					if (errorsw==""){
						errorsw=response;
					}
					else
						errorsw=errorsw+";"+response;
				});
			}
			if(errorsw!=""){
				alert("不存在的政策文号\""+errorsw+"\"将不被录入");
			}
		});
		
		$("#qqzchidden").blur(function(){
			var errorsw="";
			swlist = new Array;
			swlist = jQuery("#qqzchidden").val().split(";");
			
			$.ajaxSetup({
				async:false
			});
			for(var i=0;i<swlist.length;i++){
				jQuery.post("/kjzc/CheckSWQQ",{"zcwh":swlist[i]},function(response){
					if (errorsw==""){
						errorsw=response;
					}
					else
						errorsw+=response;
				});
			}
			if(errorsw!=""){
				alert("不存在的政策文号：\""+errorsw+"\"将不被录入");
			}
		});
	})

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


$(document).ready(function () {
	$("#sxzt").change(function (){
		if($("#sxzt").val()==1){
			$("#fzrq").val("失效时可填")
			$("#fzrq").attr("disabled",true)
		}
		if($("#sxzt").val()==0){
			$("#fzrq").attr("disabled",false)
			$("#fzrq").val("")
		}
	})
})