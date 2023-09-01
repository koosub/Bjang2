let gisMap;
let view;
let mouseEventArr = [];
let lastSdCd;

let isStyleChanged = true;

let sdLayer;
let sggLayer;
let emdLayer;

$(document).ready(function() {
	$('.datepicker-day').val('2022-11-30');
	$('.datepicker-month').val('2022-12');
	
	// 맵 세팅
    initMap();
    
    // 행정구역 레이어 추가
    addDivisionMap('sd');
    addDivisionMap('sgg');
    addDivisionMap('emd');
    
	// 인구 토글 / 유동 토글 클릭 시 리셋 및 지도 위치 이동
    $('.tab-menu li').on('click', function() {
		$('.datepicker-day').val('2022-11-30');
		$('.datepicker-month').val('2022-12');
	
		let id = $(this)[0].id.split('-')[0];
		gisMap.currentMode = id;
		
    	resetLayer(['density', 'movement', 'infection']);
		showDivisionLayer(sdLayer);
		hideDivisionLayer(sggLayer);
		hideDivisionLayer(emdLayer);
		
		switchLegend(false, 'density');
		switchLegend(false, 'movement');
		switchLegend(false, 'infection');
		
		addSdSelect();
//		addInfectionSelect('1급', id);
		$('.gradeSelect').val('grade');
		$('#infectionSelect-density').html('');
		$('#infectionSelect-density').append('<option value="infection">감염병 선택</option>');
		$('#infectionSelect-movement').html('');
		$('#infectionSelect-movement').append('<option value="infection">감염병 선택</option>');
		
		$('#select-before-box-' + id).show();
		$('#tbl-wrap-' + id).hide();
		$('.infection-name').remove();
		$('.infection-count').remove();
		
    	gisMap.getView().animate({
    		zoom: 7,
    		center: new ol.geom.Point([127.90169, 35.75421]).transform('EPSG:4326', 'EPSG:3857').getCoordinates(),
    		duration: 800,
    	});
    });
});

function funcModeCheck(funcMode) {
	if (funcMode == 'density') {
		let sd_cd = $('#sdSelect-' + funcMode).val();
		if (sd_cd == 'sd') {
			$("#densityTooltip").fadeIn(200);
			setTimeout(function() {
				$("#densityTooltip").fadeOut(500);
			}, 3000);
		} else {
			addDensity(sd_cd);
		}
		
	} else if (funcMode == 'movement') {
		let sgg_cd = $('#sggSelect-' + funcMode).val();
		if (sgg_cd == 'sgg') {
			$("#movementTooltip").fadeIn(200);
			setTimeout(function() {
				$("#movementTooltip").fadeOut(500);
			}, 3000);
		} else {
			addMovement(sgg_cd);
		}
	
	} else if (funcMode == 'infection') {
		let infdisid = $('#infectionSelect-' + gisMap.currentMode).val();
		if (infdisid == 'infection' || infdisid == undefined) {
			$("#infectionTooltip").fadeIn(200);
			setTimeout(function() {
				$("#infectionTooltip").fadeOut(500);
			}, 3000);
		} else {
			addInfection(infdisid);
		}
	}
}

