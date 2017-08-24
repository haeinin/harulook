<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>

</head>
<style>
canvas {
    -moz-user-select: none;
    -webkit-user-select: none;
    -ms-user-select: none;
}
</style>
</head>
<body>
 
<div style="width: 80%">
    <div>
        <canvas id="canvas" height="350" width="600"></canvas>
    </div>
</div>
 
<script>
var chartLabels = ["1월","2월","3월","4월"];

 
var lineChartData = {
    labels : chartLabels,
    datasets : [ {
        label : "월별 PC 판매량",
        fillColor : "rgba(220,220,220,0.2)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        pointHighlightFill : "#fff",
        pointHighlightStroke : "rgba(220,220,220,1)",
        data : [10,20,30,40,]
    }, {
        label : "월별 모니터 판매량",
        fillColor : "rgba(151,187,205,0.2)",
        strokeColor : "rgba(151,187,205,1)",
        pointColor : "rgba(151,187,205,1)",
        pointStrokeColor : "#fff",
        pointHighlightFill : "#fff",
        pointHighlightStroke : "rgba(151,187,205,1)",
        data : [100,200,300,400]
    } ]
 
}
 

    var ctx = document.getElementById("canvas").getContext("2d");
    LineChartDemo = Chart.Line(ctx, {
        data : lineChartData,
        options : {
            scales : {
                yAxes : [ {
                    ticks : {
                        beginAtZero : true
                    }
                } ]
            }
        }
    });



</script>

</body>
</html>