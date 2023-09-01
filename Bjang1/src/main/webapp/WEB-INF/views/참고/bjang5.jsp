<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>감염병</title>
	
	<style type="text/css">
		
	</style>
</head>

	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sidebars/">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>  
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <!-- Custom styles for this template -->
    <link href="/resources/css/bjang.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6ca3631ca91c49471a26211d7ed34b0"></script>
    <link href="/resources/css/bjang5.css" rel="stylesheet">
<body>
    <div id="map" style="width:640px;height:1080px; position: absolute; z-index: 1"></div>
				<script type="text/javascript">
					var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
					var options = { //지도를 생성할 때 필요한 기본 옵션
						center: new kakao.maps.LatLng(35.5040736, 127.7994855), //지도의 중심좌표.
						level: 12,
						draggable: false
						//지도의 레벨(확대, 축소 정도)
					};
					
					var map = new kakao.maps.Map(container, options);
				</script>
    			<div class="boxcl" style="position:relative; z-index: 2">
	            	<c:forEach var="min" items="${minInfo}">
	            		<div id="${min.keyword2}" class="ab ${min.keyword2}">
		            		<div class="cl" >
								<p style="top:13px; left:20%; right:20%; position: absolute; ">${min.pm}</p>
							</div>
							
	            		</div>
	            	</c:forEach>
				</div>
    
    
    
    
</body>
</html>