function initMap() {
	// 배경에 깔아놓을 OSM지도 레이어 생성
	let osmLayer = new ol.layer.Tile({
		name: 'osm',
		source: new ol.source.OSM()
	});
	
	// 브이월드 기본지도 레이어 생성
    let baseLayer = new ol.layer.Tile({
    	name: 'vworld_base',
        source: new ol.source.XYZ({
        	// 실서버 적용 시 활성화
            url: '', // WMTS API 사용, 인증키 필요
//            url: 'https://api.vworld.kr/req/wmts/1.0.0/27753361-9E23-374E-B756-A92C0BABC1D7/Base/{z}/{y}/{x}.png', // WMTS API 사용, 인증키 필요
            
            // 개발, 테스트 시 사용 가능
//            url: 'http://xdworld.vworld.kr:8080/2d/Base/202002/{z}/{x}/{y}.png', // 절대경로, 브이월드 서비스 변경 시 장애 발생 가능 (url에 년월 포함)
//            url: 'http://xdworld.vworld.kr:8080/2d/Base/service/{z}/{x}/{y}.png', // 절대경로, 브이월드 서비스 변경 시 장애 발생 가능 (url에 년월 미포함)
//            url: 'http://xdworld.vworld.kr:8080/2d/gray/service/{z}/{x}/{y}.png', // 절대경로, 브이월드 서비스 변경 시 장애 발생 가능 (url에 년월 미포함)
//            url: 'http://xdworld.vworld.kr:8080/2d/midnight/service/{z}/{x}/{y}.png', // 절대경로, 브이월드 서비스 변경 시 장애 발생 가능 (url에 년월 미포함)
//            url: 'http://xdworld.vworld.kr:8080/2d/Satellite/service/{z}/{x}/{y}.jpeg'
        }),
//        opacity: 0.8,
        background: '#A3B9CF'
    });
    
    // 브이월드 위성지도 레이어 생성
//    let satLayer = new ol.layer.Tile({
//    	name: 'vworld_satellite',
//    	source: new ol.source.XYZ({
//    		url: 'http://xdworld.vworld.kr:8080/2d/Satellite/service/{z}/{x}/{y}.jpeg'
//    	})
//    });
    
    // 브이월드 하이브리드지도 레이어 생성
//    let hybridLayer = new ol.layer.Tile({
//    	name: 'vworld_hybrid',
//    	source: new ol.source.XYZ({
//    		url: 'http://xdworld.vworld.kr:8080/2d/Hybrid/service/{z}/{x}/{y}.png'
//    	})
//    });

    // 5179 좌표계 추가 (추후 5179 좌표계 적용되어 있는 데이터 사용에 대비)
    proj4.defs([
        [
            'EPSG:5179',
            '+title=EPSG 5179 (long/lat) +proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs'
        ]
    ])
    ol.proj.proj4.register(proj4);
    // 필요하면 5179 extent 설정
//    let lonlatExtent = [118.94993975829523, 31.573281694073586, 136.37553824450367, 40.03529870288311];
//    let extent = ol.proj.transformExtent(lonlatExtent, 'EPSG:4326','EPSG:3857');
    
    let extent = [12838579.527252974, 3457390.682051207, 15649016.183242396, 5379934.8174799485];

    // 현재 viewport 범위 확인
//    gisMap.getView().calculateExtent()
    
    // 지도 속성 설정
	view = new ol.View({
        projection: 'EPSG:3857',
        center: new ol.geom.Point([127.90169, 35.75421]).transform('EPSG:4326', 'EPSG:3857').getCoordinates(),
//		projection: 'EPSG:3857',
//		center: new ol.geom.Point([127.70169, 36.96421]).transform('EPSG:4326', 'EPSG:3857').getCoordinates(),
        zoom: 7,
        minZoom: 7,
        maxZoom: 19,
        enableRotation: false,
        constrainResolution: true,
        extent: extent
    });

    // 지도 생성
    gisMap = new ol.Map({
        target: 'mainMap',
		layers: new ol.layer.Base({
			background: '#fff' 
		}),
        layers: [baseLayer], // 기본지도 
//        layers: [osmLayer, baseLayer], // OSM지도 + 기본지도 
//        layers: [osmLayer, satLayer, hybridLayer], // OSM지도 + 위성지도 + 하이브리드지도
        view: view,
    });
    
    // 줌 슬라이더 추가
    let zoomSlider = new ol.control.ZoomSlider();
    gisMap.addControl(zoomSlider);

//	let zoom = new ol.control.Zoom({
//		delta: 0.5
//	})
//	gisMap.addControl(zoom);
    
    // 축적막대 추가
    let scaleLine = new ol.control.ScaleLine({
        bar: true,
        steps: 2,
        text: true,
        minWidth: 100,
    });
    gisMap.addControl(scaleLine);
	
    // 시도 셀렉트 박스에 내용 추가
	addSdSelect();
	
	// 감염병 셀렉트 박스에 내용 추가
//	addInfectionSelect('1급', 'density');
//	addInfectionSelect('1급', 'movement');
	$('#infectionSelect-density').append('<option value="infection">감염병 선택</option>');
	$('#infectionSelect-movement').append('<option value="infection">감염병 선택</option>');
	
	/*
		현재 줌 레벨 시도 레벨로 설정
			'sd'	시도
			'sgg'	시군구 
			'emd'	읍면동
	 */
	
	gisMap.currentDivisionLevel = 'sd';
	
	/*
		현재 지도 모드 기본(행정구역)으로 설정
			'division'	기본(행정구역) 
			'density'	밀집도 
			'movement'	인구이동 
	 */
	gisMap.currentMode = 'density';
	
	// 마우스 이벤트용 변수 추가
	gisMap.highlight = undefined;
}

