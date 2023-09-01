<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 감염병 위기관리 활용서비스 통계 정보 안내 modal -->
<div class="modal-wrap" id="modalStatsInfo">
  <div class="modal-cont">
    <div class="modal-hd">
      <p class="modal-tit">통계정보 안내</p>
      <p class="tit-desc">감염병 확진자 정보는 ‘감염병 누리집’,<br> 인구 정보는 ‘SK텔레콤(모바일 위치 정보)’를 활용합니다.</p>
      <div class="btn-close"></div>
    </div>
    <div class="modal-bd">
      <div class="desc-area">
        <p class="desc-area-tit">/데이터 출처</p>
        <div class="desc-area-txt01">
          <p>
            <span class="fwbold">감염병 발생 통계 및 안내 컨텐츠</span>
            <span>감염병 누리집(질병관리청), 코로나 바이러스 감염증-19</span>
          </p>
          <p>
            <span class="fwbold">검색 트렌드</span>
            <span>네이버 데이터랩</span>
          </p>
          <p>
            <span class="fwbold">감염병 뉴스</span>
            <span>감염병 뉴스</span>
          </p>
        </div>
      </div> 
      <div class="desc-area">
        <p class="desc-area-tit">/통계 업데이트 주기</p>
        <div class="desc-area-txt01">
          <p>매월 1~3일경. 이전 월에 대한 통계 업데이트</p>
        </div>
      </div>
      <div class="desc-box">
        본 자료는 감염병 누리집에서 제공하는 정보를 활용하고 있으며, 업데이트 시간 및 통계 정보 정정으로 인해 차이가 발생할 수 있습니다.
      </div>
    </div>
  </div>
</div>  
<!-- //감염병 위기관리 활용서비스 통계 정보 안내 modal -->

<!-- 위험도 지수 안내 modal -->
<div class="modal-wrap" id="modalRiskInfo">
  <div class="modal-cont">
    <div class="modal-hd">
      <p class="modal-tit">위험도 지수 안내</p>
      <p class="tit-desc">감염병 발생 건수, 뉴스, 검색 트렌드를 계산하여 위험도를 수치화</p>
      <p class="tit-desc02">위험도 정보는 뉴스 언급 비율(α), 검색 트렌드 비율(1-α)을 통해 보여줍니다.<br> 수치화된 위험도는 값에 따라 보통, 주의, 위험으로 분류되어 정보가 제공됩니다.</p>
      <div class="btn-close"></div>
    </div>
    <div class="modal-bd">
      <div class="desc-area">
        <p class="desc-area-tit">/위험도 안내</p>
        <div class="desc-area-txt04">
          <div class="risk-desc01">
            <p class="fwbold">위험도</p>
            <img src="/resources/images/img_risk.png" alt="위험도 보통-노란색 주의-주황색 위험-빨간색">
          </div>
          <div class="risk-desc02">
            <p>
              <span class="fwbold">보통</span>
              <span>Risk 산출값이 50% 미만</span>
            </p>              
            <p>
              <span class="fwbold">주의</span>
              <span>Risk 산출값이 50% 이상, 70% 미만</span>
            </p>              
            <p>
              <span class="fwbold">위험</span>
              <span>Risk 산출값이 70% 이상</span>
            </p>              
          </div>
        </div>
      </div> 
      <div class="desc-area">
        <p class="desc-area-tit">/Risk 산출 방법</p>
        <div class="desc-area-txt05">
            <div class="risk-desc03">
              <p class="fwbold">01. 비율계산</p>
              <div class="risk-box">
                <div>
                  <p class="fwbold">뉴스 언급 비율</p>
                  <p>NewsCountPercent: Pnc</p>
                </div>
                <div>
                  <img src="/resources/images/img_fomula1.png" alt="">
                </div>
              </div>
              <div class="risk-box">
                <div>
                  <p class="fwbold">검색 트렌드 비율</p>
                  <p>TrendPercent</p>
                </div>
                <div>
                  <img src="/resources/images/img_fomula2.png" alt="">
                </div>
              </div>
            </div>
            <div class="risk-desc03">
              <p class="fwbold">02. 위험도 수준 계산</p>
              <div class="risk-box">
                <div>
                  <p class="fwbold">α 변화에 따른<br> Risk가 될 수 있는 모든 r값 추출</p>
                </div>
                <div>
                  <img src="/resources/images/img_fomula3.png" alt="">
                </div>                  
              </div>
              <div class="risk-box">
                <div>
                  <p class="fwbold">R값과 실제 감염자 비율간의<br> 상관계수를 구함</p>
                  <p>피어슨 상관계수 유사도 분석</p>
                </div>
                <div>
                  <img src="/resources/images/img_fomula4.png" alt="">
                </div>                  
              </div>
              <div class="risk-box">
                <div>
                  <p class="fwbold">가장 큰 상관계수를 갖는 α를 추출하여<br> 최종 Risk 값을 추출</p>
                </div>
                <div>
                  <img src="/resources/images/img_fomula5.png" alt="">
                </div>                  
              </div>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>  
<!-- //위험도 지수 안내 modal -->   

<!-- GIS 기반 인구 이동 활용 서비스 통계 정보 안내 modal -->
<div class="modal-wrap" id="modalGisStatsInfo">
  <div class="modal-cont">
    <div class="modal-hd">
      <p class="modal-tit">통계정보 안내</p>
      <p class="tit-desc">감염병 확진자 정보는 ‘감염병 누리집’,<br> 인구 정보는 ‘SK텔레콤(모바일 위치 정보)’를 활용합니다.</p>
      <div class="btn-close"></div>
    </div>
    <div class="modal-bd">
      <div class="desc-area">
        <p class="desc-area-tit">/용어 설명</p>
        <div class="desc-area-txt02">
          <div>
            <p>인구 밀집도</p>
            <p>SKT 제공 정보 기준 해당 지역의 방문자수를 기반으로 통계를 제공합니다.</p>
          </div>
          <div>
            <p>유동인구</p>
            <p>SKT 제공 정보 기준 해당 지역을 타 지역에서 2시간 이상 머문 경우 측정하여 제공합니다.</p>              
          </div>
        </div>
      </div> 
      <div class="desc-area">
        <p class="desc-area-tit">/유의 사항</p>
        <div class="desc-area-txt03">
          <p>
            <span class="desc-num">01.</span>
            <span>인구 통계 정보는 통신사(SKT) 모바일 위치 정보와 시장 점유율을 이용하여 전체를 추정한 값으로, 실제와 다를 수 있습니다.</span>
          </p>
          <p>
            <span class="desc-num">02.</span>
            <span>본 서비스는 크롬 브라우저에서 최적화되어 있습니다.</span>
          </p>
        </div>
      </div> 
      <div class="desc-box">
        본 자료는 감염병 누리집에서 제공하는 정보를 활용하고 있으며, 업데이트 시간 및 통계 정보 정정으로 인해 차이가 발생할 수 있습니다.
      </div>
    </div>
  </div>
</div>
<!-- //GIS 기반 인구 이동 활용 서비스 통계 정보 안내 modal -->



<script>
  $('.btn-close').click(function() {
    $('.modal-wrap').css('display', 'none')
  })  
</script>