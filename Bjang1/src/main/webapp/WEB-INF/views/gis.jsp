<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Google Tag Manager -->
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-5B3PJ5F');
</script>
<!-- End Google Tag Manager -->

<!-- Google tag (gtag.js) -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-N9HR0YVV8H"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'G-N9HR0YVV8H');
</script>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<title>GIS 기반 인구 이동 활용 서비스 | 감염병 빅데이터 혁신서비스</title>
<meta name="author" content="(주)데이터스트림즈">
<meta name="keywords"
	content="감염병 정보, 해외여행 감염병 정보, 코로나19, 코로나, GIS 기반, 감염병 위기관리, 감염병 통계, 감염병 빅데이터">
<meta name="description"
	content="감염병 빅데이터 혁신서비스는 감염병에 대한 정보를 종합적으로 제공합니다.">
<meta name="twitter:title" content="감염병 빅데이터 혁신서비스">
<meta name="twitter:description"
	content="감염병 빅데이터 혁신서비스는 감염병에 대한 정보를 종합적으로 제공합니다.">
<meta name="twitter:image" content="/resources/images/sns_present.jpg">
<meta property="og:title" content="감염병 빅데이터 혁신서비스">
<meta property="og:description"
	content="감염병 빅데이터 혁신서비스는 감염병에 대한 정보를 종합적으로 제공합니다.">
<meta property="og:url" content="https://service-covid.kr/">
<meta property="og:type" content="website">
<meta property="og:image" content="/resources/images/sns_present.jpg">
<link rel="shortcut icon" href="/resources/images/favicon.png">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/swiper-bundle.min.css">
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" /> -->
<script src="/resources/js/jquery-3.4.1.min.js"></script>
<script src="/resources/js/common.js"></script>
<script src="/resources/js/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script> -->
<script src="/resources/js/moment.min.js"></script>

<script src="/resources/js/gis/libs/proj4.js"></script>
<script src="/resources/js/gis/libs/ol.js"></script>
<link rel="stylesheet" href="/resources/css/ol.css" />

<link rel="stylesheet" href="/resources/css/datepicker.css" />
<script src="/resources/js/datepicker.js"></script>
<script src="/resources/js/datepicker.ko.js"></script>

<script src="/resources/js/gis/map.js"></script>
<script src="/resources/js/gis/density.js"></script>
<script src="/resources/js/gis/movement.js"></script>
<script src="/resources/js/gis/infection.js"></script>
<link rel="stylesheet" href="/resources/css/map.css" />
<!-- <link rel="stylesheet" href="/resources/css/GIS_style.css" /> -->

<script>
	//gnb current menu
	let currentPageDepth1 = 1;
	let currentPageDepth2;
</script>

</head>
<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-9FEQBG71R3"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'G-9FEQBG71R3');
</script>

<body>
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5B3PJ5F"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->

	<!-- header include -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<main class="GIS-content">
		<div class="GIS-inner">
			<div class="mainMap" id="mainMap"></div>
			<div class="sec-gis-search">
				<div class="btn-side-slide"></div>
				<div class="side-inner">
					<div class="gis-tit-row">
						<h2 class="">통계 조회</h2>
						<div>
							<button class="btn-gis-modal btn-trans">통계정보 안내</button>
						</div>
					</div>
					<ul class="tab-menu">
						<li id="density-tab" class="selected">인구 밀집도와 감염병 비교</li>
						<li id="movement-tab">유동 인구와 감염병 비교</li>
					</ul>
					<div class="tab-cont">
						<!-- tab1 인구밀집도와 감염병 비교 -->
						<div class="tab-cont01">
							<h3 class="tab-cont-tit">인구 밀집도 조회</h3>
							<div class="region">
								<div class="gis-select-box" style="width:100%">
									<select class="form-select form-select-100 sdSelect" id="sdSelect-density" onchange="sdFunction(value, 'density')"></select>
								</div>
							</div>
							<div class="datepicker-row">
								<span> 
									<input type="text" class="form-date datepicker-input datepicker-day" id="datepicker-density" readonly="readonly" data-language="ko">
								</span>
								<button class="apply_button" onclick="funcModeCheck('density')">적용</button>
							</div>
							<div class="select-result">
								<!-- 지역선택하기 이전 section :: display none 처리 되어 있습니다. -->
								<div class="select-before-box" id="select-before-box-density">
									<span>지도에서 읍/면/동 선택 시 인구 밀집도를 조회하실 수 있습니다.</span>
								</div>
								<!-- //지역선택하기 이전 section -->
								<!-- 지역을 선택한 후 보여지는 table -->
								<div class="tbl-wrap" id="tbl-wrap-density"></div>
							</div>
							<div class="popul-stats popul-stats-density">
								<h3 class="tab-cont-tit">감염병 조회</h3>
								<div class="select-row02">
									<div class="gis-select-box">
										<select class="form-select form-select-100 gradeSelect" onchange="gradeFunction(value, 'infection', 'density')">
											<option value="grade">등급 선택</option>
											<option value="1급">1급</option>
											<option value="2급">2급</option>
											<option value="3급">3급</option>
										</select>
									</div>
									<div class="gis-select-box">
										<select class="form-select form-select-100" id="infectionSelect-density" onchange="infectionFunction(value, 'infection')"></select>
									</div>
								</div>
								<div class="datepicker-row">
									<span>
										<input type="text" class="form-date datepicker-input datepicker-month" id="datepicker-infection-density" readonly="readonly" data-language="ko">
									</span>
									<button class="apply_button" onclick="funcModeCheck('infection')">적용</button>
								</div>
