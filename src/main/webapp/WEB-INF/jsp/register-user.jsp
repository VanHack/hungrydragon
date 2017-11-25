<%--
  Author: Fahad Ahmed
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<!-- template from https://codepen.io/AJALACOMFORT/pen/oLpPPR by Ajala Comfort -->
    <title>Hungry Dragon - Food Delivery Service User Signup</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700" rel="stylesheet"> 
</head>
<body>

  <div id="space"></div>

        <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
        <script src="https://fb.me/react-15.1.0.min.js"></script>
        <script src="https://fb.me/react-dom-15.1.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.min.js"></script>

<script type="text/babel">
var Signup = React.createClass({
  
  
      render:function(){
        
        
            return (
            <div>
                   
                  <div id="signup">
                        <input type="text" id="first" placeholder="First Name"/>
                        <input type="text" id="last" placeholder="Last Name"/>
                        <input type="email" id="email" placeholder="Email"/>
                    <input type="password" id="password" placeholder="Password"/>
                    <input type="password" id="confirm" placeholder="Confirm Password"/>
                    <button id="send">Send</button>
            </div>
                </div>
            
            )
      }
});

ReactDOM.render(<Signup/>,document.getElementById("space"));
</script>
</body>
</html>
