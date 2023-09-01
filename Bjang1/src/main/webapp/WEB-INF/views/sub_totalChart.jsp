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
  <title>질병발병 통계차트</title>
<!-- css -->
     <link rel="stylesheet" href="/resources/css1/common1.css" />
    <link rel="stylesheet" href="/resources/css/style.css" />
      <link rel="stylesheet" href="/resources/css/customSelect.css">
<!--  차트 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <style>
	.chart{
		height: 400px;
		margin: 0 auto;
		text-align: -webkit-center;
		}
	</style>
</head>
<script async src="https://www.googletagmanager.com/gtag/js?id=G-9FEQBG71R3"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-9FEQBG71R3');
</script>
<body>

        <!-- 좌측 snb -->
    <div class="side-bar">
      <!-- 상단 로고 -->
      <div class="logo-area flex-center">
        <h1 class="logo">
          <img src="/resources/img/pj_1/logo.png" alt="감염병 빅데이터 거래소" />
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
          <li class="snb__list-item">
            <a href="/" class="flex-center">
              <div class="icon-frame">
                <img src="/resources/img/pj_1/icon_snb01.png" alt="질병발병 통계맵 아이콘" />
              </div>
              <p>
                질병발병 통계맵
                <img src="/resources/img/pj_1/icon_snbArrow.png" alt="하위메뉴화살표" />
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
                    src="/resources/img/pj_1/icon_snb02.png"
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
          <img src="/resources/img/pj_1/icon_fold_arrow.png" alt="접기버튼" />
        </button>
        <!-- gnb -->
        <nav class="gnb flex">