<!-- 								<p class="status-num mt20 infection-count-density"></p> -->
							</div>
						</div>
						<!-- //tab1 인구밀집도와 감염병 비교 -->

						<!-- tab2 유동인구와 감염병 비교 -->
						<div class="tab-cont02">
							<h3 class="tab-cont-tit">유동 인구수 조회</h3>
							<div class="region">
								<div class="gis-select-box">
									<select class="form-select form-select-100 sdSelect" id="sdSelect-movement" onchange="sdFunction(value, 'movement')"></select>
								</div>
								<div class="gis-select-box">
									<select class="form-select form-select-100 sggSelect" id="sggSelect-movement" onchange="sggFunction(value, 'movement')"></select>
								</div>
							</div>
							<div class="datepicker-row">
								<span>
									<input type="text" class="form-date datepicker-input datepicker-day" id="datepicker-movement" readonly="readonly" data-language="ko">
								</span>
								<button class="apply_button" onclick="funcModeCheck('movement')">적용</button>
							</div>
							<div class="select-result">
								<!-- 지역선택하기 이전 section :: display none 처리 되어 있습니다. -->
								<div class="select-before-box" id="select-before-box-movement">
									<span>지도에서 시/군/구 선택 시 유동 인구를 조회하실 수 있습니다.</span>
								</div>
								<!-- //지역선택하기 이전 section -->
								<!-- 지역을 선택한 후 보여지는 table -->
								<div class="tbl-wrap" id="tbl-wrap-movement"></div>
							</div>
							<div class="popul-stats popul-stats-movement">
								<h3 class="tab-cont-tit">감염병 조회</h3>
								<div class="select-row02">
									<div class="gis-select-box">
										<select class="form-select form-select-100 gradeSelect" onchange="gradeFunction(value, 'infection', 'movement')">
											<option value="grade">등급 선택</option>
											<option value="1급">1급</option>
											<option value="2급">2급</option>
											<option value="3급">3급</option>
										</select>
									</div>
									<div class="gis-select-box">
										<select class="form-select form-select-100" id="infectionSelect-movement" onchange="infectionFunction(value, 'infection')"></select>
									</div>
								</div>
								<div class="datepicker-row">
									<span>
										<input type="text" class="form-date datepicker-input datepicker-month" id="datepicker-infection-movement" readonly="readonly" data-language="ko">
									</span>
									<button class="apply_button" onclick="funcModeCheck('infection')">적용</button>
								</div>
<!-- 								<p class="status-num mt20 infection-count-movement"></p> -->
							</div>
						</div>
						<!-- //tab2 유동인구와 감염병 비교 -->
					</div>
				</div>
			</div>
		</div>
		
		<div class="toolTip" id="densityTooltip">
			시도 선택 후 적용 버튼을 눌러주세요.	
		</div>
		
		<div class="toolTip" id="movementTooltip">
			시도, 시군구 선택 후 적용 버튼을 눌러주세요.
		</div>
		
		<div class="toolTip" id="infectionTooltip">
			감염병 선택 후 적용 버튼을 눌러주세요.
		</div>
	</main>
	
	<div class="legend-wrap">
		<!-- 인구밀집도 범례 -->
	    <div class="legend" id="legend-density">
	        <table>