function addDivisionMap(divisionLevel) {
	$.ajax({
		type: 'GET',
		url: '/getDivisionGeojson.do',
		data: {'divisionLevel' : divisionLevel},
		dataType: 'json',
		success: function (data) {
			
			let baseLayer = new ol.layer.Group({
				name: 'base_division',
				layers: [],
			});
			
			let divisionLayer = new ol.layer.Group({
				name: divisionLevel + '_division',
				layers: [],
			});
			
			let visible;
			if (divisionLevel == 'sd') {
				sdLayer = divisionLayer;
				visible = true;
			} else if (divisionLevel == 'sgg') {
				sggLayer = divisionLayer;
				visible = false;
			} else {
				emdLayer = divisionLayer;
				visible = false;
			}
			
			let features = (new ol.format.GeoJSON()).readFeatures(data.values[0].jsonb_build_object);
			features.forEach(function (divisionFeature) {
				
				let divisionFeatureLayer = new ol.layer.Group({
					name: divisionLevel + '_division_feature',
					layers: [],
					properties: divisionFeature.values_,
					visible: visible
				});
				
				let divisionPolygonSource = new ol.source.Vector({
					features: [divisionFeature]
				});
				
				let divisionPolygonLayer = new ol.layer.Vector({
					name: divisionLevel + '_division_polygon',
					source: divisionPolygonSource,
					style: new ol.style.Style({
						fill: new ol.style.Fill({
			            	color: 'rgba(255, 255, 255, 1.0)'
//			            	color: 'rgba(255, 255, 255, 0.2)'
				        }),
						stroke: new ol.style.Stroke({
							color: 'rgba(211, 213, 229, 1.0)',
//							color: 'rgba(0, 0, 0, 1.0)',
							width: 2
						})
					}),
					zIndex: 10
				});
				
				let divisionLabelFeature = new ol.Feature({
					geometry: new ol.geom.Point(divisionFeature.get('centerPoint').coordinates),
				});
				
				divisionLabelFeature.values_.sd_cd = divisionFeature.get('sd_cd');
				divisionLabelFeature.values_.sd_nm = divisionFeature.get('sd_nm');
				
				if (divisionFeature.get('sgg_cd') != undefined) {
					divisionLabelFeature.values_.sgg_cd = divisionFeature.get('sgg_cd');
					divisionLabelFeature.values_.sgg_nm = divisionFeature.get('sgg_nm');
					
					if (divisionFeature.get('emd_cd') != undefined) {
						divisionLabelFeature.values_.emd_cd = divisionFeature.get('emd_cd');
						divisionLabelFeature.values_.emd_nm = divisionFeature.get('emd_nm');
					}
				}
				
				let divisionLabelSource = new ol.source.Vector({
					features: [divisionLabelFeature],
				});
				
				let x = undefined;
				let y = undefined;
				
				// 시도 행정구역 중 라벨 겹치는 부분 조정
				if (divisionLevel == 'sd') {
					if (divisionFeature.get('sd_cd') == 28) { // 인천광역시
						x = -10;
						y = 15;
					} else if (divisionFeature.get('sd_cd') == 41) { // 경기도
						y = 30;
					} else if (divisionFeature.get('sd_cd') == 43) { // 충청북도
						x = 20;
						y = -30;
					} else if (divisionFeature.get('sd_cd') == 44) { // 충청남도
						x = -30;
						y = -35;
					}
				}
				
				let divisionLabelLayer = new ol.layer.Vector({
					name: divisionLevel + '_division_label',
					source: divisionLabelSource,
					style: new ol.style.Style({
						text: new ol.style.Text({
							text: divisionFeature.get(divisionLevel+'_nm'),
							font: 'bold 12px Noto Sans KR',
							fill: new ol.style.Fill({
								color: 'rgba(0, 0, 0, 1.0)'
							}),
							stroke: new ol.style.Stroke({
								color: 'rgba(255, 255, 255, 1.0)',
								width: 2
							}),
							offsetX: x,
							offsetY: y,
							overflow: true
						})
					}),
					zIndex: 11,
					declutter: true
				});
				
				divisionFeatureLayer.getLayers().push(divisionPolygonLayer);
				divisionFeatureLayer.getLayers().push(divisionLabelLayer);
				
				divisionLayer.getLayers().push(divisionFeatureLayer);
				
				divisionFeature.changed();
				
				// 시도 레벨에서만 베이스 레이어 추가
				if (divisionLevel == 'sd') {
					let baseFeatureLayer = new ol.layer.Group({
						name: 'base_division_feature',
						layers: [],
						properties: divisionFeature.values_,
						visible: visible
					});
					
					let basePolygonLayer = new ol.layer.Vector({
						name: 'base_division_polygon',
						source: divisionPolygonSource,
						style: new ol.style.Style({
							fill: new ol.style.Fill({
				            	color: 'rgba(224, 226, 237, 1.0)'
	//			            	color: 'rgba(255, 255, 255, 0.2)'
					        }),
							stroke: new ol.style.Stroke({
								color: 'rgba(211, 213, 229, 1.0)',
	//							color: 'rgba(0, 0, 0, 1.0)',
								width: 2
							})
						}),
						zIndex: 5
					});
					
					let baseLabelLayer = new ol.layer.Vector({
						name: divisionLevel + '_division_label',
						source: divisionLabelSource,
						style: new ol.style.Style({
							text: new ol.style.Text({
								text: divisionFeature.get(divisionLevel+'_nm'),
								font: 'bold 20px Noto Sans KR',
								fill: new ol.style.Fill({
									color: 'rgba(0, 0, 0, 0.3)'
								}),
								stroke: new ol.style.Stroke({
									color: 'rgba(255, 255, 255, 1.0)',
									width: 2
								}),
								offsetX: x,
								offsetY: y,
								overflow: true
							})
						}),
						zIndex: 6,
						declutter: true
					});
					
					baseFeatureLayer.getLayers().push(basePolygonLayer);
					baseFeatureLayer.getLayers().push(baseLabelLayer);
					
					baseLayer.getLayers().push(baseFeatureLayer);
					
					baseLayer.changed();
				}
			});
			
			gisMap.addLayer(divisionLayer);
			
			// 시도 레벨에서만 베이스 레이어 추가
			if (divisionLevel == 'sd') {
				gisMap.addLayer(baseLayer);
			}
		}
	});
}

