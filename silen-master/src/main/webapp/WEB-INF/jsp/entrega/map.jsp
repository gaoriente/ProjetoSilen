<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/nifty.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/demo/nifty-demo-icons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/demo/nifty-demo.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/plugins/morris-js/morris.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/plugins/magic-check/css/magic-check.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/plugins/pace/pace.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/plugins/themify-icons/themify-icons.min.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/nifty.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/demo/nifty-demo.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/MascaraValidacao.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.mask.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/system.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/pace/pace.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/pace/pace.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/morris-js/raphael-js/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
    
    <link href="${pageContext.request.contextPath}/css/system.css" rel="stylesheet">

    <script language=javascript src='https://maps.google.com/maps/api/js?key=AIzaSyBYLUv2Y5Y3VLOhAtQH6gYpuAP0dld0DSA'></script>
    <script>
		function initializeMap() {
			var startLatitude = parseFloat(document.getElementById("map_canvas").getAttribute("start-latitude"));
	      	var startLongitude = parseFloat(document.getElementById("map_canvas").getAttribute("start-longitude"));

			var companyLocation = new google.maps.LatLng(startLatitude, startLongitude);
			
			var directionsService = new google.maps.DirectionsService;
			var directionsDisplay = new google.maps.DirectionsRenderer;

	      	var myOptions = {
	        	zoom: 8,
	        	center: companyLocation,
	        	mapTypeId: google.maps.MapTypeId.ROADMAP
	      	};
	      	var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	      	directionsDisplay.setMap(map);
	      	

	      	var destinationLatitude = parseFloat(document.getElementById("map_canvas").getAttribute("dest-latitude"));
	      	var destinationLongitude = parseFloat(document.getElementById("map_canvas").getAttribute("dest-longitude"));

	        directionsService.route({
				origin: {lat: startLatitude, lng: startLongitude},
	          	destination: {lat: destinationLatitude, lng: destinationLongitude},
	          	travelMode: 'DRIVING'
	        }, function(response, status) {
				if (status === 'OK') {
	            	directionsDisplay.setDirections(response);
	          	} else {
	            	window.alert('Não foi possível carregar a rota até esse endereço' + status);
	          	}
	        });
	    }

	    google.maps.event.addDomListener(window,'load', initializeMap)
	</script>

</head>

<body>
    <div id="container" class="effect aside-float aside-bright mainnav-lg">
        <%@include file="../header.jsp" %>

        <div class="boxed">
            <div id="content-container">

                <div id="page-title">
                    <h1 class="page-header text-overflow">Mapa da entrega</h1>
                </div>

                <div id="page-content">
                    <div class="row">
                        <div class="col-md-12">
                        	<div id="map_canvas" 
                        		start-latitude="${companyInfo.latitude}" 
                        		start-longitude="${companyInfo.longitude}" 
                        		dest-latitude="${entrega.latitude}"
                        		dest-longitude="${entrega.longitude}"
                        		class="col-md-12" 
                        		style="height: 500px;">
                        	</div>
                        </div>
                    </div>
                </div><!--/page-content-->
            </div><!--/content-container-->
        </div><!--/boxed-->

        <%@include file="../menu_lateral.jsp" %>

        <%@include file="../footer.html" %>
    </div><!--/container-->
</body>
</html>