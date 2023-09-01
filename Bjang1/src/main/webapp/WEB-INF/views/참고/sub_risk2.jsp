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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
 
</head>
<body>
     <body>
        <!-- 좌측 snb -->
        <div class="side-bar">
            <!-- 상단 로고 -->
            <div class="logo-area flex-center">
		        <h1 class="logo">
		          <img src="/resources/img/logo.png" alt="감염병 빅데이터 거래소" />
		        </h1>
		        <h2 class="title">
		          <img src="/resources/img/sub_logo_svg.svg" alt="로고">
		        </h2>
	      </div>
            <!-- snb -->
            <nav class="snb">
                <ul class="snb__list">
                    <li class="snb__list-item active">
                        <a href="/" class="flex-center">
                            <div class="icon-frame">
                                <img src="/resources/img/icon_snb01.png" alt="질병발병 통계맵 아이콘"/>
                            </div>
                            <p>
                                질병발병 통계맵
                                <img src="/resources/img/icon_snbArrow.png" alt="하위메뉴화살표"/>
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
                                    <img src="/resources/img/icon_snb02.png" alt="질병발병 통계 차트 아이콘"/>
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
                    <img src="/resources/img/icon_fold_arrow.png" alt="접기버튼"/>
                </button>
                <!-- gnb -->
                <nav class="gnb flex">
                    <h2 class="logo flex mr-20">
                        <img src="/resources/img/logo_NIA.png" alt="NIA한국지능정보사회진흥원"/>
                    </h2>
                    <ul class="gnb__list flex">
                        <li class="gnb__list-item active">
                            <a href="#">
                                혁신서비스 메뉴 01
                            </a>
                        </li>
                        <li class="gnb__list-item">
                            <a href="#">
                                혁신서비스 메뉴 02
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
                                        <a href="#">
                                            <img src="/resources/img/icon_home.png" alt="홈으로 가기"/>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">질병 발병 통계맵</a>
                                    </li>
                                    <li>
                                        <a href="#">위험도 정보</a>
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
                                        <h3 class="conbox__title">뉴스 기반 정보</h3>
                                        <div class="select-frame flex-end">
                                            <div class="select-wrap sel-s-1 mr-10">
                                                <button type="button" class="btn-select">
                                                    전국
                                                    <img src="/resources/img/icon_selectArrow.png" alt="셀렉트 화살표"/>
                                                </button>
                                                <ul class="option__list">
                                                    <li class="option__list-item">
                                                        <button type="button">전국</button>
                                                    </li>
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
                                                    <li class="option__list-item epidList" id="${key1.keyword1}">
                                                        <button type="button">${key1.keyword1}</button>
                                                    </li>
                                                </c:forEach>
                                                </ul>    
                                            </div>
                                        </div>
                                    </div>
                                    <div class="conbox__sub-title-frame bor-b mb-20">
                                        <h3 class="conbox__sub-title">
                                            2022년 11월 지역별 전염병 발생 건수
                                        </h3>
                                    </div>
                                    <div class="conbox__content" style="position: relative; "  >
                                    	<%-- <div class="boxcl" style="position:absolute; z-index: 2">
							            	<c:forEach var="sivo" items="${sivo}">
							            		<div id="${sivo.sicd}" class="ab ${sivo.keyword2}">
								            		<div class="cl" >
														<p id="${sivo.keyword2}" style="top:13px; left:20%; right:20%; position: absolute; ">${sivo.count}</p>
													</div>
							            		</div>
							            	</c:forEach>
										</div> --%>
										<script>
										 	$(function(){
										 		const url = location.search;
										 		const a = new URLSearchParams(url);
										 		
										 		if(a.get('keyword1') != null && a.get('keyword1') != ""){
										 			$("#epidBtn").text(a.get('keyword1'));
										 			$("#epidBtn").append("<img src='/resources/img/icon_selectArrow.png' alt='셀렉트 화살표'/>");
										 		}else{
										 			$("#epidBtn").text('전체');
										 			$("#epidBtn").append("<img src='/resources/img/icon_selectArrow.png' alt='셀렉트 화살표'/>");
										 		}
										 		//전체 클릭시
										 		$(".epdiAll").on("click", function(){
										 			location.href="sub_risk";
										 		});
										 		
										 		//질병 클릭시
										 		$(".epidList").on("click", function(){
										 			$(".epidBtn").text($(this).text());
										 			const keyword1 = document.getElementById("epidBtn").innerText;
										 			
										 			console.log($(".epidBtn").text($(this).text()));
										 			
										 			location.href="sub_risk?keyword1="+keyword1;
										 		});
										 		
										 	})
										 	
										 	$('#473').css("display", "none");
										 	$('#896').css("display", "none");
										 	$('#906').css("display", "none");
										 	$('#918').css("display", "none");
										 	
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
											var positions = [
											    {
											        content: '<div class="overr">제주도 감염자 수<br/>${sivo.get(14).count}명</div>', 
											        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
											    } ,
											    {
											        content: '<div class="overr">전라남도 감염자 수<br/>${sivo.get(12).count}</div>', 
											        latlng: new kakao.maps.LatLng(34.979, 127.000)
											    },
											    {
											        content: '<div class="overr">광주 감염자 수<br/>${sivo.get(4).count}</div>', 
											        latlng: new kakao.maps.LatLng(35.1559, 126.858)
											    },
											    {
											        content: '<div class="overr">전라북도 감염자 수<br/>${sivo.get(13).count}</div>', 
											        latlng: new kakao.maps.LatLng(35.7522, 127.1204)
											    },{
											        content: '<div class="overr">경상남도 감염자 수<br/>${sivo.get(2).count}</div>', 
											        latlng: new kakao.maps.LatLng(35.4954, 128.2187)
											    },{
											        content: '<div class="overr">부산 감염자 수<br/>${sivo.get(7).count}</div>', 
											        latlng: new kakao.maps.LatLng(35.1713, 129.100)
											    },{
											        content: '<div class="overr">울산 감염자 수<br/>${sivo.get(10).count}</div>', 
											        latlng: new kakao.maps.LatLng(35.5181, 129.3241)
											    },{
											        content: '<div class="overr">대구 감염자수<br/>${sivo.get(5).count}</div>', 
											        latlng: new kakao.maps.LatLng(35.8717, 128.6013)
											    },{
											        content: '<div class="overr">경상북도 감염자수<br/>${sivo.get(3).count}</div>', 
											        latlng: new kakao.maps.LatLng(36.5096, 128.7025)
											    },{
											        content: '<div class="overr">대전 감염자수<br/>${sivo.get(6).count}</div>', 
											        latlng: new kakao.maps.LatLng(36.3459, 127.3735)
											    },{
											        content: '<div class="overr">세종 감염자수<br/>${sivo.get(9).count}</div>', 
											        latlng: new kakao.maps.LatLng(36.4805, 127.2891)
											    },{
											        content: '<div class="overr">충청남도 감염자수<br/>${sivo.get(15).count}</div>', 
											        latlng: new kakao.maps.LatLng(36.5852, 126.8095)
											    },{
											        content: '<div class="overr">충청북도 감염자수<br/>${sivo.get(16).count}</div>', 
											        latlng: new kakao.maps.LatLng(36.9047, 127.7521)
											    },{
											        content: '<div class="overr">경기도 감염자수<br/>${sivo.get(1).count}</div>', 
											        latlng: new kakao.maps.LatLng(37.4355, 127.4854)
											    },{
											        content: '<div class="overr">강원도 감염자수<br/>${sivo.get(0).count}</div>', 
											        latlng: new kakao.maps.LatLng(37.4521, 128.656)
											    },{
											        content: '<div class="overr">서울 감염자수<br/>${sivo.get(8).count}</div>', 
											        latlng: new kakao.maps.LatLng(37.5657, 126.9764)
											    },{
											        content: '<div class="overr">인천 감염자수<br/>${sivo.get(11).count}</div>', 
											        latlng: new kakao.maps.LatLng(37.4022, 126.6432)
											    }
											];

											for (var i = 0; i < positions.length; i ++) {
												
												var imageSrc = '/resources/img/보통.png', // 마커이미지의 주소입니다    
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
											<canvas id="line-chart"></canvas>
												<script>
													const MonthArray = [];
													const CntArray = [];
													const NewsArray = [];
													const SearchArray = [];
													<c:forEach var="YCnt" items="${YCnt}">
														MonthArray.push(${YCnt.month});
														CntArray.push(${YCnt.count});
													</c:forEach>
													<c:forEach var="NewsVo" items="${NewsVo}">
														NewsArray.push(${NewsVo.volume});
													</c:forEach>
													<c:forEach var="SearchVo" items="${SearchVo}">
														SearchArray.push(${SearchVo.count});
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
							              	new Chart(document.getElementById("bar-chart-grouped"), {
							              	    type: 'bar',
							              	    data: {
							              	      labels: MonthArray,
							              	      datasets: [
							              	        {
							              	          label: "2018",
							              	          backgroundColor: "#3e95cd",
							              	          data: CntArray
							              	        }, {
							              	          label: "검색횟수",
							              	          backgroundColor: "#8e5ea2",
							              	          data: SearchArray
							              	        },{
							                	          label: "뉴스 언급 횟수",
							                  	          backgroundColor: "#3cba9f",
							                  	          data: NewsArray
							                  	        }
							              	      ]
							              	    },
							              	    options: {
							              	    	maintainAspectRatio :false,//그래프의 비율 유지,
							       	        	 scales:{
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
                                        <h3 class="conbox__title">뉴스와 검색쿼리 상관관계</h3>
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
    
  </body>
  <script type="text/javascript">
	
					 new Chart(document.getElementById("line-chart"), { // 지난 1년 실제 감염자수 (절대)					
						  type: 'line',
						  data: {
						    labels: MonthArray, // x축(년월별)
						    datasets: [{ 
						        data: CntArray, //y축
						        label: "2017",
						        borderColor: "#3e95cd",
						        fill: false
						      },  { 
						        data: SearchArray,
						        label: "검색횟수",
						        borderColor: "#8e5ea2",
						        fill: false
						      }, { 
						        data: NewsArray,
						        label: "뉴스언급횟수",
						        borderColor: "#3cba9f",
						        fill: false
						      } 
						    ]
						  },
						  options: {
						    title: {
						      display: true,
						      text: '지난 1년 감염자 수'
						    }
						  }
						});
					
					
					new Chart(document.getElementById("line-chart1"), { //risk추이 (지난 1년)
			          	  type: 'line',
			          	  data: {
			          	    labels: [1500,1600,1700,1750,1800,1850,1900,1950,1999,2050],
			          	    datasets: [{ 
			          	        data: [86,114,106,106,107,111,133,221,783,2478],
			          	        label: "2019",
			          	        borderColor: "#3e95cd",
			          	        fill: false
			          	      }, { 
			          	        data: [282,350,411,502,635,809,947,1402,3700,5267],
			          	        label: "2020",
			          	        borderColor: "#8e5ea2",
			          	        fill: false
			          	      }, { 
			          	        data: [168,170,178,190,203,276,408,547,675,734],
			          	        label: "2021",
			          	        borderColor: "#3cba9f",
			          	        fill: false
			          	      }
			          	    ]
			          	  },
			          	  options: {
			          	    title: {
			          	      display: true,
			          	      text: 'World population per region (in millions)'
			          	    }
			          	  }
			          	});
					
					new Chart(document.getElementById("line-chart2"), { // 뉴스 검색 쿼리 상관관계
			          	  type: 'line',
			          	  data: {
			          	    labels: [1500,1600,1700,1750,1800,1850,1900,1950,1999,2050],
			          	    datasets: [{ 
			          	        data: [86,114,106,106,107,111,133,221,783,2478],
			          	        label: "2019",
			          	        borderColor: "#3e95cd",
			          	        fill: false
			          	      }
			          	    ]
			          	  },
			          	  options: {
			          	    title: {
			          	      display: true,
			          	      text: 'World population per region (in millions)'
			          	    }
			          	  }
			          	});
					new Chart(document.getElementById("bar-chart"), {
					    type: 'bar',
					    data: {
					      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
					      datasets: [
					        {
					          label: "실제감염자비율과 뉴스언급률 차이",
					          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
					          data: [2478,5267,-734,784,433]
					        }, {
		              	          label: "검색횟수",
		              	          backgroundColor: "#8e5ea2",
		              	          data: SearchArray
		              	        }
					      ]
					    },
					    options: {
					      legend: { display: false },
					      title: {
					        display: true,
					        text: 'Predicted world population (millions) in 2050'
					      }
					    }
					});
					 
				</script>
</html>