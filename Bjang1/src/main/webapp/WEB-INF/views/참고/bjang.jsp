<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>감염병</title>
</head>

	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sidebars/">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>  
    <!-- Custom styles for this template -->
    <link href="/resources/css/bjang.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6ca3631ca91c49471a26211d7ed34b0"></script>
    <style>
	.chart{
		width: 450px;
		height: 200px;
		float: left;
		margin: 80px;
		z-index: -1;		
		}
	.chartbox{
		width: 450px;
		height: 800px;
		position: relative;
		}
	.chartbox chart{
		display: block;
		}
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
    
<!-- 펼쳐지는 메뉴-->
<div class="none" id="open">
  <main class="d-flex flex-nowrap">
    <div class="flex-shrink-0 bg-color3 rel" style="width: 300px; height: 2025px;">
      <div class="line1"></div>
      <div class="bg-color">
        <a href="" class="align-items-center pl pb-3 mb-3 link-dark text-decoration-none">
          <img src="/resources/images/방패로고.PNG" class="flot ssize" alt="">
          <div class="margin-t">
            <p class="fs-5 fw-semi text-white">INFECTION</p>
            <p class="fs-5 fw-semi text-white flex-nowrap">BIGDATA</p>
            <p class="fs-5 fw-semi text-white flex-nowrap">EXCHANGE</p>
            <p class=" text-white flex-nowrap p min">감염병 빅테이터 거래소</p>
          </div>
        </a>
      </div>
      <ul class="list-unstyled ps-0">
        <li class="mb-1 bg-color2">
          <button class="d-inline-flex align-items-center rounded border-0 collapsed text-white bg-color2 center margin-tl" data-bs-toggle="collapse" id="click" data-bs-target="#home-collapse" aria-expanded="true">
            <span class="material-symbols-outlined margin-r">
              table_chart
            </span>질병발병 통계 맵
            <span class="material-symbols-outlined trun" id="turn">expand_less</span>
          </button>
          <div class="collapse show bg-color2" id="home-collapse">
            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small margin-l">
              <li><a href="#" class="d-inline-flex li rounded text-white opacity">감염자 수 기반정보</a></li>
              <li><a href="#" class="d-inline-flex li rounded text-white opacity">뉴스 기반 정보</a></li>
              <li><a href="#" class="d-inline-flex li rounded text-white opacity">위험도 정보</a><li>
              </ul>
            </div>
          </li>
          <li class="mb-1 bg-color3 margin-tl">
            <button class="d-inline-flex align-items-center rounded border-0 collapsed bg-color3 text-white" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
              <span class="material-symbols-outlined">
                bar_chart
              </span>질병발병 통계차트
            </button>
          </li>
          <li>
            <a href="#open" class="white"><span class="material-symbols-outlined">keyboard_arrow_up</span></a>
          </li>
        </ul>
      </div>
      <div class="b-example-vr bg-color4" style="height: 2025px;">
        <div class="line2"></div>
        <button class="d-inline-flex align-items-center rounded border-0 collapsed center margin-btn bg-color4" id="smar" data-bs-dismiss="offcanvas" aria-label="Close">
          <span class="material-symbols-outlined">chevron_left</span>
        </div>
      
    <!-- 헤더 -->
<!--     <div class="minus" id="minus">
      
    </div> -->

      </main>
    </div>
    <!-- 펼쳐지는 메뉴 끝 -->
    
    <!-- 간이메뉴 -->
