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
  <title>감염자수 기반 정보</title>
	<!-- css -->
    <link rel="stylesheet" href="/resources/css1/common1.css" />
    <link rel="stylesheet" href="/resources/css/style.css" />
    <link rel="stylesheet" href="/resources/css/customSelect.css">
    <!--  차트 -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6ca3631ca91c49471a26211d7ed34b0"></script>
     <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
     <!-- Google tag (gtag.js) -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-CZS29BSKP6"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'G-CZS29BSKP6');
	  
	</script>
    <style>
  	.hone{
  		width: 250px;
  		height: 250px;
  	}
	.chart{
		width: 720px;
		height: 1150px;
		margin: 0 auto;
		}
	.hbonut{
		width:250px;
		display: inline-block;
		margin-left: 20px;
		margin-right: 20px;
		position: relative;
		}
 	 
	</style>
	<script>
		$(function(){
			function displaySize() {
				if(window.innerWidth <= 1500){
					$('.hone').css("width","150px");
					$('.hone').css("height","150px");
				}else if(window.innerWidth > 1500 && window.innerWidth <= 1700 ){
					$('.hone').css("width","200px");
					$('.hone').css("height","200px");
				}else if(window.innerWidth > 1700){
					$('.hone').css("width","250px");
					$('.hone').css("height","250px");
				}
		       
			}
		 	displaySize();
	        window.addEventListener('resize', displaySize);
		})
	</script>
</head>
<!-- Google tag (gtag.js) -->
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

      <!-- '질병발병 통계맵>감염자수 기반정보' 내용 -->
      <div class="container">
        <div class="wrapper">
          <div class="contents">
            <div class="row mb-20">
              <div class="conbox">
                <!-- <ul class="breadcrumb flex mb-20">
                  <li>
                    <a href="/">
                      <img src="/resources/img/pj_1/icon_home.png" alt="홈으로 가기" />
                    </a>
                  </li>
                  <li>
                    <a href="/">질병 발병 통계맵</a>
                  </li>
                  <li>
                    <a href="/">감염자수 기반 정보</a>
                  </li>
                </ul> -->
                <div class="conbox__title-frame">
                  <h3 class="conbox__title-b">감염병 발생 현황</h3>
                </div>
              </div>
            </div>
             <div class="row mb-20">
              <div class="conbox">
                <div class="conbox__title-frame flex-both">
                  <h3 class="conbox__title">감염병 발생 순위 &nbsp;&nbsp;&nbsp;<span class="smallf">2023년 1월 통계</span>&nbsp;&nbsp;&nbsp;<span class="chul">{출처 : 감염병 누리집} </span><!--&nbsp;&nbsp;&nbsp;<button id="mov">!</button> --></h3>
<!--                   <div class="din">
		            <div><div class="gsc1"></div><p><span class="bold">보통</span> 이전 달 기준 감소 또는 보합</p></div>
		            <div><div class="jyc1"></div><p><span class="bold">관심</span> 이전 달 기준 10% 이상 증가</p></div>
		            <div><div class="ggc1"></div><p><span class="bold">주의</span> 이전 달 기준 30% ~ 50% 증가</p></div>
		            <div><div class="sgc1"></div><p><span class="bold">위험</span> 이전 달 기준 50% 이상 증가</p></div>
		          </div> -->
                  <div class="select-frame">
                    <div class="select-wrap sel-s-1">
                       <div id="region" class="myDiv">
	                         <select>
	                             <option class="regionAll">전국</option>
	                             <c:forEach var="key2" items="${key2}">
	                             	<option class="regionList">${key2.sinm}</option>
		                         </c:forEach>
	                         </select>
                     	</div>
                      <ul class="option__list" >
                        <li class="option__list-item" id="gunsu">
                          <button type="button">건수</button>
                        </li>
                        <li class="option__list-item" id="upt">
                          <button type="button">증가율</button>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="conbox__content flex-center over">
	                <c:forEach var="InDe" items="${InDe}" varStatus="status">
		                <div class="hbonut InDe" id="InDe">
<%-- 			                <canvas id="${InDe.infdnm}" class="hone"></canvas> --%>
							<p class="count numb">${status.count}</p>