function divisionStyleSwitch(selectedFeature, level) {
	let layer;
	
	if (level == 'sd') {
		layer = sdLayer;
	} else if (level == 'sgg') {
		layer = sggLayer;
	} else {
		layer = emdLayer;
	}
	
	if (selectedFeature == undefined) {
		if (isStyleChanged == true) {
			layer.getLayers().array_.map(targetFeature => {
				divisionStyleReset(targetFeature, level);
			});
			isStyleChanged = false;
		}
	} else {
		layer.getLayers().array_.map(targetFeature => {
			if (targetFeature.get(level+'_cd') == selectedFeature.get(level+'_cd')) {
				divisionStyleChange(targetFeature, level);
			} else {
				divisionStyleReset(targetFeature, level);
			}
			isStyleChanged = true;
		});
	}
}

function divisionStyleChange(targetFeature, level) {
	let highlightStyle = new ol.style.Style({
		fill: new ol.style.Fill({
	    	color: 'rgba(255, 255, 255, 0.2)'
	    }),
		stroke: new ol.style.Stroke({
			color: 'rgba(0, 0, 255, 1.0)',
			width: 5
		}),
		text: new ol.style.Text({
			font: 'bold 20px Spoqa',
			fill: new ol.style.Fill({
				color: 'rgba(0, 0, 255, 1.0)'
			}),
			stroke: new ol.style.Stroke({
				color: 'rgba(255, 255, 255, 1.0)',
				width: 2
			}),
			overflow: true
		})
	});

	targetFeature.getLayers().array_[0].values_.zIndex = 100;
	targetFeature.getLayers().array_[1].values_.zIndex = 101;
	targetFeature.getLayers().array_[0].setStyle(highlightStyle);
	targetFeature.getLayers().array_[1].style_.text_.text_ = targetFeature.get(level+'_nm');
	targetFeature.getLayers().array_[1].style_.text_.font_ = highlightStyle.text_.font_;
	targetFeature.getLayers().array_[1].style_.text_.fill_ = highlightStyle.text_.fill_;
	targetFeature.getLayers().array_[1].style_.text_.stroke_ = highlightStyle.text_.stroke_;
	
	targetFeature.getLayers().array_[0].changed();
	targetFeature.getLayers().array_[1].changed();
}

