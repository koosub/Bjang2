let globalDensityLayer;

function addDensity(sd_cd) {
	viewAnimate(sdLayer, sd_cd, 'sd');
	
	let currentDate = getCurrentDate();
	
	$.ajax({
		type: 'GET',
		url: '/getPopulationDensity.do',
		data: {
			'vst_ymd' : currentDate,
			'sd_cd' : sd_cd,
		},
		dataType: 'json',
		success: function (data) {
			resetLayer(['density']);
			switchLegend(true, 'density');
			switchLegend(false, 'movement');
			
			hideDivisionLayer(sdLayer);
			hideDivisionLayer(sggLayer);
			hideDivisionLayer(emdLayer);
			
			let densityLayer = new ol.layer.Group({
				name: 'density',
				layers: [],
			});
			globalDensityLayer = densityLayer;
				
			let features = (new ol.format.GeoJSON()).readFeatures(data.values[0].jsonb_build_object);
			features.forEach(function (densityFeature) {
				
				let densityFeatureLayer = new ol.layer.Group({
					name: 'density_feature_emd_' + densityFeature.get('emd_cd'),
					layers: [],
					properties: densityFeature.values_,
				});
				
				let mSum = 
					densityFeature.get('m1') +
					densityFeature.get('m2') +
					densityFeature.get('m3') +
					densityFeature.get('m4') +
					densityFeature.get('m5') +
					densityFeature.get('m6') +
					densityFeature.get('m7');
				let fSum = 
					densityFeature.get('f1') +
					densityFeature.get('f2') +
					densityFeature.get('f3') +
					densityFeature.get('f4') +
					densityFeature.get('f5') +
					densityFeature.get('f6') +
					densityFeature.get('f7');
				
				let t1 = densityFeature.get('m1') + densityFeature.get('f1');
				let t2 = densityFeature.get('m2') + densityFeature.get('f2');
				let t3 = densityFeature.get('m3') + densityFeature.get('f3');
				let t4 = densityFeature.get('m4') + densityFeature.get('f4');
				let t5 = densityFeature.get('m5') + densityFeature.get('f5');
				let t6 = densityFeature.get('m6') + densityFeature.get('f6');
				let t7 = densityFeature.get('m7') + densityFeature.get('f7');
				let tSum = mSum + fSum;
				
				densityFeature.setProperties({'mSum' : mSum});
				densityFeature.setProperties({'fSum' : fSum});
				densityFeature.setProperties({'t1' : t1});
				densityFeature.setProperties({'t2' : t2});
				densityFeature.setProperties({'t3' : t3});
				densityFeature.setProperties({'t4' : t4});
				densityFeature.setProperties({'t5' : t5});
				densityFeature.setProperties({'t6' : t6});
				densityFeature.setProperties({'t7' : t7});
				densityFeature.setProperties({'tSum' : tSum});
				densityFeature.setProperties({'type' : 'density'});
				
				let densityGeometrySource = new ol.source.Vector({
					features: [densityFeature],
				});
				
				let densityGeometryLayer = new ol.layer.Vector({
					name: 'density_geometry',
					source: densityGeometrySource,
					style: new ol.style.Style({
						fill: new ol.style.Fill({
							color: getDensityColor(tSum)
						}),
						stroke: new ol.style.Stroke({
							color: 'rgba(211, 213, 229, 1.0)',
//							color: 'rgba(0, 0, 0, 1.0)',
							width: 1
						}),
					}),
					zIndex: 30,
				});
				
				let densityLabelFeature = new ol.Feature({
					geometry: new ol.geom.Point(densityFeature.get('centerPoint').coordinates),
				});
				densityLabelFeature.setProperties({'centerPoint' : densityFeature.get('centerPoint')});
				densityLabelFeature.setProperties({'sd_cd' : densityFeature.get('sd_cd')});
				densityLabelFeature.setProperties({'sd_nm' : densityFeature.get('sd_nm')});
				densityLabelFeature.setProperties({'sgg_cd' : densityFeature.get('sgg_cd')});
				densityLabelFeature.setProperties({'sgg_nm' : densityFeature.get('sgg_nm')});
				densityLabelFeature.setProperties({'emd_cd' : densityFeature.get('emd_cd')});
				densityLabelFeature.setProperties({'emd_nm' : densityFeature.get('emd_nm')});
				densityLabelFeature.setProperties({'m1' : densityFeature.get('m1')});
				densityLabelFeature.setProperties({'m2' : densityFeature.get('m2')});
				densityLabelFeature.setProperties({'m3' : densityFeature.get('m3')});
				densityLabelFeature.setProperties({'m4' : densityFeature.get('m4')});
				densityLabelFeature.setProperties({'m5' : densityFeature.get('m5')});
				densityLabelFeature.setProperties({'m6' : densityFeature.get('m6')});
				densityLabelFeature.setProperties({'m7' : densityFeature.get('m7')});
				densityLabelFeature.setProperties({'mSum' : mSum});
				densityLabelFeature.setProperties({'f1' : densityFeature.get('f1')});
				densityLabelFeature.setProperties({'f2' : densityFeature.get('f2')});
				densityLabelFeature.setProperties({'f3' : densityFeature.get('f3')});
				densityLabelFeature.setProperties({'f4' : densityFeature.get('f4')});
				densityLabelFeature.setProperties({'f5' : densityFeature.get('f5')});
				densityLabelFeature.setProperties({'f6' : densityFeature.get('f6')});
				densityLabelFeature.setProperties({'f7' : densityFeature.get('f7')});
				densityLabelFeature.setProperties({'fSum' : fSum});
				densityLabelFeature.setProperties({'t1' : t1});
				densityLabelFeature.setProperties({'t2' : t2});
				densityLabelFeature.setProperties({'t3' : t3});
				densityLabelFeature.setProperties({'t4' : t4});
				densityLabelFeature.setProperties({'t5' : t5});
				densityLabelFeature.setProperties({'t6' : t6});
				densityLabelFeature.setProperties({'t7' : t7});
				densityLabelFeature.setProperties({'tSum' : tSum});
				densityLabelFeature.setProperties({'type' : 'density'});
				
				let densityLabelSource = new ol.source.Vector({
					features: [densityLabelFeature],
				});
				
				let densityLabelLayer = new ol.layer.Vector({
					name: 'density_label',
					source: densityLabelSource,
					style: new ol.style.Style({
						text: new ol.style.Text({
							text: densityFeature.get('emd_nm'),
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
						}),
					}),
					minZoom: 6,
					maxZoom: 19,
					zIndex: 31,
					declutter: true
				});
				
				densityFeatureLayer.getLayers().push(densityGeometryLayer);
				densityFeatureLayer.getLayers().push(densityLabelLayer);
				
				densityLayer.getLayers().push(densityFeatureLayer);
				
				densityFeature.changed();
			});
			
			gisMap.addLayer(densityLayer);
			
			populationDensityMouseEvent();
		}
	});
}

