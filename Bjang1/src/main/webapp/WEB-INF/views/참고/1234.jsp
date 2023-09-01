<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>감염병 빅데이터 거래소</title>
</head>

	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sidebars/">
    
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    
    <!-- 차트 -->  
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <!-- css -->
    <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" /> -->
    <link rel="stylesheet" href="/resources/css/common.css" />
    <link rel="stylesheet" href="/resources/css/style.css" />
    
    <!-- 카카오 api -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6ca3631ca91c49471a26211d7ed34b0"></script>
<style>
	
</style>
<script type="text/javascript">
$(function(){
	$('#search').on("change", function(){
		const selected = $('#search > option:selected').val();
		location.href = "/bjang?keyword1="+selected;
	}); //임시용 에러 있음 나중에 수정
})
</script>
	
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
            <a href="index.html" class="flex-center">
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
                <a href="index.html"> 감염자 수 기반 정보 </a>
              </li>
              <li class="snb__subList-item">
                <a href="sub_newsBase.html"> 뉴스 기반 정보 </a>
              </li>
              <li class="snb__subList-item">
                <a href="sub_newsBase.html"> 위험도 정보 </a>
              </li>
            </ul>
          </li>
          <li class="snb__list-item">
            <a href="sub_totalChart.html">
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
                      <ul class="option__list">
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
                <div class="conbox__content">그래프 들어갈 자리</div>
              </div>
            </div>
            <div class="row flex">
              <div class="col w-50 mr-20">
                <div class="conbox">
                  <div class="conbox__title-frame flex-both bor-b">
                    <h3 class="conbox__title">감염자수 기반 정보</h3>
                    <div class="select-frame flex-end">
                      <div class="select-wrap sel-s-1 mr-10">
                        <button type="button" class="btn-select">
                          지역
                          <img
                            src="/resources/img/icon_selectArrow.png"
                            alt="셀렉트 화살표"
                          />
                        </button>
                        <ul class="option__list">
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
                      <div class="select-wrap sel-s-1">
                        <button type="button" class="btn-select">
                          질병명
                          <img
                            src="/resources/img/icon_selectArrow.png"
                            alt="셀렉트 화살표"
                          />
                        </button>
                        <ul class="option__list">
                          <li class="option__list-item">
                            <button type="button">지역별</button>
                          </li>
                          <li class="option__list-item">
                            <button type="button">예시별</button>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="conbox__sub-title-frame bor-b mb-20">
                    <h3 class="conbox__sub-title">
                      2022년 11월
                      <span class="color-blue">지역별</span>
                      전염병 발생 건수
                    </h3>
                  </div>
                  <div class="conbox__content">그래프 들어갈 자리</div>
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
                  <div class="conbox__content">그래프 들어갈 자리</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- script -->
    
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