function divisionStyleReset(targetFeature, level) {
	let baseStyle = new ol.style.Style({
		fill: new ol.style.Fill({
	    	color: 'rgba(255, 255, 255, 1.0)'
	    }),
		stroke: new ol.style.Stroke({
			color: 'rgba(0, 0, 0, 1.0)',
			width: 2
		}),
		text: new ol.style.Text({
			font: 'bold 12px Noto Sans KR',
			fill: new ol.style.Fill({
				color: 'rgba(0, 0, 0, 1.0)'
//				color: 'rgba(255, 255, 255, 1.0)'
			}),
			stroke: new ol.style.Stroke({
				color: 'rgba(255, 255, 255, 1.0)',
//				color: 'rgba(0, 0, 0, 1.0)',
				width: 2	
			}),
			overflow: true
		})
	});
	
	targetFeature.getLayers().array_[0].values_.zIndex = 10;
	targetFeature.getLayers().array_[1].values_.zIndex = 11;
	targetFeature.getLayers().array_[0].setStyle(baseStyle);
	targetFeature.getLayers().array_[1].style_.text_.text_ = targetFeature.get(level+'_nm');
	targetFeature.getLayers().array_[1].style_.text_.font_ = baseStyle.text_.font_;
	targetFeature.getLayers().array_[1].style_.text_.fill_ = baseStyle.text_.fill_;
	targetFeature.getLayers().array_[1].style_.text_.stroke_ = baseStyle.text_.stroke_;
	
	targetFeature.getLayers().array_[0].changed();
	targetFeature.getLayers().array_[1].changed();
}

function addSdSelect() {
	$.ajax({
		type: 'GET',
		url: '/getSdList.do',
		dataType: 'json',
        success: function (data) {
			$('.sdSelect').html('');
			$('.sdSelect').append('<option value="sd">시도 선택</option>');
			$('.sggSelect').html('');
			$('.sggSelect').append('<option value="sgg">시군구 선택</option>');
        	data.values.map(t => {
        		$('.sdSelect').append('<option value="' + t.sd_cd + '">' + t.sd_nm + '</option>');
        	});
        }
    });
}

