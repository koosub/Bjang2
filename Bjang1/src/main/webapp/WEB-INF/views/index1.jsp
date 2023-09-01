<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">  
  <title>감염병 발생 현황 | 감염병 빅데이터 혁신서비스</title>  
  <meta name="author" content="(주)데이터스트림즈">
  <meta name="keywords" content="감염병 정보, 해외여행 감염병 정보, 코로나19, 코로나, GIS 기반, 감염병 위기관리, 감염병 통계, 감염병 빅데이터">
	<meta name="description" content="감염병 빅데이터 혁신서비스는 감염병에 대한 정보를 종합적으로 제공합니다.">
  <meta name="twitter:title" content="감염병 빅데이터 혁신서비스">
  <meta name="twitter:description" content="감염병 빅데이터 혁신서비스는 감염병에 대한 정보를 종합적으로 제공합니다.">
  <meta name="twitter:image" content="/resources/images/sns_present.jpg">
  <meta property="og:title" content="감염병 빅데이터 혁신서비스">
  <meta property="og:description" content="감염병 빅데이터 혁신서비스는 감염병에 대한 정보를 종합적으로 제공합니다.">
  <meta property="og:url" content="https://service-covid.kr/">
  <meta property="og:type" content="website">
  <meta property="og:image" content="/resources/images/sns_present.jpg">
  <link rel="shortcut icon" href="/resources/images/favicon.png">
  <link rel="stylesheet" href="/resources/css/common.css">
  <link rel="stylesheet" href="/resources/css/swiper-bundle.min.css">
  <script src="/resources/js/jquery-3.4.1.min.js"></script>
  <script src="/resources/js/common.js"></script>
  <script src="/resources/js/swiper-bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <!-- <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=91ef2ab0c97c3f18cf4ad1b4172fb985"></script> -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6ca3631ca91c49471a26211d7ed34b0"></script>
  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
  
  <script>
    //gnb current menu
    let currentPageDepth1 = 0;   
    let currentPageDepth2 = 0;
  </script>

</head>
<style>
.overr{
	width:150px;
 	text-align:center;
}
.cl{
		width: 49px;
		height: 48px;
		font-size: 11px;
		border-radius: 30px;
		background: rgb(255,86,112);
		color: white;
		font-weight: 500;
		text-align: center;
		position: relative;
}
.cl1{
		width: 49px;
		height: 48px;
		font-size: 11px;
		border-radius: 30px;
		background: rgb(51,183,195);
		color: white;
		font-weight: 500;
		text-align: center;
		position: relative;
}
.cl2{
		width: 49px;
		height: 48px;
		font-size: 11px;
		border-radius: 30px;
		background: rgb(107, 105, 105);
		color: white;
		font-weight: 500;
		text-align: center;
}


