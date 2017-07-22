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
				
				var one=0;
				for(i=0;i<policyParentTreeLists.length;i++){
					if(policyParentTreeLists[i].length==1){
						one++;
					}
				}
				one--;

				for (i = 0; i < policyParentTreeLists.length; i++) {
					for(j=0;j<policyParentTreeLists[i].length;j++){
						var isnew=policyParentTreeLists[i][j].isnew;
						var $versionA = $("<a/>");
						if(policyParentTreeLists[i][j].name.length>6){
							name=policyParentTreeLists[i][j].name.substr(0,6)+"...";
						}
						else{
							name=policyParentTreeLists[i][j].name;
						}
                    	$versionA.text(name);
                   	 	$versionA.css("cursor", "pointer");
                    	$versionA.unbind("click");
                    	$versionA.bind("click", function(){
                        	showPolicyByPolicyId($(this));
                   		});
						var $Span= $("<div/>");
						var pointDepth=policyParentTreeLists.length-i-1;
						parentDivName="#parentDiv"+pointDepth;
						var parentSpan11="parentSpan"+policyParentTreeLists[i][j].id;
						$Span.attr("id",parentSpan11);
						var margin_left=500-policyParentTreeLists[i].length*100;
						if(j==0&&i==0){
							if(isnew=="0"){
								$Span.attr("style","cursor:pointer;width:180px;float:left;background:url(../images/policy/policy_bg_this.png) no-repeat;display:block;line-height:80px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;");
							}
							else{
								$Span.attr("style","border:1px solid #BCEE68;cursor:pointer;width:180px;float:left;background:url(../images/policy/policy_bg_this.png) no-repeat;display:block;line-height:80px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;");
							}
						}
						else if(j==0&&i!=0){
							if(isnew=="0"){
								$Span.attr("style","cursor:pointer;width:180px;float:left;background:url(../images/policy/policy_bg_family.png) no-repeat;display:block;line-height:80px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;");
							}
							else{
								$Span.attr("style","border:1px solid #BCEE68;cursor:pointer;width:180px;float:left;background:url(../images/policy/policy_bg_family.png) no-repeat;display:block;line-height:80px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;");
							}
						}
						else if(j!=0){
							if(isnew=="0"){
								$Span.attr("style","cursor:pointer;width:180px;float:left;background:url(../images/policy/policy_bg_family.png) no-repeat;display:block;line-height:80px;text-align:center;height:85px;margin-left:25px;margin-top:50px;");
							}
							else{
								$Span.attr("style","border:1px solid #BCEE68;cursor:pointer;width:180px;float:left;background:url(../images/policy/policy_bg_family.png) no-repeat;display:block;line-height:80px;text-align:center;height:85px;margin-left:25px;margin-top:50px;");
							}
						}
						$Span.append($versionA);
						$(parentDivName).append($Span);
						var spanname1="#parentSpan"+policyParentTreeLists[i][j].id;
						var y1 = $(spanname1).offset().top; 
						var x1 = $(spanname1).offset().left; 
						
						$(spanname1).mouseover(function(){
							policyNameShow="";
							policyIdShow=$(this).attr("id").substring(10,$(this).attr("id").length);
							for(var k=0;k<policyParentTreeLists.length;k++)
								for(var l=0;l<policyParentTreeLists[k].length;l++){
									if(policyParentTreeLists[k][l].id==policyIdShow){
										policyNameShow=policyParentTreeLists[k][l].name+"("+policyParentTreeLists[k][l].policyId+")";
										break;
									}
								}
							var offset = $(this).offset();
							$("#showDiv").text(policyNameShow);
							$("#showDiv").css("left",offset.left+127);
							$("#showDiv").css("top",offset.top);
							$("#showDiv").show();
						});
						$(spanname1).bind("mouseout",function(){
								$("#showDiv").hide();
						});
	
						if(policyParentTreeLists[i][j].parentPolicyId!=null&&policyParentTreeLists[i][j].parentPolicyId!=""){
							
							var spanname2="#parentSpan"+getIdByPolicyId(policyParentTreeLists[i][j].parentPolicyId,policyParentTreeLists);
							var y2 = $(spanname2).offset().top; 
							var x2 = $(spanname2).offset().left; 
							var x=x2-x1;
							var y=y2-y1-60;
							if(x>=0){
								var z=x/y;
								for(var m=1;m<=y;m++){
										var top=y2-m+47;
										if(x==0)
										{
											top=top+38*one;
										}
										var left=x2-m*z+96;
										top=top-38;
										if(i==1){
											top=top+38;
											if(policyParentTreeLists[i].length==1)
											{
												top=top-38;
											}
										}
										if(policyParentTreeLists[i].length==1)
											{
												top=top-38;
											}
										left=left-5;
										$DivSmall=$("<div/>");
										$DivSmall.attr("style","position:absolute;top:"+top+"px;left:"+left+"px;width:1px;height:1px;background:#D2691E");
										$("#body").append($DivSmall);
								}
								if(x==0)
								{
									one--;
								}
							}
							else if(x<0){
								var z=-x/y;
								for(var m=1;m<=y;m++){
										var top=y2-m+11;
										var left=x2+m*z+96;
										if(j!=0){
											top=top-2;
											left=left-5;
										}
										if(i==1){
											top=top+38;
										}
										$DivSmall=$("<div/>");
										$DivSmall.attr("style","position:absolute;top:"+top+"px;left:"+left+"px;width:1px;height:1px;background:#D2691E");
										$("#body").append($DivSmall);
								}
							}
						}
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
				
				for (i = 1; i < policyChildTreeLists.length; i++) {
					for(j=0;j<policyChildTreeLists[i].length;j++){
						var isnew=policyChildTreeLists[i][j].isnew;
						var $versionA = $("<a/>");
						if(policyChildTreeLists[i][j].name.length>6){
							name=policyChildTreeLists[i][j].name.substr(0,6)+"...";
						}
						else{
							name=policyChildTreeLists[i][j].name;
						}
                    	$versionA.text(name);
                   	 	$versionA.css("cursor", "pointer");
                    	$versionA.unbind("click");
                    	$versionA.bind("click", function(){
                        	showPolicyByPolicyId($(this));
                   		});
						var $Span= $("<div/>");
						parentDivName="#childDiv"+i;
						var parentSpan11="childSpan"+policyChildTreeLists[i][j].id;
						$Span.attr("id",parentSpan11);
						var margin_left=500-policyChildTreeLists[i].length*100;
						if(policyChildTreeLists[i].length>5){
							margin_left=25;
						}
						if(j==0){
							if(isnew=="0"){
								$Span.attr("style","width:180px;float:left;background:url(../images/policy/policy_bg_child.png) no-repeat;display:block;line-height:80px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;");
							}
							else{
								$Span.attr("style","border:1px solid #BCEE68;width:180px;float:left;background:url(../images/policy/policy_bg_child.png) no-repeat;display:block;line-height:80px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;");
							}
						}
						else if(j!=0){
							if (isnew == "0") {
								$Span.attr("style","width:180px;float:left;background:url(../images/policy/policy_bg_child.png) no-repeat;display:block;line-height:80px;text-align:center;height:85px;margin-left:25px;margin-top:50px;");
							}
							else{
								$Span.attr("style","border:1px solid #BCEE68;width:180px;float:left;background:url(../images/policy/policy_bg_child.png) no-repeat;display:block;line-height:80px;text-align:center;height:85px;margin-left:25px;margin-top:50px;");
							}
						}
						$Span.append($versionA);
						$(parentDivName).append($Span);
						var spanname1="#childSpan"+policyChildTreeLists[i][j].id;
						var y2 = $(spanname1).offset().top; 
						var x2 = $(spanname1).offset().left; 
						
						$(spanname1).mouseover(function(){
							policyNameShow="";
							policyIdShow=$(this).attr("id").substring(9,$(this).attr("id").length);
							for(var k=0;k<policyChildTreeLists.length;k++)
								for(var l=0;l<policyChildTreeLists[k].length;l++){
									if(policyChildTreeLists[k][l].id==policyIdShow){
										policyNameShow=policyChildTreeLists[k][l].name+"("+policyChildTreeLists[k][l].policyId+")";
										break;
									}
								}
							var offset = $(this).offset();
							$("#showDiv").text(policyNameShow);
							$("#showDiv").css("left",offset.left+127);
							$("#showDiv").css("top",offset.top);
							$("#showDiv").show();
						});
						$(spanname1).bind("mouseout",function(){
								$("#showDiv").hide();
						});
						
						if(policyChildTreeLists[i][j].parentPolicyId!=null&&policyChildTreeLists[i][j].parentPolicyId!=""){
							var spanname2;
							if(policyChildTreeLists[i][j].parentPolicyId==policyChildTreeLists[0][0].policyId)
							{
								spanname2="#parentSpan"+getIdByPolicyId(policyChildTreeLists[i][j].parentPolicyId,policyChildTreeLists);
							}
							else{
								spanname2="#childSpan"+getIdByPolicyId(policyChildTreeLists[i][j].parentPolicyId,policyChildTreeLists);
							}
							var y1 = $(spanname2).offset().top; 
							var x1 = $(spanname2).offset().left; 
							var x=x2-x1;
							var y=y2-y1-70;
							if(x>=0){
								var z=x/y;
								for(var m=0;m<=y;m++){
										var top=y2-m+7;
										var left=x2-m*z+93;
										$DivSmall=$("<div/>");
										$DivSmall.attr("style","position:absolute;top:"+top+"px;left:"+left+"px;width:1px;height:1px;background:#D2691E");
										$("#body").append($DivSmall);
								}
							}
							else if(x<0){
								var z=-x/y;
								for(var m=1;m<=y;m++){
										var top=y2-m+5;
										var left=x2+m*z+93;
										$DivSmall=$("<div/>");
										$DivSmall.attr("style","position:absolute;top:"+top+"px;left:"+left+"px;width:1px;height:1px;background:#D2691E");
										$("#body").append($DivSmall);
								}
							}
						}
					}
				}
			}
			else{
				alert('操作有误，请重试！');
			}
		}
	});
}

/*
 * 根据政策文号获取政策详细信息
 */
function showPolicyByPolicyId(thisa){
	var parameter;
	var policyId;
	var id=$(thisa).parent().attr("id").substring(0,6);
	if(id=="parent"){
  			id=$(thisa).parent().attr("id").substring(10,$(thisa).parent().attr("id").length);
			policyId=getPolicyIdById(id,policyParentTreeLists);
	}else{
  			id=$(thisa).parent().attr("id").substring(9,$(thisa).parent().attr("id").length);
			policyId=getPolicyIdById(id,policyChildTreeLists);
	}
	window.location="../ZCLookServlet1?pno="+policyId;
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