function addSggSelect(sd_cd, mode) {
	$.ajax({
		type: 'GET',
		url: '/getSggList.do',
		data: {'sd_cd' : sd_cd},
		dataType: 'json',
		success: function (data) {
			$('#sggSelect-' + mode).html('');
			$('#sggSelect-' + mode).append('<option value="sgg">시군구 선택</option>');
			data.values.map(t => {
				$('#sggSelect-' + mode).append('<option value="' + t.sgg_cd + '">' + t.sgg_nm + '</option>');
			});
		}
	});
}

function addEmdSelect(sgg_cd) {
	$.ajax({
		type: 'GET',
		url: '/getEmdList.do',
		data: {'sgg_cd' : sgg_cd},
		dataType: 'json',
		success: function (data) {
			data.values.map(t => {
				$('#emdList').append('<li class="option-list__item" id="' + t.emd_cd + '" onclick="emdFunction(this.id)">' + t.emd_nm + '</li>');
				$('#emdDivisionSelect .label').attr('disabled', false);
			});
		}
	});
}

function addInfectionSelect(val, mode) {
	$.ajax({
		type: 'GET',
		url: '/getInfectionDiseaseList.do',
		dataType: 'json',
		success: function (data) {
			$('#infectionSelect-' + mode).html('');
			$('#infectionSelect-' + mode).append('<option value="infection">감염병 선택</option>');
			data.values.map(t => {
				if (t.gb == val) {
					$('#infectionSelect-' + mode).append('<option value="' + t.infdisid + '">' + t.gb + ' ' + t.infdisnm + '</option>');
				}
			});
		}
	});
}

function checkInfectionSelect(elem) {
	$('.infectionList li').removeClass('checked');
	$(elem).addClass('checked');
}

function sdFunction(value, mode) {
	resetLayer([mode]);
	switchLegend(false, mode);
	$('#select-before-box-' + mode).show();
	$('#tbl-wrap-' + mode).hide();
	
	// 셀렉트 박스에서 시도 전체 선택할 때
	if (value == 'sd') {
		
		// 기존에 표시되어 있는 레이어 숨김 / 읍면동 레이어 스타일 초기화
		switchLegend(false, mode);
		hideDivisionLayer(sggLayer);
		hideDivisionLayer(emdLayer);
		if (emdLayer) {
			emdLayer.getLayers().array_.map(targetFeature => {
				divisionStyleReset(targetFeature, 'emd');
			});
		}
		
		// 시군구/읍면동 -> 시도 레벨 변경
		gisMap.currentDivisionLevel = 'sd';
		
		// 한국 전체 범위로 화면 이동
		viewAnimate();
		
		// 전체 시도 레이어 표시
		showDivisionLayer(sdLayer);
		
		// 시도 셀렉트 박스를 시도 전체로 변경
		$('.sdSelect').val('sd').prop("selected", true);
		
		// 유동 인구 탭의 시군구 셀렉트 박스 초기화
		$('.sggSelect').html('');
		$('.sggSelect').append('<option value="sgg">시군구 선택</option>');
		
	// 셀렉트 박스에서 특정 시도 선택할 때
	} else {

		// 기존에 표시되어 있는 레이어 숨김 / 읍면동 레이어 스타일 초기화
		hideDivisionLayer(sdLayer);
		hideDivisionLayer(sggLayer);
		hideDivisionLayer(emdLayer);
		if (emdLayer) {
			emdLayer.getLayers().array_.map(targetFeature => {
				divisionStyleReset(targetFeature, 'emd');
			});
		}
		
		// 시군구 셀렉트 박스에 내용 추가
		addSggSelect(value, mode);
		
		// 시도 -> 시군구 레벨 변경
		gisMap.currentDivisionLevel = 'sgg';
		
		// 선택한 시도 범위로 화면 이동
		viewAnimate(sdLayer, value, 'sd');
		
		// 선택한 시도에 포함되어 있는 시군구 레이어 표시
		showDivisionLayer(sggLayer, value, 'sd');
	}
}

