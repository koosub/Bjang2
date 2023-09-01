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
    <style>
	.chart{
		width: 450px;
		height: 300px;
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
          <img src="/resources/img/sub_logo_svg.svg" alt="로고">
        </h2>
      </div>
      <!-- snb -->
      <nav class="snb">
        <ul class="snb__list">
          <li class="snb__list-item">
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
              <li class="snb__subList-item">
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
          <li class="snb__list-item active">
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

      <!-- '질병발병 통계 차트' 내용 -->
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
                </ul>
                <div class="conbox__title-frame mb-8">
                  <h3 class="conbox__title-b">질병 발병 통계 차트</h3>
                </div>
                <div class="conbox__content">
                  <p class="conbox__info-ment">
                    대한민국에서 발병한 질병 발병 통계를 다양한 시각화 기술들을
                    사용하여 보여 줍니다.<br />
                    사용자는 연도, 월, 지역, 그리고 병 이름을 선택하여 관심이
                    있는 질병 발병 통계를 검색할 수 있으며, 지역, 시간, 질병,
                    성별, 연령별 발병한 질병 건수를 사용자 친화적 시각화
                    인터페이스를 확인할 수 있습니다.
                  </p>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="conbox mb-30">
                <div class="conbox__title-frame flex-both">
                  <h3 class="conbox__title">
                    확진자 추이
                    <span class="date"> 11.03 00:00 기준 </span>
                  </h3>
                  <div class="select-frame flex-end">
                    <p class="mr-15">통계검색</p>
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
                      </ul>
                    </div>
                    <div class="select-wrap sel-s-1 mr-10">
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
                    <div class="select-wrap sel-s-2">
                      <button type="button" class="btn-select">
                        최근 7일
                        <img
                          src="/resources/img/icon_selectArrow.png"
                          alt="셀렉트 화살표"
                        />
                      </button>
                      <ul class="option__list">
                        <li class="option__list-item">
                          <button type="button">최근 30일</button>
                        </li>
                        <li class="option__list-item">
                          <button type="button">최근 1년</button>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="conbox__inner">
                  <div class="info-box mb-20">
                    <ul class="info-box__list flex-center">
                      <li class="info-box__list-item">
                        <p class="info-box__list-item__title">
                          확진자 추이 현황
                        </p>
                        <strong class="info-box__list-item__content"
                          >${AllInfD.get(0).infection_disease_nm}</strong
                        >
                      </li>
                      <li class="info-box__list-item">
                        <p class="info-box__list-item__title">
                          전국 누적확진자
                        </p>
                        <strong class="info-box__list-item__content"
                          >${AllInfD.get(0).count}</strong
                        >
                      </li>
                      <li class="info-box__list-item">
                        <p class="info-box__list-item__title">
                          ${SInfD.get(0).sinm } 누적확진자
                        </p>
                        <strong class="info-box__list-item__content"
                          >${SInfD.get(0).count }</strong
                        >
                      </li>
                      <li class="info-box__list-item">
                        <p class="info-box__list-item__title">
                          전국 누적사망자
                        </p>
                        <strong class="info-box__list-item__content"
                          >${AllInfD.get(1).count}</strong
                        >
                      </li>
                      <li class="info-box__list-item">
                        <p class="info-box__list-item__title">
                          ${SInfD.get(0).sinm } 누적사망자
                        </p>
                        <strong class="info-box__list-item__content"
                          >${SInfD.get(1).count}</strong
                        >
                      </li>
                    </ul>
                  </div>
                  <div class="conbox__content">
                  <div class="chart">
					<canvas id="bar-chart2" width="200px" height="150px"></canvas>
				  </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="select-frame flex-end mb-20">
                <p class="mr-15">통계검색</p>
                <div class="select-wrap sel-s-1 mr-10">
                  <button type="button" class="btn-select">
                    년
                    <img src="/resources/img/icon_selectArrow.png" alt="셀렉트 화살표" />
                  </button>
                  <ul class="option__list">
                    <li class="option__list-item">
                      <button type="button">AAA</button>
                    </li>
                    <li class="option__list-item">
                      <button type="button">BBB</button>
                    </li>
                  </ul>
                </div>
                <div class="select-wrap sel-s-1 mr-10">
                  <button type="button" class="btn-select">
                    월
                    <img src="/resources/img/icon_selectArrow.png" alt="셀렉트 화살표" />
                  </button>
                  <ul class="option__list">
                    <li class="option__list-item">
                      <button type="button">1월</button>
                    </li>
                    <li class="option__list-item">
                      <button type="button">2월</button>
                    </li>
                    <li class="option__list-item">
                      <button type="button">3월</button>
                    </li>
                    <li class="option__list-item">
                      <button type="button">4월</button>
                    </li>
                    <li class="option__list-item">
                      <button type="button">5월</button>
                    </li>
                    <li class="option__list-item">
                      <button type="button">6월</button>
                    </li>
                    <li class="option__list-item">
                      <button type="button">7월</button>
                    </li>
                    <li class="option__list-item">
                      <button type="button">8월</button>
                    </li>
                    <li class="option__list-item">
                      <button type="button">9월</button>
                    </li>
                    <li class="option__list-item">
                      <button type="button">10월</button>
                    </li>
                    <li class="option__list-item">
                      <button type="button">11월</button>
                    </li>
                    <li class="option__list-item">
                      <button type="button">12월</button>
                    </li>
                  </ul>
                </div>
                <div class="select-wrap sel-s-1 mr-10">
                  <button type="button" class="btn-select">
                    지역
                    <img src="/resources/img/icon_selectArrow.png" alt="셀렉트 화살표" />
                  </button>
                  <ul class="option__list">
                    <li class="option__list-item">
                      <button type="button">AAA</button>
                    </li>
                    <li class="option__list-item">
                      <button type="button">BBB</button>
                    </li>
                  </ul>
                </div>
                <button class="btn-b">적용하기</button>
              </div>
              <div class="row">
                <div class="row mb-20 flex-inline">
                  <div class="conbox w-50 mr-20">
                    <div class="conbox__title-frame flex-both bor-b mb-20">
                      <h3 class="conbox__title">과거 3년간 감염병 통계 비교</h3>
                         <div class="select-frame">                
		                      <div class="select-frame flex-end">
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
		                                <button type="button">AAA</button>
		                              </li>
		                              <li class="option__list-item">
		                                <button type="button">BBB</button>
		                              </li>
		                            </ul>
		                      </div>
                          </div>
                        </div>
                    </div>
                    <div class="conbox__content">
                    <div class="chart">
						<canvas id="line-chart" width="800" height="450"></canvas>
					</div>
                    </div>
                  </div>
                  <div class="conbox w-50">
                    <div class="conbox__title-frame flex-both bor-b mb-20">
                      <h3 class="conbox__title">많이 발생한 감염병 TOP5</h3>
                      <div class="select-frame">
                        
                      </div>
                    </div>
                    <div class="conbox__content">
	                    <div class="chart">
							<canvas id="bar-chart"></canvas>
						</div>
					</div>
                  </div>
                </div>
                <div class="row flex-inline">
                  <div class="conbox w-50 mr-20">
                    <div class="conbox__title-frame flex-both bor-b mb-20">
                      <h3 class="conbox__title">성별 감염자 수</h3>
                      <div class="select-frame flex-end">
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
                              <button type="button">AAA</button>
                            </li>
                            <li class="option__list-item">
                              <button type="button">BBB</button>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="conbox__content">
	                    <div class="chart">
							<canvas id="pie-chart" width="800" height="450"></canvas>
						</div>
                    </div>
                  </div>
                  <div class="conbox w-50">
                    <div class="conbox__title-frame flex-both bor-b mb-20">
                      <h3 class="conbox__title">연령별 감염자 수</h3>
                      <div class="select-frame flex-end">
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
                              <button type="button">AAA</button>
                            </li>
                            <li class="option__list-item">
                              <button type="button">BBB</button>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="conbox__content">
                    	<div class="chart">
							<canvas id="age-chart"></canvas>
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
    <script>
					// 월 배열
					const month = [];
					for(var i =1 ; i <= 12; i++){
						month.push(i);
					}
					//inf total 값들
					const total1 = [];
					const total2 = [];
					const total3 = [];
					
					//inf year 값들
					const year1 = ${Inf.get(0).year};
					const year2 = ${Inf2.get(0).year};
					const year3 = ${Inf3.get(0).year};
					
					
					//top5
					const epidemicnm = [];
					const epTotal = [];
					
					
					//YInf
					const YInfYear = [];
					const YInfTotal = [];
					
					<c:forEach var="inf" items="${Inf}">
						total1.push(${inf.total});
					</c:forEach>
					
					<c:forEach var="inf2" items="${Inf2}">
						total2.push(${inf2.total});
					</c:forEach>
					
					<c:forEach var="inf3" items="${Inf3}">
						total3.push(${inf3.total});
					</c:forEach>
					
					<c:forEach var="top5" items="${top5}">
						epidemicnm.push(`${top5.epidemicnm}`);
						epTotal.push(${top5.total});
					</c:forEach>
					
					<c:forEach var="YInf" items="${YInf}">
						YInfYear.push(${YInf.year});
						YInfTotal.push(${YInf.count});
					</c:forEach>
					
					console.log(YInfYear[0]);
					
					
				</script>
				<script type="text/javascript">
		new Chart(document.getElementById("line-chart"), { // 지난 1년 실제 감염자수 (절대)					
			  type: 'line',
			  data: {
			    labels: month, // x축(년월별)
			    datasets: [{ 
			        data: total3, //y축
			        label: year3,
			        borderColor: "#3e95cd",
			        fill: false
			      },  { 
			        data: total2,
			        label: year2,
			        borderColor: "#8e5ea2",
			        fill: false
			      }, { 
			        data: total1,
			        label: year1,
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
		
		
		new Chart(document.getElementById("bar-chart"), {
		    type: 'bar',
		    data: {
		      labels: ' ',
		      datasets: [
		        {
		          label: epidemicnm[0],
		          backgroundColor: "#3e95cd",
		          data: [epTotal[0]]
		        },{
       	          label: epidemicnm[1],
       	          backgroundColor: "#8e5ea2",
       	          data: [epTotal[1]]
       	        }, {
     	          label: epidemicnm[2],
       	          backgroundColor: "#3cba9f",
       	          data: [epTotal[2]]
       	        }, {
    	          label: epidemicnm[3],
      	          backgroundColor: "#e8c3b9",
      	          data: [epTotal[3]]
      	        }, {
     	          label: epidemicnm[4],
       	          backgroundColor: "#c45850",
       	          data: [epTotal[4]]
       	        } 
		      ]
		    },
		    options: {
		    	reponsive : false,
		    	
				plugins :{
			      legend: { 
			    	  	display : true,
			    	  	position: 'bottom',
			    	  	labels:{
			    	  		fontSize:10
			    	  	}
			      }
			    }
		    	}
		});
		
		
		new Chart(document.getElementById("pie-chart"), {
		    type: 'pie',
		    data: {
		      labels: ["남성","여성"],
		      datasets: [{
		        backgroundColor: ["#3e95cd", "#8e5ea2"],
		        data: [${genderPer.get(0).man},${genderPer.get(0).woman}]/* ,
				borderColor:[
					"#3e95cd"
				] */
		      }]
		    },
		    options: {
		 		responsive: true,
		 		plugins :{
				      legend: { 
				    	  	display : true,
				    	  	position: 'bottom',
				    	  	labels:{
				    	  		fontSize:10
				    	  	}
				      }
				    }
/* 			pieceLabel: {
		                  mode:"label",
		                  position:"outside",
		                  fontSize: 11,
		                  fontStyle: 'bold'
						
		               } */
		    }
		});
		
		
		new Chart(document.getElementById("age-chart"), {
		    type: 'bar',
		    data: {
		      labels: ' ',
		      datasets: [
		        {
		          label: [`${age.get(0).age}`],
		          backgroundColor: "#3e95cd",
		          data: [${age.get(0).total}]
		        },{
       	          label: [`${age.get(1).age}`],
       	          backgroundColor: "#8e5ea2",
       	          data: [${age.get(1).total}]
       	        }, {
     	          label: [`${age.get(2).age}`],
       	          backgroundColor: "#3cba9f",
       	          data: [${age.get(2).total}]
       	        }, {
       	          label: [`${age.get(3).age}`],
      	          backgroundColor: "#e8c3b9",
      	          data: [${age.get(3).total}]
      	        }, {
      	          label: [`${age.get(4).age}`],
       	          backgroundColor: "#c45850",
       	       	  data: [${age.get(4).total}]
       	        },{
      	          label: [`${age.get(5).age}`],
       	          backgroundColor: "#a8e3b9",
       	          data: [${age.get(5).total}]
       	        },{
       	          label: [`${age.get(6).age}`],
      	          backgroundColor: "#bec389",
      	          data: [${age.get(6).total}]
      	        },{
      	          label: [`${age.get(7).age}`],
       	          backgroundColor: "#abcdb9",
       	          data: [${age.get(7).total}]
       	        },
   			]
		    },
		    options: {
		    	reponsive : false,
		    	
				plugins :{
			      legend: { 
			    	  	display : true,
			    	  	position: 'bottom',
			    	  	labels:{
			    	  		fontSize:10
			    	  	}
			      }
			    }
		    	}
		});
		
		//확진자 추이
		new Chart(document.getElementById("bar-chart2"), {
		    type: 'bar',
		    data: {
		      labels: YInfYear,
		      datasets: [
		        {
		          label: "",
		          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
		          data: YInfTotal
		        }
		      ]
		    },
		    options: {
		    	plugins :{
				      legend: { 
				    	  	display : false  	
				      }
				    },
		      title: {
		        display: true,
		        text: 'Predicted world population (millions) in 2050'
		      }
		    }
		});
		
	</script>
  </body>
</html>