</style>
<body>
   <!-- header include -->
   <%@ include file="/WEB-INF/views/include/header.jsp" %>

  <main class="IBE-content">  
    <div class="inner">
      <!-- gnb depth02 -->
      <div class="gnb-depth02-wrap">
        <ul class="gnb-depth02">
          <li class="on">
            <a href="/">감염병 발생 현황</a>
          </li>
          <li>
            <a href="/info-lookup">감염병 정보 조회</a>
          </li>
        </ul>
        <div class="gnb-depth02-right">
          <button class="btn-stats-modal btn-gray">통계정보 안내</button>
        </div>
      </div>
      <!-- //gnb depth02 -->
      <!-- 감염병 발생순위 -->
      <section class="sec-obk-ranking">
        <div class="sec-tit">
          <div>
            <h2>감염병 발생 순위</h2>
            <span class="sec-tit-info">${year}년 ${month}월 통계 (단위: 명, 출처: 감염병 누리집)</span>
          </div>
          <div>
            <span class="fwbold mr10">지역별 보기</span>
            <div class="select-box" id="infDis">
              <select class="form-select form-select-M" id="region">
                <option class="selec">전국</option>
                <c:forEach var="key2" items="${key2}">
                <option class="selec">${key2.sinm}</option>
                </c:forEach>
              </select>
            </div>
            
             <script>
			 	$(function(){
			 		const url = location.search;
			 		const a = new URLSearchParams(url);
			 		
			 		if(a.get('keyword2') != null && a.get('keyword2') != ""){
			 			$("#region option:selected").text(a.get('keyword2'));
			 			$('#region').prepend('<option class="selec">전국</option>')
			 		}else{
			 			$("#region option:selected").text('전국');
			 		}
			 		
			 		if(a.get('keyword1') != null && a.get('keyword1') != ""){
			 			$("#infDis > .mySelect > .selec").text(a.get('keyword1'));
			 		}else{
			 			$("#infDis > .mySelect > .selec").text('전체');
			 		}		
			 		//지역 선택시
			 		$("#region").on("change", function(){
			 			const keyword2 = $("#region option:selected").text();
			 			if(keyword2 == "전국"){
			 				if(a.get('keyword1') != null && a.get('keyword1') != ""){
			 					const keyword1 = $("#infDis > .mySelect > .selec").text();
					 			location.href="?keyword1="+keyword1;
					 		}else{
					 			const keyword1 = "";
					 			location.href="/";
					 		}		
			 			}else{
			 				const keyword2 = $("#region option:selected").text();
			 				if(a.get('keyword1') != null && a.get('keyword1') != ""){
			 					const keyword1 = $("#infDis > .mySelect > .selec").text();	
					 			location.href="?keyword1="+keyword1+"&&keyword2="+keyword2;
					 		}else{
					 			const keyword1 = "";
					 			location.href="?keyword2="+keyword2;
					 		}	
			 			}
			 		});						 		
			 	})
			</script> 
              
          </div>
        </div>
        <div class="obk-ranking">
        <c:forEach var="InDe" items="${InDe}" varStatus="status">
          <div class="ranking-top">
            <a href="/info-lookup?infdisnm=${InDe.infdisnm}">
              <p class="grade">
                <span class="num">${status.count}</span>위
              </p>
              <!-- 위험인 경우만 : 클래스 " tag-danger " 추가 -->
              <c:choose>
              <c:when test="${InDe.total/InDe.ssum*100 >= 30}">
              	<span class="tag-state tag-danger">위험</span>
	          </c:when>
              <c:when test="${InDe.total/InDe.ssum*100 >= 20}">
              	<span class="tag-state">주의</span>
              </c:when>
              <c:when test="${InDe.total/InDe.ssum*100 >= 10}">
              	<span class="tag-state">관심</span>
              </c:when>
              <c:when test="${InDe.total/InDe.ssum*100 < 10}">
              	<span class="tag-state">보통</span>
              </c:when>
              </c:choose>
              <p class="disease-nm">${InDe.infdisnm}</p>
              <p class="obk-num"><fmt:formatNumber value="${InDe.sum}" pattern="#,###"/></p>
              <p class="txt-line">
                <span>전월대비</span>
              </p>
              <!-- 전월보다 상승한 경우 "up" 클래스 추가 -->
              <!-- 전월보다 하락한 경우 "down" 클래스 추가 -->
              <c:if test="${InDe.total >= 0}">
              <div class="compare-mon up">
              </c:if>
              <c:if test="${InDe.total < 0}">
              <div class="compare-mon down">
              </c:if>
                <div>
                  <!-- 상승인 경우 + -->
                  <!-- <span class="symbol plus-minus"></span> -->
                  <span class="symbol plus-minus"></span>
                  <p><span class="num">
	                  	<c:if test="${InDe.total > 0}">
			               	<fmt:formatNumber value="${InDe.total}" pattern="#,###"/>
			            </c:if>
		            	<c:if test="${InDe.total <= 0}">
		               		<fmt:formatNumber value="${InDe.total * -1}" pattern="#,###"/>
		               	</c:if>
			          </span>명
			      </p>
                </div>
                <div>
                  <span class="symbol up-down"></span>
                  <p><span class="num"><fmt:formatNumber type="number"  pattern="0.00" value="${InDe.total/InDe.ssum*100}"/></span>%</p>
                </div>
              </div>
              <!-- hover 보여지는 TEXT -->
              <div class="hover-area">
                <div class="hover-desc">${InDe.definition}</div>
                <span class="more"></span>
              </div>
              <div class="lottie-ani">
                <lottie-player class="lottie-rotate" src="/resources/images/rotating.json"  speed="1"  style="width: 329px; height: 316px;" loop autoplay></lottie-player>
              </div>
            </a>
          </div>
          </c:forEach>
          
          <!-- 4위 이하 리스트 -->
          <div class="ranking-sub">
          <c:forEach var="UpDe" items="${UpDe}" varStatus="status1">
            <div class="ranking-sub-li">
              <a href="/info-lookup?infdisnm=${UpDe.infdisnm}">
                <div class="sub-li-row01">
                  <div>
                    <p class="sub-grade">${status1.count+3}위</p>
                    <p class="sub-disease-nm">${UpDe.infdisnm}</p>
                    <!-- 위험인 경우만 : 클래스 " tag-danger " 추가 -->
                    <c:choose>
		              <c:when test="${UpDe.total/UpDe.ssum*100 >= 50}">
		              	<span class="tag-state tag-danger">위험</span>
		              </c:when>
		              <c:when test="${UpDe.total/UpDe.ssum*100 >= 30}">
		              	<span class="tag-state">주의</span>
		              </c:when>
		              <c:when test="${UpDe.total/UpDe.ssum*100 >= 10}">
		              	<span class="tag-state">관심</span>
		              </c:when>
		              <c:when test="${UpDe.total/UpDe.ssum*100 < 10}">
		              	<span class="tag-state">보통</span>
		              </c:when>
		             </c:choose>
                  </div>
                  <p class="sub-obk-num"><fmt:formatNumber value="${UpDe.sum}" pattern="#,###"/></p>
                </div>
                <!-- 전월보다 상승한 경우 "up" 클래스 추가 -->
                <!-- 전월보다 하락한 경우 "down" 클래스 추가 --> 
                <c:if test="${UpDe.total > 0}">       
                <div class="sub-li-row02 up">
                </c:if>
                <c:if test="${UpDe.total <= 0}">
                <div class="sub-li-row02 down">
                </c:if>
                  <p>
                    <!-- 상승인 경우 : '+' -->
                    <!-- 하락인 경우 : '-' -->
                    <span></span>
                    <span><c:if test="${UpDe.total > 0}">
  								<c:out value="+${UpDe.total}"/>
	   				      </c:if>
	   					  <c:if test="${UpDe.total <= 0}">
	   						<c:out value="${UpDe.total}"/>
	   					  </c:if>
   					</span> 명,
                  </p>
                  <p>
                    <!-- 상승인 경우 : '&uarr;' -->
                    <!-- 하락인 경우 : '&darr;' -->
                <c:if test="${UpDe.total > 0}">       
                    <span>&uarr;</span>                
                </c:if>
                <c:if test="${UpDe.total <= 0}">
					<span>&darr;</span>
                </c:if>
                    <span><fmt:formatNumber type="number"  pattern="0.00" value="${UpDe.total/UpDe.ssum*100}"/>%</span>
                  </p>
                </div>
              </a>
            </div>
            </c:forEach>
          </div>
        </div>
      </section>
      <!-- //감염병 발생순위 -->
    </div>
    <!-- 감염병 통계 조회 -->
    <section class="sec-stats">
      <div class="sticky-search" id="stickySearch">
        <div class="inner">
          <div class="sec-tit">
            <div>
              <h2>감염병별 통계조회</h2>
              <div class="select-filter">
                <div class="select-box">
                  <select class="form-select form-select-S" id="inf_grade">
                    <option value="전체">전체 감염병</option>
                    <option value="1">1급</option>
                    <option value="2">2급</option>
                    <option value="3">3급</option>
                  </select>
                </div>            
                <div class="select-box">
                  <select class="form-select form-select-B" id="grade_inf">
					<option value="전체">전체</option>
                  </select>
                </div>
                <div>
                  <button class="btn-gray-rect" id="inquery">조회</button>
                </div>        
                <script type="text/javascript">
	                $('#inf_grade').change(function(){
		                var grade = $('#inf_grade option:selected').val();
	
		                $.ajax({
		    	    		url : "/grade_inf",
		    	   		    method : 'POST',
		    	   		    data : {'grade': grade},
		    	    		success :function(item){
		    	    			$('#grade_inf').children('option:not(:first)').remove();
		    	    			
		    	    			for(var i in item){
		    	    				for(var i2 in item[i]){
		    	    					var infdisnm = item[i][i2].infdisnm;
		    	    					var infdisid = item[i][i2].infdisid;
		    	    					$('#grade_inf').append('<option value="'+infdisid+'">'+infdisnm+'</option>')
		    	    				}
		    	    			}
		    	    		}
		      	  		});
	                })
	                $(function(){
	                	var grade = $('#inf_grade option:selected').val();
	                	$.ajax({
		    	    		url : "/grade_inf",
		    	   		    method : 'POST',
		    	   		    data : {'grade': grade},
		    	    		success :function(item){
		    	    			$('#grade_inf').children('option:not(:first)').remove();
		    	    			for(var i in item){
		    	    				for(var i2 in item[i]){
		    	    					var infdisnm = item[i][i2].infdisnm;
		    	    					var infdisid = item[i][i2].infdisid;
		    	    					$('#grade_inf').append('<option value="'+infdisid+'">'+infdisnm+'</option>')
		    	    				}
		    	    			}
		    	    		}
		      	  		});
	           	 	});
                </script>     
              </div>
            </div>
            <div>
              <span class="sec-tit-info">${year}년 ${month}월 통계 (출처: 감염병 누리집)</span>
            </div>
          </div>
        </div>        
      </div>
      <div class="inner">
        <div class="stats-wrap">
          <div class="stats-left">
            <!-- 감염병 발생 추이 chart 영역 -->
            <div class="stats_box stats-box01">
              <div class="h3-tit-row">
                <h3 class="h3-tit">감염병 발생 추이</h3>
                <div class="select-box">
                  <select class="form-select form-select-M" id="month_year">
                    <option value="">한달간 추이</option>
                    <option value="">과거 3년간 비교</option>
                  </select>
                </div>                
              </div>
              <div class="chart-wrap">
                <canvas id="chartInfectionTrend" width="606" height="205"></canvas>
                <canvas id="chartInfectionYears" width="606" height="205" style="display:none;"></canvas>
              </div>
            </div>
            <!-- //감염병 발생 추이 chart 영역 -->
            <!-- 연령별 감염지수 chart 영역 -->
            <div class="stats_box stats-box02">
              <div class="h3-tit-row">
                <h3 class="h3-tit">연령별 감염자수</h3>
              </div>
              <div class="chart-wrap">
                <canvas id="chartIndexAge" width="606" height="210"></canvas>
              </div>
            </div>
            <!-- //연령별 감염지수 chart 영역 -->
            <!-- 성별 감염지수 chart -->
            <div class="stats_box stats-box03">
              <h3 class="h3-tit">성별 감염자수</h3>
              <div class="chart-wrap">
                <canvas id="chartInfectionGender" width="182" height="182"></canvas>
              </div>
              <div class="gender-color">
                <span class="man">남성</span>
                <span class="woman">여성</span>
              </div>
            </div>
            <!-- //성별 감염지수 chart -->
          </div>
          <div class="stats-right">
            <div class="h3-tit-row">
              <h3 class="h3-tit">전국 감염병 현황</h3>
              <div class="select-box">
                <select class="select-map-type form-select form-select-M" id="count_danger">
                  <option value="type01">발생건수 보기</option>
                  <option value="type02">위험도 보기</option>
                </select>
              </div>                
            </div>
            <!-- select : 발생 건수 보기 선택할 경우 -->
            <div class="map-color-info" id="mapOccurNum">
              <span>전달 대비 감염자수</span>
              <span class="color-txt pink">증가</span>
              <span class="color-txt green">감소</span>
              <span class="color-txt gray">변화 없음</span>
            </div>
            <!-- //select : 발생 건수 보기 선택할 경우 -->
            <!-- select : 위험도 보기 선택할 경우 -->
            <div class="map-color-info" id="mapRiskDegree">
              <span>
                위험도 지수
                <span class="btn-risk-modal">i</span>
              </span>
              <span class="color-txt brown">위험</span>
              <span class="color-txt red">주의</span>
              <span class="color-txt yellow">보통</span>
            </div>            
            <!-- //select : 위험도 보기 선택할 경우 -->
            <div class="map-wrap">
              <!-- 지도 영역 -->
              <div id="map" style="width:100%;height:805px;position:relative;"></div>
              <!-- 지도 영역 -->
              <div id="map2" style="width:100%;height:805px;position:relative;"></div>
              <script type="text/javascript">
              
              $('#count_danger').on("change", function(){
            	  var a = this.value;
            	  if(a == 'type01'){
            		  $('#map').show();
            		  $('#map2').hide();
            	  }else if(a == 'type02'){
            		  $('#map').hide();
            		  $('#map2').show();
            	  }
              });
              
              var infdisnm = $('#grade_inf option:selected').text();
              var positions = [];
              $.ajax({
  				url : "/infdis_map",
  				    method : 'GET',
  				 	data: {"infdisnm": infdisnm, "sinm": ""},
  		   			success :function(item){
  		   				for(var i in item){
  		    				for(var i2 in item[i]){
  		    					if(item[i][i2].difVal > 0){
  		    						var curVal = item[i][i2].curVal;
  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  		    					positions.push({
										content:`<div class='cl' ><p style='top:17px; left:20%; right:20%; position: absolute;'>`+curVal+`</p></div>`,
										latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng)
									});
  		    					} else if(item[i][i2].difVal == 0){
  		    						var curVal = item[i][i2].curVal;
  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  		    						positions.push({
										content:`<div class='cl2' ><p style='top:17px; left:20%; right:20%; position: absolute;'>`+curVal+`</p></div>`,
										latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng)
									});
  		    					} else if(item[i][i2].difVal < 0){
  		    						var curVal = item[i][i2].curVal;
  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  		    						positions.push({
										content:`<div class='cl1' ><p style='top:17px; left:20%; right:20%; position: absolute;'>`+curVal+`</p></div>`,
										latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng)
									});
  		    					}
  		    				}
  		    			}
	  		   			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
						var options = { //지도를 생성할 때 필요한 기본 옵션
							center: new kakao.maps.LatLng(36.5140736, 127.7994855), //지도의 중심좌표.
							level: 12,//지도의 레벨(확대, 축소 정도)
							//draggable: false //감리 임시용 나중에 마커 or 그림그리는 것으로 바꿔서 위도경도 로 찍어줘야함
						};
						var map = new kakao.maps.Map(container, options);			
						
						
						for (var i = 0; i < positions.length; i ++) {
							
							// 커스텀 오버레이생성
							var customOverlay = new kakao.maps.CustomOverlay({
							    content: positions[i].content, // 마커이미지 설정 
						        map: map, // 마커를 표시할 지도
						        position: positions[i].latlng // 마커의 위치
						    });
	
						    
						 // 커스텀 오버레이를 지도에 표시합니다
						    customOverlay.setMap(map); 
						}
  		   			}
  	    	});
              $('#inquery').on('click', function(){
	              var infdisnm = $('#grade_inf option:selected').text();
	              var positions = [];
	              $.ajax({
	  				url : "/infdis_map",
	  				    method : 'GET',
	  				 	data: {"infdisnm": infdisnm, "sinm": ""},
	  		   			success :function(item){
	  		   				
	  		   				for(var i in item){
	  		    				for(var i2 in item[i]){
	  		    					if(item[i][i2].difVal > 0){
	  		    						var curVal = item[i][i2].curVal;
	  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		  		    					positions.push({
											content:`<div class='cl' ><p style='top:17px; left:20%; right:20%; position: absolute;'>`+curVal+`</p></div>`,
											latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng)
										});
	  		    					} else if(item[i][i2].difVal == 0){
	  		    						var curVal = item[i][i2].curVal;
	  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  		    						positions.push({
											content:`<div class='cl2' ><p style='top:17px; left:20%; right:20%; position: absolute;'>`+curVal+`</p></div>`,
											latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng)
										});
	  		    					} else if(item[i][i2].difVal < 0){
	  		    						var curVal = item[i][i2].curVal;
	  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  		    						positions.push({
											content:`<div class='cl1' ><p style='top:17px; left:20%; right:20%; position: absolute;'>`+curVal+`</p></div>`,
											latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng)
										});
	  		    					}
	  		    				}
	  		    			}
		  		   			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
							var options = { //지도를 생성할 때 필요한 기본 옵션
								center: new kakao.maps.LatLng(36.5140736, 127.7994855), //지도의 중심좌표.
								level: 12,//지도의 레벨(확대, 축소 정도)
								//draggable: false //감리 임시용 나중에 마커 or 그림그리는 것으로 바꿔서 위도경도 로 찍어줘야함
							};
							var map = new kakao.maps.Map(container, options);			
							
							
							for (var i = 0; i < positions.length; i ++) {
								// 커스텀 오버레이생성
								var customOverlay = new kakao.maps.CustomOverlay({
								    content: positions[i].content, // 마커이미지 설정 
							        map: map, // 마커를 표시할 지도
							        position: positions[i].latlng // 마커의 위치
							    });
		
								
							 // 커스텀 오버레이를 지도에 표시합니다
							    customOverlay.setMap(map); 
							}
	  		   			}
	  	    	});
              });
				</script>
              <script type="text/javascript">
              var infdisnm = $('#grade_inf option:selected').text();
              var positions = [];
              $.ajax({
  				url : "/infdis_map",
  				    method : 'GET',
  				 	data: {"infdisnm": infdisnm, "sinm": ""},
  		   			success :function(item){
								var container = document.getElementById('map2'); //지도를 담을 영역의 DOM 레퍼런스
								var options = { //지도를 생성할 때 필요한 기본 옵션
									center: new kakao.maps.LatLng(36.5140736, 127.7994855), //지도의 중심좌표.
									level: 12,//지도의 레벨(확대, 축소 정도)
									//draggable: false //감리 임시용 나중에 마커 or 그림그리는 것으로 바꿔서 위도경도 로 찍어줘야함
								};
								var map = new kakao.maps.Map(container, options);			
								
								 // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
				
								 var positions = [];
								 var choi = [];//최초값
								 var difval = [];//증감량
								 var gam = [];//증감률
								 for(var i in item){
			  		    				for(var i2 in item[i]){
		  		    						choi.push(item[i][i2].curVal+item[i][i2].difVal);
		  		    						difval.push(item[i][i2].difVal);
		  		    						
			  		    					if(difval[i2] <= 0){
			  		    						gam.push(0);
			  		    					}
			  		    					else if(difval[i2] > 0 && choi.push == 0){
			  		    						gam.push(difval[i2]/1*100);	
			  		    					}
			  		    					else{
			  		    						gam.push(difval[i2]/choi[i2]*100);
			  		    					}
			  		    					if(gam[i2] >= 30){
			  		    						var curVal = item[i][i2].curVal;
			  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
												 positions.push({
													 content:'<div class="overr">'+item[i][i2].sinm+'<br/>'+curVal+'</div>',
													 latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng),
													 img:'/resources/images/위험.png'
												 });
			  		    					} else if(gam[i2] >= 20){
			  		    						var curVal = item[i][i2].curVal;
			  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
													 positions.push({
														 content:'<div class="overr">'+item[i][i2].sinm+'<br/>'+curVal+'</div>',
														 latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng),
														 img:'/resources/images/주의.png'
													 });
			  		    					} else if(gam[i2] <= 10){
			  		    						var curVal = item[i][i2].curVal;
			  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
													 positions.push({
														 content:'<div class="overr">'+item[i][i2].sinm+'<br/>'+curVal+'</div>',
														 latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng),
														 img:'/resources/images/보통.png'
													 });
			  		    					}
			  		    				}
								 }
								 
								 for (var i = 0; i < positions.length; i ++) {
									 
									 var imageSrc = positions[i].img, // 마커이미지의 주소입니다   
									    imageSize = new kakao.maps.Size(60, 60), // 마커이미지의 크기입니다
									    imageOption = {offset: new kakao.maps.Point(40, 40)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
									      
									// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
									var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
									    
									// 마커를 생성합니다
									var marker = new kakao.maps.Marker({
									    image: markerImage, // 마커이미지 설정 
								        map: map, // 마커를 표시할 지도
								        position: positions[i].latlng // 마커의 위치
								    });
				
								    // 마커에 표시할 인포윈도우를 생성합니다 
								    var infowindow = new kakao.maps.InfoWindow({
								        content: positions[i].content // 인포윈도우에 표시할 내용    
								    });
								 // 마커가 지도 위에 표시되도록 설정합니다
									marker.setMap(map);  
								    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
								    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
								    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
								    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
								    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
								}
				
								// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
								function makeOverListener(map, marker, infowindow) {
								    return function() {
								        infowindow.open(map, marker);
								    };
								}
				
								// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
								function makeOutListener(infowindow) {
								    return function() {
								        infowindow.close();
								    };
								}
  		   			}
              });
              $('#inquery').on('click', function(){
	              var infdisnm = $('#grade_inf option:selected').text();
	              var positions = [];
	              $.ajax({
	  				url : "/infdis_map",
	  				    method : 'GET',
	  				 	data: {"infdisnm": infdisnm, "sinm": ""},
	  		   			success :function(item){
									var container = document.getElementById('map2'); //지도를 담을 영역의 DOM 레퍼런스
									var options = { //지도를 생성할 때 필요한 기본 옵션
										center: new kakao.maps.LatLng(36.5140736, 127.7994855), //지도의 중심좌표.
										level: 12,//지도의 레벨(확대, 축소 정도)
										//draggable: false //감리 임시용 나중에 마커 or 그림그리는 것으로 바꿔서 위도경도 로 찍어줘야함
									};
									var map = new kakao.maps.Map(container, options);			
									
									 // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
									 var choi = [];
									 var difval = [];
									 var gam = [];
									 var positions = [];										 
									 for(var i in item){
				  		    				for(var i2 in item[i]){
			  		    						choi.push(item[i][i2].curVal+item[i][i2].difVal);
			  		    						difval.push(item[i][i2].difVal);
			  		    						
				  		    					if(difval[i2] <= 0){
				  		    						gam.push(0);
				  		    					}
				  		    					else if(difval[i2] > 0 && choi.push == 0){
				  		    						gam.push(difval[i2]/1*100);	
				  		    					}
				  		    					else{
				  		    						gam.push(difval[i2]/choi[i2]*100);
				  		    					}
				  		    					if(gam[i2] >= 30){
				  		    						var curVal = item[i][i2].curVal;
				  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
													 positions.push({
														 content:'<div class="overr">'+item[i][i2].sinm+'<br/>'+curVal+'</div>',
														 latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng),
														 img:'/resources/images/위험.png'
													 });
				  		    					} else if(gam[i2] >= 20){
				  		    						var curVal = item[i][i2].curVal;
				  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
														 positions.push({
															 content:'<div class="overr">'+item[i][i2].sinm+'<br/>'+curVal+'</div>',
															 latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng),
															 img:'/resources/images/주의.png'
														 });
				  		    					} else if(gam[i2] <= 10){
				  		    						var curVal = item[i][i2].curVal;
				  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
														 positions.push({
															 content:'<div class="overr">'+item[i][i2].sinm+'<br/>'+curVal+'</div>',
															 latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng),
															 img:'/resources/images/보통.png'
														 });
				  		    					}
				  		    				}
									 }
									 
									 for (var i = 0; i < positions.length; i ++) {
										 
										 var imageSrc = positions[i].img, // 마커이미지의 주소입니다   
										    imageSize = new kakao.maps.Size(60, 60), // 마커이미지의 크기입니다
										    imageOption = {offset: new kakao.maps.Point(40, 40)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
										      
										// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
										var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
										    
										// 마커를 생성합니다
										var marker = new kakao.maps.Marker({
										    image: markerImage, // 마커이미지 설정 
									        map: map, // 마커를 표시할 지도
									        position: positions[i].latlng // 마커의 위치
									    });
					
									    // 마커에 표시할 인포윈도우를 생성합니다 
									    var infowindow = new kakao.maps.InfoWindow({
									        content: positions[i].content // 인포윈도우에 표시할 내용    
									    });
									 // 마커가 지도 위에 표시되도록 설정합니다
										marker.setMap(map);  
									    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
									    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
									    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
									    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
									    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
									}
					
									// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
									function makeOverListener(map, marker, infowindow) {
									    return function() {
									        infowindow.open(map, marker);
									    };
									}
					
									// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
									function makeOutListener(infowindow) {
									    return function() {
									        infowindow.close();
									    };
									}
		  		   			}
		              });
              });
				</script>
            </div>
          </div>
        </div>
        <div class="stats-wrap02">
          <h3 class="h3-tit">위험도 정보</h3>
          <div class="stats-flex-row">
            <div>
              <div class="h4-tit-row">
                <h4 class="h4-tit">감염자수 · 검색트렌드 · 뉴스언급횟수</h4>
                <div class="tab-menu-slide">
                  <p class="selected">절대</p>
                  <p>상대</p>
                  <p class="tab-menu-bg"></p>
                </div>
              </div>
              <div class="tab-chart">
                <div class="tab-chart01">
                  <!-- 감염자수 · 검색트렌드 · 뉴스언급횟수, 절대 기준 chart -->
                  <div class="stats-box04">
                    <div class="chart-wrap">
                      <canvas id="chartCombine01" width="606" height="262"></canvas>
                    </div>                
                  </div>
                  <!-- //감염자수 · 검색트렌드 · 뉴스언급횟수, 절대 기준 chart -->
                </div>
                <div class="tab-chart02">
                  <!-- 감염자수 · 검색트렌드 · 뉴스언급횟수, 상대 기준 chart -->
                  <div class="stats-box04">
                    <div class="chart-wrap">
                      <canvas id="chartCombine02" width="606" height="262"></canvas>
                    </div>                
                  </div>
                  <!-- //감염자수 · 검색트렌드 · 뉴스언급횟수, 상대 기준 chart -->                    
                </div>
              </div>
              <div class="data-info-box">
                <p>데이터 출처</p>
                <ul>
                  <li>· 감염자수 : 감염병 누리집</li>
                  <li>· 검색 트렌드 : 네이버 데이터랩 검색 트렌드</li>
                  <li>· 뉴스언급횟수 : 크롤링된 뉴스에서 각 감염병명 합산</li>
                </ul>
              </div>
            </div>
            <div>
              <div class="h4-tit-row">
                <h4 class="h4-tit">감염자 수와 Risk 추이</h4>
              </div>
              <div class="stats-box04">
                <div class="chart-wrap">
                  <canvas id="chartCombine03" width="606" height="262"></canvas>
                </div>                
              </div>              
              <div class="data-info-box">
                <p>데이터 출처</p>
                <ul>
                  <li>· 감염자수 : 감염병 누리집</li>
                  <li>· RISK 수치 : 위험도 지수 산출식을 통한 지표
                    <span class="btn-risk-modal">i</span>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- //감염병 통계 조회 -->
    <div class="inner">
      <!-- 감염병 뉴스 -->
      <section class="sec-news">
        <div class="sec-news-tit">
          <h2>감염병 뉴스</h2>
        </div>
        <div class="news-slide-wrap">
          <div class="swiper news-slide">
            <div class="swiper-wrapper" id="news">
            
