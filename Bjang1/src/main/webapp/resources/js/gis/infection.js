let globalInfectionLayer;

function addInfection(infdisid) {
	gisMap.getView().animate({
		zoom: 7,
		center: new ol.geom.Point([127.90169, 35.75421]).transform('EPSG:4326', 'EPSG:3857').getCoordinates(),
		duration: 800,
	});
	
	let dateVal = $("#datepicker-infection-" + gisMap.currentMode).val();
	let currInfYear = Number(dateVal.split('-')[0]);
	let currInfMonth = Number(dateVal.split('-')[1]);
	let prevInfYear;
	let prevInfMonth;
	if (currInfMonth == 1) {
		if (currInfYear == 2019) {
			prevInfYear = currInfYear;
			prevInfMonth = currInfMonth;
		} else {
			prevInfYear = currInfYear - 1;
			prevInfMonth = 12;
		}
	} else {
		prevInfYear = currInfYear
		prevInfMonth = currInfMonth - 1;
	}

	$.ajax({
		type: 'GET',
		url: '/getInfectionDiseaseCount.do',
		data: {
//			'sd_cd' : sd_cd,
			'infdisid' : infdisid,
			'currInfYear' : currInfYear,
			'currInfMonth' : currInfMonth,
			'prevInfYear' : prevInfYear,
			'prevInfMonth' : prevInfMonth,
		},
		dataType: 'json',
		success: function (data) {
			resetLayer(['infection']);
			switchLegend(true, 'infection');
			
			let infectionLayer = new ol.layer.Group({
				name: 'infection',
				layers: [],
			});
			globalInfectionLayer = infectionLayer;
			
			let totalCount = 0;
			let infectionName;
			
			let features = (new ol.format.GeoJSON()).readFeatures(data.values[0].jsonb_build_object);
			features.forEach(function (infectionFeature) {

				let infectionFeatureLayer = new ol.layer.Group({
					name: 'infection_feature',
					layers: [],
					properties: infectionFeature.values_,
				});
				
				infectionFeature.setProperties({'type' : 'infection'});
				
				let infectionGeometryeSource = new ol.source.Vector({
					features: [infectionFeature],
				});
				
				let infectionGeometryLayer = new ol.layer.Vector({
					name: 'infection_geometry',
					source: infectionGeometryeSource,
					style: new ol.style.Style({
						image: new ol.style.Circle({
							radius: infectionFeature.get('count')/10+5,
							fill: new ol.style.Fill({
								color: getInfectionColor(infectionFeature.get('count'), infectionFeature.get('prevCount'))
						    }),
						    stroke: new ol.style.Stroke({
						    	color: 'rgba(211, 213, 229, 1.0)',
//						    	color: 'rgba(0, 0, 0, 1.0)',
						    	width: 1,
						    }),
						}),
					}),
					zIndex: 10000 - infectionFeature.get('count'),
				});
				
				let infectionLabelFeature = new ol.Feature({
					geometry: new ol.geom.Point(infectionFeature.get('centerPoint').coordinates),
				});
				infectionLabelFeature.setProperties({'centerPoint' : infectionFeature.get('centerPoint')});
				infectionLabelFeature.setProperties({'count' : infectionFeature.get('count')});
				infectionLabelFeature.setProperties({'gb' : infectionFeature.get('gb')});
				infectionLabelFeature.setProperties({'infdisid' : infectionFeature.get('infdisid')});
				infectionLabelFeature.setProperties({'infdisnm' : infectionFeature.get('infdisnm')});
				infectionLabelFeature.setProperties({'month' : infectionFeature.get('month')});
				infectionLabelFeature.setProperties({'prevCount' : infectionFeature.get('prevCount')});
				infectionLabelFeature.setProperties({'sd_cd' : infectionFeature.get('sd_cd')});
				infectionLabelFeature.setProperties({'sd_nm' : infectionFeature.get('sd_nm')});
				infectionLabelFeature.setProperties({'year' : infectionFeature.get('year')});
				infectionLabelFeature.setProperties({'type' : 'infection'});
				
				let infectionLabelSource = new ol.source.Vector({
					features: [infectionLabelFeature],
				});
				
				let infectionLabelLayer = new ol.layer.Vector({
					name: 'infection_label',
					source: infectionLabelSource,
					style: new ol.style.Style({
						text: new ol.style.Text({
							text: infectionLabelFeature.get('sd_nm') + '\n' + numToStr(infectionLabelFeature.get('count')) + ' 명',
//							text: infectionLabelFeature.get('sd_nm') + " " + infectionLabelFeature.get('count') + '명',
							font: 'bold 20px Noto Sans KR',
							fill: new ol.style.Fill({
//								color: getInfectionColor(infectionFeature.get('count'), infectionFeature.get('prevCount')),
								color: 'rgba(0, 0, 0, 1.0)'
//								color: 'rgba(255, 255, 255, 1.0)'
							}),
							stroke: new ol.style.Stroke({
								color: getInfectionColor(infectionFeature.get('count'), infectionFeature.get('prevCount')),
//								color: 'rgba(255, 255, 255, 1.0)',
//								color: 'rgba(0, 0, 0, 1.0)',
								width: 2
							}),
							offsetY : infectionFeature.get('count')/12+30,
//							offsetY : infectionFeature.get('count')/12+20,
							overflow: true
						})
					}),
					zIndex: 10000 - infectionFeature.get('count') + 1,
					declutter: true
				});
				
				infectionFeatureLayer.getLayers().push(infectionGeometryLayer);
				infectionFeatureLayer.getLayers().push(infectionLabelLayer);
				
				infectionLayer.getLayers().push(infectionFeatureLayer);
				
				infectionFeature.changed();
				
				totalCount = totalCount + infectionFeature.get('count');
				infectionName = infectionFeature.get('gb') + ' ' + infectionFeature.get('infdisnm')
			});
			
			gisMap.addLayer(infectionLayer);
			
			$('.infection-name').remove();
			$('.infection-count').remove();
			let elem = $('.popul-stats-' + gisMap.currentMode);
			let html =
				'<p class="status-num infection-name">' +
					infectionName +
				'</p>' +
				'<p class="status-num infection-count">' +
					'총 감염자 수 : <span>' + numToStr(totalCount) + ' 명</span>' +
				'</p>'
			;
			elem.append(html);
		}
	});
}

function getInfectionColor(count, prevCount) {
	let result;
	
	if (count < prevCount) {
		result = 'rgba(67, 100, 217, 0.7)';
	} else if (count == prevCount) {
		result = 'rgba(69, 211, 100, 0.7)';
	} else if (count > prevCount) {
//	} else {
		result = 'rgba(164, 75, 205, 0.7)';
	}
	
	return result;
}