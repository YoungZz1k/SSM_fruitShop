<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
   <title>后台管理中心</title>  
    <script src="${ctx}/resource/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/main.css"/>
     <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.all.min.js"></script>
    <link rel="stylesheet" href="${ctx}/resource/css/reset.css" />
	<link rel="stylesheet" href="${ctx}/resource/css/style.css" />
	<script src="${ctx}/resource/js/Ecalendar.jquery.min.js"></script>
	
	<script src="${ctx }/resource/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/resource/js/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/resource/js/macarons.js"></script>
</head>
<body>

 
  <div class="">

        <div class="result-wrap">
           
           <div class="if_sy_tongyongkuai_cont" id="thscfx" style="height:875px;">
 
		 
		 </div>
        </div>

    </div>
</body>
<script type="text/javascript">
var myChartFjHfl = echarts.init(document.getElementById('thscfx'));
option = {
	    title: {
	        text: "商品销售统计",
	        x: "center"
	    },
	    tooltip: {
	        trigger: "item",
	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    },
	    legend: {
	        x: "left",
	        /* data: ["中药", "西药", "草药"] */
	        data: [
	               <c:forEach items="${maps}" var="spe" varStatus="b">
	                <c:if test="${b.index+1 == fn:length(maps)}">
	                "${spe.name}"
	                </c:if>
	                <c:if test="${b.index+1 != fn:length(maps)}">
	                "${spe.name}",
	                </c:if>
	               </c:forEach>
	               ]
	    },
	    label: {
	        normal: {
	            formatter: "{b} ({d}%)",
	            position: "insideTopRight"
	        }
	    },
	    labelLine: {
	        normal: {
	            smooth: .6
	        }
	    },
	    toolbox: {
	        show: !0,
	        feature: {
	            mark: {
	                show: !0
	            },
	            dataView: {
	                show: !0,
	                readOnly: !1
	            },
	            magicType: {
	                show: !0,
	                type: ["pie", "funnel"]
	            },
	            restore: {
	                show: !0
	            },
	            saveAsImage: {
	                show: !0
	            }
	        }
	    },
	    calculable: !0,
	    series: [{
	        name: "类别",
	        type: "pie",
	        roseType: "area",
	        label: {
	            normal: {
	                show: !0
	            },
	            emphasis: {
	                show: !0
	            }
	        },
	        lableLine: {
	            normal: {
	                show: !0
	            },
	            emphasis: {
	                show: !0
	            }
	        },
	        data: [
	               <c:forEach items="${maps}" var="row" varStatus="b">
	               <c:if test="${b.index+1 == fn:length(maps)}">
	               { name: '${row.name}', value: ${row.value}}
	               </c:if>
	               <c:if test="${b.index+1 != fn:length(maps)}">
	               { name: '${row.name}', value: ${row.value}},
	               </c:if>
	              </c:forEach>
	               ]
	       
	    }]
	};
myChartFjHfl.setOption(option);

</script>

</script>
</html>