<div id="disp">
  <main class="d-flex flex-nowrap">
      <div class="flex-shrink-0 bg-color3 rel" style="width: 90px; height: 2025px;">
      <div class="line1"></div>
      <div class="bg-color22">
        <a href="/" class="align-items-center pl pb-3 mb-3 link-dark text-decoration-none">
          <img src="/resources/images/방패로고.PNG" class="ssize2" alt="">
        </a>
      </div>
      <ul class="list-unstyled ps-0">
        <li class="mb-1 bg-color2">
          <button class="d-inline-flex align-items-center rounded border-0 collapsed text-white bg-color2 center margin-tl" data-bs-toggle="collapse" id="click" data-bs-target="#home-collapse" aria-expanded="true">
            <span class="material-symbols-outlined margin-r">
              table_chart
            </span>
          </button>
        </li>
        <li class="mb-1 bg-color3 margin-tl">
          <button class="d-inline-flex align-items-center rounded border-0 collapsed bg-color3 text-white" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
            <span class="material-symbols-outlined margin-r">
              bar_chart
            </span>
          </button>
        </li>
        <li>
          <a href="#disp" class="white"><span class="material-symbols-outlined">keyboard_arrow_up</span></a>
        </li>
      </ul>
    </div>
    <div class="b-example-vr bg-color4" id="apply" style="height: 2025px;">
      <div class="line1"></div>
      <button class="d-inline-flex align-items-center rounded border-0 collapsed center margin-btn bg-color4" id="mar" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">
        <span class="material-symbols-outlined">chevron_right</span>
      </div>
      <!-- 간이메뉴 끝 -->
      
      <!-- 헤더 -->
      <div class="minus" id="clas">
        <div class="line"></div>
        <header class="back">
          <ul class="deco">
            <li class="main"><a href=""><span class="blue">NIA</span> 한국지능정보사회지능원</a></li>
            <li class="main2"><a href="">혁신서비스 메뉴 01</a></li>
            <li class="main3"><a href="">혁신서비스 메뉴 02</a></li>
          </ul>
        </header>
        <!-- 헤더끝 -->
        <!-- 통계맵 시작 -->
        <div class="gong"></div>
        <section class="mid">
          <div class="stat">
            <ul>
              <li>
                <span class="material-symbols-outlined"><a href="">home</a></span>
                <span class="material-symbols-outlined">chevron_right</span>
              </li>
              <li><a href="">질병발병 통계맵</a></li>
              <li><span class="material-symbols-outlined">chevron_right</span></li>
              <li><a href="">위험도 정보</a></li>
              
            </ul>
            <br/>
            <div class="cont">
              <h2>질병 발병 통계맵</h2>
              <p>대한민국에서 발병한 질병 발병 통계를 지도를 사용하여 보여줍니다.</p>
              <p>사용자는 한눈에 지역별 질병 발병 현황을 확인할 수 있습니다. 사용자는 연도, 월, 지역, 그리고 병 이름을 선택하여 관심이 있는 질병 발병 통계지도를 생성할 수 있습니다.</p>
              <h6 class="bin">&nbsp;</h6>
            </div>
            <div class="gong"></div>
            <div class="danger">
              <h3 class="gongtong">위험도 정보</h3>
              <h3 class="guns">2022년 11월 지역별 전염병 발생 건수</h3>
              <select id="search">
					<option name="keyword1">전체</option>
					<c:forEach  var="key1" items="${key1}">
						<option name="keyword1" value="${key1.keyword1}">${key1.keyword1}</option>
              		</c:forEach>
				</select>
	
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
	            	<c:forEach var="sivo" items="${sivo}">
	            		<div id="${sivo.sicd}" class="ab ${sivo.keyword2}">
		            		<div class="cl" >
								<p style="top:13px; left:20%; right:20%; position: absolute; ">${sivo.count}</p>
							</div>
							
	            		</div>
	            	</c:forEach>
				</div>
			</div>	
            </div>
            <div class="box1">
              <h3 class="gongtong">지난 1년 실제 감염자 수/검색트랜드/뉴스언급횟수 비교(절대)</h3>
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
            <div class="box1">
              <h3 class="gongtong">지난 1년 실제 감염자 수/검색트랜드/뉴스언급횟수 비교(상대)</h3>
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
            <div class="box1">
              <h3 class="gongtong">실제 감염자 비율 대비 검색트랜드 뉴스언급률 차이</h3>
              <div class="chart">
              	<canvas id="bar-chart"></canvas>
              </div>
            </div>
            <div class="box2">
              <h3 class="gongtong">실제 감염자 수 와 risk추이 (지난 1년)</h3>
              <div class="chart">
				<canvas id="line-chart1" width="800" height="450"></canvas>
				</div>
            </div>
            
            <div class="box3">
              <h3 class="gongtong">뉴스와 검색쿼리 상관관계</h3>
              <div class="chart">
				<canvas id="line-chart2" width="800" height="450"></canvas>
				</div>
            </div>
          </div>
        </section>
      </div>
      
    </main>
  </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    
    <script src="/resources/js/bjang.js"></script>


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
