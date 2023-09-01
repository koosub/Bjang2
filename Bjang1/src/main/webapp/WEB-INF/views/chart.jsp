<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<style>
	.chart{
		width: 450px;
		height: 200px;
		float: left;
		margin: 80px;		
	}
</style>
<body>
<div class="chart">
<canvas id="bar-chart" width="200px" height="150px"></canvas>
</div>
<div class="chart">
<canvas id="line-chart" width="800" height="450"></canvas>
</div>
<div class="chart">
<canvas id="pie-chart" width="800" height="450"></canvas>
</div>
<div class="chart">
<canvas id="doughnut-chart" width="800" height="450"></canvas>
</div>
<div class="chart">
<canvas id="bar-chart-horizontal" width="800" height="450"></canvas>
</div>
<div class="chart">
<canvas id="bar-chart-grouped" width="800" height="450"></canvas>
</div>

</body>
<script type="text/javascript" src="/resources/js/chart.js">
</script>
</html>
