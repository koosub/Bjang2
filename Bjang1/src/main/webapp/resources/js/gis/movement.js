let startSdNm;
let startSggNm;
let globalMovementEndLayer;

function addMovement(startSggCd) {
	gisMap.getView().animate({
		zoom: 7,
		center: new ol.geom.Point([127.90169, 35.75421]).transform('EPSG:4326', 'EPSG:3857').getCoordinates(),
		duration: 800,
	});
	
	let currentDate = getCurrentDate();
	
	$.ajax({
		type: 'GET',
		url: '/getPopulationMovement.do',
		data: {
			'vst_ymd' : currentDate,
			'sgg_cd' : startSggCd,
		},
		dataType: 'json',
		success: function (data) {
			resetLayer(['movement']);
			switchLegend(false, 'density');
			switchLegend(true, 'movement');
			
			hideDivisionLayer(sggLayer);
			hideDivisionLayer(emdLayer);
			
			let movementStartLayer = new ol.layer.Group({
				name: 'movement_start',
				layers: [],
			});
			
			let movementEndLayer = new ol.layer.Group({
				name: 'movement_end',
				layers: [],
			});
			globalMovementEndLayer = movementEndLayer;
			
			let startFeatures = (new ol.format.GeoJSON()).readFeatures(data.start[0].jsonb_build_object);
			startFeatures.forEach(function (movementStartFeature) {
				
				let movementStartFeatureLayer = new ol.layer.Group({
					name: 'movement_start_feature_sgg_' + movementStartFeature.get('startSggCd'),
					layers: [],
					properties: movementStartFeature.values_,
				});
				
				movementStartFeature.setProperties({'type' : 'movement_start'});
				
				let movementStartGeometrySource = new ol.source.Vector({
					features: [movementStartFeature],
				});
				
				let movementStartGeometryLayer = new ol.layer.Vector({
					name: 'movement_start_geometry',
					source: movementStartGeometrySource,
					style: new ol.style.Style({
						fill: new ol.style.Fill({
							color: 'rgba(188, 111, 255, 1.0)',
//							color: 'rgba(240, 240, 0, 1.0)',
						}),
						stroke: new ol.style.Stroke({
							color: 'rgba(211, 213, 229, 1.0)',
//							color: 'rgba(0, 0, 0, 1.0)',
							width: 1
						}),
					}),
					zIndex: 30,
				});
				
				let movementStartLabelFeature = new ol.Feature({
					geometry: new ol.geom.Point(movementStartFeature.get('startCenterPoint').coordinates),
				});
				movementStartLabelFeature.setProperties(movementStartFeature.getProperties());
				movementStartLabelFeature.setProperties({'type' : 'movement_start'});
				
				let movementStartLabelSource = new ol.source.Vector({
					features: [movementStartLabelFeature],
				});
				
				let movementStartLabelLayer = new ol.layer.Vector({
					name: 'movement_start_label',
					source: movementStartLabelSource,
					style: new ol.style.Style({
						text: new ol.style.Text({
							text: movementStartFeature.get('startSggNm'),
							font: 'bold 12px Noto Sans KR',
							fill: new ol.style.Fill({
								color: 'rgba(0, 0, 0, 1.0)'
//								color: 'rgba(255, 255, 255, 1.0)'
							}),
							stroke: new ol.style.Stroke({
								color: 'rgba(255, 255, 255, 1.0)',
//								color: 'rgba(0, 0, 0, 1.0)',
								width: 2
							}),
							overflow: true
						})
					}),
					zIndex: 31, // label에 declutter 옵션 사용하면 zIndex 무효
					declutter: true
				});
				
				movementStartFeatureLayer.getLayers().push(movementStartGeometryLayer);
				movementStartFeatureLayer.getLayers().push(movementStartLabelLayer);
				
				movementStartLayer.getLayers().push(movementStartFeatureLayer);
				
				startSdNm = movementStartFeature.get('startSdNm');
				startSggNm = movementStartFeature.get('startSggNm');
				
				movementStartFeature.changed();
			});
			
			let endFeatures = (new ol.format.GeoJSON()).readFeatures(data.end[0].jsonb_build_object);
			endFeatures.forEach(function (movementEndFeature) {
				
				let movementEndFeatureLayer = new ol.layer.Group({
					name: 'movement_end_feature_sgg_' + movementEndFeature.get('endSggCd'),
					layers: [],
					properties: movementEndFeature.values_,
				});

				if (movementEndFeature.get('endSggCd') != startSggCd) {
					
					let mSum = 
						movementEndFeature.get('m1') +
						movementEndFeature.get('m2') +
						movementEndFeature.get('m3') +
						movementEndFeature.get('m4') +
						movementEndFeature.get('m5') +
						movementEndFeature.get('m6') +
						movementEndFeature.get('m7');
					let fSum = 
						movementEndFeature.get('f1') +
						movementEndFeature.get('f2') +
						movementEndFeature.get('f3') +
						movementEndFeature.get('f4') +
						movementEndFeature.get('f5') +
						movementEndFeature.get('f6') +
						movementEndFeature.get('f7');
					
					let t1 = movementEndFeature.get('m1') + movementEndFeature.get('f1');
					let t2 = movementEndFeature.get('m2') + movementEndFeature.get('f2');
					let t3 = movementEndFeature.get('m3') + movementEndFeature.get('f3');
					let t4 = movementEndFeature.get('m4') + movementEndFeature.get('f4');
					let t5 = movementEndFeature.get('m5') + movementEndFeature.get('f5');
					let t6 = movementEndFeature.get('m6') + movementEndFeature.get('f6');
					let t7 = movementEndFeature.get('m7') + movementEndFeature.get('f7');
					let tSum = mSum + fSum;
					
					movementEndFeature.setProperties({'mSum' : mSum});
					movementEndFeature.setProperties({'fSum' : fSum});
					movementEndFeature.setProperties({'t1' : t1});
					movementEndFeature.setProperties({'t2' : t2});
					movementEndFeature.setProperties({'t3' : t3});
					movementEndFeature.setProperties({'t4' : t4});
					movementEndFeature.setProperties({'t5' : t5});
					movementEndFeature.setProperties({'t6' : t6});
					movementEndFeature.setProperties({'t7' : t7});
					movementEndFeature.setProperties({'tSum' : tSum});
					movementEndFeature.setProperties({'type' : 'movement_end'});
					
					let movementEndGeometrySource = new ol.source.Vector({
						features: [movementEndFeature],
					});
					
					let movementEndGeometryLayer = new ol.layer.Vector({
						name: 'movement_end_geometry',
						source: movementEndGeometrySource,
						style: new ol.style.Style({
							fill: new ol.style.Fill({
								color: getMovementColor(tSum),
							}),
							stroke: new ol.style.Stroke({
								color: 'rgba(211, 213, 229, 1.0)',
//								color: 'rgba(0, 0, 0, 1.0)',
								width: 1
							}),
						}),
						zIndex: 30,
					});
					
					let movementEndLabelFeature = new ol.Feature({
						geometry: new ol.geom.Point(movementEndFeature.get('endCenterPoint').coordinates),
					});
					movementEndLabelFeature.setProperties({'endCenterPoint' : movementEndFeature.get('endCenterPoint')});
					movementEndLabelFeature.setProperties({'endSdCd' : movementEndFeature.get('endSdCd')});
					movementEndLabelFeature.setProperties({'endSdNm' : movementEndFeature.get('endSdNm')});
					movementEndLabelFeature.setProperties({'endSggCd' : movementEndFeature.get('endSggCd')});
					movementEndLabelFeature.setProperties({'endSggNm' : movementEndFeature.get('endSggNm')});
					movementEndLabelFeature.setProperties({'m1' : movementEndFeature.get('m1')});
					movementEndLabelFeature.setProperties({'m2' : movementEndFeature.get('m2')});
					movementEndLabelFeature.setProperties({'m3' : movementEndFeature.get('m3')});
					movementEndLabelFeature.setProperties({'m4' : movementEndFeature.get('m4')});
					movementEndLabelFeature.setProperties({'m5' : movementEndFeature.get('m5')});
					movementEndLabelFeature.setProperties({'m6' : movementEndFeature.get('m6')});
					movementEndLabelFeature.setProperties({'m7' : movementEndFeature.get('m7')});
					movementEndLabelFeature.setProperties({'mSum' : mSum});
					movementEndLabelFeature.setProperties({'f1' : movementEndFeature.get('f1')});
					movementEndLabelFeature.setProperties({'f2' : movementEndFeature.get('f2')});
					movementEndLabelFeature.setProperties({'f3' : movementEndFeature.get('f3')});
					movementEndLabelFeature.setProperties({'f4' : movementEndFeature.get('f4')});
					movementEndLabelFeature.setProperties({'f5' : movementEndFeature.get('f5')});
					movementEndLabelFeature.setProperties({'f6' : movementEndFeature.get('f6')});
					movementEndLabelFeature.setProperties({'f7' : movementEndFeature.get('f7')});
					movementEndLabelFeature.setProperties({'fSum' : fSum});
					movementEndLabelFeature.setProperties({'t1' : t1});
					movementEndLabelFeature.setProperties({'t2' : t2});
					movementEndLabelFeature.setProperties({'t3' : t3});
					movementEndLabelFeature.setProperties({'t4' : t4});
					movementEndLabelFeature.setProperties({'t5' : t5});
					movementEndLabelFeature.setProperties({'t6' : t6});
					movementEndLabelFeature.setProperties({'t7' : t7});
					movementEndLabelFeature.setProperties({'tSum' : tSum});
					movementEndLabelFeature.setProperties({'type' : 'movement_end'});
					
					let movementEndLabelSource = new ol.source.Vector({
						features: [movementEndLabelFeature],
					});
					
					let movementEndLabelLayer = new ol.layer.Vector({
						name: 'movement_end_label',
						source: movementEndLabelSource,
						style: new ol.style.Style({
							text: new ol.style.Text({
								text: movementEndFeature.get('endSggNm'),
								font: 'bold 12px Noto Sans KR',
								fill: new ol.style.Fill({
									color: 'rgba(0, 0, 0, 1.0)',
//									color: 'rgba(255, 255, 255, 1.0)'
								}),
								stroke: new ol.style.Stroke({
									color: 'rgba(255, 255, 255, 1.0)',
//									color: 'rgba(0, 0, 0, 1.0)',
									width: 2
								}),
								overflow: true
							})
						}),
						zIndex: 31, // label에 declutter 옵션 사용하면 zIndex 무효
						declutter: true
					});
					
					movementEndFeatureLayer.getLayers().push(movementEndGeometryLayer);
					movementEndFeatureLayer.getLayers().push(movementEndLabelLayer);
					
					movementEndLayer.getLayers().push(movementEndFeatureLayer);
					
					movementEndFeature.changed();
				}
			});
			
			gisMap.addLayer(movementStartLayer);
			gisMap.addLayer(movementEndLayer);
			
			populationMovementMouseEvent();
		}
	});
}

