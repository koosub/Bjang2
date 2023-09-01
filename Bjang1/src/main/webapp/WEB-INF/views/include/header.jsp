<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="header">
  <h1 class="IBE-logo">
    <a href="/">
      <img src="/resources/images/logo.png" alt="Infection Bigdata Exchange">
    </a>
  </h1>
  <div class="inner">
    <nav>
      <ul class="gnb-depth01">
        <li>
          <a href="/">감염병 위기관리 활용 서비스</a>
        </li>
        <li>
          <a href="/gis">GIS 기반 인구 이동 활용 서비스</a>
        </li>
      </ul>
    </nav>
  </div>
  <div class="hd-right">
    <div class="search-area">
      <input type="search" class="form-input" id="search">
      <ul class="suggest-list" id="search_list">
      
      </ul>
    </div>
  </div>
  <div class="btn-menu">
    <span></span>
    <span></span>
    <span></span>
  </div>  
  <div class="menu-wrap">
    <div class="menu-inner">
      <p class="menu-tit-en">INFECTION<br> BIGDATA EXCHANGE</p>
      <p class="menu-tit-kr">감염병 빅데이터 거래소</p>
      <ul class="menu">
        <li>
          <a href="/">
            <span class="depth01">감염병 위기관리 활용 서비스</span>
          </a>
          <ul class="menu-depth02">
            <li>
              <a href="/">감염병 발생 현황</a>
            </li>
            <li>
              <a href="/info-lookup">감염병 정보 조회</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="/gis">
            <span class="depth01">GIS 기반 인구 이동 활용 서비스</span>
          </a>
        </li>
      </ul>
    </div>
  </div>
</header>

<script>

	if (currentPageDepth1 == 0) {
		$('.gnb-depth01 li:eq(0)').addClass('on')
		$('.menu>li:eq(0)').addClass('on')
	} else if (currentPageDepth1 == 1) {
		$('.gnb-depth01 li:eq(1)').addClass('on')
		$('.menu>li:eq(1)').addClass('on')
	}

	if (currentPageDepth2 == 0) {
		$('.menu-depth02>li:eq(0)').addClass('on')
	} else if (currentPageDepth2 == 1) {
		$('.menu-depth02>li:eq(1)').addClass('on')
	}
	
	$('.btn-menu').click(function() {
		$('.header').toggleClass('menu-open');
	});
	
	var infdisnm = $('#search').val();
	 $.ajax({
			url : "/search_inf",
		    method : 'GET',
		 	data: {"infdisnm": infdisnm},
  			success :function(item){
					$('#search_list').children().remove();
  				for(var i in item){
   				for(var i2 in item[i]){
   					$('#search_list').prepend("<li><a href='/info-lookup?infdisnm="+item[i][i2].infdisnm+"'>"+item[i][i2].infdisnm+"</a></li>");
   				}
   			}
  			}
   	});
	$('#search').on('focus keyup ',function(){
		var infdisnm = $('#search').val();
		 $.ajax({
    			url : "/search_inf",
    		    method : 'GET',
    		 	data: {"infdisnm": infdisnm},
       			success :function(item){
   					$('#search_list').children().remove();
       				for(var i in item){
        				for(var i2 in item[i]){
        					$('#search_list').prepend("<li><a href='/info-lookup?infdisnm="+item[i][i2].infdisnm+"'>"+item[i][i2].infdisnm+"</a></li>");
        				}
        			}
       			}
        	});
	})
	
	
</script>