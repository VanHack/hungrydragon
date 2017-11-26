<%--
  Author: Fahad Ahmed
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Hungry Dragon - The future of food delivery</title>

    <!-- Bootstrap Core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-shop-homepage/css/shop-homepage.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Hungry Dragon Food Delivery Service</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="well fluid-image mx-auto d-block" align="center">
       <div id="map" class="mx-auto d-block fluid-image"></div>
    </div>
    <!-- Page Content -->
    <div class="container">

<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 300px;
        width: 600px;
      }

 /* The snackbar - position it at the bottom and in the middle of the screen */
#snackbar {
    visibility: hidden; /* Hidden by default. Visible on click */
    min-width: 250px; /* Set a default minimum width */
    margin-left: -125px; /* Divide value of min-width by 2 */
    background-color: #333; /* Black background color */
    color: #fff; /* White text color */
    text-align: center; /* Centered text */
    border-radius: 2px; /* Rounded borders */
    padding: 16px; /* Padding */
    position: fixed; /* Sit on top of the screen */
    z-index: 1; /* Add a z-index if needed */
    left: 50%; /* Center the snackbar */
    bottom: 30px; /* 30px from the bottom */
}

/* Show the snackbar when clicking on a button (class added with JavaScript) */
#snackbar.show {
    visibility: visible; /* Show the snackbar */

/* Add animation: Take 0.5 seconds to fade in and out the snackbar.
However, delay the fade out process for 2.5 seconds */
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

/* Animations to fade the snackbar in and out */
@-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
} </style>
<!-- derived from https://www.w3schools.com/html/html5_geolocation.asp and https://developers.google.com/maps/documentation/javascript/examples/place-search  -->
 <script>
	var dayList = [
	  "Sunday",
	  "Monday",
	  "Tuesday",
	  "Wednesday",
	  "Thursday",
	  "Friday",
	  "Saturday"
	];

      var map;
      var infowindow;

function showPositionError(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
            document.getElementById("map").innerHTML = "User denied the request for Geolocation."
            break;
        case error.POSITION_UNAVAILABLE:
            document.getElementById("map").innerHTML = "Location information is unavailable."
            break;
        case error.TIMEOUT:
            document.getElementById("map").innerHTML = "The request to get user location timed out."
            break;
        case error.UNKNOWN_ERROR:
            document.getElementById("map").innerHTML = "An unknown error occurred."
            break;
        default:
            document.getElementById("map").innerHTML = "It should be impossible to see this text."
            break;
    }