function populationDensityMouseEvent() {
	let clickedFeature;
	let populationDensityClick = gisMap.on('click', function(e) {
		gisMap.forEachFeatureAtPixel(e.pixel, function (feature) {
			let value = feature.getProperties();
			
			if (value) {
				if (value.type == 'density') {
					
					if (clickedFeature != undefined) {
						clickedFeature = undefined;
			        }
					
					let feature = gisMap.forEachFeatureAtPixel(gisMap.getEventPixel(e.originalEvent), function(feature) {
						return feature;
			        });
					
					if (feature.values_.type == 'density') {
						$('#select-before-box-density').hide();
						$('#tbl-wrap-density').show();
					
						clickedFeature = feature;
						
						let coordinate = feature.get('centerPoint').coordinates;
			
						gisMap.getView().animate({
							zoom: gisMap.getView().getZoom(),
							center: coordinate,
							duration: 0,
						});
						
						globalDensityLayer.getLayers().array_.map(t => {
							if (t.get('emd_cd') == clickedFeature.get('emd_cd')) {
								t.getLayers().array_[0].values_.zIndex = 100;
								t.getLayers().array_[0].style_.stroke_.color_ = 'rgba(255, 0, 0, 1.0)';
								t.getLayers().array_[0].style_.stroke_.width_ = 5;
								t.getLayers().array_[1].style_.text_.font_ = 'bold 20px Spoqa';
								t.getLayers().array_[1].style_.text_.fill_.color_ = 'rgba(255, 0, 0, 1.0)';
								t.getLayers().array_[1].style_.text_.stroke_.color_ = 'rgba(255, 255, 255, 1.0)';
								qq = t.getLayers().array_[1];
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
						
						let elem = $('#tbl-wrap-density');
						let html =
							'<p class="address">' +
								clickedFeature.get('sd_nm') + ' ' + clickedFeature.get('sgg_nm') + ' ' + clickedFeature.get('emd_nm') +
							'</p>' +
							'<p class="status-num">' +
								'총 방문자 수 : <span>' + numToStr(clickedFeature.get('tSum')) + ' 명</span>' +
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
	mouseEventArr.push(populationDensityClick);
}

function getDensityColor(tSum) {
	let result;
	
//	신규 색상
//	if (tSum == 0) {
//		result = '#999eb2';
//	} else if (tSum > 0 && tSum <= 200000) {
//		result = '#2000ad';
//	} else if (tSum > 200000 && tSum <= 400000) {
//		result = '#4db5f9';
//	} else if (tSum > 400000 && tSum <= 600000) {
//		result = '#a6d96a';
//	} else if (tSum > 600000 && tSum <= 800000) {
//		result = '#fee08b';
//	} else if (tSum > 800000 && tSum <= 1000000) {
//		result = '#fdae61';
//	} else {
//		result = '#a50026';
//	}
	
//	리뉴얼 색상
	if (tSum == 0) {
		result = '#999eb2';
	} else if (tSum > 0 && tSum <= 200000) {
		result = '#EBE5FF';
	} else if (tSum > 200000 && tSum <= 400000) {
		result = '#D8D3FF';
	} else if (tSum > 400000 && tSum <= 600000) {
		result = '#BEB2FF';
	} else if (tSum > 600000 && tSum <= 800000) {
		result = '#AA9FFF';
	} else if (tSum > 800000 && tSum <= 1000000) {
		result = '#9284FF';
	} else {
		result = '#806FFF';
	}
	
//	기존 색상
//	if (tSum == 0) {
//		result = '#999eb2';
//	} else if (tSum > 0 && tSum <= 200000) {
//		result = '#C1D2DE';
//	} else if (tSum > 200000 && tSum <= 400000) {
//		result = '#8EC3DB';
//	} else if (tSum > 400000 && tSum <= 600000) {
//		result = '#62A1CA';
//	} else if (tSum > 600000 && tSum <= 800000) {
//		result = '#307EBC';
//	} else if (tSum > 800000 && tSum <= 1000000) {
//		result = '#145DAA';
//	} else {
//		result = '#0D2F65';
//	}
	
	return result;
}