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
				
				for (i = 0; i < policyBeforeTreeLists.length; i++) {
					for (j = 0; j < policyBeforeTreeLists[i].length; j++){
						var isnew=policyBeforeTreeLists[i][j].isnew;
						var $versionA = $("<a/>");
						if(policyBeforeTreeLists[i][j].name.length>6){
							name=policyBeforeTreeLists[i][j].name.substr(0,6)+"...";
						}
						else{
							name=policyBeforeTreeLists[i][j].name;
						}
	                    $versionA.text(name);
	                    $versionA.css("cursor", "pointer");
	                    $versionA.unbind("click");
	                    $versionA.bind("click", function(){
	                        showPolicyByPolicyId($(this));
	                    });
						
						var $Span= $("<div/>");
						parentDivName="#beforeDiv";
						var pointDepth=policyBeforeTreeLists.length-i-1;
						parentDivName+=pointDepth;
						var parentSpan11="beforeSpan"+policyBeforeTreeLists[i][j].id;
						$Span.attr("id",parentSpan11);
						var margin_left=(maxlength-3)*45+120-policyBeforeTreeLists[i].length*42;
						if(j==0&&i==0){
							if(isnew=="0"){
								$Span.attr("style","width:190px;float:left;height:90px;background:url(../images/policy/policy_bg_this.png) no-repeat;display:block;line-height:90px;text-align:center;margin-top:"+margin_left+"px;margin-left:30px;");
							}
							else{
								$Span.attr("style","border:1px solid #BCEE68;width:190px;float:left;height:90px;background:url(../images/policy/policy_bg_this.png) no-repeat;display:block;line-height:90px;text-align:center;margin-top:"+margin_left+"px;margin-left:30px;");
							}
						}
						if(j==0&&i!=0){
							if(isnew=="0"){
								$Span.attr("style","width:190px;float:left;height:90px;background:url(../images/policy/policy_bg_before.png) no-repeat;display:block;line-height:90px;text-align:center;margin-top:"+margin_left+"px;margin-left:30px;");
							}
							else{
								$Span.attr("style","border:1px solid #BCEE68;width:190px;float:left;height:90px;background:url(../images/policy/policy_bg_before.png) no-repeat;display:block;line-height:90px;text-align:center;margin-top:"+margin_left+"px;margin-left:30px;");
							}
						}
						else if(j!=0){
							if (isnew == "0") {
								$Span.attr("style","width:190px;float:left;height:90px;background:url(../images/policy/policy_bg_before.png) no-repeat;display:block;line-height:90px;text-align:center;margin-top:0px;margin-left:30px;");
							}
							else{
								$Span.attr("style","border:1px solid #BCEE68;width:190px;float:left;height:90px;background:url(../images/policy/policy_bg_before.png) no-repeat;display:block;line-height:90px;text-align:center;margin-top:0px;margin-left:30px;");
							}
						}
						$Span.append($versionA);
						$(parentDivName).append($Span);
						var spanname1="#beforeSpan"+policyBeforeTreeLists[i][j].id;
						var y1 = $(spanname1).offset().top; 
						var x1 = $(spanname1).offset().left; 
						
						$(spanname1).mouseover(function(){
							policyNameShow="";
							policyIdShow=$(this).attr("id").substring(10,$(this).attr("id").length);
							for(var k=0;k<policyBeforeTreeLists.length;k++)
								for(var l=0;l<policyBeforeTreeLists[k].length;l++){
									if(policyBeforeTreeLists[k][l].id==policyIdShow){
										policyNameShow=policyBeforeTreeLists[k][l].name+"("+policyBeforeTreeLists[k][l].policyId+")";
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
						
						if(policyBeforeTreeLists[i][j].parentPolicyId!=null&&policyBeforeTreeLists[i][j].parentPolicyId!=""){
							var spanname2="#beforeSpan"+getIdByPolicyId(policyBeforeTreeLists[i][j].parentPolicyId,policyBeforeTreeLists);
							var y2 = $(spanname2).offset().top; 
							var x2 = $(spanname2).offset().left; 
							var x=x2-x1;
							var y=y2-y1;
							if(y>=0){
								var z=y/x;
								
								for(var m=1;m<=x;m++){
										var top=y2-m*z+45;
										var left=x2-m+96;
										if(y==0)
										{
											left=left+187*one;
										}
										if(i==1){
											left=left+187;
											if(policyBeforeTreeLists[i].length==1)
											{
												left=left-187;
											}
										}
										if(policyBeforeTreeLists[i].length==1)
										{
											left=left-187;
										}
										$DivSmall=$("<div/>");
										$DivSmall.attr("style","position:absolute;top:"+top+"px;left:"+left+"px;width:1px;height:1px;background:#D2691E");
										$("#body").append($DivSmall);
								}
								if(y==0)
								{
									one--;
								}
							}
							else if(y<0){
								var z=-y/x;
								for(var m=1;m<=x;m++){
										var top=y2+m*z+11+30;
										var left=x2-m+96;
										if(i==1){
											left=left+187;
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
				 * 获取后继政策树结构
				 */
				for(i=1;i<policyAfterTreeLists.length;i++){
					var $Div = $("<div/>");
					$Div.attr("id","afterDiv"+i);
					$Div.attr("style","width:190px;height:auto;float:left;");
					$("#family").append($Div);
				}
				
				for (i = 1; i < policyAfterTreeLists.length; i++) {
					for (j = 0; j < policyAfterTreeLists[i].length; j++) {
						var $versionA = $("<a/>");
						var isnew=policyAfterTreeLists[i][j].isnew;
						if(policyAfterTreeLists[i][j].name.length>6){
							name=policyAfterTreeLists[i][j].name.substr(0,6)+"...";
						}
						else{
							name=policyAfterTreeLists[i][j].name;
						}
						
	                    $versionA.text(name);
	                    $versionA.css("cursor", "pointer");
	                    $versionA.unbind("click");
	                    $versionA.bind("click", function(){
	                        showPolicyByPolicyId($(this));
	                    });
						
						var $Span= $("<div/>");
						parentDivName="#afterDiv"+i;
						var parentSpan11="afterSpan"+policyAfterTreeLists[i][j].id;
						$Span.attr("id",parentSpan11);
						var margin_left=(maxlength-3)*45+120-policyAfterTreeLists[i].length*42;
						if(j==0){
							if(isnew=="0"){
								$Span.attr("style","width:190px;float:left;background:url(../images/policy/policy_bg_after.png) no-repeat;display:block;line-height:90px;text-align:center;height:90px;margin-top:"+margin_left+"px;margin-left:30px;");
							}
							else{
								$Span.attr("style","border:1px solid #BCEE68;width:190px;float:left;background:url(../images/policy/policy_bg_after.png) no-repeat;display:block;line-height:90px;text-align:center;height:90px;margin-top:"+margin_left+"px;margin-left:30px;");
							}
						}
						else if(j!=0){
							if (isnew == "0") {
								$Span.attr("style","width:190px;float:left;background:url(../images/policy/policy_bg_after.png) no-repeat;display:block;line-height:90px;text-align:center;height:90px;margin-left:30px;margin-top:0px;");
							}
							else{
								$Span.attr("style","border:1px solid #BCEE68;width:190px;float:left;background:url(../images/policy/policy_bg_after.png) no-repeat;display:block;line-height:90px;text-align:center;height:90px;margin-left:30px;margin-top:0px;");
							}
						}
						$Span.append($versionA);
						$(parentDivName).append($Span);
						var spanname1="#afterSpan"+policyAfterTreeLists[i][j].id;
						var y2 = $(spanname1).offset().top; 
						var x2 = $(spanname1).offset().left; 
						
						$(spanname1).mouseover(function(){
							policyNameShow="";
							policyIdShow=$(this).attr("id").substring(9,$(this).attr("id").length);
							for(var k=0;k<policyAfterTreeLists.length;k++)
								for(var l=0;l<policyAfterTreeLists[k].length;l++){
									if(policyAfterTreeLists[k][l].id==policyIdShow){
										policyNameShow=policyAfterTreeLists[k][l].name+"("+policyAfterTreeLists[k][l].policyId+")";
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
						
						if(policyAfterTreeLists[i][j].parentPolicyId!=null&&policyAfterTreeLists[i][j].parentPolicyId!=""){
							var spanname2;
							if(policyAfterTreeLists[i][j].parentPolicyId==policyAfterTreeLists[0][0].policyId)
							{
								spanname2="#beforeSpan"+getIdByPolicyId(policyAfterTreeLists[i][j].parentPolicyId,policyAfterTreeLists);
							}
							else{
								spanname2="#afterSpan"+getIdByPolicyId(policyAfterTreeLists[i][j].parentPolicyId,policyAfterTreeLists);
							}
							var y1 = $(spanname2).offset().top; 
							var x1 = $(spanname2).offset().left; 
							var x=x2-x1;
							var y=y2-y1;
							if(y>=0){
								var z=y/x;
								for(var m=1;m<=x;m++){
										var top=y2-m*z+45;
										var left=x2-m+96;
										$DivSmall=$("<div/>");
										$DivSmall.attr("style","position:absolute;top:"+top+"px;left:"+left+"px;width:1px;height:1px;background:#D2691E");
										$("#body").append($DivSmall);
								}
							}
							else if(y<0){
								var z=-y/x;
								for(var m=1;m<=x;m++){
										var top=y2+m*z+41;
										var left=x2-m+96;
										$DivSmall=$("<div/>");
										$DivSmall.attr("style","position:absolute;top:"+top+"px;left:"+left+"px;width:1px;height:1px;background:#D2691E");
										$("#body").append($DivSmall);
								}
							}
						}
					}
				}
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
	if(id=="before"){
  			id=$(thisa).parent().attr("id").substring(10,$(thisa).parent().attr("id").length);
			policyId=getPolicyIdById(id,policyBeforeTreeLists);
	}else{
  			id=$(thisa).parent().attr("id").substring(9,$(thisa).parent().attr("id").length);
			policyId=getPolicyIdById(id,policyAfterTreeLists);
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