// if we don't have location data, just populate the suggestion menu based on the day of the week.
        $.ajax({
	  type: "get",
	  url: "/suggest",
	  data: {
	    dayOfWeek: dayList[new Date().getDay()],
	    latitude: 0,
	    longitude: 0
	  },
	  dataType: "json",
	  contentType: "application/json; charset=utf-8",
	  traditional: true,
	  success: function(datum) {
	    doSuggest(datum, 'suggestedmenulist');
	  },
	  error: function(xhr, status, error) {
	   doSnackbar('Got error! ' + error);
//alert(JSON.stringify([xhr, status, error]));
	  }
	});
} 
      function initMap() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(MapUserLocation, showPositionError);
    } else {
        document.getElementById("map").innerHTML = "Geolocation is not supported by this browser.";
    }
     }
      function MapUserLocation(position) {
        $.ajax({
	  type: "get",
	  url: "/suggest",
	  data: {
	    dayOfWeek: dayList[new Date().getDay()],
	    latitude: position.coords.latitude,
	    longitude: position.coords.longitude
	  },
	  dataType: "json",
	  contentType: "application/json; charset=utf-8",
	  traditional: true,
	  success: function(datum) {
	    doSuggest(datum, 'suggestedmenulist');
	  },
	  error: function(xhr, status, error) {
	   doSnackbar('Got error! ' + error);
//alert(JSON.stringify([xhr, status, error]));
	  }
	});
        var pyrmont = {lat: position.coords.latitude, lng: position.coords.longitude};
        doMap(pyrmont);
      }
      function doMap(pyrmont) {
        map = new google.maps.Map(document.getElementById('map'), {
          center: pyrmont,
          zoom: 15
        });

        infowindow = new google.maps.InfoWindow();
        var service = new google.maps.places.PlacesService(map);
        service.nearbySearch({
          location: pyrmont,
          radius: 500,
          type: ['restaurant']
        }, callback);
      }

      function callback(results, status) {
        if (status === google.maps.places.PlacesServiceStatus.OK) {
	  var placeList = [];
          for (var i = 0; i < results.length; i++) {
            createMarker(results[i]);
	    var place = results[i];
            var placeLoc = place.geometry.location;
	    var placeDatum = {
	      address: place.vicinity,
	      latitude: placeLoc.lat(),
	      longitude: placeLoc.lng(),
	      restaurantName: place.name
	    };
	    placeList.push(placeDatum);
          }
	  //pushMarker(placeList);
        }
      }

      /*function pushMarker(placeList) {
        $.ajax({
	  type: "post",
	  url: "/register/postrestaurantlist",
	  dataType: "json",
	  contentType: "application/json; charset=utf-8",
	  //contentType: "application/x-www-form-urlencoded",
	  traditional: true,
	  success: function(datum) {
	  },
	  error: function(xhr, status, error) {
	    if (xhr.hasOwnProperty("readyState"))
	    {
	      if (xhr.readyState == 4)
	      {
		// TODO FIXME solve the parseerror
		return;
	      }
	    }
	   doSnackbar('Got error! ' + error);
//alert(JSON.stringify([xhr, status, error]));
	  },
	  data: placeList
	});
      }*/

      function createMarker(place) {
        var placeLoc = place.geometry.location;
        var marker = new google.maps.Marker({
          map: map,
          position: place.geometry.location
        });

        google.maps.event.addListener(marker, 'click', function() {
          infowindow.setContent(place.name);
          infowindow.open(map, this);
        });
      }
 </script>

        <div class="col-md-9">
	  <h2 class="text-secondary text-center">Recommended For You</h2>
                <div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel-suggested-menu" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-suggested-menu" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-suggested-menu" data-slide-to="1"></li>
                                <li data-target="#carousel-suggested-menu" data-slide-to="2"></li>
                            </ol>
                            <div id="suggestedmenulist" class="carousel-inner">
                            </div>
                            <a class="left carousel-control" href="#carousel-suggested-menu" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-suggested-menu" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div>
        </div>

        <div class="row">

            <div class="col-md-3">
                <!--<details open>-->
                <!-- summary --><p class="lead">Select Restaurant</p><!-- /summary -->
                <div id="restaurants" class="list-group">
                </div>
                <!--</details>-->
            </div>

            <div class="col-md-9">

                <!-- div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div id="restaurant-carousel" class="carousel-inner">
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div -->

                <div id="restaurantname">
                </div>
                <div id="menulist" class="row">
                </div>

            </div>

        </div>

<div id="snackbar">Some text some message..</div>
    </div>
    <!-- /.container -->

    <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Team Dragon 2017</p>
                    <p>Map and food images Copyright &copy; 2008-2017 - Zomato &trade; Media Pvt Ltd. All rights reserved.</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- Google Places JavaScript API -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDy00HmmAp62qnc_Xlr3O6S5yrlyyDoUCw&libraries=places&callback=initMap" async defer></script>

<script>
	var restaList = {};

	    var imgList = [
			    "https://b.zmtcdn.com/data/reviews_photos/f27/2cdc7e0c88fe2aa4f49f649737455f27.jpg?fit=around%7C200%3A200&crop=200%3A200%3B%2A%2C%2A",
			    "https://b.zmtcdn.com/data/reviews_photos/468/a0a814d7a4ada12764987ce450fd8468.jpg?fit=around%7C200%3A200&crop=200%3A200%3B%2A%2C%2A",
			    "https://b.zmtcdn.com/data/reviews_photos/2af/281654faa69cf513cfe45d5aea7b52af.jpg?fit=around%7C200%3A200&crop=200%3A200%3B%2A%2C%2A",
			    "https://b.zmtcdn.com/data/reviews_photos/1a4/536aaf11a602883e505e49676b9cb1a4.jpg?fit=around%7C200%3A200&crop=200%3A200%3B%2A%2C%2A",
			    "https://b.zmtcdn.com/data/reviews_photos/0c9/8bafd1b95c54c07993f523f07b6f20c9.jpg?fit=around%7C200%3A200&crop=200%3A200%3B%2A%2C%2A"
	    ];
	  function doMenuList(menulist, elem, restaName) {
	    if (restaName != '')
	    document.getElementById('restaurantname').innerHTML = '<h3 class="text-secondary text-center">' + restaName + '</h3>';
	    $.each(menulist, function(i, menuitem)
	    {
	      document.getElementById(elem).innerHTML =
	        document.getElementById(elem).innerHTML +
                    '<div class="col-sm-4 col-lg-4 col-md-4">' +
                        '<div class="thumbnail">' +
                            '<img src="' + imgList[(Math.floor(Math.random() * 10 * imgList.length) % imgList.length)]
			    + '" alt="' + menuitem.name + '">' +
                            '<div class="caption">' +
                                '<h4><a href="#">' + menuitem.name + '</a>' +
                                '<h4>$' + menuitem.price + '</h4>' +
                                '</h4>' +
                                '<p>'+ menuitem.type + '</p>' +
                            '</div>' +
                        '</div>' +
                    '</div>';
	    });
	  }