<%-- 			               	<img alt="" src="/resources/img/pj_1/NS.png" class="ns" id="${InDe.infdisnm}"> --%>
			               	<p class="bm infn">${InDe.infdisnm}</p>
			               	<p class="bm infs">확진자 &nbsp;&nbsp;&nbsp;&nbsp;${InDe.sum} 명</p>
			               	<p class="bm">전월대비 &nbsp;&nbsp;&nbsp;&nbsp;( <c:if test="${InDe.total > 0}">
			               								<c:out value="+${InDe.total}"/>
			               						   </c:if>
			               						   <c:if test="${InDe.total <= 0}">
			               								<c:out value="${InDe.total}"/>
			               						   </c:if>
			               						   명)</p>
		                </div>
	                </c:forEach>
	                <div class="namug">
		                <table class="topa">
		                	<c:forEach var="UpDe" items="${UpDe}" varStatus="status1">
		                	
		                	<tr>
		                	<th class="count">${status1.count+3}</th>
		                		<td class="infntd">${UpDe.infdisnm}</td>
		                		<td class="padl">${UpDe.sum} 명 ( <c:if test="${UpDe.total > 0}">
		                								<c:out value="+${UpDe.total}"/>
				               						</c:if>
				               						<c:if test="${UpDe.total <= 0}">
				               							<c:out value="${UpDe.total}"/>
				               						</c:if>명)
				               	</td>
				            <tr>
		                	</c:forEach>
		                </table>
		             </div>
	              </div>
                </div>
              </div>
            </div>
            <div class="row flex">
              <div class="col w-50 mr-20">
                <div class="conbox">
                  <div class="conbox__title-frame flex-both bor-b">
                    <h3 class="conbox__title">감염자수 기반 정보</h3>
                    <div class="select-frame flex-end">
