<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-PRN7JTV');</script>
<!-- End Google Tag Manager -->
<meta charset="UTF-8">
  <title>위험도 정보</title>
<!-- css -->
     <link rel="stylesheet" href="/resources/css1/common1.css" />
    <link rel="stylesheet" href="/resources/css/style.css" />
    <link rel="stylesheet" href="/resources/css/customSelect.css">
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6ca3631ca91c49471a26211d7ed34b0"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    
    <style>
	.chart{
		width: 450px;
		height: 300px;
		margin: 0 auto;
		}
	.chartbox{
		width: 450px;
		height: 800px;
		position: relative;
		}
	.chartbox chart{
		display: block;
		}
	.overr{
	 width:150px;
	 text-align:center;
	}
</style>
 <script>

 </script>
</head>
<script async src="https://www.googletagmanager.com/gtag/js?id=G-9FEQBG71R3"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-9FEQBG71R3');
</script>
<body>
     <body>
     
        <!-- 좌측 snb -->
        <div class="side-bar">
            <!-- 상단 로고 -->
            <div class="logo-area flex-center">
                <h1 class="logo">
                    <img src="/resources/img/pj_1/logo.png" alt="감염병 빅데이터 거래소"/>
                </h1>
                <h2 class="title">
                    Infection<br/>
                    BigData<br/>
                    Exchange<br/>
                    <p>감염병 빅데이터 거래소</p>
                </h2>
            </div>
            <!-- snb -->
            <nav class="snb">
                <ul class="snb__list">
                    <li class="snb__list-item active">
                        <a href="/" class="flex-center">
                            <div class="icon-frame">
                                <img src="/resources/img/pj_1/icon_snb01.png" alt="질병발병 통계맵 아이콘"/>
                            </div>
                            <p>
                                질병발병 통계맵
                                <img src="/resources/img/pj_1/icon_snbArrow.png" alt="하위메뉴화살표"/>
                            </p>
                        </a>
                        <ul class="snb__subList">
                            <li class="snb__subList-item">
                                <a href="/">
                                    감염자 수 기반 정보
                                </a>
                            </li>
                            <li class="snb__subList-item">
                                <a href="sub_newsBase">
                                    뉴스 기반 정보
                                </a>
                            </li>
                            <li class="snb__subList-item active">
                                <a href="sub_risk">
                                    위험도 정보
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="snb__list-item">
                        <a href="sub_totalChart">
                            <div class="flex-center">
                                <div class="icon-frame">
                                    <img src="/resources/img/pj_1/icon_snb02.png" alt="질병발병 통계 차트 아이콘"/>
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
                    <img src="/resources/img/pj_1/icon_fold_arrow.png" alt="접기버튼"/>
                </button>
                <!-- gnb -->
                <nav class="gnb flex">