/*
	  function doSuggest (suggested, menulist) {
	    var isFirst = true;
	    $.each(suggested, function(i, menuitem)
	    {
	      document.getElementById(menulist).innerHTML =
	        document.getElementById(menulist).innerHTML +
		(isFirst ? '<div class="item active">' :
		'<div class="item">') +
		'<ul class="thumbnails span6 row">' ;
		var thumbNum = 3;
alert('i:' + i);
		for (var j = i; j < i+thumbNum; j = j + 1)
		{
		  var n = j;
		  if (n >= suggested.length)
		  {
		    // wrap-around
		    n = n - suggested.length;
		  }
alert('n:' + n);
		  var menuitm = suggested[n];
	      document.getElementById(menulist).innerHTML =
	        document.getElementById(menulist).innerHTML +
		'<li class="col col-xs-6">' +
		'<h1 class="caption text-primary text-center">' +
		menuitm.name
		+ '</h1>' +
		'<img class="thumbnail slide-image" src="' +
		imgList[(Math.floor(Math.random() * 10 * imgList.length) % imgList.length)]
		+ '" alt="' + menuitm.name + '">' +
		'</li>';
		}
alert('i-end:' + i);
	      document.getElementById(menulist).innerHTML =
	        document.getElementById(menulist).innerHTML +
                                '</ul></div>';
	      isFirst = false;
	    });
	  }
*/

	  function doSuggest (suggested, menulist) {
	    var isFirst = true;
	    $.each(suggested, function(i, menuitem)
	    {
	      document.getElementById(menulist).innerHTML =
	        document.getElementById(menulist).innerHTML +
		(isFirst ? '<div class="item active">' :
		'<div class="item">') +
		'<h1 class="text-primary text-center">' +
		menuitem.name
		+ '</h1>' +
		'<img class="slide-image mx-auto d-block" src="' +
		imgList[(Math.floor(Math.random() * 10 * imgList.length) % imgList.length)]
		+ '" alt="' + menuitem.name + '">' +
                                '</div>';
	      isFirst = false;
	    });
	  }

	  function redoMenuList(restaName) {
	      // refresh, clear it out
	      document.getElementById('menulist').innerHTML = '';
	          doMenuList(restaList[restaName], 'menulist', restaName);
	  }

	  function doDatum (datum) {
	    if (!datum.hasOwnProperty("_embedded"))
	    {
	      // TODO signal error
	      return;
	    }
	    if (!datum._embedded.hasOwnProperty("restaurants"))
	    {
	      // TODO signal error
	      return;
	    }
	    var isFirst = true;
	    $.each(datum._embedded.restaurants, function(i, resta)
	    {
	      restaList[resta.name] = resta.menuItems;
	      document.getElementById('restaurants').innerHTML =
	        document.getElementById('restaurants').innerHTML +
	        '<a onClick="redoMenuList(&quot;' + resta.name + '&quot;); return false;" href="#" class="list-group-item">'
	        + resta.name + '</a>';

	      /*document.getElementById('restaurant-carousel').innerHTML =
	        document.getElementById('restaurant-carousel').innerHTML +
		(isFirst ? '<div class="item active">' :
		'<div class="item">') +
		'<h1 class="text-primary text-center">' +
		resta.name
		+ '</h1>' +
		'<img class="slide-image" src="https://maps.zomato.com/osm/14/3764/5564.png" alt="' +
		resta.name + '">' +
                                '</div>';*/
	      if (isFirst)
	      {
	        if (resta.hasOwnProperty("menuItems"))
		{
	          doMenuList(resta.menuItems, 'menulist', resta.name);
		}
		else
		{
		 // TODO ERROR
		}
	      }
	      isFirst = false;
	    });
	  }
        $.ajax({
	  type: "get",
	  url: "/rest/restaurants",
	  dataType: "json",
	  contentType: "application/json; charset=utf-8",
	  traditional: true,
	  success: function(datum) {
	    doDatum(datum);
	  },
	  error: function(xhr, status, error) {
	   doSnackbar('Got error! ' + error);
//alert(JSON.stringify([xhr, status, error]));
	  }
	});
function doSnackbar(msg) {
    // Get the snackbar DIV
    var x = document.getElementById("snackbar")
x.innerHTML = msg;

    // Add the "show" class to DIV
    x.className = "show";

    // After 3 seconds, remove the show class from DIV
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
} </script>
</body>

</html>
