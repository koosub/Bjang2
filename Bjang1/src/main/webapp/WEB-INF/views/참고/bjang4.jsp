<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>감염병</title>
	
	<style type="text/css">
		div{
			width: 500px;
			height: 500px;
		}
	</style>
</head>

	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sidebars/">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>  
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <!-- Custom styles for this template -->
    <link href="/resources/css/bjang.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6ca3631ca91c49471a26211d7ed34b0"></script>
<body>
    <div>
    	 <div>
    		<div class="chart">
				<canvas id="line-chart" width="800" height="450"></canvas>
			</div>
			<div class="chart">
				<canvas id="bar-chart"></canvas>
			</div>
			<div class="chart">
				<canvas id="pie-chart" width="800" height="450"></canvas>
			</div>
			<div class="chart">
				<canvas id="age-chart"></canvas>
			</div>
				<script>
					// 월 배열
					const month = [];
					for(var i =1 ; i <= 12; i++){
						month.push(i);
					}
					//inf total 값들
					const total1 = [];
					const total2 = [];
					const total3 = [];
					
					//inf year 값들
					const year1 = ${Inf.get(0).year};
					const year2 = ${Inf2.get(0).year};
					const year3 = ${Inf3.get(0).year};
					
					
					//top5
					const epidemicnm = [];
					const epTotal = [];
					
					<c:forEach var="inf" items="${Inf}">
						total1.push(${inf.total});
					</c:forEach>
					
					<c:forEach var="inf2" items="${Inf2}">
						total2.push(${inf2.total});
					</c:forEach>
					
					<c:forEach var="inf3" items="${Inf3}">
						total3.push(${inf3.total});
					</c:forEach>
					
					<c:forEach var="top5" items="${top5}">
						epidemicnm.push(`${top5.epidemicnm}`);
						epTotal.push(${top5.total});
					</c:forEach>
					
					console.log(epTotal[0]);
				</script>
				
			</div>
    	</div>
     	<div>
    	

    	</div>
    	<div>
    	

    	</div>

    </div>
 
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script type="text/javascript">
		new Chart(document.getElementById("line-chart"), { // 지난 1년 실제 감염자수 (절대)					
			  type: 'line',
			  data: {
			    labels: month, // x축(년월별)
			    datasets: [{ 
			        data: total3, //y축
			        label: year3,
			        borderColor: "#3e95cd",
			        fill: false
			      },  { 
			        data: total2,
			        label: year2,
			        borderColor: "#8e5ea2",
			        fill: false
			      }, { 
			        data: total1,
			        label: year1,
			        borderColor: "#3cba9f",
			        fill: false
			      } 
			    ]
			  },
			  options: {
			    title: {
			      display: true,
			      text: '지난 1년 감염자 수'
			    }
			  }
			});
		
		
		new Chart(document.getElementById("bar-chart"), {
		    type: 'bar',
		    data: {
		      labels: ' ',
		      datasets: [
		        {
		          label: epidemicnm[0],
		          backgroundColor: "#3e95cd",
		          data: [epTotal[0]]
		        },{
       	          label: epidemicnm[1],
       	          backgroundColor: "#8e5ea2",
       	          data: [epTotal[1]]
       	        }, {
     	          label: epidemicnm[2],
       	          backgroundColor: "#3cba9f",
       	          data: [epTotal[2]]
       	        }, {
    	          label: epidemicnm[3],
      	          backgroundColor: "#e8c3b9",
      	          data: [epTotal[3]]
      	        }, {
     	          label: epidemicnm[4],
       	          backgroundColor: "#c45850",
       	          data: [epTotal[4]]
       	        } 
		      ]
		    },
		    options: {
		    	reponsive : false,
		    	
				plugins :{
			      legend: { 
			    	  	display : true,
			    	  	position: 'bottom',
			    	  	labels:{
			    	  		fontSize:10
			    	  	}
			      }
			    }
		    	}
		});
		
		
		new Chart(document.getElementById("pie-chart"), {
		    type: 'pie',
		    data: {
		      labels: ["남성","여성"],
		      datasets: [{
		        backgroundColor: ["#3e95cd", "#8e5ea2"],
		        data: [${genderPer.get(0).man},${genderPer.get(0).woman}]/* ,
				borderColor:[
					"#3e95cd"
				] */
		      }]
		    },
		    options: {
		 		responsive: true,
		 		plugins :{
				      legend: { 
				    	  	display : true,
				    	  	position: 'bottom',
				    	  	labels:{
				    	  		fontSize:10
				    	  	}
				      }
				    }
/* 			pieceLabel: {
		                  mode:"label",
		                  position:"outside",
		                  fontSize: 11,
		                  fontStyle: 'bold'
						
		               } */
		    }
		});
		
		
		new Chart(document.getElementById("age-chart"), {
		    type: 'bar',
		    data: {
		      labels: ' ',
		      datasets: [
		        {
		          label: [`${age.get(0).age}`],
		          backgroundColor: "#3e95cd",
		          data: [${age.get(0).total}]
		        },{
       	          label: [`${age.get(1).age}`],
       	          backgroundColor: "#8e5ea2",
       	          data: [${age.get(1).total}]
       	        }, {
     	          label: [`${age.get(2).age}`],
       	          backgroundColor: "#3cba9f",
       	          data: [${age.get(2).total}]
       	        }, {
       	          label: [`${age.get(3).age}`],
      	          backgroundColor: "#e8c3b9",
      	          data: [${age.get(3).total}]
      	        }, {
      	          label: [`${age.get(4).age}`],
       	          backgroundColor: "#c45850",
       	       	  data: [${age.get(4).total}]
       	        },{
      	          label: [`${age.get(5).age}`],
       	          backgroundColor: "#a8e3b9",
       	          data: [${age.get(5).total}]
       	        },{
       	          label: [`${age.get(6).age}`],
      	          backgroundColor: "#bec389",
      	          data: [${age.get(6).total}]
      	        },{
      	          label: [`${age.get(7).age}`],
       	          backgroundColor: "#abcdb9",
       	          data: [${age.get(7).total}]
       	        },
   			]
		    },
		    options: {
		    	reponsive : false,
		    	
				plugins :{
			      legend: { 
			    	  	display : true,
			    	  	position: 'bottom',
			    	  	labels:{
			    	  		fontSize:10
			    	  	}
			      }
			    }
		    	}
		});
	</script>
</body>
</html>
