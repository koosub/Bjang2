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
  <title>뉴스기반 정보</title>
  
<!-- css -->
     <link rel="stylesheet" href="/resources/css1/common1.css" />
    <link rel="stylesheet" href="/resources/css/style.css" />
    <link rel="stylesheet" href="/resources/css/customSelect.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6ca3631ca91c49471a26211d7ed34b0"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
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
          <li class="snb__list-item active">
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
              <a href="/gis" target="_blank"> GIS기반 인구이동 활용 서비스 </a>
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
                    <a href="/">
                      <img src="/resources/img/pj_1/icon_home.png" alt="홈으로 가기" />
                    </a>
                  </li>
                  <li>
                    <a href="/"> 질병 발병 통계맵 </a>
                  </li>
                  <li>
                    <a href="/sub_newsBase"> 뉴스기반 정보 </a>
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
                      <div id="region" class="myDiv">
	                         <select>
	                             <option class="regionAll">전국</option>
	                             <c:forEach var="key2" items="${key2}">
	                             	<option id="InfSA" class="regionList">${key2.sinm}</option>
		                         </c:forEach>
	                         </select>
                     	</div>
                     	<div id="infDis" class="myDiv">
                        	<select>
                           		<option>전체</option>
                           		<c:forEach var="key1" items="${key1}">
                           			<option id="InfNA" class="epidList">${key1.infdisnm}</option>
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
                  <div class="conbox__content">
                  <div class="conbox__content" style="position: relative; "  >
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
							positions.push({
								content: `<div class='cl2' ><p style='top:13px; left:20%; right:20%; position: absolute;'>${InfDis.count}</p></div>`,
								latlng : new kakao.maps.LatLng(${InfDis.lat}, ${InfDis.lng})
							});
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
                     </div>
                  </div>
                </div>
              </div>
              <div class="col w-50">
                <div class="conbox mb-20">
                  <div class="conbox__title-frame flex-both bor-b">
                    <h3 class="conbox__title infdisnm">전염병 뉴스 (병명)</h3>
                  </div>
                  <div class="conbox__content">
                    <ul class="news__list mb-20 NpageContentList">
                    
                    <c:forEach var="NCont" items="${NCont}">
                      <li class="news__list-item">
                        <a href="${NCont.url}" target='_blank'>
                          <c:out value="${NCont.content}" escapeXml="false"/>
                        </a>
                      </li>
                    </c:forEach>
                      
                    </ul>
                    <div class="pagenation flex-center mb-10">
                      <a
                        href="#"
                        class="btn-pg-control go-first mr-4 flex-center NpageFirst"
                      >
                        <img
                          src="/resources/img/pj_1/icon_go_front.png"
                          alt="첫번째 페이지로 이동"
                        />
                      </a>
                      <a
                        href="#"
                        class="btn-pg-control go-prev mr-10 flex-center NpagePrev"
                      >
                        <img
                          src="/resources/img/pj_1/icon_go_prev.png"
                          alt="이전 페이지로 이동"
                        />
                      </a>
                      <ul class="flex NpageList">
                      	<c:forEach var="list" items="${list}">
                      		<li class="mr-8 Npage${list}">
                          		<a href="#">${list}</a>
                        	</li>
                      	</c:forEach>
                      </ul>
                      <a
                        href="#"
                        class="btn-pg-control go-next mr-4 flex-center NpageNext"
                      >
                        <img
                          src="/resources/img/pj_1/icon_go_next.png"
                          alt="다음 페이지로 이동"
                        />
                      </a>
                      <a href="#" class="btn-pg-control go-last flex-center NpageLast">
                        <img
                          src="/resources/img/pj_1/icon_go_tail.png"
                          alt="마지막 페이지로 이동"
                        />
                      </a>
                    </div>
                  </div>
                </div>
                <div class="conbox">
                  <div class="conbox__title-frame flex-both bor-b mb-20">
                    <h3 class="conbox__title infdisRegionnm">
                      	지역별 뉴스 (지역명/병명)
                    </h3>
                  </div>
                  <div class="conbox__content">
                    <ul class="news__list mb-20">
                      <c:forEach var="NSCont" items="${NSCont}">
                      <li class="news__list-item">
                        <a href="${NSCont.url}" class="infnews" target='_blank'>
                          ${NSCont.content}
                        </a>
                      </li>
                    </c:forEach>
                    </ul>
                    
                    <div class="pagenation flex-center mb-10">
                      <a
                        href="#"
                        class="btn-pg-control go-first mr-4 flex-center NSpageFirst" 
                      >
                        <img
                          src="/resources/img/pj_1/icon_go_front.png"
                          alt="첫번째 페이지로 이동"
                        />
                      </a>
                      <a
                        href="#"
                        class="btn-pg-control go-prev mr-10 flex-center NSpagePrev"
                      >
                        <img
                          src="/resources/img/pj_1/icon_go_prev.png"
                          alt="이전 페이지로 이동"
                        />
                      </a>
                      <ul class="flex NSpageList">
                        <c:forEach var="list" items="${NSlist}">
                      		<li class="mr-8 NSpage${list}">
                          		<a href="#">${list}</a>
                        	</li>
                      	</c:forEach>
                      </ul>
                      <a
                        href="#"
                        class="btn-pg-control go-next mr-4 flex-center NSpageNext"
                      >
                        <img
                          src="/resources/img/pj_1/icon_go_next.png"
                          alt="다음 페이지로 이동"
                        />
                      </a>
                      <a href="#" class="btn-pg-control go-last flex-center NSpageLast">
                        <img
                          src="/resources/img/pj_1/icon_go_tail.png"
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
    <script>
    /* $("#region > .mySelect > ul").on("click",function(){
    				  
            		  const region = $("#region > .mySelect > .selec").text();
      		  		  const infdis = $("#infDis > .mySelect > .selec").text();
      		  		
      		  		  const sendData = {
      		  				  "keyword1": region,
      		  				  "keyword2" : infdis
      		  		  }

  	  $.ajax({
  		url : "/sub_newsBase/NewsInf",
		    method : 'GET',
		 	data:sendData,
   		beforeSend:function(){
   			$(".infnews").text('로딩중입니다');
   		},
		success :function(item){
			for(var i = 0 in item)
			$(".infnews").text(item[i].content);
		}
  	  }); */
    
	 	$(function(){
	 		const url = location.search;
	 		const a = new URLSearchParams(url);
	 

	 		// 전염병 뉴스 (병명) 페이지네이션
	 		if(a.get('Npage') != null){
	 			$(".NpageList > li").removeClass('active');
	 			$(".Npage"+a.get('Npage')).addClass('active');
	 		}else{
	 			$(".NpageList > li").removeClass('active');
	 			$('.NpageList > li').first().addClass('active');		
	 		} 
	 		
	 		$(".NpageList > li > a").on("click",function(){
	 			const keyword1 = a.get('keyword1') != null ? "&&keyword1="+a.get('keyword1'): ''; 	
	 			const keyword2 = a.get('keyword2') != null ? "&&keyword2="+a.get('keyword2'): '';
	 			const NSpage = a.get('NSpage') != null ? "&&NSpage="+a.get('NSpage'): '';
	 			
	 			$(".NpageList > li").removeAttr('id'); 
	 			$(this).attr('id','clickNpage');
	 			const Npage = document.getElementById("clickNpage").innerText;
	 			console.log(Npage);
	 			
	 			if(a.get('keyword2') != null && a.get('keyword2') != "" || a.get('keyword1') != null && a.get('keyword1') != "" || a.get('NSpage') != null && a.get('NSpage') != ""){
		 			location.href="sub_newsBase?"+keyword1+keyword2+"&&Npage="+Npage+NSpage;
		 		}else{
		 			location.href="sub_newsBase?Npage="+Npage;
		 		}
	 		});
	 		
	 		$(".NpageNext").on("click", function(){
	 			const keyword1 = a.get('keyword1') != null ? "&&keyword1="+a.get('keyword1'): ''; 	
	 			const keyword2 = a.get('keyword2') != null ? "&&keyword2="+a.get('keyword2'): '';
	 			const NSpage = a.get('NSpage') != null ? "&&NSpage="+a.get('NSpage'): '';
	 			
	 			
	 			if(a.get('keyword2') != null && a.get('keyword2') != "" || a.get('keyword1') != null && a.get('keyword1') != "" || a.get('NSpage') != null && a.get('NSpage') != ""){
	 				location.href="sub_newsBase?"+keyword1+keyword2+"&&Npage="+${next}+NSpage;
		 		}else{
		 			location.href="sub_newsBase?Npage="+${next};
		 		}
	 		});
	 		
	 		$(".NpagePrev").on("click", function(){
	 			const keyword1 = a.get('keyword1') != null ? "&&keyword1="+a.get('keyword1'): ''; 	
	 			const keyword2 = a.get('keyword2') != null ? "&&keyword2="+a.get('keyword2'): '';
	 			const NSpage = a.get('NSpage') != null ? "&&NSpage="+a.get('NSpage'): '';
	 			
	 			if(a.get('keyword2') != null && a.get('keyword2') != "" || a.get('keyword1') != null && a.get('keyword1') != "" || a.get('NSpage') != null && a.get('NSpage') != ""){
	 				location.href="sub_newsBase?"+keyword1+keyword2+"&&Npage="+${prev}+NSpage;
		 		}else{
		 			location.href="sub_newsBase?Npage="+${prev};
		 		}
	 		});
	 		
	 		$(".NpageLast").on("click", function(){
	 			const keyword1 = a.get('keyword1') != null ? "&&keyword1="+a.get('keyword1'): ''; 	
	 			const keyword2 = a.get('keyword2') != null ? "&&keyword2="+a.get('keyword2'): '';
	 			const NSpage = a.get('NSpage') != null ? "&&NSpage="+a.get('NSpage'): '';
	 			
	 			if(a.get('keyword2') != null && a.get('keyword2') != "" || a.get('keyword1') != null && a.get('keyword1') != "" || a.get('NSpage') != null && a.get('NSpage') != ""){
	 				location.href="sub_newsBase?"+keyword1+keyword2+"&&Npage="+${last}+NSpage;
		 		}else{
		 			location.href="sub_newsBase?Npage="+${last};
		 		}
	 		});
	 		
	 		$(".NpageFirst").on("click", function(){
	 			const keyword1 = a.get('keyword1') != null ? "&&keyword1="+a.get('keyword1'): ''; 	
	 			const keyword2 = a.get('keyword2') != null ? "&&keyword2="+a.get('keyword2'): '';
	 			const NSpage = a.get('NSpage') != null ? "&&NSpage="+a.get('NSpage'): '';
	 			
	 			if(a.get('keyword2') != null && a.get('keyword2') != "" || a.get('keyword1') != null && a.get('keyword1') != "" || a.get('NSpage') != null && a.get('NSpage') != ""){
	 				location.href="sub_newsBase?"+keyword1+keyword2+"&&Npage="+1+NSpage;
		 		}else{
		 			location.href="sub_newsBase?Npage="+1;
		 		}
	 		});
	 		
	 		
	 		
	 		//지역 전염병뉴스(지역명/병명) 페이지네이션 부분
	 		 if(a.get('NSpage') != null){
	 			$(".NSpageList > li").removeClass('active');
	 			$(".NSpage"+a.get('NSpage')).addClass('active');
	 		}else{
	 			$(".NSpageList > li").removeClass('active');
	 			$('.NSpageList > li').first().addClass('active');		
	 		} 
	 		
	 		
	 		$(".NSpageList > li > a").on("click",function(){
	 			const keyword1 = a.get('keyword1') != null ? "&&keyword1="+a.get('keyword1'): ''; 	
	 			const keyword2 = a.get('keyword2') != null ? "&&keyword2="+a.get('keyword2'): '';
	 			const Npage = a.get('Npage') != null ? "&&Npage="+a.get('Npage'): '';
	 			
	 			$(".NSpageList > li").removeAttr('id'); 
	 			$(this).attr('id','clickNSpage');
	 			const NSpage = document.getElementById("clickNSpage").innerText;
	 			
	 			
	 			if(a.get('keyword2') != null && a.get('keyword2') != "" || a.get('keyword1') != null && a.get('keyword1') != "" || a.get('Npage') != null && a.get('Npage') != ""){
		 			location.href="sub_newsBase?"+keyword1+keyword2+Npage+"&&NSpage="+NSpage;
		 		}else{
		 			location.href="sub_newsBase?NSpage="+NSpage;
		 		}
	 		});
	 		
	 		$(".NSpageNext").on("click", function(){
	 			const keyword1 = a.get('keyword1') != null ? "&&keyword1="+a.get('keyword1'): ''; 	
	 			const keyword2 = a.get('keyword2') != null ? "&&keyword2="+a.get('keyword2'): '';
	 			const Npage = a.get('Npage') != null ? "&&Npage="+a.get('Npage'): '';
	 			
	 			if(a.get('keyword2') != null && a.get('keyword2') != "" || a.get('keyword1') != null && a.get('keyword1') != "" || a.get('Npage') != null && a.get('Npage') != ""){
		 			location.href="sub_newsBase?"+keyword1+keyword2+Npage+"&&NSpage="+${NSnext};
		 		}else{
		 			location.href="sub_newsBase?NSpage="+${NSnext};
		 		}
	 		});
	 		
	 		$(".NSpagePrev").on("click", function(){
	 			const keyword1 = a.get('keyword1') != null ? "&&keyword1="+a.get('keyword1'): ''; 	
	 			const keyword2 = a.get('keyword2') != null ? "&&keyword2="+a.get('keyword2'): '';
	 			const Npage = a.get('Npage') != null ? "&&Npage="+a.get('Npage'): '';
	 			
	 			if(a.get('keyword2') != null && a.get('keyword2') != "" || a.get('keyword1') != null && a.get('keyword1') != "" || a.get('Npage') != null && a.get('Npage') != ""){
		 			location.href="sub_newsBase?"+keyword1+keyword2+Npage+"&&NSpage="+${NSprev};
		 		}else{
		 			location.href="sub_newsBase?NSpage="+${NSprev};
		 		}
	 		});
	 		
	 		$(".NSpageLast").on("click", function(){
	 			const keyword1 = a.get('keyword1') != null ? "&&keyword1="+a.get('keyword1'): ''; 	
	 			const keyword2 = a.get('keyword2') != null ? "&&keyword2="+a.get('keyword2'): '';
				const Npage = a.get('Npage') != null ? "&&Npage="+a.get('Npage'): '';
	 			
	 			if(a.get('keyword2') != null && a.get('keyword2') != "" || a.get('keyword1') != null && a.get('keyword1') != "" || a.get('Npage') != null && a.get('Npage') != ""){
		 			location.href="sub_newsBase?"+keyword1+keyword2+Npage+"&&NSpage="+${NSlast};
		 		}else{
		 			location.href="sub_newsBase?NSpage="+${NSlast};
		 		}
	 		});
	 		
	 		$(".NSpageFirst").on("click", function(){
	 			const keyword1 = a.get('keyword1') != null ? "&&keyword1="+a.get('keyword1'): ''; 	
	 			const keyword2 = a.get('keyword2') != null ? "&&keyword2="+a.get('keyword2'): '';
				const Npage = a.get('Npage') != null ? "&&Npage="+a.get('Npage'): '';
	 			
	 			if(a.get('keyword2') != null && a.get('keyword2') != "" || a.get('keyword1') != null && a.get('keyword1') != "" || a.get('Npage') != null && a.get('Npage') != ""){
		 			location.href="sub_newsBase?"+keyword1+keyword2+Npage+"&&NSpage="+1;
		 		}else{
		 			location.href="sub_newsBase?NSpage="+1;
		 		}
	 		});
	 		
	 		
	 		if(a.get('keyword2') != null && a.get('keyword2') != "" && a.get('keyword1') != null && a.get('keyword1') != ""){
	 			$(".infdisRegionnm").text("지역별 뉴스("+a.get('keyword2')+"/"+ a.get('keyword1')+")");
	 			$(".infdisnm").text("전염병 뉴스("+a.get('keyword1')+")");
	 		}else if(a.get('keyword2') != null && a.get('keyword2') != ""){
	 			$(".infdisRegionnm").text("지역별 뉴스("+a.get('keyword2')+"/병명)")
	 		}else if(a.get('keyword1') != null && a.get('keyword1') != ""){
	 			$(".infdisnm").text("전염병 뉴스("+a.get('keyword1')+")");
	 			$(".infdisRegionnm").text("지역별 뉴스(전국/"+a.get('keyword1')+")");
	 		}else{
	 			$(".infdisRegionnm").text("지역별 뉴스(전국/병명)");
	 			$(".infdisnm").text("전염병 뉴스(병명)");
	 		}
	 		
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
			 			location.href="sub_newsBase?keyword1="+keyword1;
			 			
			 		}else{
			 			const keyword1 = "";
			 			location.href="sub_newsBase";
			 		}		
	 			}else{
	 				const keyword2 = $("#region > .mySelect > .selec").text();
	 				if(a.get('keyword1') != null && a.get('keyword1') != ""){
	 					const keyword1 = $("#infDis > .mySelect > .selec").text();	
			 			location.href="sub_newsBase?keyword1="+keyword1+"&&keyword2="+keyword2;
			 		}else{
			 			const keyword1 = "";
			 			location.href="sub_newsBase?keyword2="+keyword2;
			 		}	
	 			}
	 			
	 		});
	 		
	 		//질병 선택시
	 		$("#infDis > .mySelect > ul").on("click", function(){
	 			const keyword1 = $("#infDis > .mySelect > .selec").text();
	 			if(keyword1 =="전체"){
	 				if(a.get('keyword2') != null && a.get('keyword2') != ""){
		 				const keyword2 = $("#region > .mySelect > .selec").text();
			 			location.href="sub_newsBase?keyword2="+keyword2;
			 		}else{
			 			const keyword2 = "";
			 			location.href="sub_newsBase";
			 		}
	 			}else{
		 			const keyword1 = $("#infDis > .mySelect > .selec").text();
		 			if(a.get('keyword2') != null && a.get('keyword2') != ""){
			 			const keyword2 = $("#region > .mySelect > .selec").text();
			 			location.href="sub_newsBase?keyword1="+keyword1+"&&keyword2="+keyword2;
			 		}else{
			 			const keyword2 = "";
			 			location.href="sub_newsBase?keyword1="+keyword1;
			 		}
	 			}
	 			
	 			
	 		});
	 		
	 	})
	</script> 
    <!-- script -->
    <script src="/resources/js/jquery-1.11.1.min.js"></script>
    <script src="/resources/js/script.js"></script>
    <script src="/resources/js/customSelect.js"></script>
  </body>
  <!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PRN7JTV"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
</html>