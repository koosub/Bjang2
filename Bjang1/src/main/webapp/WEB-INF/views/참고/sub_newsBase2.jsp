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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6ca3631ca91c49471a26211d7ed34b0"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <style type="text/css">
    	.mt{
    		line-height: 40px;
    	}
    	.cll{
    	border-radius: 40px;
    	 width: 80px;
    	 height:80px;
    	 background:white;
    	 color:black;
    	 margin:0 auto;
    	 text-align:center;
    	}
    	.low{
    	line-height: 20px;
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
              <li class="snb__subList-item active">
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

      <!-- '질병발병 통계맵>뉴스 기반정보' 내용 -->
      <div class="container tab1-2-con active">
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
                    <a href="#"> 질병 발병 통계맵 </a>
                  </li>
                  <li>
                    <a href="#"> 뉴스기반 정보 </a>
                  </li>
                </ul>
                <div class="conbox__title-frame">
                  <h3 class="conbox__title-b">질병 발병 통계 맵</h3>
                </div>
                <div class="conbox__content">
                  <p class="conbox__info-ment">
                    대한민국에서 발병한 질병 발병 통계를 지도를 사용하여 보여
                    줍니다.<br />
                    사용자는 한눈에 지역별 질병 발병 현황을 확인할 수
                    있습니다.<br />
                    사용자는 연도, 월, 지역, 그리고 병 이름을 선택하여 관심이
                    있는 질병 발병 통계 지도를 생성할 수 있습니다.
                  </p>
                </div>
              </div>
            </div>
            <div class="row flex">
              <div class="col w-50 mr-20">
                <div class="conbox">
                  <div class="conbox__title-frame flex-both bor-b">
                    <h3 class="conbox__title">뉴스 기반 정보</h3>
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
                            <li class="option__list-item epidList" id="${key1.keyword1}">
                                <button type="button">${key1.keyword1}</button>
                            </li>
                        </c:forEach>
                        </ul>
                          <script>
						 	$('#473').css("display", "none");
						 	$('#896').css("display", "none");
						 	$('#906').css("display", "none");
						 	$('#918').css("display", "none");
                          
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
							 			location.href="sub_newsBase?keyword1="+keyword1;
							 			
							 		}else{
							 			const keyword1 = "";
							 			location.href="sub_newsBase";
							 		}		
						 			
						 		});
						 		
						 		//지역 클릭시
						 		$(".regionList").on("click", function(){
						 			$(".regionBtn").text($(this).text());
						 			const keyword2 = document.getElementById("regionBtn").innerText;
						 			if(a.get('keyword1') != null && a.get('keyword1') != ""){
							 			const keyword1 = document.getElementById("epidBtn").innerText;	
							 			location.href="sub_newsBase?keyword1="+keyword1+"&&keyword2="+keyword2;
							 		}else{
							 			const keyword1 = "";
							 			location.href="sub_newsBase?keyword2="+keyword2;
							 		}		
						 			//$('.cll').css("display", "none");
						 			function closeOverlay() {
						 			    overlay.setMap(null);
						 			}
						 		});
						 		
						 		
						 		//병명 전체 클릭시
						 		$(".epdiAll").on("click", function(){
						 			if(a.get('keyword2') != null && a.get('keyword2') != ""){
							 			const keyword2 = document.getElementById("regionBtn").innerText;
							 			location.href="sub_newsBase?keyword2="+keyword2;
							 		}else{
							 			const keyword2 = "";
							 			location.href="sub_newsBase";
							 		}
						 		});
						 		
						 		//질병 클릭시
						 		$(".epidList").on("click", function(){
						 			$(".epidBtn").text($(this).text());
						 			
						 			const keyword1 = document.getElementById("epidBtn").innerText;
						 			if(a.get('keyword2') != null && a.get('keyword2') != ""){
							 			const keyword2 = document.getElementById("regionBtn").innerText;
							 			location.href="sub_newsBase?keyword1="+keyword1+"&&keyword2="+keyword2;
							 		}else{
							 			const keyword2 = "";
							 			location.href="sub_newsBase?keyword1="+keyword1;
							 		}
						 			
						 		});
						 		
						 	})
						</script> 
                      </div>
                    </div>
                  </div>
                  <div class="conbox__sub-title-frame bor-b mb-20">
                    <h3 class="conbox__sub-title">
                      2022년 11월 지역별 전염병 발생 건수
                    </h3>
                  </div>
                  <div class="conbox__content">
                  	<div class="conbox__content" style="position: relative; "  >
                     	<div class="boxcl" style="position:absolute; z-index: 2">
						    	<c:forEach var="sivo" items="${sivo}">
						    		<div id="${sivo.sicd}" class="ab ${sivo.keyword2}">
						        		<div class="cl" >
											<p style="top:13px; left:20%; right:20%; position: absolute; ">${sivo.count}</p>
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
                    		draggable: false, //감리 임시용 나중에 마커 or 그림그리는 것으로 바꿔서 위도경도 로 찍어줘야함
                    		click: false
                    	};
                    	var map = new kakao.maps.Map(container, options);
                    	<%--var customOverlay = []
                    		
                    	  var customOverlay = [
                    		{
                    			content: '<div class="cll" id="${sivo.get(8).keyword2}"><p class="mt">서울</p><p class="low">${sivo.get(8).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(37.8840, 126.9764), // 커스텀 오버레이를 표시할 좌표
                    		},{
                    			content: '<div class="cll" id="${sivo.get(1).keyword2}"><p class="mt">경기도</p><p class="low">${sivo.get(1).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(37.4355, 127.4854), // 커스텀 오버레이를 표시할 좌표
                    		},{
                    			content: '<div class="cll" id="${sivo.get(11).keyword2}"><p class="mt">인천</p><p class="low">${sivo.get(11).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(37.4022, 126.6432), // 커스텀 오버레이를 표시할 좌표
                    		},{
                    			content: '<div class="cll" id="${sivo.get(0).keyword2}"><p class="mt">강원도</p><p class="low">${sivo.get(0).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(37.4521, 128.656), // 커스텀 오버레이를 표시할 좌표
                    		},{
                    			content: '<div class="cll" id="${sivo.get(16).keyword2}"><p class="mt">충청북도</p><p class="low">${sivo.get(16).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(36.9047, 127.7521), // 커스텀 오버레이를 표시할 좌표
                    		},{
                    			content: '<div class="cll" id="${sivo.get(15).keyword2}"><p class="mt">충청남도</p><p class="low">${sivo.get(15).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(36.5852, 126.8095), // 커스텀 오버레이를 표시할 좌표
                    		},{
                    			content: '<div class="cll" id="${sivo.get(3).keyword2}"><p class="mt">경상북도</p><p class="low">${sivo.get(3).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(36.5096, 128.7025), // 커스텀 오버레이를 표시할 좌표
                    		},{
                    			content: '<div class="cll" id="${sivo.get(9).keyword2}"><p class="mt">세종</p><p class="low">${sivo.get(9).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(36.7005, 127.2891), // 커스텀 오버레이를 표시할 좌표
                    		},{
                    			content: '<div class="cll" id="${sivo.get(6).keyword2}"><p class="mt">대전</p><p class="low">${sivo.get(6).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(36.3459, 127.3735), // 커스텀 오버레이를 표시할 좌표
                    		},{
                    			content: '<div class="cll" id="${sivo.get(13).keyword2}"><p class="mt">전라북도</p><p class="low">${sivo.get(13).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(35.7522, 127.1204), // 커스텀 오버레이를 표시할 좌표
                    		},{
                    			content: '<div class="cll" id="${sivo.get(4).keyword2}"><p class="mt">광주</p><p class="low">${sivo.get(4).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(35.3559, 126.858), // 커스텀 오버레이를 표시할 좌표
                    		},{
                    			content: '<div class="cll" id="${sivo.get(12).keyword2}"><p class="mt">전라남도</p><p class="low">${sivo.get(12).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(35.079, 127.000), // 커스텀 오버레이를 표시할 좌표
                    		},{
                    			content: '<div class="cll" id="${sivo.get(2).keyword2}"><p class="mt">경상남도</p><p class="low">${sivo.get(2).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(35.4954, 128.2187), // 커스텀 오버레이를 표시할 좌표
                    		},{
                    			content: '<div class="cll" id="${sivo.get(5).keyword2}"><p class="mt">대구</p><p class="low">${sivo.get(5).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(35.8717, 128.6013), // 커스텀 오버레이를 표시할 좌표
                    		},{
                    			content: '<div class="cll" id="${sivo.get(10).keyword2}"><p class="mt">울산</p><p class="low">${sivo.get(10).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(35.7181, 129.3241), // 커스텀 오버레이를 표시할 좌표
                    		},{

                    			content: '<div class="cll" id="${sivo.get(7).keyword2}"><p class="mt">부산</p><p class="low">${sivo.get(7).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(35.3713, 129.100), // 커스텀 오버레이를 표시할 좌표
                    		},{
                    			content: '<div class="cll" id="${sivo.get(14).keyword2}"><p class="mt">제주</p><p class="low">${sivo.get(14).count}명</p></div>', 
                    			latlng: new kakao.maps.LatLng(33.650705, 126.570677), // 커스텀 오버레이를 표시할 좌표
                    		}
                    	]; 
                    	 
                     	for(var i = 0; i < customOverlay.length; i ++) {
		                	//  커스텀 오버레이를 생성합니다
		                	var overlay = new kakao.maps.CustomOverlay({
		                        map: map, // 마커를 표시할 지도
		                        content: customOverlay[i].content,
		                        position: customOverlay[i].latlng, // 마커의 위치
		                		xAnchor: 0.5, // 컨텐츠의 x 위치
		                		yAnchor: 0 // 컨텐츠의 y 위치
		                    });
		
		                	}					

                    	overlay.setMap(map);   --%>
                     	</script>
					</div>
                  </div>
                </div>
              </div>
              <div class="col w-50">
                <div class="conbox mb-20">
                  <div class="conbox__title-frame flex-both bor-b">
                    <h3 class="conbox__title">전염병 뉴스 (병명)</h3>
                  </div>
                  <div class="conbox__content">
                    <ul class="news__list mb-20">
                    
                    <c:forEach var="NCont" items="${NCont}">
                      <li class="news__list-item">
                        <a href="${NCont.url}">
                          ${NCont.content}
                        </a>
                      </li>
                    </c:forEach>
                      
                    </ul>
                    <div class="pagenation flex-center mb-10">
                      <a
                        href="#"
                        class="btn-pg-control go-first mr-4 flex-center"
                      >
                        <img
                          src="/resources/img/icon_go_front.png"
                          alt="첫번째 페이지로 이동"
                        />
                      </a>
                      <a
                        href="#"
                        class="btn-pg-control go-prev mr-10 flex-center"
                      >
                        <img
                          src="/resources/img/icon_go_prev.png"
                          alt="이전 페이지로 이동"
                        />
                      </a>
                      <ul class="flex">
                        <li class="active mr-8">
                          <a href="#">1</a>
                        </li>
                        <li class="mr-8">
                          <a href="#">2</a>
                        </li>
                        <li class="mr-8">
                          <a href="#">3</a>
                        </li>
                        <li class="mr-8">
                          <a href="#">4</a>
                        </li>
                        <li class="mr-10">
                          <a href="#">5</a>
                        </li>
                      </ul>
                      <a
                        href="#"
                        class="btn-pg-control go-next mr-4 flex-center"
                      >
                        <img
                          src="/resources/img/icon_go_next.png"
                          alt="다음 페이지로 이동"
                        />
                      </a>
                      <a href="#" class="btn-pg-control go-last flex-center">
                        <img
                          src="/resources/img/icon_go_tail.png"
                          alt="마지막 페이지로 이동"
                        />
                      </a>
                    </div>
                  </div>
                </div>
                <div class="conbox">
                  <div class="conbox__title-frame flex-both bor-b mb-20">
                    <h3 class="conbox__title">
                      지역 전염병 뉴스 (지역명/병명)
                    </h3>
                  </div>
                  <div class="conbox__content">
                    <ul class="news__list mb-20">
                      <c:forEach var="NSCont" items="${NSCont}">
                      <li class="news__list-item">
                        <a href="${NSCont.url}">
                          ${NSCont.content}
                        </a>
                      </li>
                    </c:forEach>
                    </ul>
                    <div class="pagenation flex-center mb-10">
                      <a
                        href="#"
                        class="btn-pg-control go-first mr-4 flex-center"
                      >
                        <img
                          src="/resources/img/icon_go_front.png"
                          alt="첫번째 페이지로 이동"
                        />
                      </a>
                      <a
                        href="#"
                        class="btn-pg-control go-prev mr-10 flex-center"
                      >
                        <img
                          src="/resources/img/icon_go_prev.png"
                          alt="이전 페이지로 이동"
                        />
                      </a>
                      <ul class="flex">
                        <li class="active mr-8">
                          <a href="#">1</a>
                        </li>
                        <li class="mr-8">
                          <a href="#">2</a>
                        </li>
                        <li class="mr-8">
                          <a href="#">3</a>
                        </li>
                        <li class="mr-8">
                          <a href="#">4</a>
                        </li>
                        <li class="mr-10">
                          <a href="#">5</a>
                        </li>
                      </ul>
                      <a
                        href="#"
                        class="btn-pg-control go-next mr-4 flex-center"
                      >
                        <img
                          src="/resources/img/icon_go_next.png"
                          alt="다음 페이지로 이동"
                        />
                      </a>
                      <a href="#" class="btn-pg-control go-last flex-center">
                        <img
                          src="/resources/img/icon_go_tail.png"
                          alt="마지막 페이지로 이동"
                        />
                      </a>
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
  <!-- <script type="text/javascript">
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
	</script> -->
</html>