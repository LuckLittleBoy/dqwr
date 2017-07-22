var wholeid;//记录政策的id
var policyBeforeTreeLists;
var policyAfterTreeLists;
var policyIdShow;
var policyNameShow;

$(function(){ 
	var policyId=$('#policyId').val();
	var name=$('#name').val();
	if(policyId!=null&&policyId!=''||name!=null&&name!=''){
		wholeid=policyId;
		var parameter={
	  		policyId:policyId,
			name:name
		};
		$.ajax({
			url:"../ybc/searchPolicyServlet",
			type:"POST",
			data:parameter,
			dataType:"json",
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			error: function(){
				alert('请求服务器失败，请重试！');
			},
			success:function(data){
				if (data.msg == "ok") {
					
					wholeid=data.data.id;
					
					/**
					 * 把原来的内容清空
					 */
					$("#policyTable").empty();
						
					var $policyIdHeadTD = $("<td/>");
					$policyIdHeadTD.attr("align", "center");
					$policyIdHeadTD.attr("valign", "middle");
					$policyIdHeadTD.attr("bgcolor", "#FFFFFF");
					$policyIdHeadTD.attr("style", "border:1px solid #CBE3ED;border-right:none;");
					$policyIdHeadTD.text("政策文号");
					
					var $nameHeadTD = $("<td/>");
					$nameHeadTD.attr("align", "center");
					$nameHeadTD.attr("valign", "middle");
					$nameHeadTD.attr("bgcolor", "#FFFFFF");
					$nameHeadTD.attr("style", "border:1px solid #CBE3ED;");
					$nameHeadTD.append("政策名称");
					
			
					var $HeadTR = $("<tr/>");
					$HeadTR.append($policyIdHeadTD);
					$HeadTR.append($nameHeadTD);
					
					$("#policyTable").append($HeadTR); 
					
					var $policyIdTD = $("<td/>");
					$policyIdTD.attr("align", "center");
					$policyIdTD.attr("valign", "middle");
					$policyIdTD.attr("bgcolor", "#FFFFFF");
					$policyIdTD.attr("style", "border-bottom:1px solid #f3f8fd;");
					$policyIdTD.text(data.data.policyId);
					
					var $nameTD = $("<td/>");
					$nameTD.attr("align", "center");
					$nameTD.attr("valign", "middle");
					$nameTD.attr("bgcolor", "#FFFFFF");
					$nameTD.attr("style", "border-bottom:1px solid #f3f8fd;");
					$nameTD.append(data.data.name);
				
					var $TR = $("<tr/>");
					$TR.append($policyIdTD);
					$TR.append($nameTD);
				
					$("#policyTable").append($TR);
					
					var $familyButton=$("<input/>");
					$familyButton.attr("type", "button");
					$familyButton.attr("value", "族谱分析");
					$familyButton.attr("id", "familyButtonSubmit");
					$familyButton.attr("onclick", "familySubmit();");
					
					var $familyTD = $("<td/>");
					$familyTD.attr("align", "center");
					$familyTD.attr("valign", "middle");
					$familyTD.attr("bgcolor", "#FFFFFF");
					$familyTD.attr("colspan","3");
					$familyTD.attr("style", "border-bottom:1px solid #f3f8fd;");
					$familyTD.append($familyButton);
					
					var $familyTR = $("<tr/>");
					$familyTR.append($familyTD);
					$("#policyTable").append($familyTR);
					timeSubmit();
				}
			}
		});
	}
}); 

/*
 * 提交政策相关信息
 */
