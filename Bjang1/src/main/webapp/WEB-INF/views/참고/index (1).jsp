<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>감염병 빅데이터 거래소</title>
<!-- css -->
     <link rel="stylesheet" href="/resources/css/common.css" />
    <link rel="stylesheet" href="/resources/css/style.css" />
    <!--  차트 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6ca3631ca91c49471a26211d7ed34b0"></script>
     <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <style>
	.chart{
		width: 450px;
		height: 1000px;
		margin: 0 auto;
		}
	</style>
</head>
<body>
    <!-- 좌측 snb -->
    <div class="side-bar">
      <!-- 상단 로고 -->
      <div class="logo-area flex-center">
        <h1 class="logo">
          <img src="/resources/img/logo.png" alt="감염병 빅데이터 거래소" />
        </h1>
        <h2 class="title">
          Infection<br />
          BigData<br />
          Exchange<br />
          <p>감염병 빅데이터 거래소</p>
        </h2>
      </div>
      <!-- snb -->
      <nav class="snb">
        <ul class="snb__list">
          <li class="snb__list-item active">
            <a href="/" class="flex-center">
              <div class="icon-frame">
                <img src="/resources/img/icon_snb01.png" alt="질병발병 통계맵 아이콘" />
              </div>
              <p>
                질병발병 통계맵
                <img src="/resources/img/icon_snbArrow.png" alt="하위메뉴화살표" />
              </p>
            </a>
            <ul class="snb__subList">
              <li class="snb__subList-item active">
                <a href="/"> 감염자 수 기반 정보 </a>
              </li>
              <li class="snb__subList-item">
                <a href="sub_newsBase"> 뉴스 기반 정보 </a>
              </li>
              <li class="snb__subList-item">
                <a href="sub_risk"> 위험도 정보 </a>
              </li>
            </ul>
          </li>
          <li class="snb__list-item">
            <a href="sub_totalChart">
              <div class="flex-center">
                <div class="icon-frame">
                  <img
                    src="/resources/img/icon_snb02.png"
                    alt="질병발병 통계 차트 아이콘"
                  />
                </div>
                <p>질병발병 통계 차트</p>
              </div>
            </a>
          </li>
        </ul>
      </nav>
    </div>

    <!-- 전체 컨텐츠 영역 -->
    <div class="whole-container">
      <!-- 최상단 gnb -->
      <div class="gnb-wrapper flex">
        <!-- snb접는 버튼 -->
        <button class="btn-snbControl">
          <img src="/resources/img/icon_fold_arrow.png" alt="접기버튼" />
        </button>
        <!-- gnb -->
        <nav class="gnb flex">
          <h2 class="logo flex mr-20">
            <img src="/resources/img/logo_NIA.png" alt="NIA한국지능정보사회진흥원" />
          </h2>
          <ul class="gnb__list flex">
            <li class="gnb__list-item active">
              <a href="#"> 혁신서비스 메뉴 01 </a>
            </li>
            <li class="gnb__list-item">
              <a href="#"> 혁신서비스 메뉴 02 </a>
            </li>
          </ul>
        </nav>
      </div>

      <!-- 주 컨텐츠 영역 -->

      <!-- '질병발병 통계맵>감염자수 기반정보' 내용 -->
      <div class="container">
        <div class="wrapper">
          <div class="contents">
            <div class="row mb-20">
              <div class="conbox">
                <ul class="breadcrumb flex mb-20">
                  <li>
                    <a href="#">
                      <img src="/resources/img/icon_home.png" alt="홈으로 가기" />
                    </a>
                  </li>
                  <li>
                    <a href="#">질병 발병 통계 차트</a>
                  </li>
                  <li>
                    <a href="#">감염자수 기반 정보</a>
                  </li>
                </ul>
                <div class="conbox__title-frame">
                  <h3 class="conbox__title-b">질병 발병 통계 맵</h3>
                </div>
              </div>
            </div>
            <div class="row mb-20">
              <div class="conbox">
                <div class="conbox__title-frame flex-both">
                  <h3 class="conbox__title">질병 발병 위기경보</h3>
                  <div class="select-frame">
                    <div class="select-wrap sel-s-1">
                      <button type="button" class="btn-select">
                        증가율
                        <img
                          src="/resources/img/icon_selectArrow.png"
                          alt="셀렉트 화살표"
                        />
                      </button>
                      <ul class="option__list" >
                        <li class="option__list-item">
                          <button type="button">AAA</button>
                        </li>
                        <li class="option__list-item">
                          <button type="button">BBB</button>
                        </li>
                        <li class="option__list-item">
                          <button type="button">CCC</button>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="conbox__content">
                그래프 들어갈 자리
                </div>
              </div>
            </div>
            <div class="row flex">
              <div class="col w-50 mr-20">
                <div class="conbox">
                  <div class="conbox__title-frame flex-both bor-b">
                    <h3 class="conbox__title">감염자수 기반 정보</h3>
                    <div class="select-frame flex-end">
                      <div class="select-wrap sel-s-1 mr-10">
                        <button type="button" id="regionBtn" class="btn-select regionBtn">
                          <img
                            src="/resources/img/icon_selectArrow.png"
                            alt="셀렉트 화살표"
                          />
                        </button>
                        <ul class="option__list">
                          <li class="option__list-item regionAll">
                            <button type="button">전국</button>
                          </li>
                          <c:forEach var="key2" items="${key2}">
                          <li class="option__list-item regionList">
                            <button type="button">${key2.keyword2}</button>
                          </li>
                          </c:forEach>
                        </ul>
                      </div>
                      <div class="select-wrap sel-s-1">
                        <button type="button" id="epidBtn" class="btn-select epidBtn">
                                                    
                            <img src="/resources/img/icon_selectArrow.png" alt="셀렉트 화살표"/>
                        </button>
                        <ul class="option__list">
                         	<li class="option__list-item epdiAll">
                                <button type="button">전체</button>
                            </li>
                        <c:forEach var="key1" items="${key1}">
                            <li class="option__list-item epidList">
                                <button type="button">${key1.keyword1}</button>
                            </li>
                        </c:forEach>
                        </ul>
                      </div>
                      <script>
						 	$(function(){
						 		const url = location.search;
						 		const a = new URLSearchParams(url);
						 		
						 		console.log(a.get('keyword1'));
						 		
						 		if(a.get('keyword2') != null && a.get('keyword2') != ""){
						 			$("#regionBtn").text(a.get('keyword2'));
						 			$("#regionBtn").append("<img src='/resources/img/icon_selectArrow.png' alt='셀렉트 화살표'/>");
						 		}else{
						 			$("#regionBtn").text('전국');
						 			$("#regionBtn").append("<img src='/resources/img/icon_selectArrow.png' alt='셀렉트 화살표'/>");
						 		}
						 		
						 		if(a.get('keyword1') != null && a.get('keyword1') != ""){
						 			$("#epidBtn").text(a.get('keyword1'));
						 			$("#epidBtn").append("<img src='/resources/img/icon_selectArrow.png' alt='셀렉트 화살표'/>");

						 		}else{
						 			$("#epidBtn").text('전체');
						 			$("#epidBtn").append("<img src='/resources/img/icon_selectArrow.png' alt='셀렉트 화살표'/>");
						 		}		
						 		
						 		
						 		
						 		//지역 전체 클릭시
						 		$(".regionAll").on("click", function(){
						 			if(a.get('keyword1') != null && a.get('keyword1') != ""){
							 			const keyword1 = document.getElementById("epidBtn").innerText;	
							 			location.href="?keyword1="+keyword1;
							 			
							 		}else{
							 			const keyword1 = "";
							 			location.href="/";
							 		}		
						 			
						 		});
						 		
						 		//지역 클릭시
						 		$(".regionList").on("click", function(){
						 			$(".regionBtn").text($(this).text());
						 			const keyword2 = document.getElementById("regionBtn").innerText;
						 			if(a.get('keyword1') != null && a.get('keyword1') != ""){
							 			const keyword1 = document.getElementById("epidBtn").innerText;	
							 			location.href="?keyword1="+keyword1+"&&keyword2="+keyword2;
							 		}else{
							 			const keyword1 = "";
							 			location.href="?keyword2="+keyword2;
							 		}		
						 			
						 		});
						 		
						 		
						 		//병명 전체 클릭시
						 		$(".epdiAll").on("click", function(){
						 			if(a.get('keyword2') != null && a.get('keyword2') != ""){
							 			const keyword2 = document.getElementById("regionBtn").innerText;
							 			location.href="?keyword2="+keyword2;
							 		}else{
							 			const keyword2 = "";
							 			location.href="/";
							 		}
						 		});
						 		
						 		//질병 클릭시
						 		$(".epidList").on("click", function(){
						 			$(".epidBtn").text($(this).text());
						 			
						 			const keyword1 = document.getElementById("epidBtn").innerText;
						 			if(a.get('keyword2') != null && a.get('keyword2') != ""){
							 			const keyword2 = document.getElementById("regionBtn").innerText;
							 			location.href="?keyword1="+keyword1+"&&keyword2="+keyword2;
							 		}else{
							 			const keyword2 = "";
							 			location.href="?keyword1="+keyword1;
							 		}
						 		});
						 		
						 	})
						</script> 
                    </div>
                  </div>
                  <div class="conbox__sub-title-frame bor-b mb-20">
                    <h3 class="conbox__sub-title">
                      2022년 11월
                      <span class="color-blue">지역별</span>
                      전염병 발생 건수
                    </h3>
                  </div>
                  <div class="conbox__content" style="position: relative;">
	                  <div class="boxcl" style="position:absolute; z-index: 2">
			            	<c:forEach var="min" items="${minInfo}">
			            		<div id="${min.keyword2}" class="ab ${min.keyword2}">
				            		<div class="cl" >
										<p style="top:13px; left:20%; right:20%; position: absolute;">${min.selm}</p>
									</div>
									
			            		</div>
			            	</c:forEach>
					</div>
                  	<div id="map" style="width:100%;height:1105px;position:relative ;"></div>
					<script type="text/javascript">
						var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
						var options = { //지도를 생성할 때 필요한 기본 옵션
							center: new kakao.maps.LatLng(35.5040736, 127.7994855), //지도의 중심좌표.
							level: 12,//지도의 레벨(확대, 축소 정도)
							draggable: false //감리 임시용 나중에 마커 or 그림그리는 것으로 바꿔서 위도경도 로 찍어줘야함
						};
						
						var map = new kakao.maps.Map(container, options);
					</script>
	    			
                
                  </div>
                </div>
              </div>
              <div class="col w-50">
                <div class="conbox">
                  <div class="conbox__title-frame flex-both bor-b mb-20">
                    <h3 class="conbox__title">
                      <span class="color-blue">지역별</span>
                      전염병 발생 건수 순위
                    </h3>
                    <div class="select-frame flex-end">
                      <div class="select-wrap sel-s-1">
                        <button type="button" class="btn-select">
                          인구별
                          <img
                            src="/resources/img/icon_selectArrow.png"
                            alt="셀렉트 화살표"
                          />
                        </button>
                        <ul class="option__list">
                          <li class="option__list-item">
                            <button type="button">지역별</button>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="conbox__content">
                  <div class="chart">
	              	<canvas id="bar-chart-grouped"></canvas>
	              	<script>
	              	const url = location.search;
			 		const a = new URLSearchParams(url);
			 		
	              	const TopInfLabels = [];
	              	const TopInfEpid = a.get('keyword1') != null ? a.get('keyword1') : '전체';
	              	<c:forEach var="TopInf" items="${TopInf}">
	              		TopInfLabels.push(`${TopInf.keyword2}`);
	              	</c:forEach>
	              	
	              	
	              	new Chart(document.getElementById("bar-chart-grouped"), {
	              	    type: 'bar',
	              	    data: {
	              	      labels: [TopInfEpid],
	              	      datasets: [
	              	        {
	              	          label: [`${TopInf.get(16).keyword2}`] ,
	              	          backgroundColor: "#3e95cd",
	              	          data: [${TopInf.get(16).count}]
	              	        }, {
	              	          label: [`${TopInf.get(15).keyword2}`] ,
	              	          backgroundColor: "#ae95cd",
	              	          data: [${TopInf.get(15).count}] 
	              	        }, {
		              	      label: [`${TopInf.get(14).keyword2}`] ,
	              	          backgroundColor: "#cef5cd",
	              	          data: [${TopInf.get(14).count}]
	              	        }, {
  	              	          label:[`${TopInf.get(13).keyword2}`] ,
	              	          backgroundColor: "#afffdd",
	              	          data: [${TopInf.get(13).count}] 
	              	        }
                  	      , {
	              	          label: [`${TopInf.get(12).keyword2}`] ,
	              	          backgroundColor: "#2a75cd",
	              	          data: [${TopInf.get(12).count}] 
	              	        }
                  	    , {
	              	          label: [`${TopInf.get(11).keyword2}`] ,
	              	          backgroundColor: "#ec1fad",
	              	          data: [${TopInf.get(11).count} ]
	              	        }
                  	  , {
              	          label: [`${TopInf.get(10).keyword2}`] ,
              	          backgroundColor: "#cc75cd",
              	          data: [${TopInf.get(10).count}] 
              	        }
                  	, {
            	          label: [`${TopInf.get(9).keyword2}`] ,
            	          backgroundColor: "#bc95cd",
            	          data: [${TopInf.get(9).count}] 
            	        }
                  	, {
            	          label: [`${TopInf.get(8).keyword2}`] ,
            	          backgroundColor: "#aaaacd",
            	          data: [${TopInf.get(8).count}] 
            	        }
                  	, {
            	          label: [`${TopInf.get(7).keyword2}`] ,
            	          backgroundColor: "#4ad2cd",
            	          data: [${TopInf.get(7).count}] 
            	        }
                  	, {
            	          label: [`${TopInf.get(6).keyword2}`] ,
            	          backgroundColor: "#8df1cd",
            	          data: [${TopInf.get(6).count}] 
            	        }
                  	, {
            	          label: [`${TopInf.get(5).keyword2}`] ,
            	          backgroundColor: "#fd22cd",
            	          data: [${TopInf.get(5).count}] 
            	        }
                  	, {
            	          label: [`${TopInf.get(4).keyword2}`] ,
            	          backgroundColor: "#4ae1cd",
            	          data: [${TopInf.get(4).count}]
            	        }
                  	, {
            	          label: [`${TopInf.get(3).keyword2}`] ,
            	          backgroundColor: "#ed12cd",
            	          data: [${TopInf.get(3).count}]
            	        }
                  	, {
            	          label: [`${TopInf.get(2).keyword2}`] ,
            	          backgroundColor: "#1af3cd",
            	          data: [${TopInf.get(2).count} ]
            	        }
                  	, {
            	          label: [`${TopInf.get(1).keyword2}`] ,
            	          backgroundColor: "#ab52cd",
            	          data: [${TopInf.get(1).count} ]
            	        }
                  	, {
            	          label: [`${TopInf.get(0).keyword2}`] ,
            	          backgroundColor: "#bd13cd",
            	          data: [${TopInf.get(0).count} ]
            	        }
                  	
                  		]},
	              	    options: {
	              	    	maintainAspectRatio :false,//그래프의 비율 유지,
	              	    	plugins :{
	          			      legend: { 
	          			    	  	display : true,
	          			    	  	position: 'bottom',
	          			    	  	labels:{
	          			    	  		fontSize:10
	          			    	  	},
	          			    	  align : 'center'
	          			      }
	          			    },
	       	        	 scales:{
	       	        		y:{ //x축값 누적
	       	                    stacked:true
	       	                },
	       	                x:{ //y축값 누적
	       	                    stacked:true
	       	                },  
	       	            },
	              	      title: {
	              	        display: true,
	              	        text: 'Population growth (millions)',
	            	        	 
	              	      }
	              	    }
	              	});
	              	</script>
                  
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- script -->
    <script src="/resources/js/jquery-1.11.1.min.js"></script>
    <script src="/resources/js/script.js"></script>
  </body>
</html>