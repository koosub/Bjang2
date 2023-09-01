<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-PRN7JTV');</script>
<!-- End Google Tag Manager -->

<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">  
  <title>감염병 발생 현황 | 감염병 빅데이터 혁신서비스</title>  
  <meta name="author" content="(주)데이터스트림즈">
  <meta name="keywords" content="감염병 정보, 해외여행 감염병 정보, 코로나19, 코로나, GIS 기반, 감염병 위기관리, 감염병 통계, 감염병 빅데이터">
  <meta name="description" content="감염병 빅데이터 혁신서비스는 감염병에 대한 정보를 종합적으로 제공합니다.">
  <meta name="twitter:title" content="감염병 빅데이터 혁신서비스">
  <meta name="twitter:description" content="감염병 빅데이터 혁신서비스는 감염병에 대한 정보를 종합적으로 제공합니다.">
  <meta name="twitter:image" content="/resources/images/sns_present.jpg">
  <meta property="og:title" content="감염병 빅데이터 혁신서비스">
  <meta property="og:description" content="감염병 빅데이터 혁신서비스는 감염병에 대한 정보를 종합적으로 제공합니다.">
  <meta property="og:url" content="https://service-covid.kr/">
  <meta property="og:type" content="website">
  <meta property="og:image" content="/resources/images/sns_present.jpg"">
  <link rel="shortcut icon" href="/resources/images/favicon.png">
  <link rel="stylesheet" href="/resources/css/common.css">
  <link rel="stylesheet" href="/resources/css/swiper-bundle.min.css">
  <script src="/resources/js/jquery-3.4.1.min.js"></script>
  <script src="/resources/js/common.js"></script>
  <script src="/resources/js/swiper-bundle.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6ca3631ca91c49471a26211d7ed34b0"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
</head>
<script type="text/javascript">
//gnb current menu
let currentPageDepth1 = 0;
let currentPageDepth2 = 1;
</script>
<style>
.overr{
	width:150px;
 	text-align:center;
}
.cl{
		width: 49px;
		height: 48px;
		font-size: 11px;
		border-radius: 30px;
		background: rgb(255,86,112);
		color: white;
		font-weight: 500;
		text-align: center;
		position: relative;
}
.cl1{
		width: 49px;
		height: 48px;
		font-size: 11px;
		border-radius: 30px;
		background: rgb(51,183,195);
		color: white;
		font-weight: 500;
		text-align: center;
		position: relative;
}
.cl2{
		width: 49px;
		height: 48px;
		font-size: 11px;
		border-radius: 30px;
		background: rgb(107, 105, 105);
		color: white;
		font-weight: 500;
		text-align: center;
}


</style>

<script async src="https://www.googletagmanager.com/gtag/js?id=G-9FEQBG71R3"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-9FEQBG71R3');
</script>
<body class="bg-gray">

   <!-- header include -->
   <%@ include file="/WEB-INF/views/include/header.jsp" %>

  <main class="IBE-content IBE-content02">  
    <div class="inner">
      <!-- gnb depth02 -->
      <div class="gnb-depth02-wrap">
        <ul class="gnb-depth02">
          <li>
            <a href="/">감염병 발생 현황</a>
          </li>
          <li class="on">
            <a href="/info-lookup">감염병 정보 조회</a>
          </li>
        </ul>
        <div class="gnb-depth02-right">
          <button class="btn-stats-modal btn-gray">통계정보 안내</button>
        </div>
      </div>
      <!-- //gnb depth02 -->
    </div>
    <!-- 감염병 선택 -->
    <div class="sticky-search02" id="stickySearch02">
      <div class="inner">
        <div class="sec-tit">
          <div>
            <h2>감염병 선택</h2>
            <input type="hidden" value="${infdisnm}" id="infdisnm">
          </div>
          <div class="select-filter">
            <div class="select-box">
              <select class="form-select form-select-S" id="inf_grade">
              	<option value="전체">전체 감염병</option>
                <option value="1">1급</option>
                <option value="2">2급</option>
                <option value="3">3급</option>
              </select>
            </div>
            <div class="select-box">
              <select class="form-select form-select-B" id="grade_inf">
                <option value="">전체</option>
              </select>
            </div>
            <div>
              <button class="btn-gray-rect" id="inquery">조회</button>
            </div>
            <script type="text/javascript">
            $('#inf_grade').change(function(){
                var grade = $('#inf_grade option:selected').val();

                $.ajax({
    	    		url : "/grade_inf",
    	   		    method : 'POST',
    	   		    data : {'grade': grade},
    	    		success :function(item){
    	    			$('#grade_inf').children('option:not(:first)').remove();
    	    			
    	    			for(var i in item){
    	    				for(var i2 in item[i]){
    	    					var infdisnm = item[i][i2].infdisnm;
    	    					var infdisid = item[i][i2].infdisid;
    	    					$('#grade_inf').append('<option value="'+infdisid+'">'+infdisnm+'</option>')
    	    				}
    	    			}
    	    		}
      	  		});
            })
            $(function(){
            	var grade = $('#inf_grade option:selected').val();
            	$.ajax({
    	    		url : "/grade_inf",
    	   		    method : 'POST',
    	   		    data : {'grade': grade},
    	    		success :function(item){
    	    			$('#grade_inf').children('option:not(:first)').remove();
    	    			for(var i in item){
    	    				for(var i2 in item[i]){
    	    					var infdisnm = item[i][i2].infdisnm;
    	    					var infdisid = item[i][i2].infdisid;
    	    					$('#grade_inf').append('<option value="'+infdisid+'">'+infdisnm+'</option>')
    	    				}
    	    			}
    	    		}
      	  		});
       	 	});
           
          var infdisnm = $('#infdisnm').val();
          if(infdisnm == ''){
        	  infdisnm = "전체"
          }
          //뉴스 출력
            $.ajax({
       			url : "/news_content",
       		    method : 'GET',
       		 	data: {"infdisnm": infdisnm},
          			success :function(item){
          				for(var i in item){
           				for(var i2 in item[i]){
       						$('#news').prepend('<div class="swiper-slide"><a href="'+item[i][i2].url+'" target="_blank"><div class="news-box"><div class="news-desc">'+item[i][i2].content+'</div></div></a></div>');
           				}
           			}
          			}
           	});
           
           
           //뉴스 출력
           $('#inquery').on('click', function(){
           	var infdisnm = $('#grade_inf option:selected').text();
           	$('#news').empty();
            	$.ajax({
       			url : "/news_content",
       		    method : 'GET',
       		 	data: {"infdisnm": infdisnm},
          			success :function(item){
          				for(var i in item){
           				for(var i2 in item[i]){
       						$('#news').prepend('<div class="swiper-slide"><a href="'+item[i][i2].url+'" target="_blank"><div class="news-box"><div class="news-desc">'+item[i][i2].content+'</div></div></a></div>');
           				}
           			}
          			}
           	});
           });
            </script>                
          </div>
        </div>    
      </div>
    </div>      
    <section class="sec-infect-search">
      <div class="inner">
        <div class="infect-tit-box">
          <p class="infect-tit ani_fadeinup ani_step02" id="title">카바페넴내성장내세균속균종(CRE) 감염증</p>
          <p class="infect-tit-desc ani_fadeinup ani_step04" id="definition">
            카바페넴계 항생제에 내성을 나타내는 장내세균속균종<br> ※ 카바페넴계 항생제에 대한 내성은 주로 카바페넴분해효소생성 항생제의 유출 및 세포막의 투과성 감소 등에 의해 나타남 카바페넴계 항생제에 대한 내성은 주로 카바페넴분해효소생성 항생제의 유출 및 세포막의 투과성 감소 등에 의해 나타남
          </p>
        </div>
      </div>
    </section>
    <!-- //감염병 선택 -->
    <div class="inner ani_fadeinup ani_step05">
      <!-- 주요 증상 -->
      <section class="sec-symptom">
        <h3 class="h3-tit">주요 증상</h3>
        <div class="symptom-box view-full">
          <div class="symptom-desc" id="symptom">
            주로 요로감염을 일으키며 위장관염, 폐렴 및 패혈증 등 다양한 감염증 유발합니다.
          </div>