function populationMovementMouseEvent() {
	let clickedFeature;
	let populationMovementClick = gisMap.on('click', function(e) {
		gisMap.forEachFeatureAtPixel(e.pixel, function (feature) {
			let value = feature.getProperties();

			if (value) {
				if (value.type == 'movement_end') {
					
					if (clickedFeature != undefined) {
						clickedFeature = undefined;
			        }
					
					let feature = gisMap.forEachFeatureAtPixel(gisMap.getEventPixel(e.originalEvent), function(feature) {
						return feature;
			        });
					
					if (feature.values_.type == 'movement_end') {
						$('#select-before-box-movement').hide();
						$('#tbl-wrap-movement').show();
						
						clickedFeature = feature;
						
						let coordinate = clickedFeature.get('endCenterPoint').coordinates;
						
						gisMap.getView().animate({
							zoom: gisMap.getView().getZoom(),
							center: coordinate,
							duration: 0,
						});
						
						globalMovementEndLayer.getLayers().array_.map(t => {
							if (t.get('endSggCd') == clickedFeature.get('endSggCd')) {
								t.getLayers().array_[0].values_.zIndex = 100;
								t.getLayers().array_[0].style_.stroke_.color_ = 'rgba(255, 0, 0, 1.0)';
								t.getLayers().array_[0].style_.stroke_.width_ = 5;
								t.getLayers().array_[1].style_.text_.font_ = 'bold 20px Spoqa';
								t.getLayers().array_[1].style_.text_.fill_.color_ = 'rgba(255, 0, 0, 1.0)';
								t.getLayers().array_[1].style_.text_.stroke_.color_ = 'rgba(255, 255, 255, 1.0)';
			
							} else {
								t.getLayers().array_[0].values_.zIndex = 30;
								t.getLayers().array_[0].style_.stroke_.color_ = 'rgba(211, 213, 229, 1.0)';
//								t.getLayers().array_[0].style_.stroke_.color_ = 'rgba(0, 0, 0, 1.0)';
								t.getLayers().array_[0].style_.stroke_.width_ = 1;
								t.getLayers().array_[1].style_.text_.font_ = 'bold 12px Noto Sans KR';
								t.getLayers().array_[1].style_.text_.fill_.color_ = 'rgba(0, 0, 0, 1.0)';
								t.getLayers().array_[1].style_.text_.stroke_.color_ = 'rgba(255, 255, 255, 1.0)';
//								t.getLayers().array_[1].style_.text_.fill_.color_ = 'rgba(255, 255, 255, 1.0)';
//								t.getLayers().array_[1].style_.text_.stroke_.color_ = 'rgba(0, 0, 0, 1.0)';
							}
						});
						
			//			"<div class='popupTextHighlight mb-4' style='color:#E3042D'>" + startSdNm + ' ' + startSggNm + "</div>" +
			//			"<div class='popupTextHighlight mb-4'>&nbsp;&nbsp;→&nbsp;&nbsp;</div>" +
			//			"<div class='popupTextHighlight mb-4' style='color:#209F9F'>" + clickedFeature.get('endSdNm') + " " + clickedFeature.get('endSggNm') + "</div>" + 
									
						let elem = $('#tbl-wrap-movement');
						let html =
							'<p class="path" style="display:inline; color:#a662e2;">' + startSdNm + ' ' + startSggNm + '</p>' +
							'<p class="path" style="display:inline;">&nbsp;&nbsp;→&nbsp;&nbsp;</p>' +
							'<p class="path" style="display:inline; color:#FF6448;">' + clickedFeature.get('endSdNm') + ' ' + clickedFeature.get('endSggNm') + '</p>' +
							'<p class="status-num">' +
								'총 이동자 수 : <span>' + numToStr(clickedFeature.get('tSum')) + ' 명</span>' +
							'</p>' +
							'<table class="tbl-stats">' +
								'<colgroup>' +
									'<col>' +
									'<col>' +
									'<col>' +
									'<col>' +
								'</colgroup>' +
					        	'<thead>' +
						        	'<tr>' +
							        	'<th>연령</th>' +
										'<th>남성</th>' +
										'<th>여성</th>' +
										'<th>전체</th>' +
						        	'</tr>' +
					        	'</thead>' +
					        	'<tbody>' +
						        	'<tr>' +
										'<td>20세 미만</td>' +
										'<td>' + numToStr(clickedFeature.get('m1')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('f1')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('m1') + clickedFeature.get('m1')) + '</td>' +
									'</tr>' +
									'<tr>' +
										'<td>20대</td>' +
										'<td>' + numToStr(clickedFeature.get('m2')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('f2')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('m2') + clickedFeature.get('f2')) + '</td>' +
									'</tr>' +
									'<tr>' +
										'<td>30대</td>' +
										'<td>' + numToStr(clickedFeature.get('m3')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('f3')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('m3') + clickedFeature.get('f3')) + '</td>' +
									'</tr>' +
									'<tr>' +
										'<td>40대</td>' +
										'<td>' + numToStr(clickedFeature.get('m4')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('f4')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('m4') + clickedFeature.get('f4')) + '</td>' +
									'</tr>' +
									'<tr>' +
										'<td>50대</td>' +
										'<td>' + numToStr(clickedFeature.get('m5')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('f5')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('m5') + clickedFeature.get('f5')) + '</td>' +
									'</tr>' +
									'<tr>' +
										'<td>60대</td>' +
										'<td>' + numToStr(clickedFeature.get('m6')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('f6')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('m6') + clickedFeature.get('f6')) + '</td>' +
									'</tr>' +
									'<tr>' +
										'<td>70세 이상</td>' +
										'<td>' + numToStr(clickedFeature.get('m7')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('f7')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('m7') + clickedFeature.get('f7')) + '</td>' +
									'</tr>' +
					        	'</tbody>' +
					        	'<tfoot>' +
									'<tr>' +
										'<td>합계</td>' +
										'<td>' + numToStr(clickedFeature.get('mSum')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('fSum')) + '</td>' +
										'<td>' + numToStr(clickedFeature.get('tSum')) + '</td>' +
									'</tr>' +
					        	'</tfoot>' +
							'</table>'
						;
						elem.html(html);
					}
				}
			}
		});
	});
	mouseEventArr.push(populationMovementClick);
}