<%--                     	<div id="region" class="myDiv">
	                         <select>
	                             <option class="regionAll">전국</option>
	                             <c:forEach var="key2" items="${key2}">
	                             	<option class="regionList">${key2.sinm}</option>
		                         </c:forEach>
	                         </select>
                     	</div> --%>
                     	<div id="infDis" class="myDiv">
                        	<select>
                           		<option>전체</option>
                           		<c:forEach var="key1" items="${key1}">
                           			<option class="epidList">${key1.infdisnm}</option>
                        		</c:forEach>
                              </select>
                         </div>
                      <script>
						 	$(function(){
						 		const url = location.search;
						 		const a = new URLSearchParams(url);
						 		
						 		console.log(a.get('keyword2'));
						 		
						 		if(a.get('keyword2') != null && a.get('keyword2') != ""){
						 			$("#region > .mySelect > .selec").text(a.get('keyword2'));
						 		}else{
						 			$("#region > .mySelect > .selec").text('전국');
						 		}
						 		
						 		if(a.get('keyword1') != null && a.get('keyword1') != ""){
						 			$("#infDis > .mySelect > .selec").text(a.get('keyword1'));
						 		}else{
						 			$("#infDis > .mySelect > .selec").text('전체');
						 		}		
						 		//지역 선택시
						 		$("#region > .mySelect > ul").on("click", function(){
						 			const keyword2 = $("#region > .mySelect > .selec").text();
						 			if(keyword2 == "전국"){
						 				if(a.get('keyword1') != null && a.get('keyword1') != ""){
						 					const keyword1 = $("#infDis > .mySelect > .selec").text();
								 			location.href="?keyword1="+keyword1;
								 			
								 		}else{
								 			const keyword1 = "";
								 			location.href="/";
								 		}		
						 			}else{
						 				const keyword2 = $("#region > .mySelect > .selec").text();
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
                  <div class="conbox__sub-title-frame bor-b mb-20">
                    <h3 class="conbox__sub-title">
                      ${InfDis.get(0).year}년 ${InfDis.get(0).month}월
                      <span class="color-blue">지역별</span>
                      전염병 발생 건수
                    </h3>
                  </div>
                  <div class="conbox__content">
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
							
							 //맵에 좌표와 색깔 감염자수 값 넣기
							<c:forEach var="InfDis_dif" items="${InfDis_dif}">
							<c:if test="${InfDis_dif.difVal > 0}">
								positions.push({
									content:`<div class='cl' ><p style='top:13px; left:20%; right:20%; position: absolute;'>${InfDis_dif.curVal}</p></div>`,
									latlng: new kakao.maps.LatLng(${InfDis_dif.lat}, ${InfDis_dif.lng})
								});
						  	</c:if>
							<c:if test="${InfDis_dif.difVal == 0}">
								positions.push({
									content:`<div class='cl2' ><p style='top:13px; left:20%; right:20%; position: absolute;'>${InfDis_dif.curVal}</p></div>`,
									latlng: new kakao.maps.LatLng(${InfDis_dif.lat}, ${InfDis_dif.lng})
								});
							</c:if>
								
							<c:if test="${InfDis_dif.difVal < 0}">
								positions.push({
									content:`<div class='cl1' ><p style='top:13px; left:20%; right:20%; position: absolute;'>${InfDis_dif.curVal}</p></div>`,
									latlng: new kakao.maps.LatLng(${InfDis_dif.lat}, ${InfDis_dif.lng})
								});
							</c:if>
							</c:forEach>

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
							</script>
			            
				    	<div class="up">
				    		<div class="cl"></div>
				    		<p>전달 대비 감염자수 증가</p>
				    	</div>
				    	<div class="dw">
				        	<div class="cl1"></div>
				        	<p>전달 대비 감염자수 감소</p>
				    	</div>
				    	<div class="eq">
				        	<div class="cl2"></div>
				        	<p>전달 대비 감염자수 변함없음</p>	            	
				    	</div>
                  </div>
                </div>
              </div>
              <div class="col w-50">
                <div class="conbox">
                  <div class="conbox__title-frame flex-both bor-b mb-20">
                    <h3 class="conbox__title">
                      <!-- <span class="color-blue">
                      	<script>
	                      const url = location.search;
	 	              	  const a = new URLSearchParams(url);  	 
	 	              	  const TopInfEpid = a.get('keyword2') != null ? a.get('keyword2') : '전국';
	 	              	  var sinm = TopInfEpid;
	                      document.write(sinm)
                      </script></span> -->
                      감염병 발생 추이
                    </h3>
                    <div class="select-frame flex-end">
                      <div class="select-wrap sel-s-1">
                        <!-- <button type="button" class="btn-select">
                          인구별
                          <img
                            src="/resources/img/pj_1/icon_selectArrow.png"
                            alt="셀렉트 화살표"
                          />
                        </button>
                        <ul class="option__list">
                          <li class="option__list-item">
                            <button type="button">지역별</button>
                          </li>
                        </ul> -->
                        <div id="lastDaysList" class="myDiv">
	                    	<select>
	                    		<option class="handal">한달간 추이</option>
	                    		<option class="treey">과거 3년간 비교</option>
	                    	</select>  
	                    </div>
                      </div>
                    </div>
                  </div>
                  <div class="conbox__content">
                  	 <div class="chart">
						<canvas id="line-chart" width="800" height="450"></canvas>
						<canvas id="line-chart1Month"></canvas>
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
     <script type="text/javascript">
     //header, footer, modal include

     
     
     $(function(){	
		  const lastDays = $("#lastDaysList > .mySelect > .selec").text();
		  
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
     
    	//데이터 보내기 	
	   	$.ajax({
			url : "/Year3Epid",
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
   		
    	//sendData
/*     	const region = document.getElementById("localBtn").innerText;
		const infdis = document.getElementById("infdisListBtn").innerText; */
		//const lastDays = document.getElementById("lastdays").innerText;
    	
 	 		const sendData = {
 				"lastDays":lastDays/* ,
 				"region":region,
 				"infdis":infdis */
		  		}
    	
    	
    	//최근30일 감염자수 그래프
	   	$.ajax({
	    		url : "/InfDisChart",
	   		    method : 'GET',
	   		    data : sendData,
		   		beforeSend:function(){
		   			line_chart.data.datasets[0].data = [0];
		   			line_chart.update();
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
	    			line_chart.data.datasets[0].data = count;
	    			line_chart.data.labels=label;
	    			line_chart.update();
	    		}
  	  	});
    	
   	
     });
     
     </script>
  </body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-W7V6DZP"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
</html>