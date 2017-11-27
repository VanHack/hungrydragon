<%--
  Author: Fahad Ahmed
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
  <head>
<!-- from https://getbootstrap.com/docs/4.0/examples/signin/ -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://getbootstrap.com/favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="https://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet">
  </head>

  <body>

    <div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">Please submit your restaurant</h2>
        <label for="inputName" class="sr-only">Restaurant Name</label>
        <input type="text" id="inputName" class="form-control" placeholder="Restaurant Name" required autofocus>
        <label for="inputAddr" class="sr-only">Address</label>
        <input type="text" id="inputAddr" class="form-control" placeholder="Address" required autofocus>
        <label for="inputLat" class="sr-only">Latitude</label>
        <input type="text" id="inputLat" class="form-control" placeholder="Latitude" required autofocus>
        <label for="inputLng" class="sr-only">Longitude</label>
        <input type="text" id="inputLng" class="form-control" placeholder="Longitude" required autofocus>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->
  </body>
</html>