<!--               <div class="swiper-slide">
                <a href="" target="_blank">
                  <div class="news-box">
                    <p class="news-tit">다양한 합병증을 일으키는 감염증 다양한 합병증을 일으키는 감염증</p>
                    <div class="news-desc">다양한 합병증을 일으키는 ‘카바페넴내성장내세균속균종(CRE, 항생제 내성균)’ 감염증이 최근 4년 사이 큰 폭으로 증가한 것으로 나타났다.29일 감염증이 최근 4년 사이 큰 폭으로 증가한 것으로 나타났다.29일</div>
                  </div>                
                </a>
              </div>
              <div class="swiper-slide">
                <a href="" target="_blank">
                  <div class="news-box">
                    <p class="news-tit">백신으로 당뇨병·비만 막을까?</p>
                    <div class="news-desc">코로나19(COVID-19) 대유행으로 백신 개발 연구가 활기를 띠면서, 기술 발전에 따라 감염병에 이어 등장하게 될 질환 예방용·치료용 백신에 관심이 모인다. 
                      보건복지부가 지난해 11월 발표한 '2023 백신·치료제 지원 가이드북'에 따르면, 백신산업은 고부가가치 유망산업으로 부상하고 있다. 경제성장, 고령화 등에 따라 백신산업의 고성장이 지속돼, 글로벌 백신 시장 규모는 2019년 228억달러(한화 약 29조 5900억원)에서 2028년 1035억달러(약 134조 3430억원)로 커질 것으로 예상된다.</div>
                  </div>                  
                </a>
              </div>
              <div class="swiper-slide">
                <a href="" target="_blank">
                  <div class="news-box">
                    <p class="news-tit">“피라맥스 코로나19 3상 마무리 단계…곧 결과 확인"</p>
                    <div class="news-desc">신풍제약(대표 유제만)은 계묘년(癸卯年) 새해를 맞아 지난 2일 안산 제1공장에서 '목표 달성! 마음은 하나로! 비전은 세계로!'를 올해의 슬로건을 정하고 온라인 시무식을 진행했다.

                      올해로 창립 61주년을 맞이하는 신풍제약은 2023년은 본격적으로 새로운 발전의 시동을 거는 한해가 될 것이라고 했다.
                      
                      유제만 대표는 신년사에서 “자체 생산 제품인 메디커튼과 하이알시리즈 등이 동남아시아, 중동 및 남미 등 제3세계 시장으로 확대되고 일본, 유럽 및 미국 등 메이저시장으로의 진출도 시작할 수 있을 것”이라고 말했다.
                      </div>
                  </div>                  
                </a>                
              </div>
              <div class="swiper-slide">
                <a href="" target="_blank">
                  <div class="news-box">
                    <p class="news-tit">전 세계 거의 모든 어린이가 이 위험에 처해 있다 [ESG 세상]</p>
                    <div class="news-desc">2019년 노벨평화상 후보에 올랐던 스웨덴의 기후변화행동가 그레타 툰베리(19)는 11세 때 기후불안으로 우울증을 겪었다. 툰베리는 TED 강연에서 "'기후우울증'으로 말과 식사를 중단했고 그로 인해 두 달 만에 체중이 11kg가 줄었다"고 밝혔다. 툰베리는 2018년 8월부터 '학교 파업'을 주도하며 기후 변화의 심각성을 경고하고 정부, 기업 등의 대응을 촉구하는 목소리를 내고 있다.[1] 
                      기후우울증 혹은 기후위기우울증의 개념은 심리학자들이 처음 제시했다. 2011년 미국의 심리학자인 도허티와 클레이튼은 급격한 기후 변화로 인한 심리적 불안감을 '기후변화에 관한 불안'으로 소개했다.
                      </div>
                  </div>                  
                </a>                   
              </div>
              <div class="swiper-slide">
                <a href="" target="_blank">
                  <div class="news-box">
                    <p class="news-tit">차백신연구소, 내주 美 JP모건 헬스케어 참석…면역증강 플랫폼 공개</p>
                    <div class="news-desc">차백신연구소는 오는 9일부터 12일까지 미국 샌프란시스코에서 열리는 '2023 JP모건 헬스케어 콘퍼런스'에 참가해 자체 개발한 면역증강 플랫폼을 소개한다고 3일 밝혔다.
                      JP모건 헬스케어 콘퍼런스는 매년 50여개국 1500여개 제약·바이오 기업이 참여하는 전 세계 최대 규모의 헬스케어 투자 행사다.
                      차백신연구소는 글로벌 제약사들과 일대일 미팅을 통해 자체 개발한 면역증가제 플랫폼인 엘-팜포(L-pampo)과 리포-팜(Lipo-pam)을 소개할 계획이다. 2023년말 임상2b상이 종료될 예정인 '만성 B형간염 치료백신'의 기술이전 및 공동개발도 논의할 예정이다.
                      </div>
                  </div>                  
                </a>                     
              </div> -->
            </div>
          </div>
          <div class="news-pagination"></div>
          <div class="news-button-prev"></div>
          <div class="news-button-next"></div>
        </div>
      </section>
      <!-- //감염병 뉴스 -->
    </div>
  </main>

  <!-- footer include -->
  <%@ include file="/WEB-INF/views/include/footer.jsp" %> 
  <!-- modal include -->
  <%@ include file="/WEB-INF/views/include/modal.jsp" %>

  <script>