function policySubmit(){
	var policyId=$('#policyId').val();
	var name=$('#name').val();
	var parameter={
  		policyId:policyId,
		name:name
	};
	$.ajax({
		url:"../ybc/searchPolicyServlet",
		type:"POST",
		data:parameter,
		dataType:"json",
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		error: function(){
			alert('请求服务器失败，请重试！');
		},
		success:function(data){
			if (data.msg == "ok") {
				
				wholeid=data.data.id;
				
				/**
				 * 把原来的内容清空
				 */
				$("#policyTable").empty();
					
				var $policyIdHeadTD = $("<td/>");
				$policyIdHeadTD.attr("align", "center");
				$policyIdHeadTD.attr("valign", "middle");
				$policyIdHeadTD.attr("bgcolor", "#FFFFFF");
				$policyIdHeadTD.attr("style", "border:1px solid #CBE3ED;border-right:none;");
				$policyIdHeadTD.text("政策文号");
				
				var $nameHeadTD = $("<td/>");
				$nameHeadTD.attr("align", "center");
				$nameHeadTD.attr("valign", "middle");
				$nameHeadTD.attr("bgcolor", "#FFFFFF");
				$nameHeadTD.attr("style", "border:1px solid #CBE3ED;");
				$nameHeadTD.append("政策名称");
				
			
				
				var $HeadTR = $("<tr/>");
				$HeadTR.append($policyIdHeadTD);
				$HeadTR.append($nameHeadTD);
			
				$("#policyTable").append($HeadTR); 
				
				var $policyIdTD = $("<td/>");
				$policyIdTD.attr("align", "center");
				$policyIdTD.attr("valign", "middle");
				$policyIdTD.attr("bgcolor", "#FFFFFF");
				$policyIdTD.attr("style", "border-bottom:1px solid #f3f8fd;");
				$policyIdTD.text(data.data.policyId);
				
				var $nameTD = $("<td/>");
				$nameTD.attr("align", "center");
				$nameTD.attr("valign", "middle");
				$nameTD.attr("bgcolor", "#FFFFFF");
				$nameTD.attr("style", "border-bottom:1px solid #f3f8fd;");
				$nameTD.append(data.data.name);
				
				
				
				var $TR = $("<tr/>");
				$TR.append($policyIdTD);
				$TR.append($nameTD);
				
				$("#policyTable").append($TR);
				
				var $timeButton=$("<input/>");
				$timeButton.attr("type", "button");
				$timeButton.attr("value", "时效分析");
				$timeButton.attr("id", "timeButtonSubmit");
				$timeButton.attr("onclick", "timeSubmit();");
				
				var $familyTD = $("<td/>");
				$familyTD.attr("align", "center");
				$familyTD.attr("valign", "middle");
				$familyTD.attr("bgcolor", "#FFFFFF");
				$familyTD.attr("colspan","3");
				$familyTD.attr("style", "border-bottom:1px solid #f3f8fd;");
				$familyTD.append($timeButton);
				
				var $familyTR = $("<tr/>");
				$familyTR.append($familyTD);
				$("#policyTable").append($familyTR);
			}
		}
	});
}

/*
 * 时效分析
 */
