<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Bjang</title>
</head>

	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sidebars/">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>  

    <!-- Custom styles for this template -->
     <link href="/resources/css/bjang3.css" rel="stylesheet">
<body>
    
<div class="none" id="open">
  <main class="d-flex flex-nowrap">
    <div class="flex-shrink-0 bg-color3 rel" style="width: 300px; height: 1800px;">
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
            <a href="" class="white"><span class="material-symbols-outlined">keyboard_arrow_up</span></a>
          </li>
        </ul>
      </div>
      <div class="b-example-vr bg-color4" style="height: 1800px;">
        <div class="line2"></div>
        <button class="d-inline-flex align-items-center rounded border-0 collapsed center margin-btn bg-color4" id="smar" data-bs-dismiss="offcanvas" aria-label="Close">
          <span class="material-symbols-outlined">chevron_left</span>
        </div>
      
    
    <div class="minus" id="minus">
      
    </div>

      </main>
    </div>
    <!-- 펼쳐지는 메뉴 끝 -->
    
    <!-- 간이메뉴 -->
<div id="disp">
  <main class="d-flex flex-nowrap">
      <div class="flex-shrink-0 bg-color3 rel" style="width: 90px; height: 1800px;">
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
          <a href="" class="white"><span class="material-symbols-outlined">keyboard_arrow_up</span></a>
        </li>
      </ul>
    </div>
    <div class="b-example-vr bg-color4" id="apply" style="height: 1800px;">
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
          </div>
        </div>
        <div class="gong"></div>
        <div class="stat1">
          <div class="cont1">
            <h2>질병발생 위기경보</h2>
            <button type="button" class="btn btn-secondary mart" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="Tooltip on right">
              <span class="material-symbols-outlined">priority_high</span>
            </button>
          </div>
        </div>
          <div class="gong"></div>
          <div class="danger">
            <h3 class="gongtong float">뉴스기반 정보</h3>
            <div class="float">
              <div class="dropdown gps">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                  <span class="mal">지역&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                </button>
                <ul class="dropdown-menu">
                  <li><a class="mal1" href="#">대전</a></li>
                  <li><a class="mal1" href="#">동구</a></li>
                  <li><a class="mal1" href="#">서구</a></li>
              </ul>
            </div>
            <div class="dropdown gps2">
              <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <span class="mal">질병명</span>&nbsp;&nbsp;&nbsp;&nbsp;
              </button>
              <ul class="dropdown-menu">
                <li><a class="mal1" href="#">지역별</a></li>
                <li><a class="mal1" href="#">예시별</a></li>
              </ul>
            </div>
          </div>
            <h3 class="guns">2022년 11월 지역별 전염병 발생 건수</h3>
          </div>
          <div class="danger2">
            <h3 class="gongtong float">뉴스기반 정보</h3>
            <div class="float">
            <div class="dropdown gps2">
              <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <span class="mal">인구별</span>&nbsp;&nbsp;&nbsp;&nbsp;
              </button>
              <ul class="dropdown-menu">
                <li><a class="mal1" href="#">지역별</a></li>
                <li><a class="mal1" href="#">예시별</a></li>
              </ul>
            </div>
          </div>            
          </div>
            
          </div>
      </section>
    </div>
      
    </main>
  </div>
    
    
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    
    <script src="/resources/js/bjang3.js"></script>





</body>
</html>
