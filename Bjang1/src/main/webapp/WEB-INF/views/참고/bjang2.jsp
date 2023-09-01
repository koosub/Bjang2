<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Bjang</title>

	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sidebars/">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <!-- Custom styles for this template -->
     <link href="/resources/css/bjang2.css" rel="stylesheet">
     <style>
	.cl{		
		width: 45px;
		height: 45px;
		font-size: 11px;
		border-radius: 30px;
		background: rgb(119, 147, 60);
		color: white;
		font-weight: 500;
		text-align: center;
		position: relative;
	}
	.ab{
		position: absolute;
	}
	.강원도{
		top: 400px;
		right: 200px;			
	}
	.경기도{
		top :450px;
		left: 220px;
	}
	.인천광역시{
		top:400px;
		left: 150px;
	}
	.서울특별시{
		top: 380px;
		left: 220px;
	}
	.경상북도{
		top:600px;
		right:200px;
	}
	.경상남도{
		top:800px;
		right:200px;	
	}
	.충청남도{
		top:600px;
		left:150px;
	}
	.충청북도{
		top:580px;
		left:260px;
	}
	.대전광역시{
		top:640px;
		left:210px;
	}
	.전라북도{
		top:750px;
		left:170px;	
	}
	.전라남도{
		top:850px;
		left:200px;
	}
	.광주광역시{
		top:760px;
		left:210px;
	}
	.부산광역시{
		top:850px;
		right:140px;
	}
	.울산광역시{
		top:900px;
		right:180px;
	}
	.대구광역시{
		top:680px;
		right:210px;
	}
	.제주특별자치도{
		top:1000px;
		left:230px;
	}
	.세종특별자치시{
		left:190px;
		top:570px;
	}
</style>
<script>

</script>
</head>
<body>
    <!-- 펼쳐지는 메뉴-->
<div class="none" id="open">
  <main class="d-flex flex-nowrap">
    <div class="flex-shrink-0 bg-color3 rel" style="width: 300px; height: 1355px;">
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
      <div class="b-example-vr bg-color4" style="height: 1355px;">
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
      <div class="flex-shrink-0 bg-color3 rel" style="width: 90px; height: 1355px;">
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
    <div class="b-example-vr bg-color4" id="apply" style="height: 1355px;">
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
              
                  

            </div>
            <div class="dropdown gps2">
 <!--              <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <span class="mal">질병명</span>&nbsp;&nbsp;&nbsp;&nbsp;
              </button> -->
				<select>
					<option name="keyword1">전체</option>
					<c:forEach  var="key1" items="${key1}">
						<option name="keyword1" value="${key1.keyword1}">${key1.keyword1}</option>
              		</c:forEach><!-- ajax 으로 값 서버에 request 보내서 success 시 아래 ${sivo.count} js 로 값 변경  -->
				</select>
            </div>
          </div>
            <h3 class="guns">2022년 11월 지역별 전염병 발생 건수</h3>
            <div class="boxcl">
            	<c:forEach var="sivo" items="${sivo}">
            		<div id="${sivo.sicd}" class="ab ${sivo.keyword2}">
	            		<div class="cl" >
							<p style="top:13px; left:20%; right:20%; position: absolute; ">${sivo.count}</p>
						</div>
						
            		</div>
            	</c:forEach>
			</div>
          </div>
          <div class="box1">
            <h3 class="gongtong">전염병 뉴스(병명)</h3>
            <div class="gongtong2" style="margin-top: 25px;">
              <a href="">
                <p>추석 연휴 이후 주간 확진자 최고치 기록···</p>
                <p>수도권 대형병원 내 집단감염 등 우···</p>
                <p>따라서, 기숙학교는 입소 시 사전 PCR검사 실시하고, 학생 및 학교 종사자들은···</p>
              </a>
            </div>
            <div class="gongtong2">
              <a href="">
                <p>추석 연휴 이후 주간 확진자 최고치 기록···</p>
                <p>수도권 대형병원 내 집단감염 등 우···</p>
                <p>따라서, 기숙학교는 입소 시 사전 PCR검사 실시하고, 학생 및 학교 종사자들은···</p>
              </a>
            </div>
            <div class="gongtong2">
              <a href="">
                <p>추석 연휴 이후 주간 확진자 최고치 기록···</p>
                <p>수도권 대형병원 내 집단감염 등 우···</p>
                <p>따라서, 기숙학교는 입소 시 사전 PCR검사 실시하고, 학생 및 학교 종사자들은···</p>
              </a>
            </div>
            <nav aria-label="Page navigation example" class="myo">
              <ul class="pagination mmar">
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
          </div>
          <div class="box1">
            <h3 class="gongtong">지역 전염병 뉴스(지역명/병명)</h3>
            <div class="gongtong2" style="margin-top: 25px;">
              <a href="">
                <p>전염성을 가진 병들을 통틀어 이르는 말, 곧 세균, 바이러스. 리케차. 스피로헤타,</p>
                <p>진균, 원충 따위의 병원체가 다른 생물체에 옮아 집단적으로 유행하는 병들을 이른다.</p>
                <p>공중위생의 측면에서 예방이 매우 중요하다.</p>
              </a>
              </div>
            <div class="gongtong2">
              <a href="">
                <p>전염성을 가진 병들을 통틀어 이르는 말, 곧 세균, 바이러스. 리케차. 스피로헤타,</p>
                <p>진균, 원충 따위의 병원체가 다른 생물체에 옮아 집단적으로 유행하는 병들을 이른다.</p>
                <p>공중위생의 측면에서 예방이 매우 중요하다.</p>
              </a>
              </div>
            <div class="gongtong2">
              <a href="">
                <p>전염성을 가진 병들을 통틀어 이르는 말, 곧 세균, 바이러스. 리케차. 스피로헤타,</p>
                <p>진균, 원충 따위의 병원체가 다른 생물체에 옮아 집단적으로 유행하는 병들을 이른다.</p>
                <p>공중위생의 측면에서 예방이 매우 중요하다.</p>
              </a>
              </div>
            <nav aria-label="Page navigation example" class="myo">
              <ul class="pagination mmar">
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
          </div>
      </section>
    </div>
      
    </main>
  </div>
    

    
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    
    <script src="/resources/js/bjang2.js"></script>
	


</body>
	


</html>