<!--                     <h2 class="logo flex mr-20">
                        <img src="/resources/img/pj_1/logo_NIA.png" alt="NIA한국지능정보사회진흥원"/>
                    </h2> -->
                    <ul class="gnb__list flex">
                        <li class="gnb__list-item active">
                            <a href="/">
                                감염병 위기관리 활용 서비스 
                            </a>
                        </li>
                        <li class="gnb__list-item">
                            <a href="/gis" target="_blank">
                                 GIS기반 인구이동 활용 서비스 
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>

            <!-- 주 컨텐츠 영역 -->

            <!-- '질병발병 통계맵>위험도 정보' 내용 -->
            <div class="container tab1-3-con">
                <div class="wrapper">
                    <div class="contents">
                        <div class="row mb-20">
                            <div class="conbox">
                                <ul class="breadcrumb flex mb-20">
                                    <li>
                                        <a href="/">
                                            <img src="/resources/img/pj_1/icon_home.png" alt="홈으로 가기"/>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/">질병 발병 통계맵</a>
                                    </li>
                                    <li>
                                        <a href="/sub_risk">위험도 정보</a>
                                    </li>
                                </ul>
                                <div class="conbox__title-frame">
                                    <h3 class="conbox__title-b">질병 발병 통계 맵</h3>
                                </div>
                                <div class="conbox__content">
                                    <p class="conbox__info-ment">
                                        대한민국에서 발병한 질병 발병 통계를 지도를 사용하여 보여 줍니다.<br>
                                        사용자는 한눈에 지역별 질병 발병 현황을 확인할 수 있습니다.<br>
                                        사용자는 연도, 월, 지역, 그리고 병 이름을 선택하여 관심이 있는 질병 발병 통계 지도를 생성할 수 있습니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="row flex">
                            <div class="col w-50 mr-20">
                                <div class="conbox mb-20">
                                    <div class="conbox__title-frame flex-both bor-b">
                                        <h3 class="conbox__title">위험도 기반 정보</h3>
                                        <div class="select-frame flex-end">
                                            <div id="region" class="myDiv">
						                         <select>
						                             <option class="regionAll">전국</option>
						                         </select>
					                     	</div>
                                            <div id="infDis" class="myDiv">
					                        	<select>
					                           		<option>전체</option>
					                           		<c:forEach var="key1" items="${key1}">
					                           			<option class="epidList">${key1.infdisnm}</option>
					                        		</c:forEach>
					                              </select>
					                         </div>
                                        </div>
                                    </div>
                                    <div class="conbox__sub-title-frame bor-b mb-20">
                                        <h3 class="conbox__sub-title">
                                            ${InfDis.get(0).year}년 ${InfDis.get(0).month}월 지역별 전염병 발생 건수
                                        </h3>
                                    </div>
                                    <div class="conbox__content" style="position: relative; "  >
										<script>
										 	$(function(){
										 		const url = location.search;
										 		const a = new URLSearchParams(url);
										 		
										 		if(a.get('keyword1') != null && a.get('keyword1') != ""){
										 			$("#infDis > .mySelect > .selec").text(a.get('keyword1'));
										 		}else{
										 			$("#infDis > .mySelect > .selec").text('전체');
										 		}		
										 		
										 		//질병 선택시
										 		$("#infDis > .mySelect > ul").on("click", function(){
										 			const keyword1 = $("#infDis > .mySelect > .selec").text();
										 			if(keyword1 =="전체"){
												 		location.href="sub_risk";
										 			}else{
												 		location.href="sub_risk?keyword1="+keyword1;

										 			}
										 		});
 	
										 		
										 	})
										</script>
                                    	<div id="map" style="width:100%;height:1105px;position:relative ;"></div>
										<script type="text/javascript">
										var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
										var options = { //지도를 생성할 때 필요한 기본 옵션
											center: new kakao.maps.LatLng(35.5140736, 127.7994855), //지도의 중심좌표.
											level: 12,//지도의 레벨(확대, 축소 정도)
											//draggable: false //감리 임시용 나중에 마커 or 그림그리는 것으로 바꿔서 위도경도 로 찍어줘야함
										};
										var map = new kakao.maps.Map(container, options);			
										
										 // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 

										 var positions = [];										 
										 
										 <c:forEach var="InfDis" items="${InfDis}">
										 <c:if test="${InfDis.scount < 50}">
											 positions.push({
												 content:'<div class="overr">${InfDis.sinm}<br/>${InfDis.count}</div>',
												 latlng: new kakao.maps.LatLng(${InfDis.lat}, ${InfDis.lng}),
												 img:'/resources/img/pj_1/보통.png'
											 });
										   </c:if>
										 <c:if test="${InfDis.scount >= 50}">
											 positions.push({
												 content:'<div class="overr">${InfDis.sinm}<br/>${InfDis.count}</div>',
												 latlng: new kakao.maps.LatLng(${InfDis.lat}, ${InfDis.lng}),
												 img:'/resources/img/pj_1/주의.png'
											 });
										 </c:if>
											 
										 <c:if test="${InfDis.scount >= 70}">
											 positions.push({
												 content:'<div class="overr">${InfDis.sinm}<br/>${InfDis.count}</div>',
												 latlng: new kakao.maps.LatLng(${InfDis.lat}, ${InfDis.lng}),
												 img:'/resources/img/pj_1/위험.png'
											 });
										 </c:if>	
										 </c:forEach>
										 
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
											
											
										</script>
                                    </div>
                                </div>
                                <div class="conbox">
                                    <div class="conbox__title-frame flex-both bor-b mb-20">
                                        <h3 class="conbox__title">실제 감염자 수 와 risk 추이 (지난 1년)</h3>
                                    </div>
                                    <div class="conbox__content">
                                     <div class="chart">
										<canvas id="line-chart1" width="800" height="450"></canvas>
									</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col w-50">
                                <div class="conbox mb-20" >
                                    <div class="conbox__title-frame flex-both bor-b mb-20">
                                        <h3 class="conbox__title">지난 1년 실제 감염자 수 / 검색트렌드/ 뉴스언급횟수 비교(절대)</h3>
                                    </div>
                                    <div class="conbox__content">
                                    	<div class="chart">
											<canvas id="line-chart" width="800" height="525px"></canvas>
												<script>
													const MonthArray = [];
													const CntArray = [];
													const SCntArray = [];
													const NewsArray = [];
													const SearchArray = [];
													const perCnt = [];
													const perNewsCnt = [];
													const minInfSq = [];
													<c:forEach var="LastYear" items="${LastYear}">
														MonthArray.push(${LastYear.year}+"."+${LastYear.month});
														CntArray.push(${LastYear.count});
													<c:if test="${SDInf != 0}">
														perCnt.push((${LastYear.count}/${SDInf}*100).toFixed(2));
														<c:set var="total" value="${total + LastYear.count}"/>
													</c:if>
													</c:forEach>
													
													/* 검색률 차이 start */
													minInfSq.push((${LastYear.get(0).count/SDInf*100}-${SearchVo.get(0).sq1}).toFixed(2));
													minInfSq.push((${LastYear.get(1).count/SDInf*100}-${SearchVo.get(0).sq2}).toFixed(2));
													minInfSq.push((${LastYear.get(2).count/SDInf*100}-${SearchVo.get(0).sq3}).toFixed(2));
													minInfSq.push((${LastYear.get(3).count/SDInf*100}-${SearchVo.get(0).sq4}).toFixed(2));
													minInfSq.push((${LastYear.get(4).count/SDInf*100}-${SearchVo.get(0).sq5}).toFixed(2));
													minInfSq.push((${LastYear.get(5).count/SDInf*100}-${SearchVo.get(0).sq6}).toFixed(2));
													minInfSq.push((${LastYear.get(6).count/SDInf*100}-${SearchVo.get(0).sq7}).toFixed(2));
													minInfSq.push((${LastYear.get(7).count/SDInf*100}-${SearchVo.get(0).sq8}).toFixed(2));
													minInfSq.push((${LastYear.get(8).count/SDInf*100}-${SearchVo.get(0).sq9}).toFixed(2));
													minInfSq.push((${LastYear.get(9).count/SDInf*100}-${SearchVo.get(0).sq10}).toFixed(2));
													minInfSq.push((${LastYear.get(10).count/SDInf*100}-${SearchVo.get(0).sq11}).toFixed(2));
													minInfSq.push((${LastYear.get(11).count/SDInf*100}-${SearchVo.get(0).sq12}).toFixed(2));
													/* 검색률 차이 end */
													
													<c:forEach var="NewsVo" items="${NewsVo}">
														NewsArray.push(${NewsVo.volume});
														perNewsCnt.push((${NewsVo.volume}/${news_volume_totalMax}*100).toFixed(2));
													</c:forEach>
													
													<c:forEach var="SearchVo" items="${SearchVo}">
														SearchArray.push(${SearchVo.sq1});
														SearchArray.push(${SearchVo.sq2});
														SearchArray.push(${SearchVo.sq3});
														SearchArray.push(${SearchVo.sq4});
														SearchArray.push(${SearchVo.sq5});
														SearchArray.push(${SearchVo.sq6});
														SearchArray.push(${SearchVo.sq7});
														SearchArray.push(${SearchVo.sq8});
														SearchArray.push(${SearchVo.sq9});
														SearchArray.push(${SearchVo.sq10});
														SearchArray.push(${SearchVo.sq11});
														SearchArray.push(${SearchVo.sq12});
													</c:forEach>
												</script>
										  </div>
                                    </div>
                                </div>
                                <div class="conbox mb-20">
                                    <div class="conbox__title-frame flex-both bor-b mb-20">
                                        <h3 class="conbox__title">지난 1년 실제 감염자 수 / 검색트렌드/ 뉴스언급 비율 비교 (상대)</h3>
                                    </div>
                                    <div class="conbox__content">
										<div class="chart">
							              	<canvas id="bar-chart-grouped"></canvas>
							              	<script>
							              	//1년감염자수 검색트랜드 뉴스언급비율 상대 그래프
							              	new Chart(document.getElementById("bar-chart-grouped"), {
							              	    type: 'line',
							              	    data: {
							              	      labels: MonthArray,
							              	      datasets: [
							              	        {
							              	          label: `CDC`,
							              	          backgroundColor: "#3e95cd",
							              	          borderColor:"#3e95cd",
							              	          data: perCnt,
							              	          fill: false
							              	        }, {
							              	          label: "검색횟수",
							              	          backgroundColor: "#8e5ea2",
							              	          borderColor:"#8e5ea2",
							              	          data: SearchArray,
							              	          fill: false
							              	        },{
						                	          label: "뉴스 언급 횟수",
						                  	          backgroundColor: "#3cba9f",
						                  	          borderColor:"#3cba9f",
						                  	          data: perNewsCnt,
						                  	          fill: false
						                  	        }
							              	      ]
							              	    },
							              	    options: {
							              	    	maintainAspectRatio :false,//그래프의 비율 유지,    	 
							              	      title: {
							              	        display: true,
							              	        text: '', 
							              	      },scales: {
								              	    	yAxes: [{
								        					ticks: {
								        						beginAtZero: true,
								        						fontSize : 14,
								        					}
								        				}]
									          	    }
							              	    }
							              	});
							              	</script>
							              </div>
									</div>
                                </div>
                                <div class="conbox mb-20">
                                    <div class="conbox__title-frame flex-both bor-b mb-20">
                                        <h3 class="conbox__title">실제 감염자 비율 대비 검색트렌드 뉴스언급율 차이</h3>
                                    </div>
                                    <div class="conbox__content">
	                                    <div class="chart">
								             <canvas id="bar-chart"></canvas>
								        </div>
						            </div>
                                </div>
                                <div class="conbox">
                                    <div class="conbox__title-frame flex-both bor-b mb-20">
                                        <h3 class="conbox__title">누적 기간별 감염자 비율과 risk와의 상관 관계</h3>
                                    </div>
                                    <div class="conbox__content">
                                    <div class="chart">
										<canvas id="line-chart2" width="800" height="450"></canvas>
									</div>
                                    </div>
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
    <script src="/resources/js/customSelect.js"></script>
  </body>
  <!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PRN7JTV"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
  <script type="text/javascript">
					
					 new Chart(document.getElementById("line-chart"), { // 지난 1년 실제 감염자수 (절대)					
						  type: 'line',
						  data: {
						    labels: MonthArray, // x축(년월별)
						    datasets: [{ 
						        data: CntArray, //y축
						        label: `CDC`, //지난 월 년도
						        borderColor: "#3e95cd",
						        fill: false,
	                  	        yAxisID:'1-y-axis'
						      },  { 
						        data: SearchArray,
						        label: "검색횟수",
						        borderColor: "#8e5ea2",
						        fill: false,
	                  	        yAxisID:'2-y-axis'
						      }, { 
						        data: NewsArray,
						        label: "뉴스언급횟수",
						        borderColor: "#3cba9f",
						        fill: false,
	                  	        yAxisID:'3-y-axis'
						      } 
						    ]
						  },
						  options: {
						    title: {
						      display: true,
						      text: '지난 1년 감염자 수'
						    },scales: {
			          	    	yAxes: [{
			                        id: '1-y-axis',
			                        type: 'linear',
			                        position:'right'
			                    }, {
			                        id: '2-y-axis',
			                        type: 'linear',
			                        position:'left'
			                    },{
			                    	id: '3-y-axis',
			                    	type:'linear',
			                    	position:'right'
			                    }]
			          	    }
						  }
						});
					 
					 const From = [0, 0.1, 0.2, 0.3, 0.4, 0.45, 0.5 ,0.55, 0.7, 0.8, 0.9, 1.0];
					const risk0 = [];
					const risk1 = [];
					const risk2 = [];
					const risk3 = [];
					const risk4 = [];
					const risk5 = [];
					const risk6 = [];
					const risk7 = [];
					const risk8 = [];
					const risk9 = [];
					const risk10 = [];
					const risk11 = [];

					const beta0 = [];
					const beta20 = [];
					const gamma0 = [];
					const gamma20 = [];
					const alpa0 = [];
					
					const beta21 = [];
					const gamma1 = [];
					const gamma21 = [];
					const alpa1 = [];
					
					const beta22 = [];
					const gamma2 = [];
					const gamma22 = [];
					const alpa2 = [];
					
					const beta23 = [];
					const gamma3 = [];
					const gamma23 = [];
					const alpa3 = [];
					
					const beta24 = [];
					const gamma4 = [];
					const gamma24 = [];
					const alpa4 = [];
					
					const beta25 = [];
					const gamma5 = [];
					const gamma25 = [];
					const alpa5 = [];
					
					const beta26 = [];
					const gamma6 = [];
					const gamma26 = [];
					const alpa6 = [];
					
					const beta27 = [];
					const gamma7 = [];
					const gamma27 = [];
					const alpa7 = [];
					
					const beta28 = [];
					const gamma8 = [];
					const gamma28 = [];
					const alpa8 = [];
					
					const beta29 = [];
					const gamma9 = [];
					const gamma29 = [];
					const alpa9 = [];
					
					const beta210 = [];
					const gamma10 = [];
					const gamma210 = [];
					const alpa10 = [];
					
					const beta211 = [];
					const gamma11 = [];
					const gamma211 = [];
					const alpa11 = [];
					
					const gob = [];
					const cdc = (${total}/(${SDInf}*12)*100);
					const cdcp = [];
					
					const last0 = [];
					const bunsan0 = [];
					const last1 = [];
					const bunsan1 = [];
					const last2 = [];
					const bunsan2 = [];
					const last3 = [];
					const bunsan3 = [];
					const last4 = [];
					const bunsan4 = [];
					const last5 = [];
					const bunsan5 = [];
					const last6 = [];
					const bunsan6 = [];
					const last7 = [];
					const bunsan7 = [];
					const last8 = [];
					const bunsan8 = [];
					const last9 = [];
					const bunsan9 = [];
					const last10 = [];
					const bunsan10 = [];
					const last11 = [];
					const bunsan11 = [];
					
				<c:forEach var="Cnt" begin="0" end="11" varStatus="status0">
					cdcp.push(perCnt[${status0.index}]-cdc);
				</c:forEach>
				<c:forEach var="Cnt" begin="0" end="11" varStatus="status1">
					<c:forEach var="NewsVo" items="${NewsVo}" varStatus="status">
						risk${status1.index}.push((SearchArray[${status.index}] * From[${Cnt}]) + (NewsArray[${status.index}] * (1 - From[${Cnt}])));
					</c:forEach>
				</c:forEach>
				
				<c:forEach var="cnt" begin="0" end="11">
					for(var i = 0; i<12; i++){
						gamma${cnt}.push(risk${cnt}[i]-${NPear});
						alpa${cnt}.push((cdcp[i] * gamma${cnt}[i])/11);
						beta2${cnt}.push(Math.pow(cdcp[i],2)/11);
						gamma2${cnt}.push(Math.pow(gamma${cnt}[i], 2)/11);
						//gob.push(Math.sqrt(beta2${cnt}[${status.index}])*Math.sqrt(gamma2${cnt}[${status.index}]));
					}

					<c:set var="total10" value="${total10} + beta20[${cnt}]"/>
					<c:set var="total20" value="${total20} + gamma20[${cnt}]"/>
					<c:set var="total30" value="${total30} + alpa0[${cnt}]"/>
					
					<c:set var="total11" value="${total11} + beta21[${cnt}]"/>
					<c:set var="total21" value="${total21} + gamma21[${cnt}]"/>
					<c:set var="total31" value="${total31} + alpa1[${cnt}]"/>
					
					<c:set var="total12" value="${total12} + beta22[${cnt}]"/>
					<c:set var="total22" value="${total22} + gamma22[${cnt}]"/>
					<c:set var="total32" value="${total32} + alpa2[${cnt}]"/>
								
					<c:set var="total13" value="${total13} + beta23[${cnt}]"/>
					<c:set var="total23" value="${total23} + gamma23[${cnt}]"/>
					<c:set var="total33" value="${total33} + alpa3[${cnt}]"/>
											
					<c:set var="total14" value="${total14} + beta24[${cnt}]"/>
					<c:set var="total24" value="${total24} + gamma24[${cnt}]"/>
					<c:set var="total34" value="${total34} + alpa4[${cnt}]"/>
												
					<c:set var="total15" value="${total15} + beta25[${cnt}]"/>
					<c:set var="total25" value="${total25} + gamma25[${cnt}]"/>
					<c:set var="total35" value="${total35} + alpa5[${cnt}]"/>
					
					<c:set var="total16" value="${total16} + beta26[${cnt}]"/>
					<c:set var="total26" value="${total26} + gamma26[${cnt}]"/>
					<c:set var="total36" value="${total36} + alpa6[${cnt}]"/>
									
					<c:set var="total17" value="${total17} + beta27[${cnt}]"/>
					<c:set var="total27" value="${total27} + gamma27[${cnt}]"/>
					<c:set var="total37" value="${total37} + alpa7[${cnt}]"/>
											
					<c:set var="total18" value="${total18} + beta28[${cnt}]"/>
					<c:set var="total28" value="${total28} + gamma28[${cnt}]"/>
					<c:set var="total38" value="${total38} + alpa8[${cnt}]"/>
												
					<c:set var="total19" value="${total19} + beta29[${cnt}]"/>
					<c:set var="total29" value="${total29} + gamma29[${cnt}]"/>
					<c:set var="total39" value="${total39} + alpa9[${cnt}]"/>
					
					<c:set var="total110" value="${total110} + beta210[${cnt}]"/>
					<c:set var="total210" value="${total210} + gamma210[${cnt}]"/>
					<c:set var="total310" value="${total310} + alpa10[${cnt}]"/>

					<c:set var="total111" value="${total111} + beta28[${cnt}]"/>
					<c:set var="total211" value="${total211} + gamma28[${cnt}]"/>
					<c:set var="total311" value="${total311} + alpa11[${cnt}]"/>
				</c:forEach>
					
				bunsan0.push(Math.sqrt(${total10}) * Math.sqrt(${total20}));	
				last0.push(Math.round(${total30}, 2)/Math.round(bunsan0));
				
				bunsan1.push(Math.sqrt(${total11}) * Math.sqrt(${total21}));	
				last1.push(Math.round(${total31}, 2)/bunsan1);
				
				bunsan2.push(Math.sqrt(${total12}) * Math.sqrt(${total22}));	
				last2.push(Math.round(${total32}, 2)/bunsan2);
				
				bunsan3.push(Math.sqrt(${total13}) * Math.sqrt(${total23}));	
				last3.push(Math.round(${total33}, 2)/bunsan3);
				
				bunsan4.push(Math.sqrt(${total14}) * Math.sqrt(${total24}));	
				last4.push(Math.round(${total34}, 2)/bunsan4);
				
				bunsan5.push(Math.sqrt(${total15}) * Math.sqrt(${total25}));	
				last5.push(Math.round(${total35}, 2)/bunsan5);
				
				bunsan6.push(Math.sqrt(${total16}) * Math.sqrt(${total26}));	
				last6.push(Math.round(${total36}, 2)/bunsan6);
				
				bunsan7.push(Math.sqrt(${total17}) * Math.sqrt(${total27}));	
				last7.push(Math.round(${total37}, 2)/bunsan7);
				
				bunsan8.push(Math.sqrt(${total18}) * Math.sqrt(${total28}));	
				last8.push(Math.round(${total38}, 2)/bunsan8);
				
				bunsan9.push(Math.sqrt(${total19}) * Math.sqrt(${total29}));	
				last9.push(Math.round(${total39}, 2)/bunsan9);
				
				bunsan10.push(Math.sqrt(${total110}) * Math.sqrt(${total210}));	
				last10.push(Math.round(${total310}, 2)/bunsan10);
				
				bunsan11.push(Math.sqrt(${total111}) * Math.sqrt(${total211}));	
				last11.push(Math.round(${total311}, 2)/bunsan11);
				
					//risk추이 그래프
					new Chart(document.getElementById("line-chart1"), { //risk추이 (지난 1년)
		          	  type: 'line',
		          	  data: {
		          	    labels: MonthArray,
		          	    datasets: [{ 
		          	    	data: perCnt, //y축
					        label: `CDC`, //지난 월 년도
					        borderColor: "#3e95cd",
					        fill: false,
					        tension: 0.3,
					        yAxisID:"first-y-axis"
		          	      }, { 
		          	        data: SearchArray,
		          	        label: "Risk",
		          	        borderColor: "#8e5ea2",
		          	        fill: false,
		          	      	tension: 0.3,
		          	      	yAxisID:"second-y-axis"
		          	      }
		          	    ]
		          	  },
		          	  options: {
		          	    title: {
		          	      display: true,
		          	      text: '실제 감염자 수와 risk 추이(지난 1년)'
		          	    },
		          	    scales: {
		          	    	yAxes: [{
		                        id: 'first-y-axis',
		                        type: 'linear'
		                    }, {
		                        id: 'second-y-axis',
		                        type: 'linear',
		                        position:'right',
		                        ticks: {
		                            suggestedMin: 50,
		                            suggestedMax: 100
		                        }
		                    }]
		          	    }
		          	  }
		          	});
					const PearArray = [];
 					<c:forEach var="Pearson" items="${Pearson}">
						PearArray.push(${Pearson.p1},${Pearson.p2},${Pearson.p3},${Pearson.p4},${Pearson.p5},${Pearson.p6},${Pearson.p7},${Pearson.p8},${Pearson.p9},${Pearson.p10},${Pearson.p11})
					</c:forEach>
						
					
					//피어슨 그래프
					new Chart(document.getElementById("line-chart2"), { // 뉴스 검색 쿼리 상관관계
			          	  type: 'line',
			          	  data: {
			          	    labels: [0,1,2,3,4,5,6,7,8,9,10],
			          	    datasets: [{ 
			          	        data: [last0, last1, last2, last3, last4, last5, last6, last7, last8, last9, last10, last11],
			          	        label: "Pearson",
			          	        borderColor: "#3e95cd",
			          	        fill: false
			          	      }
			          	    ]
			          	  },
			          	  options: {
			          	    title: {
			          	      display: true,
			          	      text: ''
			          	    }
			          	  }
			          	});
					//실제감염자비율과 뉴스언급률 차이 그래프
					new Chart(document.getElementById("bar-chart"), {
					    type: 'bar',
					    data: {
					      labels: MonthArray,
					      datasets: [
					        {
					          label: "실제감염자비율과 뉴스언급률 차이",
					          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#8e5ea2","#3cba9f"],
					          data: perCnt
					        }, {
		              	          label: "실제감염자 비율과 검색트랜드 차이",
		              	          backgroundColor: "#8e5ea2",
		              	          data: minInfSq
		              	        }
					      ]
					    },
					    options: {
					      legend: { display: false },
					      title: {
					        display: true,
					        text: ''
					      }
					    }
					});
					 
				</script>
</html>