<!-- 	        신규 색상 -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#a50026;"></td> -->
<!-- 	                <td>1,000,001 ~ -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#fdae61;"></td> -->
<!-- 	                <td>800,001 ~ 1,000,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#fee08b;"></td> -->
<!-- 	                <td>600,001 ~ 800,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#a6d96a;"></td> -->
<!-- 	                <td>400,001 ~ 600,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#4db5f9;"></td> -->
<!-- 	                <td>200,001 ~ 400,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#2000ad;"></td> -->
<!-- 	                <td>1 ~ 200,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#999eb2;"></td> -->
<!-- 	                <td colspan="3">0 (데이터 없음)</td> -->
<!-- 	            </tr> -->
	            
<!-- 	            리뉴얼 색상 -->
	            <tr>
	                <td style="background:#806FFF;"></td>
	                <td>1,000,001 ~
	            </tr>
	            <tr>
	                <td style="background:#9284FF;"></td>
	                <td>800,001 ~ 1,000,000</td>
	            </tr>
	            <tr>
	                <td style="background:#AA9FFF;"></td>
	                <td>600,001 ~ 800,000</td>
	            </tr>
	            <tr>
	                <td style="background:#BEB2FF;"></td>
	                <td>400,001 ~ 600,000</td>
	            </tr>
	            <tr>
	                <td style="background:#D8D3FF;"></td>
	                <td>200,001 ~ 400,000</td>
	            </tr>
	            <tr>
	                <td style="background:#EBE5FF;"></td>
	                <td>1 ~ 200,000</td>
	            </tr>
	            <tr>
	                <td style="background:#999eb2;"></td>
	                <td colspan="3">0 (데이터 없음)</td>
	            </tr>
	            
<!-- 	            기존 색상 -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#0D2F65;"></td> -->
<!-- 	                <td>1,000,001 ~ -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#145DAA;"></td> -->
<!-- 	                <td>800,001 ~ 1,000,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#307EBC;"></td> -->
<!-- 	                <td>600,001 ~ 800,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#62A1CA;"></td> -->
<!-- 	                <td>400,001 ~ 600,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#8EC3DB;"></td> -->
<!-- 	                <td>200,001 ~ 400,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#C1D2DE;"></td> -->
<!-- 	                <td>1 ~ 200,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#999eb2;"></td> -->
<!-- 	                <td colspan="3">0 (데이터 없음)</td> -->
<!-- 	            </tr> -->
	        </table>
	    </div>
	    
	    <!-- 유동인구수 범례 -->
	    <div class="legend" id="legend-movement">
	        <table>
<!-- 	        신규 색상 -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#a50026;"></td> -->
<!-- 	                <td>10,001 ~</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#f46d43;"></td> -->
<!-- 	                <td>5,001 ~ 10,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#fee08b;"></td> -->
<!-- 	                <td>2,001 ~ 5,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#d9ef8b;"></td> -->
<!-- 	                <td>1,001 ~ 2,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#66bd63;"></td> -->
<!-- 	                <td>501 ~ 1,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#7fdce9;"></td> -->
<!-- 	                <td>101 ~ 500</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#3f61f9;"></td> -->
<!-- 	                <td>51 ~ 100</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#2000ad;"></td> -->
<!-- 	                <td>1 ~ 50</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#999eb2;"></td> -->
<!-- 	                <td>0 (데이터 없음)</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#BC6FFF;"></td> -->
<!-- 	                <td>출발지</td> -->
<!-- 	            </tr> -->
	            