function timeSubmit(){
	var timeselect=$('#timeSearch option:selected') .val();//选中的值
	var starttime=$('#startT').val();
	var endtime=$('#endT').val();
	var parameter;
	parameter={
  		id:wholeid,
		timeselect:timeselect,
		starttime:starttime,
		endtime:endtime
	};
	$.ajax({
		url:"../ybc/getBeforePolicyTreeByIdServlet",
		type:"POST",
		data:parameter,
		dataType:"json",
		async:false,//取消异步请求
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		error: function(){
			alert('请求服务器失败，请重试！');
		},
		success:function(data){
			if(data.msg=="ok"){	
				$("#family").empty();
				$("#child").empty();
				policyBeforeTreeLists=data.policyBeforeTreeLists;
				policyAfterTreeLists=data.policyAfterTreeLists;
				
				var maxlength=0;
				for(i=0;i<policyBeforeTreeLists.length;i++){
					if(maxlength<policyBeforeTreeLists[i].length){
						maxlength=policyBeforeTreeLists[i].length;
					}
				}
				for(i=0;i<policyAfterTreeLists.length;i++){
					if(maxlength<policyAfterTreeLists[i].length){
						maxlength=policyAfterTreeLists[i].length;
					}
				}

				$("#family").empty();
				$("#child").empty();
				
				var i,j;
				var name;
				var name1=new Array();
				for(var k=0;k<10;k++){
					name1[k]=new Array();
					for(var j=0;j<10;j++){
						name1[k][j]="";
					}
				}
				/*
				 * 获取前驱政策树结构
				 */
				for(i=0;i<policyBeforeTreeLists.length;i++){
					var $Div = $("<div/>");
					$Div.attr("id","beforeDiv"+i);
					$Div.attr("style","width:190px;height:auto;float:left;");
					$("#family").append($Div);
				}
				
				var one=0;
				for(i=0;i<policyBeforeTreeLists.length;i++){
					if(policyBeforeTreeLists[i].length==1){
						one++;
					}
				}
				one--;
				if(policyBeforeTreeLists[0][0].name.length>6){
					name1[0][0]=policyBeforeTreeLists[0][0].name.substr(0,6)+"...";
				}else{
					name1[0][0]=policyBeforeTreeLists[0][0].name;
				}
			if(policyBeforeTreeLists.length==1){
				
				var msg="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
				document.getElementById('cxzc').innerHTML=msg;
				document.getElementById('cxzc').style.visibility = "visible"
				document.getElementById('cx').innerHTML=policyBeforeTreeLists[0][0].name;

						document.getElementById('tab11').style.visibility = "hidden";
						document.getElementById('tab22').style.visibility = "hidden";
						document.getElementById('tab33').style.visibility = "hidden";
						document.getElementById('tab44').style.visibility = "hidden";
						document.getElementById('tab55').style.visibility = "hidden";
				
			}else {
				
              
				var m=policyBeforeTreeLists[1].length;			
				for(j=0;j<m;j++){
					if(policyBeforeTreeLists[1][j].name.length>6){
						name1[1][j]=policyBeforeTreeLists[1][j].name.substr(0,6)+"...";
					}
					else{
						name1[1][j]=policyBeforeTreeLists[1][j].name;
					}
				}
				
				var msg="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
				document.getElementById('cxzc').innerHTML=msg;
				document.getElementById('cx').innerHTML=policyBeforeTreeLists[0][0].name;

					var msg1,msg2,msg3,msg4,msg5;	
					switch(m){
					case 1:
						var msg="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
						document.getElementById('cxzc').innerHTML=msg;
						document.getElementById('cxzc').style.visibility = "visible"
						msg1="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name1[1][0]+"</font>"
						document.getElementById('tab33').innerHTML=msg1;
						document.getElementById('tab3').innerHTML=policyBeforeTreeLists[1][0].name;

						document.getElementById('tab11').style.visibility = "hidden";
						document.getElementById('tab22').style.visibility = "hidden";
						document.getElementById('tab33').style.visibility = "visible";
						document.getElementById('tab44').style.visibility = "hidden";
						document.getElementById('tab55').style.visibility = "hidden";
					    break;
					case 2:
						var msg="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
						document.getElementById('cxzc').innerHTML=msg;
						document.getElementById('cxzc').style.visibility = "visible"
						msg1="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][0]+"</font>"
						msg2="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][1]+"</font>"
						document.getElementById('tab22').innerHTML=msg1;
						document.getElementById('tab44').innerHTML=msg2;
						document.getElementById('tab2').innerHTML=policyBeforeTreeLists[1][0].name;
						document.getElementById('tab4').innerHTML=policyBeforeTreeLists[1][1].name;

						document.getElementById('tab11').style.visibility = "hidden";
					    document.getElementById('tab22').style.visibility = "visible";
					    document.getElementById('tab33').style.visibility = "hidden";
					    document.getElementById('tab44').style.visibility = "visible";
					    document.getElementById('tab55').style.visibility = "hidden";
					  
					    break;
					case 3:
						var msg="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
						document.getElementById('cxzc').innerHTML=msg;
						document.getElementById('cxzc').style.visibility = "visible"
						msg1="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][0]+"</font>"
						msg2="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][1]+"</font>"
						msg3="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][2]+"</font>"										  
						document.getElementById('tab22').innerHTML=msg1;
						document.getElementById('tab33').innerHTML=msg2;
						document.getElementById('tab44').innerHTML=msg3;
						document.getElementById('tab2').innerHTML=policyBeforeTreeLists[1][0].name;
						document.getElementById('tab3').innerHTML=policyBeforeTreeLists[1][1].name;
						document.getElementById('tab4').innerHTML=policyBeforeTreeLists[1][2].name;

						document.getElementById('tab11').style.visibility ="hidden";
					    document.getElementById('tab22').style.visibility ="visible";
					    document.getElementById('tab33').style.visibility="visible";
					    document.getElementById('tab44').style.visibility ="visible";
					    document.getElementById('tab55').style.visibility ="hidden";
					    break;
					case 4:
						var msg="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
						document.getElementById('cxzc').innerHTML=msg;
						document.getElementById('cxzc').style.visibility = "visible"
						msg1="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][0]+"</font>"
						msg2="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][1]+"</font>"
						msg3="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][2]+"</font>"					  
						msg4="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][3].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][3]+"</font>"	
						document.getElementById('tab11').innerHTML=msg1;
						document.getElementById('tab22').innerHTML=msg2;
						document.getElementById('tab33').innerHTML=msg3;
						document.getElementById('tab44').innerHTML=msg4;
						document.getElementById('tab1').innerHTML=policyBeforeTreeLists[1][0].name;
						document.getElementById('tab2').innerHTML=policyBeforeTreeLists[1][1].name;
						document.getElementById('tab3').innerHTML=policyBeforeTreeLists[1][2].name;
						document.getElementById('tab4').innerHTML=policyBeforeTreeLists[1][3].name;

						document.getElementById('tab11').style.visibility = "visible";
					    document.getElementById('tab22').style.visibility = "visible";
					    document.getElementById('tab33').style.visibility = "visible";
					    document.getElementById('tab44').style.visibility = "visible";
					    document.getElementById('tab55').style.visibility = "hidden";
					    break;
					case 5:
						
						var msg="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
						document.getElementById('cxzc').innerHTML=msg;
						document.getElementById('cxzc').style.visibility = "visible"
						msg1="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][0].id+"'  onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name1[1][0]+"</font>"
						msg2="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'  >"+name1[1][1]+"</font>"
						msg3="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name1[1][2]+"</font>"					  
					    msg4="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][3].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name1[1][3]+"</font>"	
						msg5="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][4].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name1[1][4]+"</font>"	
						document.getElementById('tab11').innerHTML=msg1;
						document.getElementById('tab22').innerHTML=msg2;
						document.getElementById('tab33').innerHTML=msg3;
						document.getElementById('tab44').innerHTML=msg4;
						document.getElementById('tab55').innerHTML=msg5;
						document.getElementById('tab1').innerHTML=policyBeforeTreeLists[1][0].name;
						document.getElementById('tab2').innerHTML=policyBeforeTreeLists[1][1].name;
						document.getElementById('tab3').innerHTML=policyBeforeTreeLists[1][2].name;
						document.getElementById('tab4').innerHTML=policyBeforeTreeLists[1][3].name;
						document.getElementById('tab5').innerHTML=policyBeforeTreeLists[1][4].name;

						document.getElementById('tab11').style.visibility = "visible";
					    document.getElementById('tab22').style.visibility = "visible";
					    document.getElementById('tab33').style.visibility = "visible";
					    document.getElementById('tab44').style.visibility = "visible";
					    document.getElementById('tab55').style.visibility = "visible";
					    break;
					    default:
					    var msg="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
						document.getElementById('cxzc').innerHTML=msg;
						document.getElementById('cxzc').style.visibility = "visible"
					    msg1="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][0]+"</font>"
					    msg2="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][1]+"</font>"
						msg3="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][2]+"</font>"					  
					    msg4="<font style='cursor:pointer' size='3' id='before+"+policyBeforeTreeLists[1][3].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][3]+"</font>"
						msg5="<font>更多。。。</font>"
					    document.getElementById('tab11').innerHTML=msg1;
						document.getElementById('tab22').innerHTML=msg2;
						document.getElementById('tab33').innerHTML=msg3;
						document.getElementById('tab44').innerHTML=msg4;
						document.getElementById('tab55').innerHTML=msg5;
						document.getElementById('tab1').innerHTML=policyBeforeTreeLists[1][0].name;
						document.getElementById('tab2').innerHTML=policyBeforeTreeLists[1][1].name;
						document.getElementById('tab3').innerHTML=policyBeforeTreeLists[1][2].name;
						document.getElementById('tab4').innerHTML=policyBeforeTreeLists[1][3].name;

						document.getElementById('tab11').style.visibility = "visible";
						document.getElementById('tab22').style.visibility = "visible";
						document.getElementById('tab33').style.visibility = "visible";
					    document.getElementById('tab44').style.visibility = "visible";
						document.getElementById('tab55').style.visibility = "visible";
						break;
					}
				
			}				
				/*
				 * 获取后继政策树结构
				 */
				for(i=1;i<policyAfterTreeLists.length;i++){
					var $Div = $("<div/>");
					$Div.attr("id","afterDiv"+i);
					$Div.attr("style","width:190px;height:auto;float:left;");
					$("#family").append($Div);
				}
				var name=new Array();
				for(var k=0;k<10;k++){
					name[k]=new Array();
					for(var j=0;j<10;j++){
						name[k][j]="";
					}
				}
				if(policyAfterTreeLists.length==1){
					document.getElementById('tab111').style.visibility = "hidden";
					document.getElementById('tab222').style.visibility = "hidden";
					document.getElementById('tab333').style.visibility = "hidden";
					document.getElementById('tab444').style.visibility = "hidden";
					document.getElementById('tab555').style.visibility = "hidden";
				}else{
				
				var m=policyAfterTreeLists[1].length;
				for(j=0;j<m;j++){
					if(policyAfterTreeLists[1][j].name.length>6){
						name[1][j]=policyAfterTreeLists[1][j].name.substr(0,6)+"...";
					}
					else{
						name[1][j]=policyAfterTreeLists[1][j].name;
					}
				}
				
					var msg1,msg2,msg3,msg4,msg5;	
					switch(m){
					
					case 1:
						msg1="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name[1][0]+"</font>"
						document.getElementById('tab3333').innerHTML=msg1;
						document.getElementById('tab333').innerHTML=policyAfterTreeLists[1][0].name;

					    document.getElementById('tab1111').style.visibility = "hidden";
						document.getElementById('tab2222').style.visibility = "hidden";
						document.getElementById('tab3333').style.visibility = "visible";
						document.getElementById('tab4444').style.visibility = "hidden";
						document.getElementById('tab5555').style.visibility = "hidden";
					    break;
					case 2:
						msg1="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][0]+"</font>"
						msg2="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][1]+"</font>"
						document.getElementById('tab2222').innerHTML=msg1;
						document.getElementById('tab4444').innerHTML=msg2;
						document.getElementById('tab222').innerHTML=policyAfterTreeLists[1][0].name;
						document.getElementById('tab444').innerHTML=policyAfterTreeLists[1][1].name;

						document.getElementById('tab1111').style.visibility = "hidden";
					    document.getElementById('tab2222').style.visibility = "visible";
					    document.getElementById('tab3333').style.visibility = "hidden";
					    document.getElementById('tab4444').style.visibility = "visible";
					    document.getElementById('tab5555').style.visibility = "hidden";
					    break;
					case 3:
						msg1="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][0]+"</font>"
						msg2="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][1]+"</font>"
						msg3="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][2]+"</font>"										  
						document.getElementById('tab2222').innerHTML=msg1;
						document.getElementById('tab3333').innerHTML=msg2;
						document.getElementById('tab4444').innerHTML=msg3;
						document.getElementById('tab222').innerHTML=policyAfterTreeLists[1][0].name;
						document.getElementById('tab333').innerHTML=policyAfterTreeLists[1][1].name;
						document.getElementById('tab444').innerHTML=policyAfterTreeLists[1][2].name;

						document.getElementById('tab1111').style.visibility ="hidden";
					    document.getElementById('tab2222').style.visibility ="visible";
					    document.getElementById('tab3333').style.visibility="visible";
					    document.getElementById('tab4444').style.visibility ="visible";
					    document.getElementById('tab5555').style.visibility ="hidden";
					    break;
					case 4:
						msg1="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][0]+"</font>"
						msg2="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][1]+"</font>"
						msg3="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][2]+"</font>"					  
						msg4="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][3].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][3]+"</font>"	
						document.getElementById('tab1111').innerHTML=msg1;
						document.getElementById('tab2222').innerHTML=msg2;
						document.getElementById('tab3333').innerHTML=msg3;
						document.getElementById('tab4444').innerHTML=msg4;
						document.getElementById('tab111').innerHTML=policyAfterTreeLists[1][0].name;
						document.getElementById('tab222').innerHTML=policyAfterTreeLists[1][1].name;
						document.getElementById('tab333').innerHTML=policyAfterTreeLists[1][2].name;
						document.getElementById('tab444').innerHTML=policyAfterTreeLists[1][3].name;

						document.getElementById('tab1111').style.visibility = "visible";
					    document.getElementById('tab2222').style.visibility = "visible";
					    document.getElementById('tab3333').style.visibility = "visible";
					    document.getElementById('tab4444').style.visibility = "visible";
					    document.getElementById('tab5555').style.visibility = "hidden";
					    break;
					case 5:
						
						msg1="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name[1][0]+"</font>"
						msg2="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name[1][1]+"</font>"
						msg3="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'  >"+name[1][2]+"</font>"					  
					    msg4="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][3].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name[1][3]+"</font>"	
						msg5="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][4].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][4]+"</font>"	
						document.getElementById('tab1111').innerHTML=msg1;
						document.getElementById('tab2222').innerHTML=msg2;
						document.getElementById('tab3333').innerHTML=msg3;
						document.getElementById('tab4444').innerHTML=msg4;
						document.getElementById('tab5555').innerHTML=msg5;
						document.getElementById('tab111').innerHTML=policyAfterTreeLists[1][0].name;
						document.getElementById('tab222').innerHTML=policyAfterTreeLists[1][1].name;
						document.getElementById('tab333').innerHTML=policyAfterTreeLists[1][2].name;
						document.getElementById('tab444').innerHTML=policyAfterTreeLists[1][3].name;
						document.getElementById('tab555').innerHTML=policyAfterTreeLists[1][4].name;

						document.getElementById('tab1111').style.visibility = "visible";
					    document.getElementById('tab2222').style.visibility = "visible";
					    document.getElementById('tab3333').style.visibility = "visible";
					    document.getElementById('tab4444').style.visibility = "visible";
					    document.getElementById('tab5555').style.visibility = "visible";
					    break;
					    default:
					    msg1="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][0]+"</font>"
					    msg2="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][1]+"</font>"
						msg3="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][2]+"</font>"					  
					    msg4="<font style='cursor:pointer' size='3' id='after+"+policyAfterTreeLists[1][3].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][3]+"</font>"
						msg5="<font onclick='morepolicy()' size='3'>更多。。。</font>"
					    document.getElementById('tab1111').innerHTML=msg1;
						document.getElementById('tab2222').innerHTML=msg2;
						document.getElementById('tab3333').innerHTML=msg3;
						document.getElementById('tab4444').innerHTML=msg4;
						document.getElementById('tab5555').innerHTML=msg5;
						document.getElementById('tab111').innerHTML=policyAfterTreeLists[1][0].name;
						document.getElementById('tab222').innerHTML=policyAfterTreeLists[1][1].name;
						document.getElementById('tab333').innerHTML=policyAfterTreeLists[1][2].name;
						document.getElementById('tab444').innerHTML=policyAfterTreeLists[1][3].name;

						document.getElementById('tab1111').style.visibility = "visible";
						document.getElementById('tab2222').style.visibility = "visible";
						document.getElementById('tab3333').style.visibility = "visible";
					    document.getElementById('tab4444').style.visibility = "visible";
						document.getElementById('tab5555').style.visibility = "visible";
						break;
					}
				}
			}
			else{
				alert('操作有误！');
			}
		}
	});
}
function morepolicy(){
	var i,j;
	var msg="<table border='1' width='90%'align='center'><tr><td width='25'><font size='3' color='green'><strong>前驱政策</strong></font></td> "
		if(policyBeforeTreeLists.length==1){
			msg+="<td><font size='3'>"+'该政策没有前驱政策'+"</font></td></tr>";
		}
		else{
			msg+="<td>"
	for(i=0;i<policyBeforeTreeLists[1].length;i++){
		 msg+="<div><font size='3' style='cursor:pointer' id='before+"+policyBeforeTreeLists[1][i].id+"' onclick='showPolicyByPolicyId(this.id)' >"+policyBeforeTreeLists[1][i].name+"</font></div>";
	}
		}
	msg+="</td></tr>"
	msg+="<tr height='50'><td><font style='font-weight:bold;' size='3' color='red'>查询政策<font></td>"+
	"<td><div><font size='3' style='cursor:pointer' id='parent+"+policyBeforeTreeLists[0][0].id+"' onclick='showPolicyByPolicyId(this.id)'>"+policyBeforeTreeLists[0][0].name+"</font></div></td></tr>"
	msg+="<tr><td><font size='3' color='blue' style='font-weight:bold;'>后继政策</font></td><td>"
	for(j=0;j<policyAfterTreeLists[1].length;j++){
		msg+="<div><font size='3' style='cursor:pointer' id='after+"+policyAfterTreeLists[1][j].id+"' onclick='showPolicyByPolicyId(this.id)'>"+policyAfterTreeLists[1][j].name+"</font></div>";
	}
	msg+="</td></tr></table>";
	document.getElementById('tab0').innerHTML=msg;
}

				
				
				
				
