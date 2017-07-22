var wholeid;//记录政策的id
var policyParentTreeLists;

var policyChildTreeLists;
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
					familySubmit();
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
			}
		}
	});
}

/*
 * 族谱分析
 */
function familySubmit(){
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
		url:"../ybc/getPolicyParentTreeByIdServlet",
		type:"POST",
		data:parameter,
		dataType:"json",
		async:false,//取消异步请求
		contentType:"application/x-www-form-urlencoded;charset=utf-8",
		error: function(){
			alert('请求服务器失败，请重试！');
		},
		success: function(data){
			if (data.msg == "ok") {
				policyParentTreeLists=data.policyParentTreeLists;
				
				policyChildTreeLists=data.policyChildTreeLists;
				
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
				 * 获取父辈政策树结构
				 */
				
				for(i=0;i<policyParentTreeLists.length;i++){
					
					var $Div = $("<div/>");
					$Div.attr("id","parentDiv"+i);
					$Div.attr("style","width:auto;height:100px;");
					$("#family").append($Div);
					var $clearDiv= $("<div/>");
					$clearDiv.attr("style","clear:both;");
					$("#family").append($clearDiv);
				}
				if(policyParentTreeLists[0][0].name.length>6){
					name1[0][0]=policyParentTreeLists[0][0].name.substr(0,6)+"...";
				}
				else{
					name1[0][0]=policyParentTreeLists[0][0].name;
				}
			if(policyParentTreeLists.length==1){
				
				var msg="<font style='cursor:pointer' onmouseout='display2()' onmouseover='display1(this.id)' size='3' id='parent+"+policyParentTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
				document.getElementById('cxzc').innerHTML=msg;
				document.getElementById('cxzc').style.visibility = "visible"
				document.getElementById('cx').innerHTML=policyParentTreeLists[0][0].name;

						document.getElementById('tab11').style.visibility = "hidden";
						document.getElementById('tab22').style.visibility = "hidden";
						document.getElementById('tab33').style.visibility = "hidden";
						document.getElementById('tab44').style.visibility = "hidden";
						document.getElementById('tab55').style.visibility = "hidden";
				
			}else {
				
              
				var m=policyParentTreeLists[1].length;			
				for(j=0;j<m;j++){
					if(policyParentTreeLists[1][j].name.length>6){
						name1[1][j]=policyParentTreeLists[1][j].name.substr(0,6)+"...";
					}
					else{
						name1[1][j]=policyParentTreeLists[1][j].name;
					}
				}
				
				var msg="<font style='cursor:pointer' size='3' id='parent+"+policyParentTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
				document.getElementById('cxzc').innerHTML=msg;
				document.getElementById('cx').innerHTML=policyParentTreeLists[0][0].name;

					var msg1,msg2,msg3,msg4,msg5;	
					switch(m){
					case 1:
						var msg="<font style='cursor:pointer' size='3' id='parent+"+policyParentTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
						document.getElementById('cxzc').innerHTML=msg;
						document.getElementById('cxzc').style.visibility = "visible"
						msg1="<font style='cursor:pointer' onmouseout='display2()' onmouseover='display1(this.id)' size='3' id='parent+"+policyParentTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name1[1][0]+"</font>"
						document.getElementById('tab33').innerHTML=msg1;
						document.getElementById('tab3').innerHTML=policyParentTreeLists[1][0].name;

						document.getElementById('tab11').style.visibility = "hidden";
						document.getElementById('tab22').style.visibility = "hidden";
						document.getElementById('tab33').style.visibility = "visible";
						document.getElementById('tab44').style.visibility = "hidden";
						document.getElementById('tab55').style.visibility = "hidden";
					    break;
					case 2:
						var msg="<font style='cursor:pointer' size='3' id='parent+"+policyParentTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
						document.getElementById('cxzc').innerHTML=msg;
						document.getElementById('cxzc').style.visibility = "visible"
						msg1="<font style='cursor:pointer' onmouseout='display2()' onmouseover='display1(this.id)' size='3' id='parent+"+policyParentTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][0]+"</font>"
						msg2="<font style='cursor:pointer' onmouseout='display2()' onmouseover='display1(this.id)' size='3' id='parent+"+policyParentTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][1]+"</font>"
						document.getElementById('tab22').innerHTML=msg1;
						document.getElementById('tab44').innerHTML=msg2;
						document.getElementById('tab2').innerHTML=policyParentTreeLists[1][0].name;
						document.getElementById('tab4').innerHTML=policyParentTreeLists[1][1].name;
						document.getElementById('tab11').style.visibility = "hidden";
					    document.getElementById('tab22').style.visibility = "visible";
					    document.getElementById('tab33').style.visibility = "hidden";
					    document.getElementById('tab44').style.visibility = "visible";
					    document.getElementById('tab55').style.visibility = "hidden";
					  
					    break;
					case 3:
						var msg="<font style='cursor:pointer' size='3' id='parent+"+policyParentTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
						document.getElementById('cxzc').innerHTML=msg;
						document.getElementById('cxzc').style.visibility = "visible"
						msg1="<font style='cursor:pointer' onmouseout='display2()' onmouseover='display1(this.id)' size='3' id='parent+"+policyParentTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][0]+"</font>"
						msg2="<font style='cursor:pointer' onmouseout='display2()' onmouseover='display1(this.id)' size='3' id='parent+"+policyParentTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][1]+"</font>"
						msg3="<font style='cursor:pointer' onmouseout='display2()' onmouseover='display1(this.id)' size='3' id='parent+"+policyParentTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][2]+"</font>"										  
						document.getElementById('tab22').innerHTML=msg1;
						document.getElementById('tab33').innerHTML=msg2;
						document.getElementById('tab44').innerHTML=msg3;
						document.getElementById('tab2').innerHTML=policyParentTreeLists[1][0].name;
						document.getElementById('tab3').innerHTML=policyParentTreeLists[1][1].name;
						document.getElementById('tab4').innerHTML=policyParentTreeLists[1][2].name;

						document.getElementById('tab11').style.visibility ="hidden";
					    document.getElementById('tab22').style.visibility ="visible";
					    document.getElementById('tab33').style.visibility="visible";
					    document.getElementById('tab44').style.visibility ="visible";
					    document.getElementById('tab55').style.visibility ="hidden";
					    break;
					case 4:
						var msg="<font style='cursor:pointer' size='3' id='parent+"+policyParentTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
						document.getElementById('cxzc').innerHTML=msg;
						document.getElementById('cxzc').style.visibility = "visible"
							
						msg1="<font style='cursor:pointer' onmouseout='display2()' onmouseover='display1(this.id)' size='3' id='parent+"+policyParentTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][0]+"</font>"
						msg2="<font style='cursor:pointer' onmouseout='display2()' onmouseover='display1(this.id)' size='3' id='parent+"+policyParentTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][1]+"</font>"
						msg3="<font style='cursor:pointer' onmouseout='display2()' onmouseover='display1(this.id)' size='3' id='parent+"+policyParentTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][2]+"</font>"					  
						msg4="<font style='cursor:pointer' onmouseout='display2()' onmouseover='display1(this.id)' size='3' id='parent+"+policyParentTreeLists[1][3].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][3]+"</font>"	
						document.getElementById('tab11').innerHTML=msg1;
						document.getElementById('tab22').innerHTML=msg2;
						document.getElementById('tab33').innerHTML=msg3;
						document.getElementById('tab44').innerHTML=msg4;
						document.getElementById('tab1').innerHTML=policyParentTreeLists[1][0].name;
						document.getElementById('tab2').innerHTML=policyParentTreeLists[1][1].name;
						document.getElementById('tab3').innerHTML=policyParentTreeLists[1][2].name;
						document.getElementById('tab4').innerHTML=policyParentTreeLists[1][3].name;

						document.getElementById('tab11').style.visibility = "visible";
					    document.getElementById('tab22').style.visibility = "visible";
					    document.getElementById('tab33').style.visibility = "visible";
					    document.getElementById('tab44').style.visibility = "visible";
					    document.getElementById('tab55').style.visibility = "hidden";
					    break;
					case 5:
						
						var msg="<font style='cursor:pointer' size='3' id='parent+"+policyParentTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
						document.getElementById('cxzc').innerHTML=msg;
						document.getElementById('cxzc').style.visibility = "visible"
						msg1="<font style='cursor:pointer'  size='3' id='parent+"+policyParentTreeLists[1][0].id+"'  onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name1[1][0]+"</font>"
						msg2="<font style='cursor:pointer'  size='3' id='parent+"+policyParentTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'  >"+name1[1][1]+"</font>"
						msg3="<font style='cursor:pointer'  size='3' id='parent+"+policyParentTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name1[1][2]+"</font>"					  
					    msg4="<font style='cursor:pointer'  size='3' id='parent+"+policyParentTreeLists[1][3].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name1[1][3]+"</font>"	
						msg5="<font style='cursor:pointer'  size='3' id='parent+"+policyParentTreeLists[1][4].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name1[1][4]+"</font>"	
						document.getElementById('tab11').innerHTML=msg1;
						document.getElementById('tab22').innerHTML=msg2;
						document.getElementById('tab33').innerHTML=msg3;
						document.getElementById('tab44').innerHTML=msg4;
						document.getElementById('tab55').innerHTML=msg5;
						document.getElementById('tab1').innerHTML=policyParentTreeLists[1][0].name;
						document.getElementById('tab2').innerHTML=policyParentTreeLists[1][1].name;
						document.getElementById('tab3').innerHTML=policyParentTreeLists[1][2].name;
						document.getElementById('tab4').innerHTML=policyParentTreeLists[1][3].name;
						document.getElementById('tab5').innerHTML=policyParentTreeLists[1][4].name;
						document.getElementById('tab11').style.visibility = "visible";
					    document.getElementById('tab22').style.visibility = "visible";
					    document.getElementById('tab33').style.visibility = "visible";
					    document.getElementById('tab44').style.visibility = "visible";
					    document.getElementById('tab55').style.visibility = "visible";
					    break;
					    default:
					    var msg="<font style='cursor:pointer' size='3' id='parent+"+policyParentTreeLists[0][0].id+"'  onclick='showPolicyByPolicyId(this.id)' >"+name1[0][0]+"</font>";
						document.getElementById('cxzc').innerHTML=msg;
						document.getElementById('cxzc').style.visibility = "visible"
					    msg1="<font style='cursor:pointer' size='3' id='parent+"+policyParentTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][0]+"</font>"
					    msg2="<font style='cursor:pointer' size='3' id='parent+"+policyParentTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][1]+"</font>"
						msg3="<font style='cursor:pointer' size='3' id='parent+"+policyParentTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][2]+"</font>"					  
					    msg4="<font style='cursor:pointer' size='3' id='parent+"+policyParentTreeLists[1][3].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name1[1][3]+"</font>"
						msg5="<font>更多。。。</font>"
					    document.getElementById('tab11').innerHTML=msg1;
						document.getElementById('tab22').innerHTML=msg2;
						document.getElementById('tab33').innerHTML=msg3;
						document.getElementById('tab44').innerHTML=msg4;
						document.getElementById('tab55').innerHTML=msg5;
						document.getElementById('tab11').style.visibility = "visible";
						document.getElementById('tab22').style.visibility = "visible";
						document.getElementById('tab33').style.visibility = "visible";
					    document.getElementById('tab44').style.visibility = "visible";
						document.getElementById('tab55').style.visibility = "visible";
						break;
					}
				
			}
				/*
				 * 获取子孙政策树结构
				 */
			
			
				for(i=1;i<policyChildTreeLists.length;i++){
					
					var $Div = $("<div/>");
					$Div.attr("id","childDiv"+i);
					$Div.attr("style","width:auto;height:100px;");
					$("#child").append($Div);
					var $clearDiv= $("<div/>");
					$clearDiv.attr("style","clear:both;");
					$("#child").append($clearDiv);
				}
				var name=new Array();
				for(var k=0;k<10;k++){
					name[k]=new Array();
					for(var j=0;j<10;j++){
						name[k][j]="";
					}
				}
				if(policyChildTreeLists.length==1){
					document.getElementById('tab1111').style.visibility = "hidden";
					document.getElementById('tab2222').style.visibility = "hidden";
					document.getElementById('tab3333').style.visibility = "hidden";
					document.getElementById('tab4444').style.visibility = "hidden";
					document.getElementById('tab5555').style.visibility = "hidden";
				}else{
				
				var m=policyChildTreeLists[1].length;
				for(j=0;j<m;j++){
					if(policyChildTreeLists[1][j].name.length>6){
						name[1][j]=policyChildTreeLists[1][j].name.substr(0,6)+"...";
					}
					else{
						name[1][j]=policyChildTreeLists[1][j].name;
					}
				}
				
					var msg1,msg2,msg3,msg4,msg5;	
					switch(m){
					case 1:
						msg1="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name[1][0]+"</font>"
						document.getElementById('tab3333').innerHTML=msg1;
						document.getElementById('tab333').innerHTML=policyChildTreeLists[1][0].name;

					    document.getElementById('tab1111').style.visibility = "hidden";
						document.getElementById('tab2222').style.visibility = "hidden";
						document.getElementById('tab3333').style.visibility = "visible";
						document.getElementById('tab4444').style.visibility = "hidden";
						document.getElementById('tab5555').style.visibility = "hidden";
					    break;
					case 2:
						msg1="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][0]+"</font>"
						msg2="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][1]+"</font>"
						document.getElementById('tab2222').innerHTML=msg1;
						document.getElementById('tab4444').innerHTML=msg2;
						document.getElementById('tab222').innerHTML=policyChildTreeLists[1][0].name;
						document.getElementById('tab444').innerHTML=policyChildTreeLists[1][1].name;

						document.getElementById('tab1111').style.visibility = "hidden";
					    document.getElementById('tab2222').style.visibility = "visible";
					    document.getElementById('tab3333').style.visibility = "hidden";
					    document.getElementById('tab4444').style.visibility = "visible";
					    document.getElementById('tab5555').style.visibility = "hidden";
					    break;
					case 3:
						msg1="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][0]+"</font>"
						msg2="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][1]+"</font>"
						msg3="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][2]+"</font>"										  
						document.getElementById('tab2222').innerHTML=msg1;
						document.getElementById('tab3333').innerHTML=msg2;
						document.getElementById('tab4444').innerHTML=msg3;
						document.getElementById('tab222').innerHTML=policyChildTreeLists[1][0].name;
						document.getElementById('tab333').innerHTML=policyChildTreeLists[1][1].name;
						document.getElementById('tab444').innerHTML=policyChildTreeLists[1][2].name;

						document.getElementById('tab1111').style.visibility ="hidden";
					    document.getElementById('tab2222').style.visibility ="visible";
					    document.getElementById('tab3333').style.visibility="visible";
					    document.getElementById('tab4444').style.visibility ="visible";
					    document.getElementById('tab5555').style.visibility ="hidden";
					    break;
					case 4:
						msg1="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][0]+"</font>"
						msg2="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][1]+"</font>"
						msg3="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][2]+"</font>"					  
						msg4="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][3].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][3]+"</font>"	
						document.getElementById('tab1111').innerHTML=msg1;
						document.getElementById('tab2222').innerHTML=msg2;
						document.getElementById('tab3333').innerHTML=msg3;
						document.getElementById('tab4444').innerHTML=msg4;
						document.getElementById('tab111').innerHTML=policyChildTreeLists[1][0].name;
						document.getElementById('tab222').innerHTML=policyChildTreeLists[1][1].name;
						document.getElementById('tab333').innerHTML=policyChildTreeLists[1][2].name;
						document.getElementById('tab444').innerHTML=policyChildTreeLists[1][3].name;

						document.getElementById('tab1111').style.visibility = "visible";
					    document.getElementById('tab2222').style.visibility = "visible";
					    document.getElementById('tab3333').style.visibility = "visible";
					    document.getElementById('tab4444').style.visibility = "visible";
					    document.getElementById('tab5555').style.visibility = "hidden";
					    break;
					case 5:
						
						msg1="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name[1][0]+"</font>"
						msg2="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name[1][1]+"</font>"
						msg3="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'  >"+name[1][2]+"</font>"					  
					    msg4="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][3].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)' >"+name[1][3]+"</font>"	
						msg5="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][4].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][4]+"</font>"	
						document.getElementById('tab1111').innerHTML=msg1;
						document.getElementById('tab2222').innerHTML=msg2;
						document.getElementById('tab3333').innerHTML=msg3;
						document.getElementById('tab4444').innerHTML=msg4;
						document.getElementById('tab5555').innerHTML=msg5;
						document.getElementById('tab111').innerHTML=policyChildTreeLists[1][0].name;
						document.getElementById('tab222').innerHTML=policyChildTreeLists[1][1].name;
						document.getElementById('tab333').innerHTML=policyChildTreeLists[1][2].name;
						document.getElementById('tab444').innerHTML=policyChildTreeLists[1][3].name;
						document.getElementById('tab555').innerHTML=policyChildTreeLists[1][4].name;

						document.getElementById('tab1111').style.visibility = "visible";
					    document.getElementById('tab2222').style.visibility = "visible";
					    document.getElementById('tab3333').style.visibility = "visible";
					    document.getElementById('tab4444').style.visibility = "visible";
					    document.getElementById('tab5555').style.visibility = "visible";
					    break;
					    default:
					    msg1="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][0].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][0]+"</font>"
					    msg2="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][1].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][1]+"</font>"
						msg3="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][2].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][2]+"</font>"					  
					    msg4="<font style='cursor:pointer' size='3' id='child+"+policyChildTreeLists[1][3].id+"' onclick='policysubmit1(this.id)' ondblclick='showPolicyByPolicyId(this.id)'>"+name[1][3]+"</font>"
						msg5="<font onclick='morepolicy()' size='3'>更多。。。</font>"
					    document.getElementById('tab1111').innerHTML=msg1;
						document.getElementById('tab2222').innerHTML=msg2;
						document.getElementById('tab3333').innerHTML=msg3;
						document.getElementById('tab4444').innerHTML=msg4;
						document.getElementById('tab5555').innerHTML=msg5;
						document.getElementById('tab111').innerHTML=policyChildTreeLists[1][0].name;
						document.getElementById('tab222').innerHTML=policyChildTreeLists[1][1].name;
						document.getElementById('tab333').innerHTML=policyChildTreeLists[1][2].name;
						document.getElementById('tab444').innerHTML=policyChildTreeLists[1][3].name;

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

/*
 * 点击更多，显示全部政策表
 */
function morepolicy(){
	var i,j;
	var msg="<table border='1' width='100%' align='center'><tr><td width='25'><font size='3' color='blue'><strong>上位政策</strong></font></td> "
		if(policyParentTreeLists.length==1){
			msg+="<td><font size='3'>"+'该政策没有上位政策'+"</font></td></tr>";
		}
		else{
			msg+="<td>"
	for(i=0;i<policyParentTreeLists[1].length;i++){
		 msg+="<div><font size='3' style='cursor:pointer' id='parent+"+policyParentTreeLists[1][i].id+"' onclick='showPolicyByPolicyId(this.id)' >"+policyParentTreeLists[1][i].name+"</font></div>";
	}
		}
	msg+="</td></tr>"
	msg+="<tr height='50'><td><font style='font-weight:bold;' size='3' color='red'>查询政策<font></td>"+
	"<td><div><font size='3' style='cursor:pointer' id='parent+"+policyParentTreeLists[0][0].id+"' onclick='showPolicyByPolicyId(this.id)'>"+policyParentTreeLists[0][0].name+"</font></div></td></tr>"
	msg+="<tr><td><font size='3' color='blue' style='font-weight:bold;'>下位政策</font></td><td>"
	for(j=0;j<policyChildTreeLists[1].length;j++){
		msg+="<div><font size='3' style='cursor:pointer' id='child+"+policyChildTreeLists[1][j].id+"' onclick='showPolicyByPolicyId(this.id)'>"+policyChildTreeLists[1][j].name+"</font></div>";
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
	
	if(id=="parent"){
  			id=thisa.substring(7,thisa.length);
			policyId=getPolicyIdById(id,policyParentTreeLists);
	}else{
  			id=thisa.substring(6,thisa.length);
  			
			policyId=getPolicyIdById(id,policyChildTreeLists);
	}
	window.location="zcfxzclook.do?pno="+policyId;
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
function setbgcolor(){
	var id=document.getElementsByTagName("tr");
	alert(id);
	
	
}
function policysubmit1(thisa){
var id=thisa.substring(0,6);
	$('#tab0').empty();
	var name="";
	
	if(id=="parent"){
  			id=thisa.substring(7,thisa.length);
			policyId=getPolicyIdById(id,policyParentTreeLists);
	}else{
  			id=thisa.substring(6,thisa.length);
  			
			policyId=getPolicyIdById(id,policyChildTreeLists);
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
			}
		}
	});
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