<!-- 	            리뉴얼 색상 -->
	            <tr>
	                <td style="background:#FF6448;"></td>
	                <td>10,001 ~</td>
	            </tr>
	            <tr>
	                <td style="background:#FF7D65;"></td>
	                <td>5,001 ~ 10,000</td>
	            </tr>
	            <tr>
	                <td style="background:#FF927E;"></td>
	                <td>2,001 ~ 5,000</td>
	            </tr>
	            <tr>
	                <td style="background:#FFA798;"></td>
	                <td>1,001 ~ 2,000</td>
	            </tr>
	            <tr>
	                <td style="background:#FFBEB2;"></td>
	                <td>501 ~ 1,000</td>
	            </tr>
	            <tr>
	                <td style="background:#FFD1C9;"></td>
	                <td>101 ~ 500</td>
	            </tr>
	            <tr>
	                <td style="background:#FFDFD9;"></td>
	                <td>51 ~ 100</td>
	            </tr>
	            <tr>
	                <td style="background:#FFEEEB;"></td>
	                <td>1 ~ 50</td>
	            </tr>
	            <tr>
	                <td style="background:#999eb2;"></td>
	                <td>0 (데이터 없음)</td>
	            </tr>
	            <tr>
	                <td style="background:#BC6FFF;"></td>
	                <td>출발지</td>
	            </tr>
	            
<!-- 	            기존 색상 -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#002929;"></td> -->
<!-- 	                <td>10,001 ~</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#0B4242;"></td> -->
<!-- 	                <td>5,001 ~ 10,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#016363;"></td> -->
<!-- 	                <td>2,001 ~ 5,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#2D8A8A;"></td> -->
<!-- 	                <td>1,001 ~ 2,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#209F9F;"></td> -->
<!-- 	                <td>501 ~ 1,000</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#83C8C8;"></td> -->
<!-- 	                <td>101 ~ 500</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#C8E4E4;"></td> -->
<!-- 	                <td>51 ~ 100</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#EDF7F7;"></td> -->
<!-- 	                <td>1 ~ 50</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#999eb2;"></td> -->
<!-- 	                <td>0 (데이터 없음)</td> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	                <td style="background:#F0F000;"></td> -->
<!-- 	                <td>출발지</td> -->
<!-- 	            </tr> -->
	        </table>
	    </div>
	    
	    <!-- 감염자수 범례 -->
	    <div class="legend" id="legend-infection">
	        <table>
	            <tr>
	                <td style="background:#4364D9;"></td>
	                <td>전월 대비 감염자 수 감소</td>
	            </tr>
	            <tr>
	                <td style="background:#45D364;"></td>
	                <td>전월 대비 변함 없음</td>
	            </tr>
	            <tr>
	                <td style="background:#A44BCD;"></td>
	                <td>전월 대비 감염자 수 증가</td>
	            </tr>
	        </table>
	    </div>
	</div>

	<!-- modal include -->
	<%@ include file="/WEB-INF/views/include/modal.jsp" %>

<script>
	//side menu open, close
	$('.btn-side-slide').click(function() {
		$('.sec-gis-search').toggleClass('close')
	})
	
	//tab 
	$('.tab-menu li').click(function() {
		let activeTab = $(this).index();
		$('.tab-menu li').removeClass('selected');
		$(this).addClass('selected');

		$('.tab-cont>div').css({
			display : 'none'
		});
		$('.tab-cont .tab-cont0' + (activeTab + 1)).css({
			display : 'block'
		});
	})
			
	$('#datepicker-density').datepicker({
		classes: 'calendar-density',
		dateFormat: 'yyyy-mm-dd',
		minDate: new Date('2022-01-01'),
		maxDate: new Date('2022-11-30'),
		position: 'bottom center',
		autoClose: true,
	});
	$('#datepicker-infection-density').datepicker({
		classes: 'calendar-infection-density',
        dateFormat: 'yyyy-mm',
		minDate: new Date('2019-01'),
		maxDate: new Date('2022-12'),
        view: 'months',
        minView: 'months',
        position: 'top center',
        autoClose: true,
	});
	$('#datepicker-movement').datepicker({
		classes: 'calendar-movement',
		dateFormat: 'yyyy-mm-dd',
		minDate: new Date('2022-01-01'),
		maxDate: new Date('2022-11-30'),
		position: 'bottom center',
		autoClose: true,
	});
	$('#datepicker-infection-movement').datepicker({
		classes: 'calendar-infection-movement',
        dateFormat: 'yyyy-mm',
		minDate: new Date('2019-01'),
		maxDate: new Date('2022-12'),
        view: 'months',
        minView: 'months',
        position: 'top center',
        autoClose: true,
	});
</script>

</body>
</html>