function getMovementColor(tSum) {
	let result;
	
//	신규 색상
//	if (tSum == 0) {
//		result = '#999eb2';
//	} else if (tSum  > 0 && tSum <= 50) {
//		result = '#2000ad';
//	} else if (tSum > 50 && tSum <= 100) {
//		result = '#3f61f9';
//	} else if (tSum > 100 && tSum <= 500) {
//		result = '#7fdce9';
//	} else if (tSum > 500 && tSum <= 1000) {
//		result = '#66bd63';
//	} else if (tSum > 1000 && tSum <= 2000) {
//		result = '#d9ef8b';
//	} else if (tSum > 2000 && tSum <= 5000) {
//		result = '#fee08b';
//	} else if (tSum > 5000 && tSum <= 10000) {
//		result = '#f46d43';
//	} else {
//		result = '#a50026';
//	}
	
//	리뉴얼 색상
	if (tSum == 0) {
		result = '#999eb2';
	} else if (tSum  > 0 && tSum <= 50) {
		result = '#FFEEEB';
	} else if (tSum > 50 && tSum <= 100) {
		result = '#FFDFD9';
	} else if (tSum > 100 && tSum <= 500) {
		result = '#FFD1C9';
	} else if (tSum > 500 && tSum <= 1000) {
		result = '#FFBEB2';
	} else if (tSum > 1000 && tSum <= 2000) {
		result = '#FFA798';
	} else if (tSum > 2000 && tSum <= 5000) {
		result = '#FF927E';
	} else if (tSum > 5000 && tSum <= 10000) {
		result = '#FF7D65';
	} else {
		result = '#FF6448';
	}
	
//	기존 색상
//	if (tSum == 0) {
//		result = '#808080';
//	} else if (tSum  > 0 && tSum <= 50) {
//		result = '#EDF7F7';
//	} else if (tSum > 50 && tSum <= 100) {
//		result = '#C8E4E4';
//	} else if (tSum > 100 && tSum <= 500) {
//		result = '#83C8C8';
//	} else if (tSum > 500 && tSum <= 1000) {
//		result = '#209F9F';
//	} else if (tSum > 1000 && tSum <= 2000) {
//		result = '#2D8A8A';
//	} else if (tSum > 2000 && tSum <= 5000) {
//		result = '#016363';
//	} else if (tSum > 5000 && tSum <= 10000) {
//		result = '#0B4242';
//	} else {
//		result = '#002929';
//	}
	
	return result;
}