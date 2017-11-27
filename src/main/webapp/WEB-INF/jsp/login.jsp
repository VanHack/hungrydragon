<%--
  Author: Fahad Ahmed
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<!-- template from https://codepen.io/AJALACOMFORT/pen/oLpPPR by Ajala Comfort -->
    <title>Hungry Dragon - Food Delivery Service Login</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700" rel="stylesheet"> 
<link href="https://raw.githubusercontent.com/post-j-ma/hungrydragon/master/website/css/login.css" rel="stylesheet"> 

    <!-- Bootstrap Core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

  <div id="space"></div>

        <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
        <script src="https://fb.me/react-15.1.0.min.js"></script>
        <script src="https://fb.me/react-dom-15.1.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/babel">
class Login extends React.Component {
      constructor(props){
	super(props);
	this.state = {
	  username: '',
	  password: ''
	};
        this.handleUsernameChange = this.handleUsernameChange.bind(this);
        this.handlePasswordChange = this.handlePasswordChange.bind(this);
        this.handleClick = this.handleClick.bind(this);
      }
      handleUsernameChange(e){
        this.setState({username: e.target.value});
      }
      handlePasswordChange(e){
        this.setState({password: e.target.value});
      }
      handleClick(){
        alert(this.state.username + ' ' + this.state.password);
	var newLogin = {
		username: this.state.username,
		password: this.state.password
	};
        $.ajax({
	  type: "post",
	  url: "/auth/postlogin",
	  dataType: "json",
	  //contentType: "application/json; charset=utf-8",
	  contentType: "application/x-www-form-urlencoded",
	  traditional: true,
	  success: function(datum) {
	    window.location='/';
	  },
	  error: function(xhr, status, error) {
	    if (xhr.hasOwnProperty("readyState"))
	    {
	      if (xhr.readyState == 4)
	      {
		// TODO FIXME solve the parseerror
	        window.location='/';
	      }
	    }
alert(JSON.stringify([xhr, status, error]));
	  },
	  //data: JSON.stringify(newLogin)
	  data: newLogin
	});
      }
      render(){
        
        
        
            return (
            
                  <div>
                              
                 <div id="login">
		    <div class="well mx-auto d-block" align="center">
		    <div class="row">
                    <input type="text" id="username" placeholder="Username" value={this.state.username} onChange={this.handleUsernameChange} />
		    </div>
		    <div class="row">
                    <input type="password" id="password" placeholder="Password" value={this.state.password} onChange={this.handlePasswordChange} />
		    </div>
		    <div class="row">
                    <button id="send" onClick={this.handleClick} >Send</button>
		    </div>
		    </div>
            </div>
                
                  </div>
              
            )
      }
};


ReactDOM.render(<Login/>,document.getElementById("space"));
</script>
</body>
</html>
