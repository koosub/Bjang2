//javascript
$(function() {

  //modal
  $('.btn-stats-modal').click(function() {
    $('#modalStatsInfo').css('display', 'block')
  })
  $('.btn-risk-modal').click(function() {
    $('#modalRiskInfo').css('display', 'block')
  })
  $('.btn-gis-modal').click(function() {
    $('#modalGisStatsInfo').css('display', 'block')
  })
  $('.btn-close').click(function() {
    $('.modal-wrap').css('display', 'none')
  })

  //전국 감염병 현황 select 선택시 UI 변경
  $('.select-map-type').on('change', function() {
    let selectValue = $(this).val();
    if(selectValue == 'type01') {
      $('#mapOccurNum').css('display', 'block');
      $('#mapRiskDegree').css('display', 'none');
    } else if(selectValue == 'type02') {
      $('#mapOccurNum').css('display', 'none');
      $('#mapRiskDegree').css('display', 'block');
    }
  })

  //절대, 상대 sliding tab menu
  $('.tab-menu-slide p').click(function() {
    let activeTab = $(this).index();

    $('.tab-menu-slide p').removeClass('selected');
    $(this).addClass('selected');

    if(activeTab == 0) {
      $('.tab-menu-bg').css('left', '0')
    } else if(activeTab == 1) {
      $('.tab-menu-bg').css('left', '46px')
    }      

    $('.tab-chart>div').css({display: 'none'});
    $('.tab-chart .tab-chart0' + (activeTab+1)).css({display: 'block'});          
  })    

  //감염병 뉴스 slide
  const swiper = new Swiper('.news-slide', {
    slidesPerView: 4,
    slidesPerGroup: 4,
    spaceBetween: 28,
    navigation: {
      nextEl: '.news-button-next',
      prevEl: '.news-button-prev',
    },
    pagination: {
      el: '.news-pagination',
    },
  })  
});