//     //gnb current menu
//     let currentPageDepth1 = 0;   
//     let currentPageDepth2 = 0;
    
//     if(currentPageDepth1 == 0) {
//         $('.gnb-depth01 li:eq(0)').addClass('on')
//         $('.menu>li:eq(0)').addClass('on')
//       } else if(currentPageDepth1 == 1) {
//         $('.gnb-depth01 li:eq(1)').addClass('on')
//         $('.menu>li:eq(1)').addClass('on')
//       }

//       if(currentPageDepth2 == 0) {
//         $('.menu-depth02>li:eq(0)').addClass('on')
//       } else if(currentPageDepth2 == 1) {
//         $('.menu-depth02>li:eq(1)').addClass('on')
//       }

   
    //3년간 비교 그래프 한달간 추이 보여주기
    $('#month_year').on('change', function(){
    	var text = $('#month_year option:selected').text();
    	if(text == '한달간 추이'){
    		$('#chartInfectionTrend').css('display',''); 
    		$('#chartInfectionYears').css('display','none');
    	}
    	else if(text == '과거 3년간 비교'){
    		$('#chartInfectionTrend').css('display', 'none');
    		$('#chartInfectionYears').css('display', '');
    	}
    })
    
    
    //검색 section sticky 
    const stickyElement = document.getElementById("stickySearch");
    window.addEventListener("scroll", checkStickyState);

    function checkStickyState() {
      let elementTop = stickyElement.getBoundingClientRect().top;
      let parentTop = stickyElement.parentElement.getBoundingClientRect().top;

      if (elementTop <= parentTop) {
        $('.sticky-search').removeClass('fixed');
      } else {
        $('.sticky-search').addClass('fixed');
      }
    }
    var infdisnm = $('#grade_inf option:selected').text();
    
    //감염병 발생 추이 chart
    //한달간 데이터
    var month_chart;
    $('#inquery').on('click', function(){
    	const month_count = [];
	    var infdisid = $('#grade_inf option:selected').val();
	    var infdisnm = $('#grade_inf option:selected').text();
	    if(infdisnm == '코로나바이러스감염증-19'){
	    	$.ajax({
				url : "/covid_date",
				    method : 'GET',
				 	data: {},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					month_count.push(item[i][i2].count);
		    				}
		    			}
	   					month_chart.data.datasets[0].data = month_count;
	   					month_chart.data.datasets[0].label = infdisnm;
		   				month_chart.update();
		   			}
	    	});
	    }else if(infdisnm == '전체'){
	        const sum = [];
	        var covid_date = [];
			$.ajax({
					url : "/covid_date",
					    method : 'GET',
					 	data: {},
			   			success :function(item){
			   				for(var i in item){
			    				for(var i2 in item[i]){
			    					covid_date.push(item[i][i2].count);
			    				}
			    				
			    			}
			   			}
		    	});
	        
		    $.ajax({
				url : "/one_month_inf",
				    method : 'GET',
				 	data: {"infdisid": infdisid},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					month_count.push(item[i][i2].count);
		    				}
		    			}
		   				for(var i = 0; i < month_count1.length; i++){	   					
		   					var test = month_count[i];
		   					var test2 = covid_date[i];
		   					var ssum  = parseInt(test) + parseInt(test2);
		   					sum.push(ssum);
		   				}
	   					month_chart.data.datasets[0].data = sum;
	   					month_chart.data.datasets[0].label = infdisnm;
		   				month_chart.update();
		   			}
	    	});
	    }
		else {
		    $.ajax({
				url : "/one_month_inf",
				    method : 'GET',
				 	data: {"infdisid": infdisid},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					month_count.push(item[i][i2].count);
		    				}
		    			}
	   					month_chart.data.datasets[0].data = month_count;
	   					month_chart.data.datasets[0].label = infdisnm;
		   				month_chart.update();
		   			}
	    	});
	    }
    })
    var covid_date = [];
	$.ajax({
			url : "/covid_date",
			    method : 'GET',
			 	data: {},
	   			success :function(item){
	   				for(var i in item){
	    				for(var i2 in item[i]){
	    					covid_date.push(item[i][i2].count);
	    				}
	    				
	    			}
	   			}
    	});
    //감염병 발생 추이 chart
    const month_count1 = [];
    const date = [];
    const sum = [];

    var infdisid = $('#grade_inf option:selected').val();
	    $.ajax({
			url : "/one_month_inf",
			    method : 'GET',
			 	data: {"infdisid": infdisid},
	   			success :function(item){
	   				for(var i in item){
	    				for(var i2 in item[i]){
	    					month_count1.push(item[i][i2].count);
	    					date.push(item[i][i2].date);
	    				}
	    			}
	   				for(var i = 0; i < month_count1.length; i++){	   					
	   					var test = month_count1[i];
	   					var test2 = covid_date[i];
	   					var ssum  = parseInt(test) + parseInt(test2);
	   					sum.push(ssum);
	   				}
	   				
	    				month_chart.data.datasets[0].data = sum;
	    				
	    				month_chart.data.labels = date;
		   				month_chart.update();
	   			}
	    });
	   				const IBEChart1 = document.getElementById('chartInfectionTrend');
	   			    month_chart = new Chart(IBEChart1, {
	   			      type: 'line',
	   			      data: {
	   			        labels: date,
	   			        datasets: [{
	   			          label: infdisnm,
	   			          data: month_count1,
	   			          fill: false,
	   			          borderColor: '#3F80E5',
	   			          borderWidth: 2,
	   			          tension: 0
	   			        }]
	   			      },
	   			      options: {
	   			        scales: {
	   			          y: {
	   			            min: 0,  
	   			            ticks: {
	   			              stepSize: 100,
	   			              color: '#9092A2' 
	   			            }
	   			          },
	   			          x: {
	   			            ticks: {
	   			              color: '#9092A2' 
	   			            }            
	   			          }
	   			        },
	   			        plugins: {
	   			          // label이 보여지기 원하는 경우 true 로 바꿔주세요
	   			          legend: {
	   			            display: false
	   			          }
	   			        }
	   			      }
	   			    });
	   			
    	
	    //과거3년 그래프
	    $('#inquery').on('click', function(){
	    	const Years_count = [];
	    	const Years_count1 = [];
	    	const Years_count2 = [];
	    	const Years = [];
	    	const Years1 = [];
	    	const Years2 = [];
	    	const month_data = [];
		    var infdisid = $('#grade_inf option:selected').val();
		    var infdisnm = $('#grade_inf option:selected').text();
		    $.ajax({
				url : "/Year_inf",
				    method : 'GET',
				 	data: {"infdisid": infdisid},
		   			success :function(item){
		   				for(var i in item.Years_inf){
		   					Years_count.push(item.Years_inf[i].count);
		   					year_chart.data.datasets[0].data = Years_count;
		   				}
		   				for(var i in item.Years_inf1){
		   					Years_count1.push(item.Years_inf1[i].count);
		   					month_data.push(item.Years_inf1[i].month);
		   					year_chart.data.datasets[1].data = Years_count1;
		   					year_chart.data.labels = month_data;
		   				}
		   				for(var i in item.Years_inf2){
		   					Years_count2.push(item.Years_inf2[i].count);
		   					year_chart.data.datasets[2].data = Years_count2;
		   				}
		   				for(var i = 0; i < 1; i++){		   					
		   					Years.push(item.Years_inf[i].year);
			   				Years1.push(item.Years_inf1[i].year);
		   					Years2.push(item.Years_inf2[i].year);
		   				}
	   					
		   				year_chart.data.datasets[0].label = Years;
		   				year_chart.data.datasets[1].label = Years1;
		   				year_chart.data.datasets[2].label = Years2;
		   				year_chart.update();
		   			}
	    	});
	    })
	    
	    var year_chart
	    const Years_count = [];
    	const Years_count1 = [];
    	const Years_count2 = [];
    	const month_data = [];
    	const Years = [];
    	const Years1 = [];
    	const Years2 = [];
	    var infdisid = $('#grade_inf option:selected').val();
	    var infdisnm = $('#grade_inf option:selected').text();
	    
	    $.ajax({
			url : "/Year_inf",
			    method : 'GET',
			 	data: {"infdisid": infdisid},
	   			success :function(item){
	   				for(var i in item.Years_inf){
	   					Years_count.push(item.Years_inf[i].count);
	   				}
	   				for(var i in item.Years_inf1){
	   					Years_count1.push(item.Years_inf1[i].count);
	   					month_data.push(item.Years_inf1[i].month);	
	   				}
	   				for(var i in item.Years_inf2){
	   					Years_count2.push(item.Years_inf2[i].count);
	   				}
	   				for(var i = 0; i < 1; i++){		   					
	   					Years.push(item.Years_inf[i].year);
		   				Years1.push(item.Years_inf1[i].year);
	   					Years2.push(item.Years_inf2[i].year);
	   				}

	   				const IBEChart7 = document.getElementById('chartInfectionYears');  
	   			    year_chart = new Chart(IBEChart7, {
	   			      type: 'line',
	   			      data: {
	   			        labels: month_data,
	   			        datasets: [
	   			          {
	   			            label: Years,
	   			            data: Years_count,
	   			            backgroundColor: '#ffffff',
	   			            borderColor: '#8BD047',
	   			            borderWidth: 2,
	   			            tension: 0.4,
	   			          },
	   			          {
	   			            label: Years1,
	   			            data: Years_count1,
	   			            backgroundColor: '#ffffff',
	   			            borderColor: '#3F80E5',
	   			            borderWidth: 2,
	   			            tension: 0.4,
	   			          },
	   			          {
	   			            label: Years2,
	   			            data: Years_count2,
	   			            backgroundColor: '#ffffff',
	   			            borderColor: '#BA39EA',
	   			            borderWidth: 2,
	   			            tension: 0.4
	   			          }
	   			        ]
	   			      },
	   			      options: {
	   			        scales: {
	   			          x: {
	   			            ticks: {
	   			              color: '#9092A2' 
	   			            }            
	   			          },          
	   			          y: {
	   			            min: 0, 
	   			            ticks: {
	   			              stepSize: 100,
	   			              color: '#9092A2' 
	   			            }
	   			          }
	   			        },
	   			        plugins: {
	   			          legend: {
	   			            position: 'bottom',
	   			            labels: {
	   			              font: {
	   			                size: 14
	   			              },
	   			              color: '#646674',
	   			              padding: 22,
	   			              boxWidth: 11,
	   			              boxHeight: 11,
	   			              usePointStyle: true,
	   			              pointStyle: 'circle',
	   			            }
	   			          }
	   			        }        
	   			      }
	   			    });
	   			}
    	});
	    
	     
    var age_chart
    
    $('#inquery').on('click', function(){
    	const age_count = [];
	    var infdisid = $('#grade_inf option:selected').val();
	    var infdisnm = $('#grade_inf option:selected').text();
	    const covid_age = [];
	    const sum4 = [];
	    if(infdisnm == '전체'){
		    $.ajax({
				url : "/covid_age",
				    method : 'GET',
				 	data: {},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					covid_age.push(item[i][i2].count);
		    				}
		    			}
		   			}
			});
	    	$.ajax({
	    		url : "/age_inf",
	    		    method : 'GET',
	    		 	data: {"infdisid": infdisid},
	       			success :function(item){
	       				for(var i in item){
	        				for(var i2 in item[i]){
	        					age_count.push(item[i][i2].count);
	    						var a = age_count[i2];
	    						var b = covid_age[i2];
	    						var c = parseInt(a) + parseInt(b);
	    						sum3.push(c);
	        				}
	    					age_chart.data.datasets[0].data = sum3;
	    					age_chart.data.datasets[0].label = infdisnm;
	    					
	        				age_chart.update();
	        			}
	       			}
	        });
	    } else if(infdisnm == '코로나바이러스감염증-19'){
		    $.ajax({
				url : "/covid_age",
				    method : 'GET',
				 	data: {},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					covid_age.push(item[i][i2].count);
		    				}
		    			}
    					age_chart.data.datasets[0].data = covid_age;
    					age_chart.data.datasets[0].label = infdisnm;
    					age_chart.update();
		   			}
			});
	    } 
	    else{
		    $.ajax({
				url : "/age_inf",
				    method : 'GET',
				 	data: {"infdisid": infdisid},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					age_count.push(item[i][i2].count);
		    					age_chart.data.datasets[0].data = age_count;
		    					age_chart.data.datasets[0].label = infdisnm;
		    				}
		    			}
		   				age_chart.update();
		   			}
	    	});	    	
	    }
    });
    const covid_age = [];
    $.ajax({
		url : "/covid_age",
		    method : 'GET',
		 	data: {},
   			success :function(item){
   				for(var i in item){
    				for(var i2 in item[i]){
    					covid_age.push(item[i][i2].count);
    				}
    			}

   			}
	});
    const age_count = [];
    const sum3 = []
    $.ajax({
		url : "/age_inf",
		    method : 'GET',
		 	data: {"infdisid": infdisid},
   			success :function(item){
   				for(var i in item){
    				for(var i2 in item[i]){
    					age_count.push(item[i][i2].count);
						var a = age_count[i2];
						var b = covid_age[i2];
						var c = parseInt(a) + parseInt(b);
						sum3.push(c);
    				}
					age_chart.data.datasets[0].data = sum3;
					age_chart.data.datasets[0].label = infdisnm;
					
    				age_chart.update();
    			}
   			}
    });
   			//연령별 감염지수 chart
   			    const IBEChart2 = document.getElementById('chartIndexAge');   
   			    age_chart = new Chart(IBEChart2, {
   			      type: 'bar',
   			      data: {
   			        labels: ['0-9세', '10-19세', '20-29세', '30-39세', '40-49세', '50-59세', '60-69세', '70세 이상'],
   			        datasets: [{
   			          label: infdisnm,
   			          data: age_count,
   			          backgroundColor: [
   			            '#FFCE00',
   			            '#FF9858',
   			            '#FF4740',
   			            '#E63A9D',
   			            '#B65ECB',
   			            '#605BD1',
   			            '#4588E2',
   			            '#5BC8D1'
   			          ]
   			        }]
   			      },
   			      options : {
   			        scales: {
   			          y: {
   			            min: 0, 
   			            ticks: {
   			              stepSize: 200,
   			              color: '#9092A2' 
   			            }
   			          },
   			          x: {
   			            ticks: {
   			              color: '#9092A2' 
   			            }            
   			          }
   			        },
   			        plugins: {
   			          // label이 보여지기 원하는 경우 true 로 바꿔주세요
   			          legend: {
   			            display: false
   			          }
   			        }        
   			      }
   			    });
	
    
    const count = [];
    const IBEChart3 = document.getElementById('chartInfectionGender');
    var gender_chart;
    const sum2 = [];
    const covid_gender = [];
    $.ajax({
		url : "/covid_gender",
		    method : 'GET',
		 	data: {},
   			success :function(item){
   				for(var i in item){
    				for(var i2 in item[i]){
    					covid_gender.push(item[i][i2].count);
    				}
    			}

   			}
	});
    $.ajax({
			url : "/gender_inf",
			    method : 'GET',
			 	data: {"infdisid": "전체"},
	   			success :function(item){
	   				for(var i in item){
	    				for(var i2 in item[i]){
	    					count.push(item[i][i2].count);
	    				}
	    			}
	   				for(var i = 0; i<2; i++){
	   					var a = count[i]
	   					var b = covid_gender[i];
	   					var c = parseInt(a)+parseInt(b)
	   					sum2.push(c);
	   				}
    				gender_chart.data.datasets[0].data = sum2;
   					gender_chart.data.datasets[0].label = infdisnm;
   					gender_chart.update();

	   			}
    	});
  	//성별 감염지수 cahrt  
	gender_chart = new Chart(IBEChart3, {
		      type: 'doughnut',
		      data: {
		        labels: ['남성', '여성'],
		        datasets: [{
		          label: infdisnm,
		          data: count,
		          backgroundColor: [
		            '#605BD1',
		            '#FF4740',
		          ],
		          borderWidth: 0
		        }]
		      },
		      options : {
		        cutout: '50%',
		        plugins: {
		          // label이 보여지기 원하는 경우 true 로 바꿔주세요
		          legend: {
		            display: false
		          }
		        }
		      }
		    });
	    $('#inquery').on('click', function(){
	    	const count2 = [];
		    var infdisid = $('#grade_inf option:selected').val();
		    var infdisnm = $('#grade_inf option:selected').text();
		    if(infdisnm == '코로나바이러스감염증-19'){
		    	const covid_gender = [];
		        $.ajax({
		    		url : "/covid_gender",
		    		    method : 'GET',
		    		 	data: {},
		       			success :function(item){
		       				for(var i in item){
		        				for(var i2 in item[i]){
		        					covid_gender.push(item[i][i2].count);
		        				}
		        			}
		       				gender_chart.data.datasets[0].data = covid_gender;
	       					gender_chart.data.datasets[0].label = infdisnm;
	       					gender_chart.update();
		       			}
		    	});
		    }
		    else if(infdisnm == '전체'){
		    	const sum2 = [];
		        const covid_gender = [];
		        $.ajax({
		    		url : "/covid_gender",
		    		    method : 'GET',
		    		 	data: {},
		       			success :function(item){
		       				for(var i in item){
		        				for(var i2 in item[i]){
		        					covid_gender.push(item[i][i2].count);
		        				}
		        			}

		       			}
		    	});
		        
		        $.ajax({
		    			url : "/gender_inf",
		    			    method : 'GET',
		    			 	data: {"infdisid": "전체"},
		    	   			success :function(item){
		    	   				for(var i in item){
		    	    				for(var i2 in item[i]){
		    	    					count.push(item[i][i2].count);
		    	    				}
		    	    			}
		    	   				for(var i = 0; i<2; i++){
		    	   					var a = count[i]
		    	   					var b = covid_gender[i];
		    	   					var c = parseInt(a)+parseInt(b)
		    	   					sum2.push(c);
		    	   				}
		        				gender_chart.data.datasets[0].data = sum2;
		       					gender_chart.data.datasets[0].label = infdisnm;
		       					gender_chart.update();
		    	   			}
		        	});
		    }
		    else{
			    $.ajax({
					url : "/gender_inf",
					    method : 'GET',
					 	data: {"infdisid": infdisid},
			   			success :function(item){
			   				for(var i in item){
			    				for(var i2 in item[i]){
			    					count2.push(item[i][i2].count);
			    					gender_chart.data.datasets[0].data = count2;
			    					gender_chart.data.datasets[0].label = infdisnm;
			    				}
			    			}
			   				gender_chart.update();
			   			}
		    	});
		    }
		    
	    })

    //감염자수 · 검색트렌드 · 뉴스언급횟수 chart
    $('#inquery').on('click', function(){
	    	const sq1 = [];
	    	const sq2 = [];
		    var infdisnm = $('#grade_inf option:selected').text();
		    $.ajax({
				url : "/search_trend",
				    method : 'GET',
				 	data: {"infdisnm": infdisnm},
		   			success :function(item){
 		   				 for(var i in item){
		    				for(var i2 in item[i]){
		    					sq1.push(item[i][i2].sq1);
		    					sq1.push(item[i][i2].sq2);
		    					sq1.push(item[i][i2].sq3);
		    					sq1.push(item[i][i2].sq4);
		    					sq1.push(item[i][i2].sq5);
		    					sq1.push(item[i][i2].sq6);
		    					sq1.push(item[i][i2].sq7);
		    					sq1.push(item[i][i2].sq8);
		    					sq1.push(item[i][i2].sq9);
		    					sq1.push(item[i][i2].sq10);
		    					sq1.push(item[i][i2].sq11);
		    					sq1.push(item[i][i2].sq12);
		    					
		    				}
		    			}
 		   				let min = sq1.reduce((a,b) =>{
    						return Math.max(a,b);
    					})

    					for(var i = 0; i<sq1.length; i++){
    						sq2.push(sq1[i]/min*100);
    					}
 		   				 
 		   				trend_chart.data.datasets[0].data = sq2;
    					sangde_chart.data.datasets[0].data = sq2;
 		   				 
 		   				trend_chart.update();
 		   				sangde_chart.update();
		   			}
	    	});
	    })
	    $('#inquery').on('click', function(){
	    	const count = [];
	    	const count1 = [];
		    var infdisid = $('#grade_inf option:selected').val();
		    var infdisnm = $('#grade_inf option:selected').text();
		    $.ajax({
				url : "/news_count",
				    method : 'GET',
				 	data: {"infdisnm": infdisnm},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					count.push(item[i][i2].count)
		    				}
		    			}
		   				let min = count.reduce((a,b) =>{
    						return Math.max(a,b);
    					})
    					for(var i in item){
    						for(var i2 in item[i]){
    							count1.push((item[i][i2].count/min*100).toFixed(2));
    						}
    					}
		   				
		   				sangde_chart.data.datasets[2].data = count1;	   				
		   				trend_chart.data.datasets[2].data = count;
    					
		   				sangde_chart.update();
		   				trend_chart.update();
		   			}
	    	});
	    })
	    $('#inquery').on('click', function(){
	    	const count = [];
	    	const count1 = [];
		    var infdisid = $('#grade_inf option:selected').val();
		    var infdisnm = $('#grade_inf option:selected').text();
		    $.ajax({
				url : "/OneYear_inf",
				    method : 'GET',
				 	data: {"infdisnm": infdisnm},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					count.push(item[i][i2].count)
		    				}
		    			}
		   				let min = count.reduce((a,b) =>{
    						return Math.max(a,b);
    					})
    					for(var i in item){
    						for(var i2 in item[i]){
    							count1.push((item[i][i2].count/min*100).toFixed(2));
    						}
    					}
		   				
		   				risk_chart.data.datasets[0].data = count1;
		   				sangde_chart.data.datasets[1].data = count1;
						trend_chart.data.datasets[1].data = count;
    					
						risk_chart.update();
						sangde_chart.update();
		   				trend_chart.update();
		   			}
	    	});
	    })
	    $('#inquery').on('click', function(){
	    	const risk_news_count = [];
		    const risk_trend_count = [];
		    const risk_trend_count1 = [];
		    var infdisnm = $('#grade_inf option:selected').text();
			    $.ajax({
					url : "/risk_count",
					    method : 'GET',
					 	data: {"infdisnm": infdisnm, "sinm": ""},
			   			success :function(item){
			   				for(var i in item.news_count){
			   					risk_news_count.push(item.news_count[i].count);
			   					
			   				}
			   				for(var i in item.search_trend){
			   					risk_trend_count.push(item.search_trend[i].sq1);
			   					risk_trend_count.push(item.search_trend[i].sq2);
			   					risk_trend_count.push(item.search_trend[i].sq3);
			   					risk_trend_count.push(item.search_trend[i].sq4);
			   					risk_trend_count.push(item.search_trend[i].sq5);
			   					risk_trend_count.push(item.search_trend[i].sq6);
			   					risk_trend_count.push(item.search_trend[i].sq7);
			   					risk_trend_count.push(item.search_trend[i].sq8);
			   					risk_trend_count.push(item.search_trend[i].sq9);
			   					risk_trend_count.push(item.search_trend[i].sq10);
			   					risk_trend_count.push(item.search_trend[i].sq11);
			   					risk_trend_count.push(item.search_trend[i].sq12);
			   				}
	
	    					let min = risk_trend_count.reduce((a,b) =>{
	    						return Math.max(a,b);
	    					})
	    					for(var i = 0; i<risk_trend_count.length; i++){
	    						risk_trend_count1.push(risk_trend_count[i]/min*100);
	    					}
	    					risk_chart.data.datasets[1].data = risk_trend_count1; 
	    					risk_chart.update();
			   			}
		    	});
	    });
	    
	    const one_year_count = [];
	    const one_year_count1 = [];
		    var infdisid = $('#grade_inf option:selected').val();
		    var infdisnm = $('#grade_inf option:selected').text();
		    $.ajax({
				url : "/OneYear_inf",
				    method : 'GET',
				 	data: {"infdisnm": infdisnm},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					one_year_count.push(item[i][i2].count)
		    				}
		    			}
		   				let min = one_year_count.reduce((a,b) =>{
    						return Math.max(a,b);
    					})
    					for(var i in item){
    						for(var i2 in item[i]){
    							one_year_count1.push((item[i][i2].count/min*100).toFixed(2));
    						}
    					}
		   				
						trend_chart.data.datasets[1].data = one_year_count;
						sangde_chart.data.datasets[1].data = one_year_count1;
						risk_chart.data.datasets[0].data = one_year_count1;
						sangde_chart.update();
		   				trend_chart.update();
		   				risk_chart.update();
		   			}
	    	});
		    const news_count = [];
			const news_count1 = [];
		    $.ajax({
				url : "/news_count",
				    method : 'GET',
				 	data: {"infdisnm": infdisnm},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					news_count.push(item[i][i2].count)
		    				}
		    			}
    					let min = news_count.reduce((a,b) =>{
    						return Math.max(a,b);
    					})
    					
    					for(var i in item){
    						for(var i2 in item[i]){
    							news_count1.push((item[i][i2].count/min*100).toFixed(2));
    						}
    					}
    					
						sangde_chart.data.datasets[2].data = news_count1;  					
		   				trend_chart.data.datasets[2].data = news_count;
		   				
		   				trend_chart.update();
		   				sangde_chart.update();
		   			}
	    	});
		    
		    const sq1 = [];
		    const sq2 = [];
		    var infdisnm = $('#grade_inf option:selected').text();
		    $.ajax({
				url : "/search_trend",
				    method : 'GET',
				 	data: {"infdisnm": infdisnm},
		   			success :function(item){
 		   				 for(var i in item){
		    				for(var i2 in item[i]){
		    					sq1.push(item[i][i2].sq1);
		    					sq1.push(item[i][i2].sq2);
		    					sq1.push(item[i][i2].sq3);
		    					sq1.push(item[i][i2].sq4);
		    					sq1.push(item[i][i2].sq5);
		    					sq1.push(item[i][i2].sq6);
		    					sq1.push(item[i][i2].sq7);
		    					sq1.push(item[i][i2].sq8);
		    					sq1.push(item[i][i2].sq9);
		    					sq1.push(item[i][i2].sq10);
		    					sq1.push(item[i][i2].sq11);
		    					sq1.push(item[i][i2].sq12);
		    				}
		    			}
		   				let min = sq1.reduce((a,b) =>{
    						return Math.max(a,b);
    					})

    					for(var i = 0; i<sq1.length; i++){
    						sq2.push(sq1[i]/min*100);
    					}
    					
   						trend_chart.data.datasets[0].data = sq2;
    					sangde_chart.data.datasets[0].data = sq2;
 		   				trend_chart.update();
 		   				sangde_chart.update();
		   			}
	    	});
	    const risk_news_count = [];
	    const risk_trend_count = [];
	    const risk_trend_count1 = [];
	    var infdisnm = $('#grade_inf option:selected').text();
		    $.ajax({
				url : "/risk_count",
				    method : 'GET',
				 	data: {"infdisnm": infdisnm, "sinm": ""},
		   			success :function(item){
		   				for(var i in item.news_count){
		   					risk_news_count.push(item.news_count[i].count);
		   					
		   				}
		   				for(var i in item.search_trend){
		   					risk_trend_count.push(item.search_trend[i].sq1);
		   					risk_trend_count.push(item.search_trend[i].sq2);
		   					risk_trend_count.push(item.search_trend[i].sq3);
		   					risk_trend_count.push(item.search_trend[i].sq4);
		   					risk_trend_count.push(item.search_trend[i].sq5);
		   					risk_trend_count.push(item.search_trend[i].sq6);
		   					risk_trend_count.push(item.search_trend[i].sq7);
		   					risk_trend_count.push(item.search_trend[i].sq8);
		   					risk_trend_count.push(item.search_trend[i].sq9);
		   					risk_trend_count.push(item.search_trend[i].sq10);
		   					risk_trend_count.push(item.search_trend[i].sq11);
		   					risk_trend_count.push(item.search_trend[i].sq12);
		   				}

    					let min = risk_trend_count.reduce((a,b) =>{
    						return Math.max(a,b);
    					})
    					for(var i = 0; i<risk_trend_count.length; i++){
    						risk_trend_count1.push(risk_trend_count[i]/min*100);
    					}
    					risk_chart.data.datasets[1].data = risk_trend_count1; 
    					risk_chart.update();
		   			}
	    	});
		    
    var trend_chart;
    const IBEChart4 = document.getElementById('chartCombine01');
    trend_chart = new Chart(IBEChart4, {
      type: 'line',
      data: {
        labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
        datasets: [
          {
            label: '검색트랜드',
            data: [65, 59, 80, 81, 56, 55, 90],
            fill: false,
            borderColor: '#8BD047',
            backgroundColor: '#ffffff',
            borderWidth: 2,
            yAxisID: 'y1',
            tension: 0.4
          },
          {
            label: '감염자수',
            data: [1100, 1500, 2000, 1100, 1900, 1450, 1200],
            fill: false,
            borderColor: '#3F80E5',
            backgroundColor: '#ffffff',
            borderWidth: 2,
            yAxisID: 'y2',
            tension: 0.4
          },
          {
            label: '뉴스언급횟수',
            data: [1000, 1200, 2000, 1500, 1200, 1800, 1000],
            fill: false,
            borderColor: '#BA39EA',
            backgroundColor: '#ffffff',
            borderWidth: 2,
            yAxisID: 'y3',
            tension: 0.4
          }
        ]
      },
      options: {
        scales: {
            x: {
              ticks: {
                color: '#9092A2' 
              }            
            },
            y1: {
              type: 'linear',
              position: 'left',
              id: 'y1',
              title: {
                display: true,
                text: '검색트렌드'
              },
              min: 0, 

              ticks: {
                stepSize: 10,
                color: '#9092A2' 
              }
            },
            y2: {
                type: 'linear',
                position: 'right',
                id: 'y2',
                title: {
                  display: true,
                  text: '감염자수'
                }, 
                ticks: {
                  stepSize: 200,
                  color: '#9092A2' 
                },
                grid: {
                  drawOnChartArea: false
                }
            },
            y3: {
                type: 'linear',
                position: 'right',
                id: 'y3',
                offset: true,
                title: {
                  display: true,
                  text: '뉴스횟수'
                },
                ticks: {
                  stepSize: 200,
                  color: '#9092A2' 
                },
                grid: {
                  drawOnChartArea: false
                }
            }
        },
        plugins: {
          legend: {
            position: 'bottom',
            labels: {
              font: {
                size: 14
              },
              color: '#646674',
              padding: 22,
              boxWidth: 11,
              boxHeight: 11,
              usePointStyle: true,
              pointStyle: 'circle',
            }
          }
        }
      },
    });

    const IBEChart5 = document.getElementById('chartCombine02');  
    var sangde_chart = new Chart(IBEChart5, {
      type: 'line',
      data: {
        labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
        datasets: [
          {
            label: '검색트랜드',
            data: [100, 300, 120, 480, 260, 110],
            backgroundColor: '#ffffff',
            borderColor: '#8BD047',
            borderWidth: 2,
            tension: 0.4,
          },
          {
            label: '감염자수',
            data: [40, 100, 369, 420, 250, 490],
            backgroundColor: '#ffffff',
            borderColor: '#3F80E5',
            borderWidth: 2,
            tension: 0.4,
          },
          {
            label: '뉴스횟수',
            data: [400, 210, 380, 10, 200, 150],
            backgroundColor: '#ffffff',
            borderColor: '#BA39EA',
            borderWidth: 2,
            tension: 0.4
          }
        ]
      },
      options: {
        scales: {
          x: {
            ticks: {
              color: '#9092A2' 
            }            
          },          
          y: {
            min: 0,
            ticks: {
              stepSize: 100,
              color: '#9092A2' 
            }
          }
        },
        plugins: {
          legend: {
            position: 'bottom',
            labels: {
              font: {
                size: 14
              },
              color: '#646674',
              padding: 22,
              boxWidth: 11,
              boxHeight: 11,
              usePointStyle: true,
              pointStyle: 'circle',
            }
          }
        }        
      }
    });

    const IBEChart6 = document.getElementById('chartCombine03');  
    var risk_chart = new Chart(IBEChart6, {
      type: 'line',
      data: {
        labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
        datasets: [
          {
            label: '감염자수',
            data: [65, 59, 80, 81, 56, 55, 90],
            fill: false,
            borderColor: '#8BD047',
            backgroundColor: '#ffffff',
            borderWidth: 2,
            yAxisID: 'y1', 
            tension: 0.4
          },
          {
            label: 'Risk',
            data: [1100, 1500, 2000, 1100, 1900, 1450, 1200],
            fill: false,
            borderColor: '#3F80E5',
            backgroundColor: '#ffffff',
            borderWidth: 2,
            yAxisID: 'y2', 
            tension: 0.4
          }
        ]
      },
      options: {
        scales: {
            x: {
              ticks: {
                color: '#9092A2' 
              }            
            },
            y1: {
              type: 'linear',
              position: 'left',
              id: 'y1',
              min: 0,
              title: {
                display: true,
                text: '감염자수'
              },
              ticks: {
                stepSize: 10,
                color: '#9092A2' 
              }
            },
            y2: {
                type: 'linear',
                position: 'right',
                id: 'y2',
                title: {
                  display: true,
                  text: 'Risk'
                }, 
                ticks: {
                  stepSize: 200,
                  color: '#9092A2' 
                },
                grid: {
                  drawOnChartArea: false
                }
            }
        },
        plugins: {
          legend: {
            position: 'bottom',
            labels: {
              font: {
                size: 14
              },
              color: '#646674',
              padding: 22,
              boxWidth: 11,
              boxHeight: 11,
              usePointStyle: true,
              pointStyle: 'circle',
            }
          }
        }
      },
    });    

    //뉴스 출력
     $.ajax({
			url : "/news_content",
		    method : 'GET',
		 	data: {"infdisnm": infdisnm},
   			success :function(item){
   				for(var i in item){
    				for(var i2 in item[i]){
						$('#news').prepend('<div class="swiper-slide"><a href="'+item[i][i2].url+'" target="_blank"><div class="news-box"><div class="news-desc">'+item[i][i2].content+'</div></div></a></div>');
    				}
    			}
   			}
    	});
    
    
     //뉴스 출력
    $('#inquery').on('click', function(){
    	var infdisnm = $('#grade_inf option:selected').text();
    	$('#news').empty();
     	$.ajax({
			url : "/news_content",
		    method : 'GET',
		 	data: {"infdisnm": infdisnm},
   			success :function(item){
   				for(var i in item){
    				for(var i2 in item[i]){
						$('#news').prepend('<div class="swiper-slide"><a href="'+item[i][i2].url+'" target="_blank"><div class="news-box"><div class="news-desc">'+item[i][i2].content+'</div></div></a></div>');
    				}
    			}
   			}
    	});
    });
    
     
    
    
  </script>
   
   
</body>

</html>