/*
 * 根据政策文号获取政策详细信息
 */
function showPolicyByPolicyId(thisa){
	var parameter;
	var policyId;

	var id=thisa.substring(0,6);
	
	if(id=="before"){
  			id=thisa.substring(7,thisa.length);
			policyId=getPolicyIdById(id,policyBeforeTreeLists);
	}else{
  			id=thisa.substring(6,thisa.length);
  			
			policyId=getPolicyIdById(id,policyAfterTreeLists);
	}
	window.location="zcfxzclook.do?pno="+policyId;
}

function policysubmit1(thisa){
	var id=thisa.substring(0,6);
		$('#tab0').empty();
		var name="";
		
		if(id=="before"){
	  			id=thisa.substring(7,thisa.length);
				policyId=getPolicyIdById(id,policyBeforeTreeLists);
		}else{
	  			id=thisa.substring(6,thisa.length);
	  			
				policyId=getPolicyIdById(id,policyAfterTreeLists);
		}
		var parameter={
		  		policyId:policyId,	
		  		name:name
			};
		$.ajax({
			url:"../ybc/searchPolicyServlet",
			type:"POST",
			data:parameter,
			dataType:"json",
			contentType:"application/x-www-form-urlencoded;charset=utf-8",
			error: function(){
				alert('请求服务器失败，请重试！');
			},
			success:function(data){
				if (data.msg == "ok") {
					
					wholeid=data.data.id;
					
					/**
					 * 把原来的内容清空
					 */
					$("#policyTable").empty();
						
					var $policyIdHeadTD = $("<td/>");
					$policyIdHeadTD.attr("align", "center");
					$policyIdHeadTD.attr("valign", "middle");
					$policyIdHeadTD.attr("bgcolor", "#FFFFFF");
					$policyIdHeadTD.attr("style", "border:1px solid #CBE3ED;border-right:none;");
					$policyIdHeadTD.text("政策文号");
					
					var $nameHeadTD = $("<td/>");
					$nameHeadTD.attr("align", "center");
					$nameHeadTD.attr("valign", "middle");
					$nameHeadTD.attr("bgcolor", "#FFFFFF");
					$nameHeadTD.attr("style", "border:1px solid #CBE3ED;");
					$nameHeadTD.append("政策名称");
					
				
					
					var $HeadTR = $("<tr/>");
					$HeadTR.append($policyIdHeadTD);
					$HeadTR.append($nameHeadTD);
				
					$("#policyTable").append($HeadTR); 
					
					var $policyIdTD = $("<td/>");
					$policyIdTD.attr("align", "center");
					$policyIdTD.attr("valign", "middle");
					$policyIdTD.attr("bgcolor", "#FFFFFF");
					$policyIdTD.attr("style", "border-bottom:1px solid #f3f8fd;");
					$policyIdTD.text(data.data.policyId);
					
					var $nameTD = $("<td/>");
					$nameTD.attr("align", "center");
					$nameTD.attr("valign", "middle");
					$nameTD.attr("bgcolor", "#FFFFFF");
					$nameTD.attr("style", "border-bottom:1px solid #f3f8fd;");
					$nameTD.append(data.data.name);
					
					
					
					var $TR = $("<tr/>");
					$TR.append($policyIdTD);
					$TR.append($nameTD);
					
					$("#policyTable").append($TR);
					
					var $timeButton=$("<input/>");
					$timeButton.attr("type", "button");
					$timeButton.attr("value", "时效分析");
					$timeButton.attr("id", "timeButtonSubmit");
					$timeButton.attr("onclick", "timeSubmit();");
					
					var $familyTD = $("<td/>");
					$familyTD.attr("align", "center");
					$familyTD.attr("valign", "middle");
					$familyTD.attr("bgcolor", "#FFFFFF");
					$familyTD.attr("colspan","3");
					$familyTD.attr("style", "border-bottom:1px solid #f3f8fd;");
					$familyTD.append($timeButton);
					
					var $familyTR = $("<tr/>");
					$familyTR.append($familyTD);
					$("#policyTable").append($familyTR);
				}
			}
		});
	}



/*
 * 根据政策policyid获取id
 */
function getIdByPolicyId(policyId,policytree)
{
	for(var i=0;i<policytree.length;i++)
	{
		for(var j=0;j<policytree[i].length;j++)
		{
			if(policytree[i][j].policyId==policyId)
			{
				return policytree[i][j].id;
			}
		}
	}
}

/*
 * 根据政策id获取policyid
 */
function getPolicyIdById(id,policytree)
{
	for(var i=0;i<policytree.length;i++)
	{
		for(var j=0;j<policytree[i].length;j++)
		{
			if(policytree[i][j].id==id)
			{
				return policytree[i][j].policyId;
			}
		}
	}
}