function sggFunction(value, mode) {
	resetLayer([mode]);
	switchLegend(false, mode);
	$('#select-before-box-' + mode).show();
	$('#tbl-wrap-' + mode).hide();
	
	// 셀렉트 박스에서 시군구 전체 선택할 때
	if (value == 'sgg') {
		
		// 기존에 표시되어 있는 레이어 숨김 / 읍면동 레이어 스타일 초기화
		switchLegend(false, mode);
		hideDivisionLayer(emdLayer);
		emdLayer.getLayers().array_.map(targetFeature => {
			divisionStyleReset(targetFeature, 'emd');
		});
		
		// 읍면동 -> 시군구 레벨 변경
		gisMap.currentDivisionLevel = 'sgg';
		
		// 마지막으로 선택한 시군구 레이어 범위로 화면 이동
		viewAnimate(sdLayer, lastSdCd, 'sd');
		
		// 마지막으로 선택한 시군구에 포함되어 있는 읍면동 레이어 표시
		showDivisionLayer(sggLayer, lastSdCd, 'sd');
		
		// 시군구 셀렉트 박스를 시군구 전체로 변경
		$('.sggSelect').val('sgg').prop("selected", true);
		
	// 셀렉트 박스에서 특정 시군구 선택할 때
	} else {

		// 기존에 표시되어 있는 레이어 숨김 / 읍면동 레이어 스타일 초기화
		hideDivisionLayer(sggLayer);
		hideDivisionLayer(emdLayer);
		emdLayer.getLayers().array_.map(targetFeature => {
			divisionStyleReset(targetFeature, 'emd');
		});
		
		// 읍면동 셀렉트 박스에 내용 추가
//		addEmdSelect(value);
		
		// 시군구 -> 읍면동 레벨 변경
		gisMap.currentDivisionLevel = 'emd';
		
		// 선택한 시군구 레이어 범위로 화면 이동
		viewAnimate(sggLayer, value, 'sgg');
		
		// 선택한 시군구에 포함되어 있는 읍면동 레이어 표시
		showDivisionLayer(emdLayer, value, 'sgg');
		
		// 읍면동 셀렉트 박스 초기화
		$('#emdDivisionSelect').children('option:not(:first)').remove();
	}
}

function emdFunction(value) {
	emdLayer.getLayers().array_.map(targetFeature => {
		if (targetFeature.get('value') == value) {
			divisionStyleChange(targetFeature, 'emd');
		} else {
			divisionStyleReset(targetFeature, 'emd');
		}
	});
}

function gradeFunction(value, mode1, mode2) {
	resetLayer([mode1]);
	switchLegend(false, 'infection');
	$('.infection-name').remove();
	$('.infection-count').remove();
		
	if (value == 'grade') {
		$('#infectionSelect-' + mode2).html('');
		$('#infectionSelect-' + mode2).append('<option value="infection">감염병 선택</option>');
	} else {
		addInfectionSelect(value, mode2)
	}
}

function infectionFunction(value, mode) {
	resetLayer([mode]);
	switchLegend(false, 'infection');
	$('.infection-name').remove();
	$('.infection-count').remove();
}