<!--           <h2 class="logo flex mr-20">
            <img src="/resources/img/pj_1/logo_NIA.png" alt="NIA한국지능정보사회진흥원" />
          </h2> -->
          <ul class="gnb__list flex">
            <li class="gnb__list-item active">
              <a href="/"> 감염병 위기관리 활용 서비스 </a>
            </li>
            <li class="gnb__list-item">
              <a href="/gis" target='_blank'> GIS기반 인구이동 활용 서비스 </a>
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
                      <img src="/resources/img/pj_1/icon_home.png" alt="홈으로 가기" />
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
                    <span class="date"> 12.31 23:59 기준 </span>
                  </h3>
                  <div class="select-frame flex-end">
                    <p class="mr-15">통계검색</p>
                    <div id="region" class="myDiv">
                       <select>
                           	<option class="regionAll">전국</option>
                           	<c:forEach var="key2" items="${key2}">
                           		<option class="regionList">${key2.sinm}</option>
                        	</c:forEach>
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
                    <div id="lastDaysList" class="myDiv">
                    	<select>
                    		<option>최근 7일</option>
                    		<option>최근 30일</option>
                    		<option>최근 1년</option>
                    	</select>  
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
                        <strong class="info-box__list-item__content infdisnm"
                          >-</strong
                        >
                      </li>
                      <li class="info-box__list-item">
                        <p class="info-box__list-item__title">
                          	전국 누적확진자
                        </p>
                        <strong class="info-box__list-item__content infdisNationCnt"
                          >-</strong
                        >
                      </li>
                      <li class="info-box__list-item">
                        <p class="info-box__list-item__title infdisRegionTitle">
                         	전국 누적확진자
                        </p>
                        <strong class="info-box__list-item__content infdisRegionCnt"
                          >-</strong
                        >
                      </li>
                      <li class="info-box__list-item">
                        <p class="info-box__list-item__title infdisDeathNationTitle">
                         	 전국 누적사망자
                        </p>
                        <strong class="info-box__list-item__content infdisDeathNationCnt"
                          >-</strong
                        >
                      </li>
                      <li class="info-box__list-item">
                        <p class="info-box__list-item__title infdisDeathRegionTitle">
                         	 전국 누적사망자
                        </p>
                        <strong class="info-box__list-item__content infdisDeathRegionCnt"
                          >-</strong
                        >
                      </li>
                    </ul>
                  </div>
                  <div class="conbox__content">
                  <div class="chart" style="">
					<canvas id="bar-chart2" ></canvas>
					<canvas id="line-chart1Month" ></canvas>
					<canvas id="line-chart1Year" ></canvas>
				  </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="select-frame flex-end mb-20">
                <p class="mr-15">통계검색</p>
                <div class="flex mr-10">
                <div id="yearList" class="myDiv">
                	<select>
	                	<c:forEach var="yearList" items="${yearList}">
	                        <option>${yearList.year}년</option>
	                	</c:forEach>
                	</select>  
                </div>
                <div id="monthList" class="myDiv">
                	<select>
                		<option>선택안함</option>
						<option>1월</option>
						<option>2월</option>
						<option>3월</option>
						<option>4월</option>
						<option>5월</option>
						<option>6월</option>
						<option>7월</option>
						<option>8월</option>
						<option>9월</option>
						<option>10월</option>
						<option>11월</option>
						<option>12월</option>
                	</select>  
                </div>
               	<div id="region2" class="myDiv">
                    <select>
                   		<option class="regionAll">전국</option>
                      	<c:forEach var="key2" items="${key2}">
                   			<option class="regionList">${key2.sinm}</option>
                     	</c:forEach>
                    </select>
               	</div>
                </div>
                
                <button class="btn-b applyBtn">적용하기</button>
              </div>
              <div class="row">
                <div class="row mb-20 flex-inline">
                  <div class="conbox w-50 mr-20">
                    <div class="conbox__title-frame flex-both bor-b mb-20">
                      <h3 class="conbox__title">과거 3년간 감염병 통계 비교</h3>
                      <div class="select-frame">
                        <div class="select-frame flex-end">
	                        <div id="year3InfDis" class="myDiv">
		                     	<select>
		                     		<option>전체</option>
		                    		<c:forEach var="key1" items="${key1}">
		                     			<option class="epidList">${key1.infdisnm}</option>
		                  			</c:forEach>
		                       </select>
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
	                  	<div id="genderInfDis" class="myDiv">
	                    	<select>
	                     		<option>전체</option>
	                    		<c:forEach var="key1" items="${key1}">
	                     			<option class="epidList">${key1.infdisnm}</option>
	                  			</c:forEach>
	                    	</select>
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
                      		<div id="ageInfDis" class="myDiv">
		                     	<select>
		                     		<option>전체</option>
		                    		<c:forEach var="key1" items="${key1}">
		                     			<option class="epidList">${key1.infdisnm}</option>
		                  			</c:forEach>
	                       		</select>
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
              $(function(){	
            	  
            	  $("#line-chart1Month").hide();
    			  $("#line-chart1Year").hide();
    			  const lastDays = $("#lastDaysList > .mySelect > .selec").text();
    			  if($("#monthList > .mySelect > .selec").text() == "선택안함"){
    				  $("#monthList > .mySelect > .selec").text('월');
    			  }
    			  $("#monthList > .mySelect > ul").on("click",function(){
    				  if($("#monthList > .mySelect > .selec").text() == "선택안함"){
        				  $("#monthList > .mySelect > .selec").text('월');
        			  }
    			  })
    			  var last1MonthChart = new Chart(document.getElementById("line-chart1Month"), { 					
          			  type: 'line',
          			  data: {
          			    labels: [''], // x축(년월별)
          			    datasets: [{ 
          			        data: [0], //y축
          			        borderColor: "#3e95cd",
          			        fill: false
          			      }
          			    ]
          			  },
          			  options: {
          				scales: {
				            x: {
				            	ticks:{
				            		callback:function(value, index){
				            			return index % 6 === 0 ? this.getLabelForValue(value) : ''; 
				            		},
				            		
				                    maxRotation: 0,
				                    minRotation: 0
				            	}
				            }
						},
          			    title: {
          			      display: true,
          			      text: '최근 30일'
          			    },
          			  plugins :{
					      legend: { 
					    	  	display : false  	
					      }
				      }
				      
				      }
          			});
    			  
    			  var last1YearChart = new Chart(document.getElementById("line-chart1Year"), { 					
          			  type: 'line',
          			  data: {
          			    labels: [''], // x축(년월별)
          			    datasets: [{ 
          			        data: [0], //y축
          			        label: [''],
          			        borderColor: "#3e95cd"
          			      }
          			    ]
          			  },
          			  options: {
          				scales: {
				            x: {
				            	ticks:{
				            		callback:function(value, index){
				            			return index % 2 === 0 ? this.getLabelForValue(value) : ''; 
				            		},
				            		
				                    maxRotation: 0,
				                    minRotation: 0
				            	}
				            }
						},
          			    title: {
          			      display: true,
          			      text: '최근 1년'
          			    },
          			  plugins :{
						      legend: { 
						    	  	display : false  	
						      }
						}
						 
          			    
          			    
          			  }
          			});  
    			  
    			  //최근 날짜 콤보 박스 클릭
    			  $("#lastDaysList > .mySelect > ul").on("click",function(){
    				  
            		  const lastDays = $("#lastDaysList > .mySelect > .selec").text();
            		  const region = $("#region > .mySelect > .selec").text();
      		  		  const infdis = $("#infDis > .mySelect > .selec").text();
      		  		
      		  		  const sendData = {
      		  				  "lastDays": lastDays,
      		  				  "region" : region,
      		  				  "infdis":infdis
      		  		  }
      		  		 //전국 확진자 수
      	          	  $.ajax({
      	          		url : "/sub_totalChart/InfDisNation",
      	       		    method : 'GET',
      	       		 	data:sendData,
      		       		beforeSend:function(){
      		       			$(".infdisNationCnt").text('-');
      		       		},
      		    		success :function(item){
      		    			
      		    			$(".infdisNationCnt").text(item[0].count);
      		    		}
      	          	  });
      		            	  
      		          	  //지역 확진자 수
      		          	  $.ajax({
      		           	  	url : "/sub_totalChart/InfDisRegion",
      		          		method : 'GET',
      		          		data:sendData,
      		          		beforeSend:function(){
      		          			$(".infdisRegionCnt").text('-');
      		          		},
      			    		success :function(item){
      			    			
      		    				$(".infdisRegionCnt").text(item[0].count);
      			    		}
      		           	  });	

            		  if(lastDays == "최근 7일"){
            			  $("#bar-chart2").show();
            			  $("#line-chart1Month").hide();
            			  $("#line-chart1Year").hide();
            			  
            			  $.ajax({
            		    		url : "/sub_totalChart/InfDisChart",
            		   		    method : 'GET',
            		   		    data : sendData,
	            		   		beforeSend:function(){
	         			   		 	bar_chart2.data.datasets[0].data = [0];
	         	    				bar_chart2.update();
	         	          		},
            		    		success :function(item){
            		    			const count = [];
            		    			const label = [];
            		    			for(var i = 0 in item){
            		    				count.push(item[i].count);
            		    				label.push(item[i].month+"."+item[i].day);
            		    			}
            	    				bar_chart2.data.datasets[0].data = count;
            	    				bar_chart2.data.labels=label;
            		    			bar_chart2.update();
            		    		}
            	    	  }); 
            			  
            		  }else if(lastDays == "최근 30일"){
            			  $("#bar-chart2").hide();
            			  $("#line-chart1Month").show();
            			  $("#line-chart1Year").hide();
            			  $.ajax({
            		    		url : "/sub_totalChart/InfDisChart",
            		   		    method : 'GET',
            		   		    data : sendData,
            		   		 	beforeSend:function(){
            		   		 		last1MonthChart.data.datasets[0].data = [0];
            		   		 		last1MonthChart.update();
	         	          		},
            		    		success :function(item){
            		    			const count = [];
            		    			const label = [];
            		    			for(var i = 0 in item){
            		    				
            		    				count.push(item[i].count);
            		    				
            		    				label.push(item[i].month+"."+item[i].day);
            		    				
            		    			}
            		    			last1MonthChart.data.datasets[0].data = count;
            		    			last1MonthChart.data.labels=label;
            		    			last1MonthChart.update();
            		    		}
            	    	  }); 
            		  }else if(lastDays == "최근 1년"){
            			  $("#bar-chart2").hide();
            			  $("#line-chart1Month").hide();
            			  $("#line-chart1Year").show();
            			  $.ajax({
          		    		url : "/sub_totalChart/InfDisChart",
          		   		    method : 'GET',
          		   		    data : sendData,
	          		   		beforeSend:function(){
		          		   		last1YearChart.data.datasets[0].data = [0];
		          		 	  	last1YearChart.update();
	     	          		},
          		    		success :function(item){
          		    			const count = [];
          		    			const label = [];
          		    			var total = 0;
          		    			for(var i = 0 in item){
          		    				if(i % 6 == 0){
	          		    				count.push(item[i].count);
	          		    				
	          		    				label.push(item[i].month+"."+item[i].day);
          		    				}else if(i == item.length-1){
										count.push(item[i].count);
	          		    				
	          		    				label.push(item[i].month+"."+item[i].day);
          		    				}
          		    			}
          		    			last1YearChart.data.datasets[0].data = count;
          		    			last1YearChart.data.labels=label;
          		    			last1YearChart.update();
          		    		}
          	    	  	});
            		  }
            		  
            		  
            		  
            	  });
            	  
            	  
            	  const infdisnm = $("#infDis > .mySelect > .selec").text();
            	  $(".infdisnm").text(infdisnm);   
            	  
            	  //전국 확진자 수
            	  $.ajax({
            		url : "/sub_totalChart/InfDisNation",
           		    method : 'GET',
		    		success :function(item){
		    			
		    			$(".infdisNationCnt").text(item[0].count);
		    		}
            	  });
            	  
            	  //지역 확진자 수(default 서울)
            	  $.ajax({
              		url : "/sub_totalChart/InfDisRegion",
             		    method : 'GET',
  		    		success :function(item){
  		    			
  		    			$(".infdisRegionCnt").text(item[0].count);
  		    		}
              	  });
            	  

  				//확진자 추이 그래프
  		var	bar_chart2 = new Chart(document.getElementById("bar-chart2"), {
  				    type: 'bar',
  				    data: {
  				      labels: [''],
  				      datasets: [
  				        {
  				          label: '',
  				          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
  				          data: [0]
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
  				        text: ''
  				      }
  				    }
  				});
  				
		  	//확진자 추이 그래프 최근 7일
		  	   $.ajax({
		    		url : "/sub_totalChart/InfDisChart",
		   		    method : 'GET',
		   		    data : {"lastDays":lastDays},
		    		success :function(item){
		    			const count = [];
		    			const label = [];
		    			for(var i = 0 in item){
		    				count.push(item[i].count);
		    				label.push(item[i].month+"."+item[i].day);
		    			}
	    				bar_chart2.data.datasets[0].data = count;
	    				bar_chart2.data.labels=label;
		    			bar_chart2.update();
		    		}
	    	  }); 
		  	
		  	
		  	 //확진자 추이 질병 선택
		  	$("#infDis > .mySelect > ul").on("click", function(){
			  		
		  		 	const lastDays = $("#lastDaysList > .mySelect > .selec").text();
           		 	const region = $("#region > .mySelect > .selec").text();
   		  		  	const infdis = $("#infDis > .mySelect > .selec").text();
   		  			$(".infdisnm").text(infdis);
   		  			
			  		const sendData = {
			  				"lastDays":lastDays,
			  				"region":region,
			  				"infdis":infdis
			  		}
			  		
			  	//확진자 추이 그래프
			 	 	$.ajax({
			    		url : "/sub_totalChart/InfDisChart",
			   		    method : 'GET',
			   		    data:sendData,
			   		 	beforeSend:function(){
				   		 	bar_chart2.data.datasets[0].data = [0];
		    				bar_chart2.update();
		          		},
			    		success :function(item){
			    			const count = [];
			    			const label = [];
			    			for(var i = 0 in item){
			    				count.push(item[i].count);
			    				label.push(item[i].month+"."+item[i].day);
			    			}
		    				bar_chart2.data.datasets[0].data = count;
		    				bar_chart2.data.labels=label;
			    			bar_chart2.update();
			    		}
		    	  }); 
			  	  //전국 확진자 수
	          	  $.ajax({
	          		url : "/sub_totalChart/InfDisNation",
	       		    method : 'GET',
	       		 	data:sendData,
		       		beforeSend:function(){
		       			$(".infdisNationCnt").text('-');
		       		},
		    		success :function(item){
		    			
		    			$(".infdisNationCnt").text(item[0].count);
		    		}
	          	  });
		            	  
		          	  //지역 확진자 수
		          	  $.ajax({
		           	  	url : "/sub_totalChart/InfDisRegion",
		          		method : 'GET',
		          		data:sendData,
		          		beforeSend:function(){
		          			$(".infdisRegionCnt").text('-');
		          		},
			    		success :function(item){
			    			
		    				$(".infdisRegionCnt").text(item[0].count);
			    		}
		           	  });	
		          	if(lastDays == "최근 7일"){
	      			  $("#bar-chart2").show();
	      			  $("#line-chart1Month").hide();
	      			  $("#line-chart1Year").hide();
	      			  
	      			  $.ajax({
	      		    		url : "/sub_totalChart/InfDisChart",
	      		   		    method : 'GET',
	      		   		    data : sendData,
	          		   		beforeSend:function(){
	       			   		 	bar_chart2.data.datasets[0].data = [0];
	       	    				bar_chart2.update();
	       	          		},
	      		    		success :function(item){
	      		    			const count = [];
	      		    			const label = [];
	      		    			for(var i = 0 in item){
	      		    				count.push(item[i].count);
	      		    				label.push(item[i].month+"."+item[i].day);
	      		    			}
	      	    				bar_chart2.data.datasets[0].data = count;
	      	    				bar_chart2.data.labels=label;
	      		    			bar_chart2.update();
	      		    		}
	      	    	  }); 
	      			  
	      		  }else if(lastDays == "최근 30일"){
	      			  $("#bar-chart2").hide();
	      			  $("#line-chart1Month").show();
	      			  $("#line-chart1Year").hide();
	      			  $.ajax({
	      		    		url : "/sub_totalChart/InfDisChart",
	      		   		    method : 'GET',
	      		   		    data : sendData,
	      		   		 	beforeSend:function(){
	      		   		 		last1MonthChart.data.datasets[0].data = [0];
	      		   		 		last1MonthChart.update();
	       	          		},
	      		    		success :function(item){
	      		    			const count = [];
	      		    			const label = [];
	      		    			for(var i = 0 in item){
	      		    				
	      		    				count.push(item[i].count);
	      		    				
	      		    				label.push(item[i].month+"."+item[i].day);
	      		    				
	      		    			}
	      		    			last1MonthChart.data.datasets[0].data = count;
	      		    			last1MonthChart.data.labels=label;
	      		    			last1MonthChart.update();
	      		    		}
	      	    	  }); 
	      		  }else if(lastDays == "최근 1년"){
	    			  $("#bar-chart2").hide();
	    			  $("#line-chart1Month").hide();
	    			  $("#line-chart1Year").show();
	    			  $.ajax({
	  		    		url : "/sub_totalChart/InfDisChart",
	  		   		    method : 'GET',
	  		   		    data : sendData,
	      		   		beforeSend:function(){
	          		   		last1YearChart.data.datasets[0].data = [0];
	          		 	  	last1YearChart.update();
	 	          		},
	  		    		success :function(item){
	  		    			const count = [];
	  		    			const label = [];
	  		    			var total = 0;
	  		    			for(var i = 0 in item){
	  		    				if(i % 6 == 0){
	      		    				count.push(item[i].count);
	      		    				
	      		    				label.push(item[i].month+"."+item[i].day);
	  		    				}else if(i == item.length-1){
									count.push(item[i].count);
	      		    				
	      		    				label.push(item[i].month+"."+item[i].day);
	  		    				}
	  		    			}
	  		    			last1YearChart.data.datasets[0].data = count;
	  		    			last1YearChart.data.labels=label;
	  		    			last1YearChart.update();
	  		    		}
	  	    	  	});
	    		  }
			  	});
		  	 
		  	//확진자 추이 지역 선택
			$("#region > .mySelect > ul").on("click", function(){
		  		
	  		 	const lastDays = $("#lastDaysList > .mySelect > .selec").text();
       		 	const region = $("#region > .mySelect > .selec").text();
		  		const infdis = $("#infDis > .mySelect > .selec").text();
		  	
		  		$(".infdisRegionTitle").text(region.substring(0,2)+" 누적확진자");
		  		$(".infdisDeathRegionTitle").text(region.substring(0,2)+" 누적사망자");
		  		const sendData = {
		  				"lastDays":lastDays,
		  				"region":region,
		  				"infdis":infdis
		  		}
		  		
		  		//확진자 추이 그래프
		 	 	$.ajax({
		    		url : "/sub_totalChart/InfDisChart",
		   		    method : 'GET',
		   		    data:sendData,
		   		 	beforeSend:function(){
			   		 	bar_chart2.data.datasets[0].data = [0];
	    				bar_chart2.update();
	          		},
		    		success :function(item){
		    			const count = [];
		    			const label = [];
		    			for(var i = 0 in item){
		    				count.push(item[i].count);
		    				label.push(item[i].month+"."+item[i].day);
		    			}
	    				bar_chart2.data.datasets[0].data = count;
	    				bar_chart2.data.labels=label;
		    			bar_chart2.update();
		    		}
	    	  }); 
	            	  
	          	  //지역 확진자 수
	          	  $.ajax({
	           	  	url : "/sub_totalChart/InfDisRegion",
	          		method : 'GET',
	          		data:sendData,
	          		beforeSend:function(){
	          			$(".infdisRegionCnt").text('-');
	          		},
		    		success :function(item){
		    			
	    				$(".infdisRegionCnt").text(item[0].count);
		    		}
	           	  });	
	          	  
	          	  
	          	if(lastDays == "최근 7일"){
      			  $("#bar-chart2").show();
      			  $("#line-chart1Month").hide();
      			  $("#line-chart1Year").hide();
      			  
      			  $.ajax({
      		    		url : "/sub_totalChart/InfDisChart",
      		   		    method : 'GET',
      		   		    data : sendData,
          		   		beforeSend:function(){
       			   		 	bar_chart2.data.datasets[0].data = [0];
       	    				bar_chart2.update();
       	          		},
      		    		success :function(item){
      		    			const count = [];
      		    			const label = [];
      		    			for(var i = 0 in item){
      		    				count.push(item[i].count);
      		    				label.push(item[i].month+"."+item[i].day);
      		    			}
      	    				bar_chart2.data.datasets[0].data = count;
      	    				bar_chart2.data.labels=label;
      		    			bar_chart2.update();
      		    		}
      	    	  }); 
      			  
      		  }else if(lastDays == "최근 30일"){
      			  $("#bar-chart2").hide();
      			  $("#line-chart1Month").show();
      			  $("#line-chart1Year").hide();
      			  $.ajax({
      		    		url : "/sub_totalChart/InfDisChart",
      		   		    method : 'GET',
      		   		    data : sendData,
      		   		 	beforeSend:function(){
      		   		 		last1MonthChart.data.datasets[0].data = [0];
      		   		 		last1MonthChart.update();
       	          		},
      		    		success :function(item){
      		    			const count = [];
      		    			const label = [];
      		    			for(var i = 0 in item){
      		    				
      		    				count.push(item[i].count);
      		    				
      		    				label.push(item[i].month+"."+item[i].day);
      		    				
      		    			}
      		    			last1MonthChart.data.datasets[0].data = count;
      		    			last1MonthChart.data.labels=label;
      		    			last1MonthChart.update();
      		    		}
      	    	  }); 
      		  }else if(lastDays == "최근 1년"){
    			  $("#bar-chart2").hide();
    			  $("#line-chart1Month").hide();
    			  $("#line-chart1Year").show();
    			  $.ajax({
  		    		url : "/sub_totalChart/InfDisChart",
  		   		    method : 'GET',
  		   		    data : sendData,
      		   		beforeSend:function(){
          		   		last1YearChart.data.datasets[0].data = [0];
          		 	  	last1YearChart.update();
 	          		},
  		    		success :function(item){
  		    			const count = [];
  		    			const label = [];
  		    			var total = 0;
  		    			for(var i = 0 in item){
  		    				if(i % 6 == 0){
      		    				count.push(item[i].count);
      		    				
      		    				label.push(item[i].month+"."+item[i].day);
  		    				}else if(i == item.length-1){
								count.push(item[i].count);
      		    				
      		    				label.push(item[i].month+"."+item[i].day);
  		    				}
  		    			}
  		    			last1YearChart.data.datasets[0].data = count;
  		    			last1YearChart.data.labels=label;
  		    			last1YearChart.update();
  		    		}
  	    	  	});
    		  }
		  		
		  	});
			
			
		  	$(".localList > li").on("click", function(){
		  		$("#localBtn").text($(this).text());
		  		$("#localBtn").append("<img src='/resources/img/pj_1/icon_selectArrow.png' alt='셀렉트 화살표'/>");
		  		
		  		const region = document.getElementById("localBtn").innerText;
		  		const infdis = document.getElementById("infdisListBtn").innerText;
		  		$(".infdisRegionTitle").text(region.substring(0,2)+" 누적확진자");
		  		$(".infdisDeathRegionTitle").text(region.substring(0,2)+" 누적사망자");
		  		const lastDays = document.getElementById("lastdays").innerText;
		  		
		  		const sendData = {
		  				"lastDays":lastDays,
		  				"region":region,
		  				"infdis":infdis
		  		}
		  		
		  		//확진자 추이 그래프
		 	 	$.ajax({
		    		url : "/sub_totalChart/InfDisChart",
		   		    method : 'GET',
		   		    data:sendData,
		   		 	beforeSend:function(){
			   		 	bar_chart2.data.datasets[0].data = [0];
	    				bar_chart2.update();
	          		},
		    		success :function(item){
		    			const count = [];
		    			const label = [];
		    			for(var i = 0 in item){
		    				count.push(item[i].count);
		    				label.push(item[i].month+"."+item[i].day);
		    			}
	    				bar_chart2.data.datasets[0].data = count;
	    				bar_chart2.data.labels=label;
		    			bar_chart2.update();
		    		}
	    	  }); 
	            	  
	          	  //지역 확진자 수
	          	  $.ajax({
	           	  	url : "/sub_totalChart/InfDisRegion",
	          		method : 'GET',
	          		data:sendData,
	          		beforeSend:function(){
	          			$(".infdisRegionCnt").text('-');
	          		},
		    		success :function(item){
		    			
	    				$(".infdisRegionCnt").text(item[0].count);
		    		}
	           	  });	
	          	  
	          	  
	          	if(lastDays == "최근 7일"){
      			  $("#bar-chart2").show();
      			  $("#line-chart1Month").hide();
      			  $("#line-chart1Year").hide();
      			  
      			  $.ajax({
      		    		url : "/sub_totalChart/InfDisChart",
      		   		    method : 'GET',
      		   		    data : sendData,
          		   		beforeSend:function(){
       			   		 	bar_chart2.data.datasets[0].data = [0];
       	    				bar_chart2.update();
       	          		},
      		    		success :function(item){
      		    			const count = [];
      		    			const label = [];
      		    			for(var i = 0 in item){
      		    				count.push(item[i].count);
      		    				label.push(item[i].month+"."+item[i].day);
      		    			}
      	    				bar_chart2.data.datasets[0].data = count;
      	    				bar_chart2.data.labels=label;
      		    			bar_chart2.update();
      		    		}
      	    	  }); 
      			  
      		  }else if(lastDays == "최근 30일"){
      			  $("#bar-chart2").hide();
      			  $("#line-chart1Month").show();
      			  $("#line-chart1Year").hide();
      			  $.ajax({
      		    		url : "/sub_totalChart/InfDisChart",
      		   		    method : 'GET',
      		   		    data : sendData,
      		   		 	beforeSend:function(){
      		   		 		last1MonthChart.data.datasets[0].data = [0];
      		   		 		last1MonthChart.update();
       	          		},
      		    		success :function(item){
      		    			const count = [];
      		    			const label = [];
      		    			for(var i = 0 in item){
      		    				
      		    				count.push(item[i].count);
      		    				
      		    				label.push(item[i].month+"."+item[i].day);
      		    				
      		    			}
      		    			last1MonthChart.data.datasets[0].data = count;
      		    			last1MonthChart.data.labels=label;
      		    			last1MonthChart.update();
      		    		}
      	    	  }); 
      		  }else if(lastDays == "최근 1년"){
    			  $("#bar-chart2").hide();
    			  $("#line-chart1Month").hide();
    			  $("#line-chart1Year").show();
    			  $.ajax({
  		    		url : "/sub_totalChart/InfDisChart",
  		   		    method : 'GET',
  		   		    data : sendData,
      		   		beforeSend:function(){
          		   		last1YearChart.data.datasets[0].data = [0];
          		 	  	last1YearChart.update();
 	          		},
  		    		success :function(item){
  		    			const count = [];
  		    			const label = [];
  		    			var total = 0;
  		    			for(var i = 0 in item){
  		    				if(i % 6 == 0){
      		    				count.push(item[i].count);
      		    				
      		    				label.push(item[i].month+"."+item[i].day);
  		    				}else if(i == item.length-1){
								count.push(item[i].count);
      		    				
      		    				label.push(item[i].month+"."+item[i].day);
  		    				}
  		    			}
  		    			last1YearChart.data.datasets[0].data = count;
  		    			last1YearChart.data.labels=label;
  		    			last1YearChart.update();
  		    		}
  	    	  	});
    		  }
		  		
		  	});
  				
            	  var applyBtnCnt = 0; //적용하기 버튼 클릭확인
            	  
            	  //top5 그래프
           var bar_chart = new Chart(document.getElementById("bar-chart"), {
  				    type: 'bar',
  				    data: {
  				      labels: ' ',
  				      datasets: [
  				        {
  				          label: '',
  				          backgroundColor: "#3e95cd",
  				          data: [0]
  				        },{
  		       	          label: '',
  		       	          backgroundColor: "#8e5ea2",
  		       	          data: [0]
  		       	        }, {
  		     	          label: '',
  		       	          backgroundColor: "#3cba9f",
  		       	          data: [0]
  		       	        }, {
  		    	          label:'',
  		      	          backgroundColor: "#e8c3b9",
  		      	          data:[0]
  		      	        }, {
  		     	          label: '',
  		       	          backgroundColor: "#c45850",
  		       	          data: [0]
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
           
          
           		$.ajax({
					url : "/sub_totalChart/Top5",
        		    method : 'GET',
        		    data: {"region":"전국"},
		    		success :function(item){		
		    			for(var i = 0 in item){
		    				bar_chart.data.datasets[i].data.pop();
		    				bar_chart.data.datasets[i].data.push(item[i].count);
		    				bar_chart.data.datasets[i].label=item[i].infdisnm;
		    			}
		    			bar_chart.update();
			    		
			    	}
        		});
            	  //연령별 그래프
          var age_chart  =  new Chart(document.getElementById("age-chart"), {
          		    type: 'bar',
          		    data: {
          		      labels: ' ',
          		      datasets: [
          		        {
          		          label: [''],
          		          backgroundColor: "#3e95cd",
          		          data: [0]
          		        },{
                 	          label:  [''],
                 	          backgroundColor: "#8e5ea2",
                 	          data:  [0]
                 	        }, {
               	          label:  [''],
                 	          backgroundColor: "#3cba9f",
                 	          data:  [0]
                 	        }, {
                 	          label: [''],
                	          backgroundColor: "#e8c3b9",
                	          data:  [0]
                	        }, {
                	          label:[''],
                 	          backgroundColor: "#c45850",
                 	       	  data:  [0]
                 	        },{
                	          label: [''],
                 	          backgroundColor: "#a8e3b9",
                 	          data:  [0]
                 	        },{
                 	          label: [''],
                	          backgroundColor: "#bec389",
                	          data:  [0]
                	        },{
                	          label: [''],
                 	          backgroundColor: "#abcdb9",
                 	          data: [0]
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
            	  
            	  $.ajax({
  					url : "/sub_totalChart/age",
             		    method : 'GET',
             		 	data: {"ageEpid" : '전체'},
  		    		success :function(item){		
  		    			for(var i = 0 in item){
  		    				age_chart.data.datasets[i].data.pop();
  		    				age_chart.data.datasets[i].label.pop();
  		    				age_chart.data.datasets[i].data.push(item[i].count);
  		    				age_chart.data.datasets[i].label.push(item[i].age);
  		    			}
  		    			age_chart.update();
   			    		
   			    	}
             		});
            	  
            	  
            	// 연령별 그래프 질병 선택
            	  $("#ageInfDis > .mySelect > ul").on("click",function(){
                		const ageEpid = $("#ageInfDis > .mySelect > .selec").text();
						const year = $("#yearList > .mySelect > .selec").text();
						const month = $("#monthList > .mySelect > .selec").text();
							
						const region = $("#region2 > .mySelect > .selec").text();
						
                		const sendData = {
	  							"ageEpid" : ageEpid
	  					};
                		if(applyBtnCnt == 1){
                			const	sendData = {
	    	  							"ageEpid" : ageEpid,
	    	  							"year" :year,
	    	  							"month" : month,
	    	  							"region" : region
	    	  					};
                			$.ajax({
      							url : "/sub_totalChart/age",
                       		    method : 'GET',                       			
           			    		data: sendData,
           			    		beforeSend:function(){
                    				age_chart.data.datasets[0].data = [0];
                    				age_chart.data.datasets[1].data = [0];
                    				age_chart.data.datasets[2].data = [0];
                    				age_chart.data.datasets[3].data = [0];
                    				age_chart.data.datasets[4].data = [0];
                    				age_chart.data.datasets[5].data = [0];
                    				age_chart.data.datasets[6].data = [0];
                    				age_chart.data.datasets[7].data = [0];
                    				age_chart.update();
	         	          		},
           			    		success :function(item){		
           			    			for(var i = 0 in item){
           	  		    				age_chart.data.datasets[i].data.pop();
           	  		    				age_chart.data.datasets[i].label.pop();
           	  		    				age_chart.data.datasets[i].data.push(item[i].count);
           	  		    				age_chart.data.datasets[i].label.push(item[i].age);
           	  		    			}
           	  		    			age_chart.update();
           	   			    		
               			    	}
                         	});
		 				}else{
		 					const sendData = {
		  							"ageEpid" : ageEpid
		  					};
		 					
		 					$.ajax({
      							url : "/sub_totalChart/age",
                       		    method : 'GET',
           			    		data: sendData,
           			    		beforeSend:function(){
                       				age_chart.data.datasets[0].data = [0];
                       				age_chart.data.datasets[1].data = [0];
                       				age_chart.data.datasets[2].data = [0];
                       				age_chart.data.datasets[3].data = [0];
                       				age_chart.data.datasets[4].data = [0];
                       				age_chart.data.datasets[5].data = [0];
                       				age_chart.data.datasets[6].data = [0];
                       				age_chart.data.datasets[7].data = [0];
                       				age_chart.update();
	         	          		},
           			    		success :function(item){		
           			    			for(var i = 0 in item){
           	  		    				age_chart.data.datasets[i].data.pop();
           	  		    				age_chart.data.datasets[i].label.pop();
           	  		    				age_chart.data.datasets[i].data.push(item[i].count);
           	  		    				age_chart.data.datasets[i].label.push(item[i].age);
           	  		    			}
           	  		    			age_chart.update();
           	   			    		
               			    	}
                         	});
		 				}
                		
                		
	  				
                  	})  
                  	       	 
                  	
                  	
            	 //성별 감염자 수
            var pie_chart = new Chart(document.getElementById("pie-chart"), {
          		    type: 'pie',
          		 	 plugins:[ChartDataLabels],
          		    data: {
          		      labels: ["남성","여성"],
          		      datasets: [{
          		        backgroundColor: ["#3e95cd", "#8e5ea2"],
          		        data: ['0','0']
          		      }]
          		    },
          		    options: {
          		 		responsive: true,
          		 		plugins:{
          				      legend: { 
          				    	  	display : true,
          				    	  	position: 'bottom',
          				    	  	labels:{
          				    	  		fontSize:10
          				    	  	}
          				      },
          				      datalabels:{
          				    		color : '#ffffff',
          				    		formatter: function (value,context) {
          				              return Math.round(value /(context.dataset.data[0] + context.dataset.data[1]) * 100) + '%';
          				            }	
          				      }
          				    }
          			
          		    }
          		});
            	  
            	  
            	  
            	  $.ajax({
					url : "/sub_totalChart/genderPer",
           		    method : 'GET',
           		 	data: {"genderPerEpid" : '전체'},
		    		success :function(item){		
		    			
 			    		const genderTotal = [];
 			    		
 			    		for(var i = 0 in item){
 			    			 genderTotal.push(item[i].count);
 			    		}
 			    		pie_chart.data.datasets[0].data.pop();
 			    		pie_chart.data.datasets[0].data.pop();
 			    		pie_chart.data.datasets[0].data.push(genderTotal[0]);
 			    		pie_chart.data.datasets[0].data.push(genderTotal[1]);

 			    		
 			    		pie_chart.update();
 			    	}
           		});
            	
            	//성별 감염자 수 질병 선택
          		$("#genderInfDis > .mySelect > ul").on("click",function(){
                		const genderPerEpid = $("#genderInfDis > .mySelect > .selec").text();
                		const year = $("#yearList > .mySelect > .selec").text();
						const month = $("#monthList > .mySelect > .selec").text();
							
						const region = $("#region2 > .mySelect > .selec").text();
						
  					
                   	
                   	if(applyBtnCnt == 1){
              			const	sendData = {
	    	  							"genderPerEpid" : genderPerEpid,
	    	  							"year" :year,
	    	  							"month" : month,
	    	  							"region" : region
	    	  					};
              			$.ajax({
    							url : "/sub_totalChart/genderPer",
                     		    method : 'GET',
         			    		data: sendData,
         			    	 	beforeSend:function(){
         			    	 		pie_chart.data.datasets[0].data = [0];
         			    	 		pie_chart.update();
	         	          		},
         			    		success :function(item){		
  	       			    		const genderTotal = [];
  	       			    		
  	       			    		for(var i = 0 in item){
  	       			    			 genderTotal.push(item[i].count);
  	       			    		}
  	       			    		pie_chart.data.datasets[0].data.pop();
  	       			    		pie_chart.data.datasets[0].data.pop();
  	       			    		pie_chart.data.datasets[0].data.push(genderTotal[0]);
  	       			    		pie_chart.data.datasets[0].data.push(genderTotal[1]);
  	
  	         			    		
  	       			    		pie_chart.update();
             			    	}
                       	});
		 				}else{
		 					const sendData = {
		  							"genderPerEpid" : genderPerEpid
		  					};
		 					
		 					$.ajax({
    							url : "/sub_totalChart/genderPer",
                     		    method : 'GET',
         			    		data: sendData,
         			    		beforeSend:function(){
         			    	 		pie_chart.data.datasets[0].data = [0];
         			    	 		pie_chart.update();
	         	          		},
         			    		success :function(item){		
  	       			    		const genderTotal = [];
  	       			    		
  	       			    		for(var i = 0 in item){
  	       			    			 genderTotal.push(item[i].count);
  	       			    		}
  	       			    		pie_chart.data.datasets[0].data.pop();
  	       			    		pie_chart.data.datasets[0].data.pop();
  	       			    		pie_chart.data.datasets[0].data.push(genderTotal[0]);
  	       			    		pie_chart.data.datasets[0].data.push(genderTotal[1]);
  	
  	         			    		
  	       			    		pie_chart.update();
             			    	}
                       	});
		 				}
                	})  

            	  
            	  

	              	//과거 3년 감염병 통계 비교 차트
	              	const Year3Epidmonth = [];
					for(var i =1 ; i <= 12; i++){
						Year3Epidmonth.push(i);
					}
	              	
	              	var line_chart = new Chart(document.getElementById("line-chart"), { // 지난 1년 실제 감염자수 (절대)					
	          			  type: 'line',
	          			  data: {
	          			    labels: Year3Epidmonth, // x축(년월별)
	          			    datasets: [{ 
	          			        data: ['1'], //y축
	          			        label: ['1'],
	          			        borderColor: "#3e95cd",
	          			        fill: false
	          			      },  { 
	          			        data: ['1'],
	          			        label: ['1'],
	          			        borderColor: "#8e5ea2",
	          			        fill: false
	          			      }, { 
	          			        data: ['1'],
	          			        label: ['1'],
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
	              	
	              	$.ajax({
						url : "/sub_totalChart/Year3Epid",
             		    method : 'GET',
             		 	data: {"Year3Epid" : '전체'},
   			    		success :function(item){		
   			    		var ic=1;
   			    		var ic2=1;
   			    		var ic3=1;
   			    		
   			    		const total1 = [];
      					const total2 = [];
      					const total3 = [];
   			    		
   			    		for (var i = 0 in item["lastYear"]){
   			    			
   			    			if(ic2 == item["lastYear"][i].month){
          						total2.push(item["lastYear"][i].count);
          						ic2++;
          					}else{
          						for(var a = ic2; a <= item["lastYear"][i].month; a++){
          							if(ic2 == item["lastYear"][i].month){
          								total2.push(item["lastYear"][i].count);
          								ic2++;
          								break;
          							}
          							total2.push(0);
          							ic2++;	
          						}
          						
          					}
   			    		}
   			    		
   			    		
   			    		for (var i = 0 in item["currentYear"]){
   			    			if(ic == item["currentYear"][i].month){
          						total1.push(item["currentYear"][i].count);
          						ic++;
          					}else{
          						for(var a = ic; a <=item["currentYear"][i].month; a++){
          							if(ic == item["currentYear"][i].month){
          								total.push(item["currentYear"][i].count);
          								ic++;
          								break;
          							}
          							total1.push(0);
          							ic++;	
          						}
          						
          					}
   			    		}
   			    		
   			    		for (var i = 0 in item["beforeLastYear"]){
   			    			
   			    			if(ic3 == item["beforeLastYear"][i].month){
          						total3.push(item["beforeLastYear"][i].count);
          						ic3++;
          					}else{
          						for(var a = ic3; a <= item["beforeLastYear"][i].month; a++){
          							if(ic3 == item["beforeLastYear"][i].month){
          								total2.push(item["beforeLastYear"][i].count);
          								ic3++;
          								break;
          							}
          							total2.push(0);
          							ic3++;	
          						}
          						
          					}
   			    		
   			    		}
   			    		
   			    		//inf year 값들
      					const year1 = item["currentYear"][0].year;
      					if(item["lastYear"][0] == undefined){
      						const year2 = parseInt(year)-1;
	      					line_chart.data.datasets[1].label = year2
      					}else{
      						const year2 = item["lastYear"][0].year;
	      					line_chart.data.datasets[1].label = year2

      					}
      					
      					if(item["beforeLastYear"][0] == undefined){
      						const year3 = parseInt(year)-2;
	      					line_chart.data.datasets[0].label = year3
      					}else{
      						const year3 = item["beforeLastYear"][0].year;
	      					line_chart.data.datasets[0].label = year3
      					}
      					
      					line_chart.data.datasets[2].label = year1
      					line_chart.data.datasets[0].data = total3
      					line_chart.data.datasets[1].data = total2
      					line_chart.data.datasets[2].data = total1
      					
      					
      					line_chart.update();
      					
      					line_chart.update();
   			    	}
           		});
              	
	              	
	              	
              	//과거 3년 질병 선택
              	$("#year3InfDis > .mySelect > ul").on("click",function(){

              		const Year3Epid = $("#year3InfDis > .mySelect > .selec").text();
              		
              		const year = $("#yearList > .mySelect > .selec").text();
					const region = $("#region2 > .mySelect > .selec").text();
					
					if(applyBtnCnt == 1){
            			const	sendData = {
    	  							"Year3Epid" : Year3Epid,
    	  							"year" :year,
    	  							"region" : region
    	  					};
            			$.ajax({
    						url : "/sub_totalChart/Year3Epid",
                     		    method : 'GET',
           			    	data: sendData,
           			    	beforeSend:function(){
           			    		line_chart.data.datasets[0].data = [0];
           			    		line_chart.data.datasets[1].data = [0];
           			    		line_chart.data.datasets[2].data = [0];
           			    		line_chart.update();
         	          		},
           			    	success :function(item){		
           			    		var ic=1;
           			    		var ic2=1;
           			    		var ic3=1;
           			    		
           			    		const total1 = [];
              					const total2 = [];
              					const total3 = [];
           			    		
           			    		for (var i = 0 in item["lastYear"]){
           			    			
           			    			if(ic2 == item["lastYear"][i].month){
                  						total2.push(item["lastYear"][i].count);
                  						ic2++;
                  					}else{
                  						for(var a = ic2; a <= item["lastYear"][i].month; a++){
                  							if(ic2 == item["lastYear"][i].month){
                  								total2.push(item["lastYear"][i].count);
                  								ic2++;
                  								break;
                  							}
                  							total2.push(0);
                  							ic2++;	
                  						}
                  						
                  					}
           			    		}
           			    		
           			    		
           			    		for (var i = 0 in item["currentYear"]){
           			    			if(ic == item["currentYear"][i].month){
                  						total1.push(item["currentYear"][i].count);
                  						ic++;
                  					}else{
                  						for(var a = ic; a <=item["currentYear"][i].month; a++){
                  							if(ic == item["currentYear"][i].month){
                  								total.push(item["currentYear"][i].count);
                  								ic++;
                  								break;
                  							}
                  							total1.push(0);
                  							ic++;	
                  						}
                  						
                  					}
           			    		}
           			    		
           			    		for (var i = 0 in item["beforeLastYear"]){
           			    			
           			    			if(ic3 == item["beforeLastYear"][i].month){
                  						total3.push(item["beforeLastYear"][i].count);
                  						ic3++;
                  					}else{
                  						for(var a = ic3; a <= item["beforeLastYear"][i].month; a++){
                  							if(ic3 == item["beforeLastYear"][i].month){
                  								total2.push(item["beforeLastYear"][i].count);
                  								ic3++;
                  								break;
                  							}
                  							total2.push(0);
                  							ic3++;	
                  						}
                  						
                  					}
           			    		
           			    		}
           			    		
              					//inf year 값들
              					const year1 = item["currentYear"][0].year;
              					if(item["lastYear"][0] == undefined){
    	      						const year2 = parseInt(year)-1;
    		      					line_chart.data.datasets[1].label = year2
    	      					}else{
    	      						const year2 = item["lastYear"][0].year;
    		      					line_chart.data.datasets[1].label = year2

    	      					}
    	      					
    	      					if(item["beforeLastYear"][0] == undefined){
    	      						const year3 = parseInt(year)-2;
    		      					line_chart.data.datasets[0].label = year3
    	      					}else{
    	      						const year3 = item["beforeLastYear"][0].year;
    		      					line_chart.data.datasets[0].label = year3
    	      					}
    	      					
    	      					line_chart.data.datasets[2].label = year1
    	      					line_chart.data.datasets[0].data = total3
    	      					line_chart.data.datasets[1].data = total2
    	      					line_chart.data.datasets[2].data = total1
    	      					
    	      					
    	      					line_chart.update();
              					
              					line_chart.update();
           			    	}
                     	});
	 				}else{
	 					const sendData = {
	  							"Year3Epid" : Year3Epid
	  					};
	 					
	 					$.ajax({
							url : "/sub_totalChart/Year3Epid",
	                 		    method : 'GET',
	       			    	data: sendData,
	       			    	beforeSend:function(){
           			    		line_chart.data.datasets[0].data = [0];
           			    		line_chart.data.datasets[1].data = [0];
           			    		line_chart.data.datasets[2].data = [0];
           			    		line_chart.update();
         	          		},
	       			    	success :function(item){		
	       			    		var ic=1;
	       			    		var ic2=1;
	       			    		var ic3=1;
	       			    		
	       			    		const total1 = [];
	          					const total2 = [];
	          					const total3 = [];
	       			    		
	       			    		for (var i = 0 in item["lastYear"]){
	       			    			
	       			    			if(ic2 == item["lastYear"][i].month){
	              						total2.push(item["lastYear"][i].count);
	              						ic2++;
	              					}else{
	              						for(var a = ic2; a <= item["lastYear"][i].month; a++){
	              							if(ic2 == item["lastYear"][i].month){
	              								total2.push(item["lastYear"][i].count);
	              								ic2++;
	              								break;
	              							}
	              							total2.push(0);
	              							ic2++;	
	              						}
	              						
	              					}
	       			    		}
	       			    		
	       			    		
	       			    		for (var i = 0 in item["currentYear"]){
	       			    			if(ic == item["currentYear"][i].month){
	              						total1.push(item["currentYear"][i].count);
	              						ic++;
	              					}else{
	              						for(var a = ic; a <=item["currentYear"][i].month; a++){
	              							if(ic == item["currentYear"][i].month){
	              								total.push(item["currentYear"][i].count);
	              								ic++;
	              								break;
	              							}
	              							total1.push(0);
	              							ic++;	
	              						}
	              						
	              					}
	       			    		}
	       			    		
	       			    		for (var i = 0 in item["beforeLastYear"]){
	       			    			
	       			    			if(ic3 == item["beforeLastYear"][i].month){
	              						total3.push(item["beforeLastYear"][i].count);
	              						ic3++;
	              					}else{
	              						for(var a = ic3; a <= item["beforeLastYear"][i].month; a++){
	              							if(ic3 == item["beforeLastYear"][i].month){
	              								total2.push(item["beforeLastYear"][i].count);
	              								ic3++;
	              								break;
	              							}
	              							total2.push(0);
	              							ic3++;	
	              						}
	              						
	              					}
	       			    		
	       			    		}
	       			    		
	          					//inf year 값들
	          					const year1 = item["currentYear"][0].year;
	          					if(item["lastYear"][0] == undefined){
		      						const year2 = parseInt(year)-1;
			      					line_chart.data.datasets[1].label = year2
		      					}else{
		      						const year2 = item["lastYear"][0].year;
			      					line_chart.data.datasets[1].label = year2

		      					}
		      					
		      					if(item["beforeLastYear"][0] == undefined){
		      						const year3 = parseInt(year)-2;
			      					line_chart.data.datasets[0].label = year3
		      					}else{
		      						const year3 = item["beforeLastYear"][0].year;
			      					line_chart.data.datasets[0].label = year3
		      					}
		      					
		      					line_chart.data.datasets[2].label = year1
		      					line_chart.data.datasets[0].data = total3
		      					line_chart.data.datasets[1].data = total2
		      					line_chart.data.datasets[2].data = total1
		      					
		      					
		      					line_chart.update();
	          					
	          					line_chart.update();
	       			    	}
	                 	});
	 				}

					
              	});
              	
              	//적용하기 버튼
               	 $(".applyBtn").on("click", function(){
            		  const year = $("#yearList > .mySelect > .selec").text();
            		  const month = $("#monthList > .mySelect > .selec").text();
            		  	
            		  const region = $("#region2 > .mySelect > .selec").text();
            		  
            		  const top5Data = {
            				  "year" : year,
            				  "month" : month,
            				  "region" : region
            		  };
            		  
            		  $.ajax({
      					url : "/sub_totalChart/Top5",
              		    method : 'GET',
              		    data : top5Data,
              		  	beforeSend:function(){
              		  		bar_chart.data.datasets[0].data = [0];
              		 		bar_chart.update();
   	          			},
      		    		success :function(item){		
      		    			for(var i = 0 in item){
      		    				bar_chart.data.datasets[i].data.pop();
      		    				bar_chart.data.datasets[i].data.push(item[i].count);
      		    				bar_chart.data.datasets[i].label=item[i].infdisnm;
      		    			}
      		    			bar_chart.update();
      			    		
      			    	}
              		});
            		  
           		  	const ageEpid = $("#ageInfDis > .mySelect > .selec").text();
              		
 					const ageData = {
 							"ageEpid" : ageEpid,
 							"year" : year,
           				  	"month" : month,
           				  	"region" : region
 					}
        	  
 					$.ajax({
					url : "/sub_totalChart/age",
               		    method : 'GET',
   			    		data: ageData,
   			    		beforeSend:function(){
            				age_chart.data.datasets[0].data = [0];
            				age_chart.data.datasets[1].data = [0];
            				age_chart.data.datasets[2].data = [0];
            				age_chart.data.datasets[3].data = [0];
            				age_chart.data.datasets[4].data = [0];
            				age_chart.data.datasets[5].data = [0];
            				age_chart.data.datasets[6].data = [0];
            				age_chart.data.datasets[7].data = [0];
            				age_chart.update();
     	          		},
   			    		success :function(item){		
   			    			for(var i = 0 in item){
   	  		    				age_chart.data.datasets[i].data.pop();
   	  		    				age_chart.data.datasets[i].label.pop();
   	  		    				age_chart.data.datasets[i].data.push(item[i].count);
   	  		    				age_chart.data.datasets[i].label.push(item[i].age);
   	  		    			}
   	  		    			age_chart.update();
   	   			    		
       			    	}
                   	});
 					const genderPerEpid = $("#genderInfDis > .mySelect > .selec").text();
					const genderData = {
							"genderPerEpid" : genderPerEpid,
							"year" : year,
           				  	"month" : month,
           				  	"region" : region
					}
					
					$.ajax({
							url : "/sub_totalChart/genderPer",
               		    method : 'GET',
   			    		data: genderData,
   			    		beforeSend:function(){
   			    	 		pie_chart.data.datasets[0].data = [0];
   			    	 		pie_chart.update();
     	          		},
   			    		success :function(item){		
       			    		const genderTotal = [];
       			    		
       			    		for(var i = 0 in item){
       			    			 genderTotal.push(item[i].count);
       			    		}
       			    		pie_chart.data.datasets[0].data.pop();
       			    		pie_chart.data.datasets[0].data.pop();
       			    		pie_chart.data.datasets[0].data.push(genderTotal[0]);
       			    		pie_chart.data.datasets[0].data.push(genderTotal[1]);

         			    		
       			    		pie_chart.update();
       			    	}
                 	}) ;
					const Year3Epid = $("#year3InfDis > .mySelect > .selec").text();
					const	Year3EpidData = {
  							"Year3Epid" : Year3Epid,
  							"year" :year,
  							"region" : region
  					};
	    			$.ajax({
						url : "/sub_totalChart/Year3Epid",
	             		    method : 'GET',
	   			    	data: Year3EpidData,
	   			    	beforeSend:function(){
       			    		line_chart.data.datasets[0].data = [0];
       			    		line_chart.data.datasets[1].data = [0];
       			    		line_chart.data.datasets[2].data = [0];
       			    		line_chart.update();
     	          		},
	   			    	success :function(item){		
	   			    		var ic=1;
	   			    		var ic2=1;
	   			    		var ic3=1;
	   			    		
	   			    		const total1 = [];
	      					const total2 = [];
	      					const total3 = [];
	   			    		
	   			    		for (var i = 0 in item["lastYear"]){
	   			    			
	   			    			if(ic2 == item["lastYear"][i].month){
	          						total2.push(item["lastYear"][i].count);
	          						ic2++;
	          					}else{
	          						for(var a = ic2; a <= item["lastYear"][i].month; a++){
	          							if(ic2 == item["lastYear"][i].month){
	          								total2.push(item["lastYear"][i].count);
	          								ic2++;
	          								break;
	          							}
	          							total2.push(0);
	          							ic2++;	
	          						}
	          						
	          					}
	   			    		}
	   			    		
	   			    		
	   			    		for (var i = 0 in item["currentYear"]){
	   			    			if(ic == item["currentYear"][i].month){
	          						total1.push(item["currentYear"][i].count);
	          						ic++;
	          					}else{
	          						for(var a = ic; a <=item["currentYear"][i].month; a++){
	          							if(ic == item["currentYear"][i].month){
	          								total.push(item["currentYear"][i].count);
	          								ic++;
	          								break;
	          							}
	          							total1.push(0);
	          							ic++;	
	          						}
	          						
	          					}
	   			    		}
	   			    		
	   			    		for (var i = 0 in item["beforeLastYear"]){
	   			    			
	   			    			if(ic3 == item["beforeLastYear"][i].month){
	          						total3.push(item["beforeLastYear"][i].count);
	          						ic3++;
	          					}else{
	          						for(var a = ic3; a <= item["beforeLastYear"][i].month; a++){
	          							if(ic3 == item["beforeLastYear"][i].month){
	          								total2.push(item["beforeLastYear"][i].count);
	          								ic3++;
	          								break;
	          							}
	          							total2.push(0);
	          							ic3++;	
	          						}
	          						
	          					}
	   			    		
	   			    		}
	   			    		
	      					//inf year 값들
	      					const year1 = item["currentYear"][0].year;
	      					
	      					if(item["lastYear"][0] == undefined){
	      						const year2 = parseInt(year)-1;
		      					line_chart.data.datasets[1].label = year2
	      					}else{
	      						const year2 = item["lastYear"][0].year;
		      					line_chart.data.datasets[1].label = year2

	      					}
	      					
	      					if(item["beforeLastYear"][0] == undefined){
	      						const year3 = parseInt(year)-2;
		      					line_chart.data.datasets[0].label = year3
	      					}else{
	      						const year3 = item["beforeLastYear"][0].year;
		      					line_chart.data.datasets[0].label = year3
	      					}
	      					
	      					line_chart.data.datasets[2].label = year1
	      					line_chart.data.datasets[0].data = total3
	      					line_chart.data.datasets[1].data = total2
	      					line_chart.data.datasets[2].data = total1
	      					
	      					
	      					line_chart.update();
	   			    	}
	             	});  
            		  
					applyBtnCnt = 1; 
              })
              
          });
          </script>
          <script src="/resources/js/customSelect.js"></script>
  </body>
  <!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?idx=GTM-PRN7JTV"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
</html>