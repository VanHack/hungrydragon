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
class Signup extends React.Component {
      constructor(props){
	super(props);
	this.state = {
	  firstname: '',
	  lastname: '',
	  address: '',
	  username: '',
	  password: '',
	  passwordconfirm: '',
	  ezmail: ''
	};
        this.handleFirstnameChange = this.handleFirstnameChange.bind(this);
        this.handleLastnameChange = this.handleLastnameChange.bind(this);
        this.handleAddressChange = this.handleAddressChange.bind(this);
        this.handleUsernameChange = this.handleUsernameChange.bind(this);
        this.handlePasswordChange = this.handlePasswordChange.bind(this);
        this.handlePasswordConfirmChange = this.handlePasswordConfirmChange.bind(this);
        this.handleEzmailChange = this.handleEzmailChange.bind(this);
        this.handleClick = this.handleClick.bind(this);
      }
      handleFirstnameChange(e){
        this.setState({firstname: e.target.value});
      }
      handleLastnameChange(e){
        this.setState({lastname: e.target.value});
      }
      handleAddressChange(e){
        this.setState({address: e.target.value});
      }
      handleUsernameChange(e){
        this.setState({username: e.target.value});
      }
      handlePasswordChange(e){
        this.setState({password: e.target.value});
      }
      handlePasswordConfirmChange(e){
        this.setState({passwordconfirm: e.target.value});
      }
      handleEzmailChange(e){
        this.setState({ezmail: e.target.value});
      }
      handleClick(){
        if (this.state.password != this.state.passwordconfirm)
	{
	  alert('Error! Password fields do not match!');
	  return;
	}
        alert(this.state.firstname + ' ' + this.state.lastname + ' ' + this.state.address + ' ' + this.state.username + ' ' + this.state.password + ' ' + this.state.ezmail);
	//pushMarker();
      }
      pushMarker(){
	var newSignup = {
		first_name: this.state.firstname,
		last_name: this.state.lastname,
		address: this.state.address,
		username: this.state.username,
		password: this.state.password,
		email: this.state.ezmail
	};
        $.ajax({
	  type: "post",
	  url: "/TODO",
	  dataType: "json",
	  contentType: "application/json; charset=utf-8",
	  traditional: true,
	  success: function(datum) {
	  },
	  data: JSON.stringify(newSignup)
	});
      }
      render(){
            return (
            <div>
                   
                  <div id="signup">
                        <input type="text" id="first_name" placeholder="First Name" value={this.state.firstname} onChange={this.handleFirstnameChange} />
                        <input type="text" id="last_name" placeholder="Last Name" value={this.state.lastname} onChange={this.handleLastnameChange} />
                        <input type="text" id="address" placeholder="Delivery Address" value={this.state.address} onChange={this.handleAddressChange} />
                        <input type="text" id="username" placeholder="Username" value={this.state.username} onChange={this.handleUsernameChange} />
                        <input type="password" id="password" placeholder="Password" value={this.state.password} onChange={this.handlePasswordChange} />
                        <input type="password" id="confirm" placeholder="Confirm Password" value={this.state.passwordconfirm} onChange={this.handlePasswordConfirmChange} />
                        <input type="text" id="ezmail" placeholder="E-mail" value={this.state.ezmail} onChange={this.handleEzmailChange} />
                    <button id="send" onClick={this.handleClick} >Send</button>
            </div>
                </div>
            
            )
      }
};

ReactDOM.render(<Signup/>,document.getElementById("space"));
</script>
</body>
</html>