function viewAnimate(layer, cd, level) {
	/*
		- layer : 화면 이동에 사용할 레이어 (sdLayer, sggLayer, emdLayer)
		- 화면 이동할 지역 코드 (시도 2자리, 시군구 5자리, 읍면동 10자리)
		- 레이어가 해당되는 레벨 ('sd', 'sgg', 'emd')
	
		- layer, cd, level 전부 같은 레벨
			ex - (sdLayer, 11, 'sd')
			ex - (sggLayer, 11110, 'sgg')
			ex - (emdLayer, 1111055000, 'emd')
	*/

	// 마지막으로 선택된 시도 코드 저장
	if (level == 'sd') {
		lastSdCd = cd;
	}
	
	if (gisMap.currentMode != 'movement') { // 유동 인구수 모드에서는 카메라 이동 적용 안함
		let zoom;
		let center;
		
		// 화면 이동 시 피쳐 크기에 맞게 줌 범위 자동 계산
		if (layer) {
			layer.getLayers().array_.map(t1 => {
				if (t1.get(level+'_cd') == cd) {
					t1.getLayers().array_.map(t2 => {
						if (t2.get('name').includes('polygon')) {
							let extent = t2.getSource().getFeatures()[0].getGeometry().getExtent();
							let resolution = view.getResolutionForExtent(extent);
							zoom = Math.floor(view.getZoomForResolution(resolution));
							center = ol.extent.getCenter(extent);
						} 
					});
				}
			});
		} else {
			// 기본 한국 전체 범위
			zoom = 7;
			center = new ol.geom.Point([127.90169, 35.75421]).transform('EPSG:4326', 'EPSG:3857').getCoordinates();
		}
		
		// 화면 이동
		gisMap.getView().animate({
			zoom: zoom,
			center: center,
			duration: 800,
		});
	}
}

function showDivisionLayer(layer, cd, level) {
	/*
		- layer : 레이어 표시에 사용할 레이어 (sdLayer, sggLayer, emdLayer)
		- cd : 표시할 레이어를 포함하고 있는 상위 지역 코드 (시도 2자리, 시군구 5자리)
		- level : 표시할 레이어의 상위 레벨 ('sd', 'sgg')
		
		- layer는 cd, level보다 한 단계 낮은 레벨이고 cd, level은 같은 레벨
			ex - (sggLayer, 11, 'sd')
			ex - (emdLayer, 11110, 'sgg')
		- 시도 레이어의 경우 전체가 표시되는 경우만 있으므로 layer만 파라미터로 받으면 됨
	*/
	
	// 선택한 레이어에 포함되어 있는 하위 레이어 표시
	if (layer) {
		layer.getLayers().array_.map(t => {
			if (cd) {
				if (t.get(level+'_cd') == cd) {
					t.setVisible(true);
				}
			} else {
				t.setVisible(true);
			}
		});
	}
}

function hideDivisionLayer(layer) {
	if (layer) {
		layer.getLayers().array_.map(t => {
			t.setVisible(false);
		});
	}
}

function resetLayer(layerNameArr) {
	// 범례창 off
//	switchDensityLegend(false);
//	switchMovementLegend(false);
//	switchInfectionLegend(false);
	
	for (let i = 0; i < layerNameArr.length; i++) {
		let layerName = layerNameArr[i] 
		
		// 레이어 삭제
		for (let j = gisMap.getLayers().array_.length-1; j >= 0; j--) {
			let layer = gisMap.getLayers().array_[j];
			
			if (layer.values_.name.includes(layerName)) {
				gisMap.removeLayer(layer);
			}
		}
		
		if (layerName != 'infection') {
			// 마우스무브 관련 객체들삭제
			if (gisMap.popup != undefined) {
				gisMap.popup.innerHTML = '';
			}
			
			// 마우스 이벤트 초기화
			mouseEventArr.map(t => {
				ol.Observable.unByKey(t);
			});
			mouseEventArr = [];
		}
	}
}

function getCurrentDate() {
	let dateVal = $("#datepicker-" + gisMap.currentMode).val();
	
	let currDate = dateVal.split('-')[0] + dateVal.split('-')[1];
	
	if (dateVal.split('-')[2]) {
		currDate = dateVal.split('-')[0] + dateVal.split('-')[1] + dateVal.split('-')[2];
	}

	return currDate;
}

function numToStr(num) {
	let result = Number(num).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	return result;
}

function render() {
	gisMap.render();
	gisMap.renderSync();
}

function switchLegend(bool, mode) {
	if (bool == true) {
		$("#legend-" + mode).show();
	} else {
		$("#legend-" + mode).hide();
	}
}