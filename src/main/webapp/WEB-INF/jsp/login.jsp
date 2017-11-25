<%--
  Author: Fahad Ahmed
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<!-- template from https://codepen.io/AJALACOMFORT/pen/oLpPPR by Ajala Comfort -->
    <title>Hungry Dragon - Food Delivery Service Login</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700" rel="stylesheet"> 
</head>
<body>

  <div id="space"></div>

        <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
        <script src="https://fb.me/react-15.1.0.min.js"></script>
        <script src="https://fb.me/react-dom-15.1.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.min.js"></script>

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
	//pushMarker();
      }
      pushMarker(){
        $.ajax({
	  type: "post",
	  url: "/TODO",
	  dataType: "json",
	  contentType: "application/json; charset=utf-8",
	  traditional: true,
	  success: function(datum) {
	  },
	  data: JSON.stringify(newLogin)
	});
      }
      render(){
        
        
        
            return (
            
                  <div>
                              
                 <div id="login">
                    <input type="text" id="username" placeholder="Username" value={this.state.username} onChange={this.handleUsernameChange} />
                    <input type="password" id="password" placeholder="Password" value={this.state.password} onChange={this.handlePasswordChange} />
                    <button id="send" onClick={this.handleClick} >Send</button>
            </div>
                
                  </div>
              
            )
      }
};


ReactDOM.render(<Login/>,document.getElementById("space"));
</script>
</body>
</html>
