<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*,com.satp.entity.*, java.util.ArrayList,net.sf.json.JSONArray;" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>政策统计</title>
		<style type="text/css">
		body { font:14px/1.5  宋体,宋体, \5b8b\4f53, sans-serif; }
		a { margin-left:5px; color:#07F; text-decoration:none; }
		a:hover { text-decoration:underline; }
		th{
			border-color: #666666;
			background-color: #dedede;
		}
		</style>
		<script src="js1/jquery.js"></script>
		<script src="js/highcharts.js"></script>
		<script src="js/exporting.js"></script>
		<script type="text/javascript">
		<% 
		String sql=(String)request.getAttribute("sql");
		ArrayList<Highcharts> highchartslist = (ArrayList<Highcharts>)request.getAttribute("highchartslist");
		String CXZD1=(String)request.getAttribute("CXZD1");
		   String[] cats=null;
		   StringBuffer jsonresult = new StringBuffer();
	       JSONArray jsonArrayResult = new JSONArray();
	       JSONArray jsonArrayResul2 = new JSONArray();

	       jsonresult.append("[");
	       for(Highcharts highcharts:highchartslist)
			{
				jsonArrayResult.add(highcharts.getName());
				jsonresult.append("['"+highcharts.getName()+"',"+highcharts.getNumber()+"],");
			}
	       for(Highcharts highcharts:highchartslist)
			{
	    	   jsonArrayResul2.add(highcharts.getNumber());
			}
	       jsonresult.append("]");
		%>
	$(function () {
	        var colors = Highcharts.getOptions().colors,
	            categories =<%=jsonArrayResult%> ,
	            name ='<%=CXZD1%>',
	            data =
	            	  [<%
	            	   int len=jsonArrayResult.size();
	            	   for(int i=0;i<len;i++)
	            	   {
	            	   %>
	            	   {
	                    y:<%=jsonArrayResul2.get(i) %>,
	                    color: colors[<%=i%>]
	                    },
	            	   <%}%>
	                   <%-- /*, {
	                    y:<%=jsonArrayResul2.get(1) %>,
	                    color: colors[1],
	                    drilldown: {
	                        name: '行政法规',
	                        categories: ['施行中', '审核中', '过期'],
	                        data: [20, 60, 10],
	                        color: colors[1]
	                    } 
	                }, {
	                    y: 0,
	                    color: colors[2],
	                    drilldown: {
	                        name: '地方性法规',
	                        categories: ['施行中', '审核中', '过期'],
	                        data: [20, 6, 5],
	                        color: colors[2]
	                    } 
	                }, {
	                    y: 26,
	                    color: colors[3],
	                     drilldown: {
	                        name: '国务院部门规章',
	                        categories: ['施行中', '审核中', '过期'],
	                        data: [10, 6, 10],
	                        color: colors[3]
	                    } 
	                }, {
	                    y: 26,
	                    color: colors[4],
	                     drilldown: {
	                        name: '地方政府规章',
	                        categories: ['施行中', '审核中', '过期'],
	                        data: [10, 6, 10],
	                        color: colors[4]
	                    } 
	                }, {
	                    y: 190,
	                    color: colors[5],
	                    drilldown: {
	                        name: '规范性文件',
	                        categories: ['施行中', '审核中', '过期'],
	                        data: [120, 60, 10],
	                        color: colors[5]
	                    } 
	                }*/ --%>];
	    
	        function setChart(name, categories, data, color) {
				chart.xAxis[0].setCategories(categories, false);
				chart.series[0].remove(false);
				chart.addSeries({
					name: name,
					data: data,
					color: color || 'blue'
				}, false);
				chart.redraw();
	        }   
	        var chart = $('#container').highcharts({
	            chart: {
	                type: 'column'
	            },
	            title: {
	                text: '河北省科技政策数据库管理政策类别统计',
	                style: {
	     				color: '#000000',
	     				fontSize: '20px'
	        		}

	            },
	           
	            xAxis: {
	                categories: categories
	            },
	            yAxis: {
	                title: {
	                    text: ''
	                }
	            },
	            plotOptions: {
	                column: {
	                	showInLegend: false,
	                    cursor: 'pointer',
	                    point: {
	                        events: {
	                            click: function(e) {
	                            	window.location="ZcDetailed?Cname="+e.point.category+"&sql="+"<%=sql%>";
	                            }
	                        } 
	                    },
	                    dataLabels: {
	                        enabled: true,
	                        color: 'red',
	                        style: {
	                            fontWeight: 'bold'
	                        },
	                        formatter: function() {
	                            return this.y;
	                        }
	                    }
	                }
	            },
	            tooltip: {
	                formatter: function() {
	                    var point = this.point,
	                        s = "<center>"+this.x +"</center>"+'<br/>库存总数:<b>'+ this.y +'</b><br/><br/>';
	                    if (point.drilldown) {
	                        s += '点击 '+ point.category +' 查看详细';
	                    } else {
	                        s += '<政策分类>';
	                    }
	                    return s;
	                }
	            },
	            series: [{
	                name: name,
	                data: data,
	                color: 'blue'
	            }],
	            exporting: {
	                enabled: true
	            }
	        })
	        .highcharts(); 
	        
	        $('#container2').highcharts({
	        	chart: {
		        	plotBackgroundColor: null,
		        	plotBorderWidth: null,
		        	plotShadow: false
	        	},
	        	title: {
	        		text: '河北省科技政策数据库管理政策类别统计'
	        	},
	        	tooltip: {
	        	pointFormat: '<br/><b><br/>{series.name}:{point.y}</b>'      	
	        	},
	        	plotOptions: {
		        	pie: {
			        	allowPointSelect: true,
			        	cursor: 'pointer',
			        	dataLabels: {
			        	enabled: true,
			        	format: '<b>{point.name}</b>: {point.percentage:.1f} %'
			        	},
			        	events: {  
			        		click: function(e) {  
			        		window.location="ZcDetailed?Cname="+e.point.name+"&sql="+"<%=sql%>";
			        		}
			        	},

			        	showInLegend: true
		        	}
	        	},
	        	series: [{
		        	type: 'pie',
		        	name: '政策数：',
		        	data:<%=jsonresult%>
		        	}]
	        	});
	    });

</script>
</head><body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA" onload="exec()">
    <div style="margin-left:92%;margin-top: 10px">
    <input type="button" value="导出数据" onclick="Excel()" style=" border:1px solid #ccc; margin:2px;"/></div>
    <div style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 550px;">
    <input type="hidden" name="sql" value="<%=sql %>">
    <input type="hidden" name="highchartslist" value="<%=highchartslist %>">
    <input type="hidden" name="CXZD1" value="<%=CXZD1 %>">
	<div id="container" style="min-width: 410px; margin: 0 auto;"></div>
	<div id="container2" style="min-width: 410px; margin: 0 auto;"></div>
	</div>
</body>
<script type="text/javascript">
function exec()
{
	$.post("Excelout",function(data){
	},"json");
}
function Excel(){
	$.post("Excelout",function(data){
		if(data.length!=0){
			alert(data);
		}else{
			alert("导出失败，请重试！");
		}
		
	},"json");
	 window.location="DownloadServlet";
}
</script>
</html>