<!--      <div class="view-more">
            <span class="btn-more btn-full">펼치기</span>
            <span class="btn-more btn-part">접기</span>
          </div> -->
        </div>
      </section>
      <!-- //주요 증상 -->
      <!-- 감염병 뉴스 -->
      <section class="sec-news">
        <div class="sec-news-tit">
          <h2>감염병 뉴스</h2>
        </div>
        <div class="news-slide-wrap">
          <div class="swiper news-slide">
            <div class="swiper-wrapper" id="news">
              
            </div>
          </div>
          <div class="news-pagination"></div>
          <div class="news-button-prev"></div>
          <div class="news-button-next"></div>
        </div>
      </section>
      <!-- //감염병 뉴스 -->
      <!-- 감염병 관련 정보 -->
      <section class="sec-infect-info">
        <h3 class="h3-tit">감염병 관련 정보</h3>
        <div class="infect-info-box" id="relevant">
	    <div class="infect-info-row">
            <p class="infect-info-num">            
              <span>Q 01</span>
            </p>
            <div class="infect-info-desc">
              <p class="tit">카바페넴내성장내세균속균종(CRE)은 무엇인가요?</p>
              <p class="desc">카바페넴내성장내세균속균종(CRE)은 카바페넴계열 학생제에 내성을 가지고 있는 장내세균속균종을 말합니다. 장내세균속균종은 사람의 장에서 정상적으로 존재하는데, 요로나 혈류 등 다른 부위로 유입되어 요로감염, 혈류감염, 상처감염 및 폐렴과 같은 심각한 감염을 일으킬 수 있습니다. 카바페넴은 심각한 감염을 치료하기 위한 항생제이나 내성을 획득한 세균에 대해서는 효과적이지 못합니다. 따라서 카바페넴내성장내세균속균종(CRE)은 공중보건에 새로운 위협요인이 되고 있습니다.</p>
            </div>
          </div>
          <div class="infect-info-row">
            <p class="infect-info-num">
              <span>Q 02</span>
            </p>
            <div class="infect-info-desc">
              <p class="tit">카바페넴내성장내세균속균종(CRE)은 어떻게 전파되나요?</p>
              <p class="desc">카바페넴내성장내세균속균종(CRE)은 카바페넴계열 학생제에 내성을 가지고 있는 장내세균속균종을 말합니다. 장내세균속균종은 사람의 장에서 정상적으로 존재하는데, 요로나 혈류 등 다른 부위로 유입되어 요로감염, 혈류감염, 상처감염 및 폐렴과 같은 심각한 감염을 일으킬 수 있습니다. 카바페넴은 심각한 감염을 치료하기 위한 항생제이나 내성을 획득한 세균에 대해서는 효과적이지 못합니다.</p>
            </div>
          </div>
          <div class="infect-info-row">
            <p class="infect-info-num">
              <span>Q 100</span>
            </p>
            <div class="infect-info-desc">
              <p class="tit">카바페넴내성장내세균속균종(CRE)에 감염되었을 때 치료해야 하나요?</p>
              <p class="desc">카바페넴내성장내세균속균종(CRE)은 카바페넴계열 학생제에 내성을 가지고 있는 장내세균속균종을 말합니다. 장내세균속균종은 사람의 장에서 정상적으로 존재하는데, 요로나 혈류 등 다른 부위로 유입되어 요로감염, 혈류감염, 상처감염 및 폐렴과 같은 심각한 감염을 일으킬 수 있습니다. 카바페넴은 심각한 감염을 치료하기 위한 항생제이나 내성을 획득한 세균에 대해서는 효과적이지 못합니다. 따라서 카바페넴내성장내세균속균종(CRE)은 공중보건에 새로운 위협요인이 되고 있습니다.</p>
            </div>
          </div>
          <div class="infect-info-row">
            <p class="infect-info-num">            
              <span>Q 03</span>
            </p>
            <div class="infect-info-desc">
              <p class="tit">카바페넴내성장내세균속균종(CRE)에 감염되었을 때 치료해야 하나요?</p>
              <p class="desc">카바페넴내성장내세균속균종(CRE)은 카바페넴계열 학생제에 내성을 가지고 있는 장내세균속균종을 말합니다. 장내세균속균종은 사람의 장에서 정상적으로 존재하는데, 요로나 혈류 등 다른 부위로 유입되어 요로감염, 혈류감염, 상처감염 및 폐렴과 같은 심각한 감염을 일으킬 수 있습니다. 카바페넴은 심각한 감염을 치료하기 위한 항생제이나 내성을 획득한 세균에 대해서는 효과적이지 못합니다. 따라서 카바페넴내성장내세균속균종(CRE)은 공중보건에 새로운 위협요인이 되고 있습니다.</p>
            </div>
          </div>
          <div class="infect-info-row">
            <p class="infect-info-num">            
              <span>Q 04</span>
            </p>
            <div class="infect-info-desc">
              <p class="tit">카바페넴내성장내세균속균종(CRE)에 감염되었을 때 치료해야 하나요?</p>
              <p class="desc">카바페넴내성장내세균속균종(CRE)은 카바페넴계열 학생제에 내성을 가지고 있는 장내세균속균종을 말합니다. 장내세균속균종은 사람의 장에서 정상적으로 존재하는데, 요로나 혈류 등 다른 부위로 유입되어 요로감염, 혈류감염, 상처감염 및 폐렴과 같은 심각한 감염을 일으킬 수 있습니다. 카바페넴은 심각한 감염을 치료하기 위한 항생제이나 내성을 획득한 세균에 대해서는 효과적이지 못합니다. 따라서 카바페넴내성장내세균속균종(CRE)은 공중보건에 새로운 위협요인이 되고 있습니다.</p>
            </div>
          </div>
          <div class="infect-info-row">
            <p class="infect-info-num">
              <span>Q 05</span>
            </p>
            <div class="infect-info-desc">
              <p class="tit">카바페넴내성장내세균속균종(CRE)에 감염되었을 때 치료해야 하나요?</p>
              <p class="desc">카바페넴내성장내세균속균종(CRE)은 카바페넴계열 학생제에 내성을 가지고 있는 장내세균속균종을 말합니다. 장내세균속균종은 사람의 장에서 정상적으로 존재하는데, 요로나 혈류 등 다른 부위로 유입되어 요로감염, 혈류감염, 상처감염 및 폐렴과 같은 심각한 감염을 일으킬 수 있습니다. 카바페넴은 심각한 감염을 치료하기 위한 항생제이나 내성을 획득한 세균에 대해서는 효과적이지 못합니다. 따라서 카바페넴내성장내세균속균종(CRE)은 공중보건에 새로운 위협요인이 되고 있습니다.</p>
            </div>
          </div>
        </div>
      </section>
      <!-- //감염병 관련 정보 -->
      <!-- 지역과 시기 선택 -->
      <section class="sec-region-search">
        <div class="sec-tit02">
          <div>
            <h2>지역과 시기 선택</h2>
          </div>
          <div class="select-filter">
            <div class="select-box">
              <select class="form-select form-select-M" id="sicd">
                <option value="전국">전국</option>
                <option value="11">서울특별시</option>
                <option value="26">부산광역시</option>
                <option value="27">대구광역시</option>
                <option value="28">인천광역시</option>
                <option value="29">광주광역시</option>
                <option value="30">대전광역시</option>
                <option value="31">울산광역시</option>
                <option value="36">세종특별자치시</option>
                <option value="41">경기도</option>
                <option value="42">강원도</option>
                <option value="43">충청북도</option>
                <option value="44">충청남도</option>
                <option value="45">전라북도</option>
                <option value="46">전라남도</option>
                <option value="47">경상북도</option>
                <option value="48">경상남도</option>
                <option value="50">제주특별자치도</option>
              </select>
            </div>            
            <div class="select-box">
              <select class="form-select form-select-T" id="year">
                <option value="2023">2023년</option>
                <option value="2022">2022년</option>
                <option value="2021">2021년</option>
                <option value="2020">2020년</option>
                <option value="2019">2019년</option>
              </select>
            </div>     
            <div class="select-box">
              <select class="form-select form-select-T" id="month">
                <option value="01">1월</option>
                <option value="02">2월</option>
                <option value="03">3월</option>
                <option value="04">4월</option>
                <option value="05">5월</option>
                <option value="06">6월</option>
                <option value="07">7월</option>
                <option value="08">8월</option>
                <option value="09">9월</option>
                <option value="10">10월</option>
                <option value="11">11월</option>
                <option value="12">12월</option>
              </select>
            </div>   
            <div>
              <button class="btn-gray-rect" id="sinm">조회</button>
            </div>                  
          </div>
        </div>  
        <ul class="infect-info-list">
          <li>
            <span class="info-li-icon">
              <img src="/resources/images/img_calendar.png" alt="">
              <lottie-player class="lottie-circle" src="/resources/images/circle.json"  speed="1"  style="width: 252px; height: 252px;"  loop autoplay></lottie-player>
            </span>
            <p class="info-li-tit">연간 확진자수</p>
            <p class="info-li-cont" id="year_count"></p>
          </li>
          <li>
            <span class="info-li-icon">
              <img src="/resources/images/img_shield.png" alt="">
              <lottie-player class="lottie-circle" src="/resources/images/circle.json"  speed="1"  style="width: 252px; height: 252px;"  loop autoplay></lottie-player>
            </span>
            <p class="info-li-tit">월간 확진자수</p>
            <p class="info-li-cont" id="month_count">123,100</p>
          </li>
          <li>
            <span class="info-li-icon">
              <img src="/resources/images/img_ranking.png" alt="">
              <lottie-player class="lottie-circle" src="/resources/images/circle.json"  speed="1"  style="width: 252px; height: 252px;"  loop autoplay></lottie-player>
            </span>
            <p class="info-li-tit">전월 대비 증감</p>
            <p class="info-li-cont" id="jg2">증가</p>
            <p class="info-li-detail" id="jg">+ 12,000명</p>
          </li>
          <li>
            <span class="info-li-icon">
              <img src="/resources/images/img_people.png" alt="">
              <lottie-player class="lottie-circle" src="/resources/images/circle.json"  speed="1"  style="width: 252px; height: 252px;"  loop autoplay></lottie-player>
            </span>
            <p class="info-li-tit">최다 발생 연령대</p>
            <p class="info-li-cont" id="age_max">10~19</p>
          </li>
          <li>
            <span class="info-li-icon">
              <img src="/resources/images/img_map.png" alt="">
              <lottie-player class="lottie-circle" src="/resources/images/circle.json"  speed="1"  style="width: 252px; height: 252px;"  loop autoplay></lottie-player>
            </span>
            <p class="info-li-tit">최다 발생 지역</p>
            <p class="info-li-cont" id="sicd_max">세종특별자치시</p>
          </li>
          <li>
            <span class="info-li-icon">
              <img src="/resources/images/img_alarm.png" alt="">
              <lottie-player class="lottie-circle" src="/resources/images/circle.json"  speed="1"  style="width: 252px; height: 252px;"  loop autoplay></lottie-player>
            </span>
            <p class="info-li-tit">위험도</p>
            <p class="info-li-cont" id="botong">보통</p>
            <p class="info-li-detail" id="danger">24.77%</p>
          </li>
        </ul>  
        <div class="stats-wrap">
          <div class="stats-left">
            <!-- 감염병 발생 추이 chart 영역 -->
            <div class="stats_box stats-box01">
              <div class="h3-tit-row">
                <h3 class="h3-tit">감염병 발생 추이</h3>
                <div class="select-box">
                  <select class="form-select form-select-M" id="month_year">
                    <option value="">한달간 추이</option>
                    <option value="">과거 3년간 비교</option>
                  </select>
                </div>                
              </div>
              <div class="chart-wrap">
                <canvas id="chartInfectionTrend" width="606" height="205"></canvas>
                <canvas id="chartInfectionYears" width="606" height="205" style="display:none;"></canvas>
              </div>
            </div>
            <!-- //감염병 발생 추이 chart 영역 -->
            <!-- 연령별 감염자수 chart 영역 -->
            <div class="stats_box stats-box02">
              <div class="h3-tit-row">
                <h3 class="h3-tit">연령별 감염자수</h3>
              </div>
              <div class="chart-wrap">
                <canvas id="chartIndexAge" width="606" height="210"></canvas>
              </div>
            </div>
            <!-- //연령별 감염자수 chart 영역 -->
            <!-- 성별 감염자수 chart -->
            <div class="stats_box stats-box03">
              <h3 class="h3-tit">성별 감염자수</h3>
              <div class="chart-wrap">
                <canvas id="chartInfectionGender" width="182" height="182"></canvas>
              </div>
              <div class="gender-color">
                <span class="man">남성</span>
                <span class="woman">여성</span>
              </div>
            </div>
            <!-- //성별 감염자수 chart -->
          </div>
          <div class="stats-right">
            <div class="h3-tit-row">
              <h3 class="h3-tit">전국 감염병 현황</h3>
              <div class="select-box">
                <select class="select-map-type form-select form-select-M" id="count_danger">
                  <option value="type01">발생건수 보기</option>
                  <option value="type02">위험도 보기</option>
                </select>
              </div>               
            </div>
            <!-- select : 발생 건수 보기 선택할 경우 -->
            <div class="map-color-info" id="mapOccurNum">
              <span>전달 대비 감염자수</span>
              <span class="color-txt pink">증가</span>
              <span class="color-txt green">감소</span>
              <span class="color-txt gray">변화 없음</span>
            </div>
            <!-- //select : 발생 건수 보기 선택할 경우 -->
            <!-- select : 위험도 보기 선택할 경우 -->
            <div class="map-color-info" id="mapRiskDegree">
              <span>
                위험도 지수
                <span class="btn-risk-modal">i</span>
              </span>
              <span class="color-txt brown">위험</span>
              <span class="color-txt red">주의</span>
              <span class="color-txt yellow">보통</span>
            </div>            
            <!-- //select : 위험도 보기 선택할 경우 -->
            <div class="map-wrap">
              <!-- 지도 영역 -->
              <div id="map" style="width:100%;height:805px;position:relative;"></div>
              <!-- 지도 영역 -->
              <div id="map2" style="width:100%;height:805px;position:relative;"></div>
              <!-- //지도 영역 -->
               <script type="text/javascript">
              
              $('#count_danger').on("change", function(){
            	  var a = this.value;
            	  if(a == 'type01'){
            		  $('#map').show();
            		  $('#map2').hide();
            	  }else if(a == 'type02'){
            		  $('#map').hide();
            		  $('#map2').show();
            	  }
              });
              
              var infdisnm = $('#grade_inf option:selected').text();
              var positions = [];
              $.ajax({
  				url : "/infdis_map",
  				    method : 'GET',
  				 	data: {"infdisnm": infdisnm, "sinm": ""},
  		   			success :function(item){
  		   				for(var i in item){
  		    				for(var i2 in item[i]){
  		    					if(item[i][i2].difVal > 0){
  		    						var curVal = item[i][i2].curVal;
  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  		    					positions.push({
										content:`<div class='cl' ><p style='top:17px; left:20%; right:20%; position: absolute;'>`+curVal+`</p></div>`,
										latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng)
									});
  		    					} else if(item[i][i2].difVal == 0){
  		    						var curVal = item[i][i2].curVal;
  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  		    						positions.push({
										content:`<div class='cl2' ><p style='top:17px; left:20%; right:20%; position: absolute;'>`+curVal+`</p></div>`,
										latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng)
									});
  		    					} else if(item[i][i2].difVal < 0){
  		    						var curVal = item[i][i2].curVal;
  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  		    						positions.push({
										content:`<div class='cl1' ><p style='top:17px; left:20%; right:20%; position: absolute;'>`+curVal+`</p></div>`,
										latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng)
									});
  		    					}
  		    				}
  		    			}
	  		   			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
						var options = { //지도를 생성할 때 필요한 기본 옵션
							center: new kakao.maps.LatLng(36.5140736, 127.7994855), //지도의 중심좌표.
							level: 12,//지도의 레벨(확대, 축소 정도)
							//draggable: false //감리 임시용 나중에 마커 or 그림그리는 것으로 바꿔서 위도경도 로 찍어줘야함
						};
						var map = new kakao.maps.Map(container, options);			
						
						
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
  		   			}
  	    	});
              $('#inquery').on('click', function(){
	              var infdisnm = $('#grade_inf option:selected').text();
	              var positions = [];
	              $.ajax({
	  				url : "/infdis_map",
	  				    method : 'GET',
	  				 	data: {"infdisnm": infdisnm, "sinm": ""},
	  		   			success :function(item){
	  		   				
	  		   				for(var i in item){
	  		    				for(var i2 in item[i]){
	  		    					if(item[i][i2].difVal > 0){
	  		    						var curVal = item[i][i2].curVal;
	  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		  		    					positions.push({
											content:`<div class='cl' ><p style='top:17px; left:20%; right:20%; position: absolute;'>`+curVal+`</p></div>`,
											latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng)
										});
	  		    					} else if(item[i][i2].difVal == 0){
	  		    						var curVal = item[i][i2].curVal;
	  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  		    						positions.push({
											content:`<div class='cl2' ><p style='top:17px; left:20%; right:20%; position: absolute;'>`+curVal+`</p></div>`,
											latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng)
										});
	  		    					} else if(item[i][i2].difVal < 0){
	  		    						var curVal = item[i][i2].curVal;
	  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  		    						positions.push({
											content:`<div class='cl1' ><p style='top:17px; left:20%; right:20%; position: absolute;'>`+curVal+`</p></div>`,
											latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng)
										});
	  		    					}
	  		    				}
	  		    			}
		  		   			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
							var options = { //지도를 생성할 때 필요한 기본 옵션
								center: new kakao.maps.LatLng(36.5140736, 127.7994855), //지도의 중심좌표.
								level: 12,//지도의 레벨(확대, 축소 정도)
								//draggable: false //감리 임시용 나중에 마커 or 그림그리는 것으로 바꿔서 위도경도 로 찍어줘야함
							};
							var map = new kakao.maps.Map(container, options);			
							
							
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
	  		   			}
	  	    	});
              });
				</script>
              <script type="text/javascript">
              var infdisnm = $('#grade_inf option:selected').text();
              var positions = [];
              $.ajax({
  				url : "/infdis_map",
  				    method : 'GET',
  				 	data: {"infdisnm": infdisnm, "sinm": ""},
  		   			success :function(item){
								var container = document.getElementById('map2'); //지도를 담을 영역의 DOM 레퍼런스
								var options = { //지도를 생성할 때 필요한 기본 옵션
									center: new kakao.maps.LatLng(36.5140736, 127.7994855), //지도의 중심좌표.
									level: 12,//지도의 레벨(확대, 축소 정도)
									//draggable: false //감리 임시용 나중에 마커 or 그림그리는 것으로 바꿔서 위도경도 로 찍어줘야함
								};
								var map = new kakao.maps.Map(container, options);			
								
								 // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
				
								 var positions = [];
								 var choi = [];//최초값
								 var difval = [];//증감량
								 var gam = [];//증감률
								 for(var i in item){
			  		    				for(var i2 in item[i]){
		  		    						choi.push(item[i][i2].curVal+item[i][i2].difVal);
		  		    						difval.push(item[i][i2].difVal);
		  		    						
			  		    					if(difval[i2] <= 0){
			  		    						gam.push(0);
			  		    					}
			  		    					else if(difval[i2] > 0 && choi.push == 0){
			  		    						gam.push(difval[i2]/1*100);	
			  		    					}
			  		    					else{
			  		    						gam.push(difval[i2]/choi[i2]*100);
			  		    					}
			  		    					if(gam[i2] >= 30){
			  		    						var curVal = item[i][i2].curVal;
			  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
												 positions.push({
													 content:'<div class="overr">'+item[i][i2].sinm+'<br/>'+curVal+'</div>',
													 latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng),
													 img:'/resources/images/위험.png'
												 });
			  		    					} else if(gam[i2] >= 20){
			  		    						var curVal = item[i][i2].curVal;
			  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
													 positions.push({
														 content:'<div class="overr">'+item[i][i2].sinm+'<br/>'+curVal+'</div>',
														 latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng),
														 img:'/resources/images/주의.png'
													 });
			  		    					} else if(gam[i2] <= 10){
			  		    						var curVal = item[i][i2].curVal;
			  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
													 positions.push({
														 content:'<div class="overr">'+item[i][i2].sinm+'<br/>'+curVal+'</div>',
														 latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng),
														 img:'/resources/images/보통.png'
													 });
			  		    					}
			  		    				}
								 }
								 
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
  		   			}
              });
              $('#inquery').on('click', function(){
	              var infdisnm = $('#grade_inf option:selected').text();
	              var positions = [];
	              $.ajax({
	  				url : "/infdis_map",
	  				    method : 'GET',
	  				 	data: {"infdisnm": infdisnm, "sinm": ""},
	  		   			success :function(item){
									var container = document.getElementById('map2'); //지도를 담을 영역의 DOM 레퍼런스
									var options = { //지도를 생성할 때 필요한 기본 옵션
										center: new kakao.maps.LatLng(36.5140736, 127.7994855), //지도의 중심좌표.
										level: 12,//지도의 레벨(확대, 축소 정도)
										//draggable: false //감리 임시용 나중에 마커 or 그림그리는 것으로 바꿔서 위도경도 로 찍어줘야함
									};
									var map = new kakao.maps.Map(container, options);			
									
									 // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
									 var choi = [];
									 var difval = [];
									 var gam = [];
									 var positions = [];										 
									 for(var i in item){
				  		    				for(var i2 in item[i]){
			  		    						choi.push(item[i][i2].curVal+item[i][i2].difVal);
			  		    						difval.push(item[i][i2].difVal);
			  		    						
				  		    					if(difval[i2] <= 0){
				  		    						gam.push(0);
				  		    					}
				  		    					else if(difval[i2] > 0 && choi.push == 0){
				  		    						gam.push(difval[i2]/1*100);	
				  		    					}
				  		    					else{
				  		    						gam.push(difval[i2]/choi[i2]*100);
				  		    					}
				  		    					if(gam[i2] >= 30){
				  		    						var curVal = item[i][i2].curVal;
				  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
													 positions.push({
														 content:'<div class="overr">'+item[i][i2].sinm+'<br/>'+curVal+'</div>',
														 latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng),
														 img:'/resources/images/위험.png'
													 });
				  		    					} else if(gam[i2] >= 20){
				  		    						var curVal = item[i][i2].curVal;
				  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
														 positions.push({
															 content:'<div class="overr">'+item[i][i2].sinm+'<br/>'+curVal+'</div>',
															 latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng),
															 img:'/resources/images/주의.png'
														 });
				  		    					} else if(gam[i2] <= 10){
				  		    						var curVal = item[i][i2].curVal;
				  		    						curVal = curVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
														 positions.push({
															 content:'<div class="overr">'+item[i][i2].sinm+'<br/>'+curVal+'</div>',
															 latlng: new kakao.maps.LatLng(item[i][i2].lat, item[i][i2].lng),
															 img:'/resources/images/보통.png'
														 });
				  		    					}
				  		    				}
									 }
									 
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
		  		   			}
		              });
              });
				</script>
            </div>
          </div>
        </div>     
        <div class="stats-wrap02">
          <h3 class="h3-tit">위험도 정보</h3>
          <div class="stats-flex-row">
            <div>
              <div class="h4-tit-row">
                <h4 class="h4-tit">감염자수 · 검색트렌드 · 뉴스언급횟수</h4>
                <div class="tab-menu-slide">
                  <p class="selected">절대</p>
                  <p>상대</p>
                  <p class="tab-menu-bg"></p>
                </div>
              </div>
              <div class="tab-chart">
                <div class="tab-chart01">
                  <!-- 감염자수 · 검색트렌드 · 뉴스언급횟수, 절대 기준 chart -->
                  <div class="stats-box04">
                    <div class="chart-wrap">
                      <canvas id="chartCombine01" width="606" height="262"></canvas>
                    </div>                
                  </div>
                  <!-- //감염자수 · 검색트렌드 · 뉴스언급횟수, 절대 기준 chart -->
                </div>
                <div class="tab-chart02">
                  <!-- 감염자수 · 검색트렌드 · 뉴스언급횟수, 상대 기준 chart -->
                  <div class="stats-box04">
                    <div class="chart-wrap">
                      <canvas id="chartCombine02" width="606" height="262"></canvas>
                    </div>                
                  </div>
                  <!-- //감염자수 · 검색트렌드 · 뉴스언급횟수, 상대 기준 chart -->                    
                </div>
              </div>
              <div class="data-info-box">
                <p>데이터 출처</p>
                <ul>
                  <li>· 감염자수 : 감염병 누리집</li>
                  <li>· 검색 트렌드 : 네이버 데이터랩 검색 트렌드</li>
                  <li>· 뉴스언급횟수 : 크롤링된 뉴스에서 각 감염병명 합산</li>
                </ul>
              </div>
            </div>
            <div>
              <div class="h4-tit-row">
                <h4 class="h4-tit">감염자 수와 Risk 추이</h4>
              </div>
              <div class="stats-box04">
                <div class="chart-wrap">
                  <canvas id="chartCombine03" width="606" height="262"></canvas>
                </div>                
              </div>              
              <div class="data-info-box">
                <p>데이터 출처</p>
                <ul>
                  <li>· 감염자수 : 감염병 누리집</li>
                  <li>· RISK 수치 : 위험도 지수 산출식을 통한 지표
                    <span class="btn-risk-modal">i</span>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>           
      </section>
      <!-- //지역과 시기 선택 -->
    </div>
  </main>

  <!-- footer include -->
  <%@ include file="/WEB-INF/views/include/footer.jsp" %> 
  <!-- modal include -->
  <%@ include file="/WEB-INF/views/include/modal.jsp" %>

  <script>
    //3년간 비교 그래프 한달간 추이 보여주기
      $('#month_year').on('change', function(){
      	var text = $('#month_year option:selected').text();
      	if(text == '한달간 추이'){
      		$('#chartInfectionTrend').css('display','');
      		$('#chartInfectionYears').css('display','none');
      	}
      	else if(text == '과거 3년간 비교'){
      		$('#chartInfectionTrend').css('display', 'none');
      		$('#chartInfectionYears').css('display', '');
      	}
      })
      
      
      
      
    //검색 section sticky 
    const stickyElement = document.getElementById("stickySearch02");
    window.addEventListener("scroll", checkStickyState);

    function checkStickyState() {
      let elementTop = stickyElement.getBoundingClientRect().top;
      let parentTop = stickyElement.parentElement.getBoundingClientRect().top;

      if (elementTop <= 80) { 
        $('.sticky-search02').addClass('fixed');
      } else {
        $('.sticky-search02').removeClass('fixed');
      }
    }    

    //주요증상 펼쳐보기
    $('.view-more').click(function() {
      $('.symptom-box').toggleClass('view-full')
    })
	var infdisnm = $('#grade_inf option:selected').text();
    //감염병 발생 추이 chart
    //한달간 데이터
    var month_chart;
    $('#inquery').on('click', function(){
    	const month_count = [];
	    var infdisid = $('#grade_inf option:selected').val();
	    var infdisnm = $('#grade_inf option:selected').text();
	    if(infdisnm == '코로나바이러스감염증-19'){
	    	$.ajax({
				url : "/covid_date",
				    method : 'GET',
				 	data: {},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					month_count.push(item[i][i2].count);
		    				}
		    			}
	   					month_chart.data.datasets[0].data = month_count;
	   					month_chart.data.datasets[0].label = infdisnm;
		   				month_chart.update();
		   			}
	    	});
	    }else if(infdisnm == '전체'){
	        const sum = [];
	        var covid_date = [];
			$.ajax({
					url : "/covid_date",
					    method : 'GET',
					 	data: {},
			   			success :function(item){
			   				for(var i in item){
			    				for(var i2 in item[i]){
			    					covid_date.push(item[i][i2].count);
			    				}
			    				
			    			}
			   			}
		    	});
	        
		    $.ajax({
				url : "/one_month_inf",
				    method : 'GET',
				 	data: {"infdisid": infdisid},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					month_count.push(item[i][i2].count);
		    				}
		    			}
		   				for(var i = 0; i < month_count1.length; i++){	   					
		   					var test = month_count[i];
		   					var test2 = covid_date[i];
		   					var ssum  = parseInt(test) + parseInt(test2);
		   					sum.push(ssum);
		   				}
	   					month_chart.data.datasets[0].data = sum;
	   					month_chart.data.datasets[0].label = infdisnm;
		   				month_chart.update();
		   			}
	    	});
	    }
		else {
		    $.ajax({
				url : "/one_month_inf",
				    method : 'GET',
				 	data: {"infdisid": infdisid},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					month_count.push(item[i][i2].count);
		    				}
		    			}
	   					month_chart.data.datasets[0].data = month_count;
	   					month_chart.data.datasets[0].label = infdisnm;
		   				month_chart.update();
		   			}
	    	});
	    }
    })
    var covid_date = [];
	$.ajax({
			url : "/covid_date",
			    method : 'GET',
			 	data: {},
	   			success :function(item){
	   				for(var i in item){
	    				for(var i2 in item[i]){
	    					covid_date.push(item[i][i2].count);
	    				}
	    				
	    			}
	   			}
    	});
    //감염병 발생 추이 chart
    const month_count1 = [];
    const date = [];
    const sum = [];

    var infdisid = $('#grade_inf option:selected').val();
	    $.ajax({
			url : "/one_month_inf",
			    method : 'GET',
			 	data: {"infdisid": infdisid},
	   			success :function(item){
	   				for(var i in item){
	    				for(var i2 in item[i]){
	    					month_count1.push(item[i][i2].count);
	    					date.push(item[i][i2].date);
	    				}
	    			}
	   				for(var i = 0; i < month_count1.length; i++){	   					
	   					var test = month_count1[i];
	   					var test2 = covid_date[i];
	   					var ssum  = parseInt(test) + parseInt(test2);
	   					sum.push(ssum);
	   				}
	   				
	    				month_chart.data.datasets[0].data = sum;
	    				
	    				month_chart.data.labels = date;
		   				month_chart.update();
	   			}
	    });
	   				const IBEChart1 = document.getElementById('chartInfectionTrend');
	   			    month_chart = new Chart(IBEChart1, {
	   			      type: 'line',
	   			      data: {
	   			        labels: date,
	   			        datasets: [{
	   			          label: infdisnm,
	   			          data: month_count1,
	   			          fill: false,
	   			          borderColor: '#3F80E5',
	   			          borderWidth: 2,
	   			          tension: 0
	   			        }]
	   			      },
	   			      options: {
	   			        scales: {
	   			          y: {
	   			            min: 0,  
	   			            ticks: {
	   			              stepSize: 100,
	   			              color: '#9092A2' 
	   			            }
	   			          },
	   			          x: {
	   			            ticks: {
	   			              color: '#9092A2' 
	   			            }            
	   			          }
	   			        },
	   			        plugins: {
	   			          // label이 보여지기 원하는 경우 true 로 바꿔주세요
	   			          legend: {
	   			            display: false
	   			          }
	   			        }
	   			      }
	   			    });
	    
	    //과거 3년간 감염자수 그래프
	   $('#inquery').on('click', function(){
	    	const Years_count = [];
	    	const Years_count1 = [];
	    	const Years_count2 = [];
	    	const Years = [];
	    	const Years1 = [];
	    	const Years2 = [];
	    	const month_data = [];
		    var infdisid = $('#grade_inf option:selected').val();
		    var infdisnm = $('#grade_inf option:selected').text();
		    $.ajax({
				url : "/Year_inf",
				    method : 'GET',
				 	data: {"infdisid": infdisid},
		   			success :function(item){
		   				for(var i in item.Years_inf){
		   					Years_count.push(item.Years_inf[i].count);
		   					year_chart.data.datasets[0].data = Years_count;
		   				}
		   				for(var i in item.Years_inf1){
		   					Years_count1.push(item.Years_inf1[i].count);
		   					month_data.push(item.Years_inf1[i].month);
		   					year_chart.data.datasets[1].data = Years_count1;
		   					year_chart.data.labels = month_data;
		   				}
		   				for(var i in item.Years_inf2){
		   					Years_count2.push(item.Years_inf2[i].count);
		   					year_chart.data.datasets[2].data = Years_count2;
		   				}
		   				for(var i = 0; i < 1; i++){		   					
		   					Years.push(item.Years_inf[i].year);
			   				Years1.push(item.Years_inf1[i].year);
		   					Years2.push(item.Years_inf2[i].year);
		   				}
	   					
		   				year_chart.data.datasets[0].label = Years;
		   				year_chart.data.datasets[1].label = Years1;
		   				year_chart.data.datasets[2].label = Years2;
		   				year_chart.update();
		   			}
	    	});
	    })
	    
	    var year_chart
	    const Years_count = [];
    	const Years_count1 = [];
    	const Years_count2 = [];
    	const month_data = [];
    	const Years = [];
    	const Years1 = [];
    	const Years2 = [];
	    var infdisid = $('#grade_inf option:selected').val();
	    var infdisnm = $('#grade_inf option:selected').text();
	    
	    $.ajax({
			url : "/Year_inf",
			    method : 'GET',
			 	data: {"infdisid": infdisid},
	   			success :function(item){
	   				for(var i in item.Years_inf){
	   					Years_count.push(item.Years_inf[i].count);
	   				}
	   				for(var i in item.Years_inf1){
	   					Years_count1.push(item.Years_inf1[i].count);
	   					month_data.push(item.Years_inf1[i].month);	
	   				}
	   				for(var i in item.Years_inf2){
	   					Years_count2.push(item.Years_inf2[i].count);
	   				}
	   				for(var i = 0; i < 1; i++){		   					
	   					Years.push(item.Years_inf[i].year);
		   				Years1.push(item.Years_inf1[i].year);
	   					Years2.push(item.Years_inf2[i].year);
	   				}

	   	const IBEChart7 = document.getElementById('chartInfectionYears');  
	   			    year_chart = new Chart(IBEChart7, {
	   			      type: 'line',
	   			      data: {
	   			        labels: month_data,
	   			        datasets: [
	   			          {
	   			            label: Years,
	   			            data: Years_count,
	   			            backgroundColor: '#ffffff',
	   			            borderColor: '#8BD047',
	   			            borderWidth: 2,
	   			            tension: 0.4,
	   			          },
	   			          {
	   			            label: Years1,
	   			            data: Years_count1,
	   			            backgroundColor: '#ffffff',
	   			            borderColor: '#3F80E5',
	   			            borderWidth: 2,
	   			            tension: 0.4,
	   			          },
	   			          {
	   			            label: Years2,
	   			            data: Years_count2,
	   			            backgroundColor: '#ffffff',
	   			            borderColor: '#BA39EA',
	   			            borderWidth: 2,
	   			            tension: 0.4
	   			          }
	   			        ]
	   			      },
	   			      options: {
	   			        scales: {
	   			          x: {
	   			            ticks: {
	   			              color: '#9092A2' 
	   			            }            
	   			          },          
	   			          y: {
	   			            min: 0, 
	   			            ticks: {
	   			              stepSize: 100,
	   			              color: '#9092A2' 
	   			            }
	   			          }
	   			        },
	   			        plugins: {
	   			          legend: {
	   			            position: 'bottom',
	   			            labels: {
	   			              font: {
	   			                size: 14
	   			              },
	   			              color: '#646674',
	   			              padding: 22,
	   			              boxWidth: 11,
	   			              boxHeight: 11,
	   			              usePointStyle: true,
	   			              pointStyle: 'circle',
	   			            }
	   			          }
	   			        }        
	   			      }
	   			    });
	   			}
    	});
	    

	    var age_chart
	    
	    $('#inquery').on('click', function(){
	    	const age_count = [];
		    var infdisid = $('#grade_inf option:selected').val();
		    var infdisnm = $('#grade_inf option:selected').text();
		    const covid_age = [];
		    const sum4 = [];
		    if(infdisnm == '전체'){
			    $.ajax({
					url : "/covid_age",
					    method : 'GET',
					 	data: {},
			   			success :function(item){
			   				for(var i in item){
			    				for(var i2 in item[i]){
			    					covid_age.push(item[i][i2].count);
			    				}
			    			}
		
			   			}
				});
		    	$.ajax({
		    		url : "/age_inf",
		    		    method : 'GET',
		    		 	data: {"infdisid": infdisid},
		       			success :function(item){
		       				for(var i in item){
		        				for(var i2 in item[i]){
		        					age_count.push(item[i][i2].count);
		    						var a = age_count[i2];
		    						var b = covid_age[i2];
		    						var c = parseInt(a) + parseInt(b);
		    						sum3.push(c);
		        				}
		    					age_chart.data.datasets[0].data = sum3;
		    					age_chart.data.datasets[0].label = infdisnm;
		    					
		        				age_chart.update();
		        			}
		       			}
		        });
		    } else if(infdisnm == '코로나바이러스감염증-19'){
			    $.ajax({
					url : "/covid_age",
					    method : 'GET',
					 	data: {},
			   			success :function(item){
			   				for(var i in item){
			    				for(var i2 in item[i]){
			    					covid_age.push(item[i][i2].count);
			    				}
			    			}
	    					age_chart.data.datasets[0].data = covid_age;
	    					age_chart.data.datasets[0].label = infdisnm;
	    					age_chart.update();
			   			}
				});
		    } 
		    else{
			    $.ajax({
					url : "/age_inf",
					    method : 'GET',
					 	data: {"infdisid": infdisid},
			   			success :function(item){
			   				for(var i in item){
			    				for(var i2 in item[i]){
			    					age_count.push(item[i][i2].count);
			    					age_chart.data.datasets[0].data = age_count;
			    					age_chart.data.datasets[0].label = infdisnm;
			    				}
			    			}
			   				age_chart.update();
			   			}
		    	});	    	
		    }
	    });
	    const covid_age = [];
	    $.ajax({
			url : "/covid_age",
			    method : 'GET',
			 	data: {},
	   			success :function(item){
	   				for(var i in item){
	    				for(var i2 in item[i]){
	    					covid_age.push(item[i][i2].count);
	    				}
	    			}

	   			}
		});
	    const age_count = [];
	    const sum3 = []
	    $.ajax({
			url : "/age_inf",
			    method : 'GET',
			 	data: {"infdisid": infdisid},
	   			success :function(item){
	   				for(var i in item){
	    				for(var i2 in item[i]){
	    					age_count.push(item[i][i2].count);
							var a = age_count[i2];
							var b = covid_age[i2];
							var c = parseInt(a) + parseInt(b);
							sum3.push(c);
	    				}
						age_chart.data.datasets[0].data = sum3;
						age_chart.data.datasets[0].label = infdisnm;
						
	    				age_chart.update();
	    			}
	   			}
	    });
	   			//연령별 감염지수 chart
	   			    const IBEChart2 = document.getElementById('chartIndexAge');   
	   			    age_chart = new Chart(IBEChart2, {
	   			      type: 'bar',
	   			      data: {
	   			        labels: ['0-9세', '10-19세', '20-29세', '30-39세', '40-49세', '50-59세', '60-69세', '70세 이상'],
	   			        datasets: [{
	   			          label: infdisnm,
	   			          data: age_count,
	   			          backgroundColor: [
	   			            '#FFCE00',
	   			            '#FF9858',
	   			            '#FF4740',
	   			            '#E63A9D',
	   			            '#B65ECB',
	   			            '#605BD1',
	   			            '#4588E2',
	   			            '#5BC8D1'
	   			          ]
	   			        }]
	   			      },
	   			      options : {
	   			        scales: {
	   			          y: {
	   			            min: 0, 
	   			            ticks: {
	   			              stepSize: 200,
	   			              color: '#9092A2' 
	   			            }
	   			          },
	   			          x: {
	   			            ticks: {
	   			              color: '#9092A2' 
	   			            }            
	   			          }
	   			        },
	   			        plugins: {
	   			          // label이 보여지기 원하는 경우 true 로 바꿔주세요
	   			          legend: {
	   			            display: false
	   			          }
	   			        }        
	   			      }
	   			    });
		
	    
	    const count = [];
	    const IBEChart3 = document.getElementById('chartInfectionGender');
	    var gender_chart;
	    const sum2 = [];
	    const covid_gender = [];
	    $.ajax({
			url : "/covid_gender",
			    method : 'GET',
			 	data: {},
	   			success :function(item){
	   				for(var i in item){
	    				for(var i2 in item[i]){
	    					covid_gender.push(item[i][i2].count);
	    				}
	    			}

	   			}
		});
	    $.ajax({
				url : "/gender_inf",
				    method : 'GET',
				 	data: {"infdisid": "전체"},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					count.push(item[i][i2].count);
		    				}
		    			}
		   				for(var i = 0; i<2; i++){
		   					var a = count[i]
		   					var b = covid_gender[i];
		   					var c = parseInt(a)+parseInt(b)
		   					sum2.push(c);
		   				}
	    				gender_chart.data.datasets[0].data = sum2;
	   					gender_chart.data.datasets[0].label = infdisnm;
	   					gender_chart.update();

		   			}
	    	});
	  	//성별 감염지수 cahrt  
		gender_chart = new Chart(IBEChart3, {
			      type: 'doughnut',
			      data: {
			        labels: ['남성', '여성'],
			        datasets: [{
			          label: infdisnm,
			          data: count,
			          backgroundColor: [
			            '#605BD1',
			            '#FF4740',
			          ],
			          borderWidth: 0
			        }]
			      },
			      options : {
			        cutout: '50%',
			        plugins: {
			          // label이 보여지기 원하는 경우 true 로 바꿔주세요
			          legend: {
			            display: false
			          }
			        }        
			      }
			    });
		    $('#inquery').on('click', function(){
		    	const count2 = [];
			    var infdisid = $('#grade_inf option:selected').val();
			    var infdisnm = $('#grade_inf option:selected').text();
			    if(infdisnm == '코로나바이러스감염증-19'){
			    	const covid_gender = [];
			        $.ajax({
			    		url : "/covid_gender",
			    		    method : 'GET',
			    		 	data: {},
			       			success :function(item){
			       				for(var i in item){
			        				for(var i2 in item[i]){
			        					covid_gender.push(item[i][i2].count);
			        				}
			        			}
			       				gender_chart.data.datasets[0].data = covid_gender;
		       					gender_chart.data.datasets[0].label = infdisnm;
		       					gender_chart.update();
			       			}
			    	});
			    }
			    else if(infdisnm == '전체'){
			    	const sum2 = [];
			        const covid_gender = [];
			        $.ajax({
			    		url : "/covid_gender",
			    		    method : 'GET',
			    		 	data: {},
			       			success :function(item){
			       				for(var i in item){
			        				for(var i2 in item[i]){
			        					covid_gender.push(item[i][i2].count);
			        				}
			        			}

			       			}
			    	});
			        
			        $.ajax({
			    			url : "/gender_inf",
			    			    method : 'GET',
			    			 	data: {"infdisid": "전체"},
			    	   			success :function(item){
			    	   				for(var i in item){
			    	    				for(var i2 in item[i]){
			    	    					count.push(item[i][i2].count);
			    	    				}
			    	    			}
			    	   				for(var i = 0; i<2; i++){
			    	   					var a = count[i]
			    	   					var b = covid_gender[i];
			    	   					var c = parseInt(a)+parseInt(b)
			    	   					sum2.push(c);
			    	   				}
			        				gender_chart.data.datasets[0].data = sum2;
			       					gender_chart.data.datasets[0].label = infdisnm;
			       					gender_chart.update();

			    	   			}
			        	});
			    }
			    else{
				    $.ajax({
						url : "/gender_inf",
						    method : 'GET',
						 	data: {"infdisid": infdisid},
				   			success :function(item){
				   				for(var i in item){
				    				for(var i2 in item[i]){
				    					count2.push(item[i][i2].count);
				    					gender_chart.data.datasets[0].data = count2;
				    					gender_chart.data.datasets[0].label = infdisnm;
				    				}
				    			}
				   				gender_chart.update();
				   			}
			    	});
			    }
			    
		    })
    //감염자수 · 검색트렌드 · 뉴스언급횟수 chart
    $('#inquery').on('click', function(){
	    	const sq1 = [];
	    	const sq2 = [];
		    var infdisnm = $('#grade_inf option:selected').text();
		    $.ajax({
				url : "/search_trend",
				    method : 'GET',
				 	data: {"infdisnm": infdisnm},
		   			success :function(item){
 		   				 for(var i in item){
		    				for(var i2 in item[i]){
		    					sq1.push(item[i][i2].sq1);
		    					sq1.push(item[i][i2].sq2);
		    					sq1.push(item[i][i2].sq3);
		    					sq1.push(item[i][i2].sq4);
		    					sq1.push(item[i][i2].sq5);
		    					sq1.push(item[i][i2].sq6);
		    					sq1.push(item[i][i2].sq7);
		    					sq1.push(item[i][i2].sq8);
		    					sq1.push(item[i][i2].sq9);
		    					sq1.push(item[i][i2].sq10);
		    					sq1.push(item[i][i2].sq11);
		    					sq1.push(item[i][i2].sq12);
		    				}
		    			}
 		   				let min = sq1.reduce((a,b) =>{
    						return Math.max(a,b);
    					})
    					
    					for(var i = 0; i<sq1.length; i++){
    						sq2.push(sq1[i]/min*100);
    					}
 		   				 
 		   				trend_chart.data.datasets[0].data = sq2;
    					sangde_chart.data.datasets[0].data = sq2;
 		   				 
 		   				trend_chart.update();
 		   				sangde_chart.update();
		   			}
	    	});
	    })
	    $('#inquery').on('click', function(){
	    	const count = [];
	    	const count1 = [];
		    var infdisid = $('#grade_inf option:selected').val();
		    var infdisnm = $('#grade_inf option:selected').text();
		    $.ajax({
				url : "/news_count",
				    method : 'GET',
				 	data: {"infdisnm": infdisnm},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					count.push(item[i][i2].count)
		    				}
		    			}
		   				let min = count.reduce((a,b) =>{
    						return Math.max(a,b);
    					})
    					for(var i in item){
    						for(var i2 in item[i]){
    							count1.push((item[i][i2].count/min*100).toFixed(2));
    						}
    					}
		   				
		   				sangde_chart.data.datasets[2].data = count1;	   				
		   				trend_chart.data.datasets[2].data = count;
    					
		   				sangde_chart.update();
		   				trend_chart.update();
		   			}
	    	});
	    })
	    $('#inquery').on('click', function(){
	    	const count = [];
	    	const count1 = [];
		    var infdisid = $('#grade_inf option:selected').val();
		    var infdisnm = $('#grade_inf option:selected').text();
		    $.ajax({
				url : "/OneYear_inf",
				    method : 'GET',
				 	data: {"infdisnm": infdisnm},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					count.push(item[i][i2].count)
		    				}
		    			}
		   				let min = count.reduce((a,b) =>{
    						return Math.max(a,b);
    					})
    					for(var i in item){
    						for(var i2 in item[i]){
    							count1.push((item[i][i2].count/min*100).toFixed(2));
    						}
    					}
		   				
		   				risk_chart.data.datasets[0].data = count1;
		   				sangde_chart.data.datasets[1].data = count1;
						trend_chart.data.datasets[1].data = count;
    					
						risk_chart.update();
						sangde_chart.update();
		   				trend_chart.update();
		   			}
	    	});
	    })
	    $('#inquery').on('click', function(){
	    	const risk_news_count = [];
		    const risk_trend_count = [];
		    const risk_trend_count1 = [];
		    var infdisnm = $('#grade_inf option:selected').text();
			    $.ajax({
					url : "/risk_count",
					    method : 'GET',
					 	data: {"infdisnm": infdisnm, "sinm": ""},
			   			success :function(item){
			   				for(var i in item.news_count){
			   					risk_news_count.push(item.news_count[i].count);
			   					
			   				}
			   				for(var i in item.search_trend){
			   					risk_trend_count.push(item.search_trend[i].sq1);
			   					risk_trend_count.push(item.search_trend[i].sq2);
			   					risk_trend_count.push(item.search_trend[i].sq3);
			   					risk_trend_count.push(item.search_trend[i].sq4);
			   					risk_trend_count.push(item.search_trend[i].sq5);
			   					risk_trend_count.push(item.search_trend[i].sq6);
			   					risk_trend_count.push(item.search_trend[i].sq7);
			   					risk_trend_count.push(item.search_trend[i].sq8);
			   					risk_trend_count.push(item.search_trend[i].sq9);
			   					risk_trend_count.push(item.search_trend[i].sq10);
			   					risk_trend_count.push(item.search_trend[i].sq11);
			   					risk_trend_count.push(item.search_trend[i].sq12);
			   				}
	    					let min = risk_trend_count.reduce((a,b) =>{
	    						return Math.max(a,b);
	    					})
	    					for(var i = 0; i<risk_trend_count.length; i++){
	    						risk_trend_count1.push(risk_trend_count[i]/min*100);
	    					}
	    					risk_chart.data.datasets[1].data = risk_trend_count1; 
	    					risk_chart.update();
			   			}
		    	});
	    });
	    
	    const one_year_count = [];
	    const one_year_count1 = [];
		    var infdisid = $('#grade_inf option:selected').val();
		    var infdisnm = $('#grade_inf option:selected').text();
		    $.ajax({
				url : "/OneYear_inf",
				    method : 'GET',
				 	data: {"infdisnm": infdisnm},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					one_year_count.push(item[i][i2].count)
		    				}
		    			}
		   				let min = one_year_count.reduce((a,b) =>{
    						return Math.max(a,b);
    					})
    					for(var i in item){
    						for(var i2 in item[i]){
    							one_year_count1.push((item[i][i2].count/min*100).toFixed(2));
    						}
    					}
		   				
						trend_chart.data.datasets[1].data = one_year_count;
						sangde_chart.data.datasets[1].data = one_year_count1;
						risk_chart.data.datasets[0].data = one_year_count1;
						sangde_chart.update();
		   				trend_chart.update();
		   				risk_chart.update();
		   			}
	    	});
		    const news_count = [];
			const news_count1 = [];
		    $.ajax({
				url : "/news_count",
				    method : 'GET',
				 	data: {"infdisnm": infdisnm},
		   			success :function(item){
		   				for(var i in item){
		    				for(var i2 in item[i]){
		    					news_count.push(item[i][i2].count)
		    				}
		    			}
    					let min = news_count.reduce((a,b) =>{
    						return Math.max(a,b);
    					})
    					
    					for(var i in item){
    						for(var i2 in item[i]){
    							news_count1.push((item[i][i2].count/min*100).toFixed(2));
    						}
    					}
    					
						sangde_chart.data.datasets[2].data = news_count1;  					
		   				trend_chart.data.datasets[2].data = news_count;
		   				
		   				trend_chart.update();
		   				sangde_chart.update();
		   			}
	    	});
		    
		    const sq1 = [];
		    const sq2 = [];
		    var infdisnm = $('#grade_inf option:selected').text();
		    $.ajax({
				url : "/search_trend",
				    method : 'GET',
				 	data: {"infdisnm": infdisnm},
		   			success :function(item){
 		   				 for(var i in item){
		    				for(var i2 in item[i]){
		    					sq1.push(item[i][i2].sq1);
		    					sq1.push(item[i][i2].sq2);
		    					sq1.push(item[i][i2].sq3);
		    					sq1.push(item[i][i2].sq4);
		    					sq1.push(item[i][i2].sq5);
		    					sq1.push(item[i][i2].sq6);
		    					sq1.push(item[i][i2].sq7);
		    					sq1.push(item[i][i2].sq8);
		    					sq1.push(item[i][i2].sq9);
		    					sq1.push(item[i][i2].sq10);
		    					sq1.push(item[i][i2].sq11);
		    					sq1.push(item[i][i2].sq12);
		    				}
		    			}
		   				let min = sq1.reduce((a,b) =>{
    						return Math.max(a,b);
    					})

    					for(var i = 0; i<sq1.length; i++){
    						sq2.push(sq1[i]/min*100);
    					}
    					
   						trend_chart.data.datasets[0].data = sq2;
    					sangde_chart.data.datasets[0].data = sq2;
 		   				trend_chart.update();
 		   				sangde_chart.update();
		   			}
	    	});
	    const risk_news_count = [];
	    const risk_trend_count = [];
	    const risk_trend_count1 = [];
	    var infdisnm = $('#grade_inf option:selected').text();
		    $.ajax({
				url : "/risk_count",
				    method : 'GET',
				 	data: {"infdisnm": infdisnm, "sinm": ""},
		   			success :function(item){
		   				for(var i in item.news_count){
		   					risk_news_count.push(item.news_count[i].count);
		   					
		   				}
		   				for(var i in item.search_trend){
		   					risk_trend_count.push(item.search_trend[i].sq1);
		   					risk_trend_count.push(item.search_trend[i].sq2);
		   					risk_trend_count.push(item.search_trend[i].sq3);
		   					risk_trend_count.push(item.search_trend[i].sq4);
		   					risk_trend_count.push(item.search_trend[i].sq5);
		   					risk_trend_count.push(item.search_trend[i].sq6);
		   					risk_trend_count.push(item.search_trend[i].sq7);
		   					risk_trend_count.push(item.search_trend[i].sq8);
		   					risk_trend_count.push(item.search_trend[i].sq9);
		   					risk_trend_count.push(item.search_trend[i].sq10);
		   					risk_trend_count.push(item.search_trend[i].sq11);
		   					risk_trend_count.push(item.search_trend[i].sq12);
		   				}

    					let min = risk_trend_count.reduce((a,b) =>{
    						return Math.max(a,b);
    					})
    					for(var i = 0; i<risk_trend_count.length; i++){
    						risk_trend_count1.push(risk_trend_count[i]/min*100);
    					}
    					risk_chart.data.datasets[1].data = risk_trend_count1; 
    					risk_chart.update();
		   			}
	    	});
	//검색트랜드, 뉴스, 감염자 그래프
    var trend_chart;
    const IBEChart4 = document.getElementById('chartCombine01');
    trend_chart = new Chart(IBEChart4, {
      type: 'line',
      data: {
        labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
        datasets: [
          {
            label: '검색트랜드',
            data: [65, 59, 80, 81, 56, 55, 90],
            fill: false,
            borderColor: '#8BD047',
            backgroundColor: '#ffffff',
            borderWidth: 2,
            yAxisID: 'y1',
            tension: 0.4
          },
          {
            label: '감염자수',
            data: [1100, 1500, 2000, 1100, 1900, 1450, 1200],
            fill: false,
            borderColor: '#3F80E5',
            backgroundColor: '#ffffff',
            borderWidth: 2,
            yAxisID: 'y2',
            tension: 0.4
          },
          {
            label: '뉴스언급횟수',
            data: [1000, 1200, 2000, 1500, 1200, 1800, 1000],
            fill: false,
            borderColor: '#BA39EA',
            backgroundColor: '#ffffff',
            borderWidth: 2,
            yAxisID: 'y3',
            tension: 0.4
          }
        ]
      },
      options: {
        scales: {
            x: {
              ticks: {
                color: '#9092A2' 
              }            
            },
            y1: {
              type: 'linear',
              position: 'left',
              id: 'y1',
              title: {
                display: true,
                text: '검색트렌드'
              },
              min: 0, 

              ticks: {
                stepSize: 10,
                color: '#9092A2' 
              }
            },
            y2: {
                type: 'linear',
                position: 'right',
                id: 'y2',
                title: {
                  display: true,
                  text: '감염자수'
                }, 
                ticks: {
                  stepSize: 200,
                  color: '#9092A2' 
                },
                grid: {
                  drawOnChartArea: false
                }
            },
            y3: {
                type: 'linear',
                position: 'right',
                id: 'y3',
                offset: true,
                title: {
                  display: true,
                  text: '뉴스횟수'
                },
                ticks: {
                  stepSize: 200,
                  color: '#9092A2' 
                },
                grid: {
                  drawOnChartArea: false
                }
            }
        },
        plugins: {
          legend: {
            position: 'bottom',
            labels: {
              font: {
                size: 14
              },
              color: '#646674',
              padding: 22,
              boxWidth: 11,
              boxHeight: 11,
              usePointStyle: true,
              pointStyle: 'circle',
            }
          }
        }
      },
    });
	//검색트랜드, 뉴스언급, 감염자수 그래프
    const IBEChart5 = document.getElementById('chartCombine02');  
    var sangde_chart = new Chart(IBEChart5, {
      type: 'line',
      data: {
        labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
        datasets: [
          {
            label: '검색트랜드',
            data: [100, 300, 120, 480, 260, 110],
            backgroundColor: '#ffffff',
            borderColor: '#8BD047',
            borderWidth: 2,
            tension: 0.4,
          },
          {
            label: '감염자수',
            data: [40, 100, 369, 420, 250, 490],
            backgroundColor: '#ffffff',
            borderColor: '#3F80E5',
            borderWidth: 2,
            tension: 0.4,
          },
          {
            label: '뉴스횟수',
            data: [400, 210, 380, 10, 200, 150],
            backgroundColor: '#ffffff',
            borderColor: '#BA39EA',
            borderWidth: 2,
            tension: 0.4
          }
        ]
      },
      options: {
        scales: {
          x: {
            ticks: {
              color: '#9092A2' 
            }            
          },          
          y: {
            min: 0,
            ticks: {
              stepSize: 100,
              color: '#9092A2' 
            }
          }
        },
        plugins: {
          legend: {
            position: 'bottom',
            labels: {
              font: {
                size: 14
              },
              color: '#646674',
              padding: 22,
              boxWidth: 11,
              boxHeight: 11,
              usePointStyle: true,
              pointStyle: 'circle',
            }
          }
        }        
      }
    });
	//감염자수 risk 추이
    const IBEChart6 = document.getElementById('chartCombine03');  
    var risk_chart = new Chart(IBEChart6, {
      type: 'line',
      data: {
        labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
        datasets: [
          {
            label: '감염자수',
            data: [65, 59, 80, 81, 56, 55, 90],
            fill: false,
            borderColor: '#8BD047',
            backgroundColor: '#ffffff',
            borderWidth: 2,
            yAxisID: 'y1', 
            tension: 0.4
          },
          {
            label: 'Risk',
            data: [1100, 1500, 2000, 1100, 1900, 1450, 1200],
            fill: false,
            borderColor: '#3F80E5',
            backgroundColor: '#ffffff',
            borderWidth: 2,
            yAxisID: 'y2', 
            tension: 0.4
          }
        ]
      },
      options: {
        scales: {
            x: {
              ticks: {
                color: '#9092A2' 
              }            
            },
            y1: {
              type: 'linear',
              position: 'left',
              id: 'y1',
              min: 0,
              title: {
                display: true,
                text: '감염자수'
              },
              ticks: {
                stepSize: 10,
                color: '#9092A2' 
              }
            },
            y2: {
                type: 'linear',
                position: 'right',
                id: 'y2',
                title: {
                  display: true,
                  text: 'Risk'
                }, 
                ticks: {
                  stepSize: 200,
                  color: '#9092A2' 
                },
                grid: {
                  drawOnChartArea: false
                }
            }
        },
        plugins: {
          legend: {
            position: 'bottom',
            labels: {
              font: {
                size: 14
              },
              color: '#646674',
              padding: 22,
              boxWidth: 11,
              boxHeight: 11,
              usePointStyle: true,
              pointStyle: 'circle',
            }
          }
        }
      },
    });
    
    //감염병 정보 조회
    var infdisnm1 = $('#infdisnm').val();
    if(infdisnm1 != ""){    	    
	    $('#infdisnm').val("");
    }else if(infdisnm1 == ""){
    	infdisnm1 = "카바페넴내성장내세균속균종(CRE) 감염증";
    }
	
    $.ajax({
		url : "/inf_arrange",
	    method : 'GET',
	    data : {'infdisnm': infdisnm1},
		success :function(item){
			for(var i in item){
				for(var i2 in item[i]){
			    	$("#title").empty();
			    	$("#definition").empty();
			    	$("#symptom").empty();
			    	$("#relevant").empty();
			    	
					$("#title").text(item[i][i2].infdisnm);
					$("#definition").text(item[i][i2].definition);
					$("#symptom").text(item[i][i2].symptom);
					var relevant = item[i][i2].relevant;
					relevant = relevant.replace(/"Q|Q/g, '</br>Q');
					$("#relevant").prepend('<div class="infect-info-desc"><p class="desc">'+relevant+'</p></div>');
				}
			}
		}
	});
    
    $('#inquery').on('click', function(){
    	var infdisnm = $('#grade_inf option:selected').text();
    	$.ajax({
			url : "/inf_arrange",
		    method : 'GET',
		    data : {'infdisnm': infdisnm},
			success :function(item){
				for(var i in item){
					for(var i2 in item[i]){
				    	$("#title").empty();
				    	$("#definition").empty();
				    	$("#symptom").empty();
				    	$("#relevant").empty();
						$("#title").text(item[i][i2].infdisnm);
						$("#definition").text(item[i][i2].definition);
						$("#symptom").text(item[i][i2].symptom);
						var relevant = item[i][i2].relevant;
						relevant = relevant.replace(/"Q|Q/g, '</br>Q');
						//relevant = relevant.replace(/"Q|Q/g, '<p class="infect-info-num"><span>Q</span></p>');
						relevant = relevant.replace(/"○|○/g, '</br>○');
						$("#relevant").prepend('<div class="infect-info-desc"><p class="desc">'+relevant+'</p></div>');
					}
				}
			}
		});
    });
    
    //지역과 시기선택 연간 월간 확진자 수
    var year_count = [];
    var month_count = [];
    var back_month = [];
    var danger;
    var jg;
    var botong;
    var jg2;
    $('#year_count').empty();
    $('#jg2').empty();
    $('#month_count').empty();
    $('#jg').empty();
    $('#botong').empty();
    $('#danger').empty();
    $('#sicd_max').empty();
    $('#age_max').empty();
    var now = new Date();
    var month = now.getMonth();
    month = '0'+month;
    var sicd = $('#sicd option:selected').val();
    var year = $('#year option:selected').val();

    $.ajax({
		url : "/year_month_count",
	    method : 'GET',
	    data : {'sicd': sicd, 'year': year, 'month': month},
		success :function(item){
			for(var i in item.year_count){
				year_count.push(item.year_count[i].count);//연간 확진자
			}
			for(var i in item.month_count){
				month_count.push(item.month_count[i].count);//월간확진자
			}
			for(var i in item.back_month){
				back_month.push(item.back_month[i].count);
			}
			jg = month_count - back_month;//증감
			danger = jg/back_month*100;//위험도
			year_count = year_count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			month_count = month_count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			if(danger >= 20){
				botong = '위험';
			}else if(danger >= 10){
				boting = '주의';
			}else if(danger <= 5){
				botong = '보통';
			}
			if(jg < 0){
				jg2 = '감소';
			}else if(jg == 0){
				jg2 = '변동없음';
			}else if(jg > 0){
				jg2 = '증가';
			}
			$('#jg2').text(jg2);
			$('#botong').text(botong);
			$('#year_count').text(year_count);
			$('#month_count').text(month_count);
			jg = jg.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$('#jg').text(jg+'명');
			$('#danger').text(danger.toFixed(2)+'%');
		}
	});
    $('#sinm').on('click', function(){
        var year_count = [];
        var month_count = [];
        var back_month = [];
        var danger;
        var jg;
        var jg2;
        var botong;
	    var sicd = $('#sicd option:selected').val();
	    var year = $('#year option:selected').val();
	    var month = $('#month option:selected').val();
	    $.ajax({
			url : "/year_month_count",
		    method : 'GET',
		    data : {'sicd': sicd, 'year': year, 'month': month},
			success :function(item){
			    $('#year_count').empty();
			    $('#month_count').empty();
			    $('#jg').empty();
			    $('#jg2').empty();
			    $('#danger').empty();
			    $('#botong').empty();
				for(var i in item.year_count){
					year_count.push(item.year_count[i].count);//연간 확진자
				}
				for(var i in item.month_count){
					month_count.push(item.month_count[i].count);//월간확진자
				}
				for(var i in item.back_month){
					back_month.push(item.back_month[i].count);
				}
				jg = month_count - back_month;//증감
				danger = jg/back_month*100;//위험도
				year_count = year_count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				month_count = month_count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				
				if(danger >= 20){
					botong = '위험';
				}else if(danger >= 10){
					botong = '주의';
				}else if(danger <= 5){
					botong = '보통';
				}
				if(jg < 0){
					jg2 = '감소';
				}else if(jg == 0){
					jg2 = '변동없음';
				}else if(jg > 0){
					jg2 = '증가';
				}
				$('#jg2').text(jg2);
				$('#botong').text(botong);
				$('#year_count').text(year_count);
				$('#month_count').text(month_count);
				$('#jg').text(jg.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'명');
				$('#danger').text(danger.toFixed(2)+'%');
			}
		});
    })
    //최다 발생지역, 연령대
    var sicd_max = [];
    var age_max = [];
    $.ajax({
		url : "/max_count_age",
	    method : 'GET',
	    data : {'sicd': sicd, 'year': year, 'month': month},
		success :function(item){
			for(var i in item.sicd_max){
				sicd_max.push(item.sicd_max[i].sinm);		
			}
			for(var i in item.age_max){
				age_max.push(item.age_max[i].age);	
			}
			$('#sicd_max').text(sicd_max);
			$('#age_max').text(age_max);
		}
	});
    
    $('#sinm').on('click', function(){
        var sicd_max = [];
        var age_max = [];
        var sicd = $('#sicd option:selected').val();
        var year = $('#year option:selected').val();
        var month = $('#month option:selected').val();
        $.ajax({
    		url : "/max_count_age",
    	    method : 'GET',
    	    data : {'sicd': sicd, 'year': year, 'month': month},
    		success :function(item){
    		    $('#sicd_max').empty();
    		    $('#age_max').empty();
    			for(var i in item.sicd_max){
    				sicd_max.push(item.sicd_max[i].sinm);
    			}
    			for(var i in item.age_max){
    				age_max.push(item.age_max[i].age);	
    			}
    			$('#sicd_max').text(sicd_max);
    			$('#age_max').text(age_max);
    		}
    	});
    })
    
  </script>

</body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PRN7JTV"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
</html>