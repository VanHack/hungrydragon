<%--
  Author: Fahad Ahmed
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
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
class RestaurantAdd extends React.Component {
      constructor(props){
	super(props);
	this.state = {
	  name: '',
	  address: '',
	  latitude: '',
	  longitude: ''
	};
        this.handleNameChange = this.handleNameChange.bind(this);
        this.handleAddressChange = this.handleAddressChange.bind(this);
        this.handleLatitudeChange = this.handleLatitudeChange.bind(this);
        this.handleLongitudeChange = this.handleLongitudeChange.bind(this);
        this.handleClick = this.handleClick.bind(this);
      }
      handleNameChange(e){
        this.setState({name: e.target.value});
      }
      handleAddressChange(e){
        this.setState({address: e.target.value});
      }
      handleLatitudeChange(e){
        this.setState({latitude: e.target.value});
      }
      handleLongitudeChange(e){
        this.setState({longitude: e.target.value});
      }
      handleClick(){
        alert(this.state.name + ' ' + this.state.address + ' ' + this.state.latitude + ' ' + this.state.longitude);
	var newRestaurant = {
		name: this.state.name,
		address: this.state.address,
		latitude: this.state.latitude,
		longitude: this.state.longitude
	};
        $.ajax({
	  type: "post",
	  url: "/register/postrestaurant",
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
	  //data: JSON.stringify(newRestaurant)
	  data: newRestaurant
	});
      }
      render(){
            return (
            <div>
                   
                  <div id="signup">
                        <input type="text" id="name" placeholder="Restaurant Name" value={this.state.name} onChange={this.handleNameChange} />
                        <input type="text" id="address" placeholder="Address" value={this.state.address} onChange={this.handleAddressChange} />
                        <input type="text" id="latitude" placeholder="Latitude" value={this.state.latitude} onChange={this.handleLatitudeChange} />
                        <input type="text" id="longitude" placeholder="Longitude" value={this.state.longitude} onChange={this.handleLongitudeChange} />
                    <button id="send" onClick={this.handleClick} >Send</button>
            </div>
                </div>
            
            )
      }
};

ReactDOM.render(<RestaurantAdd/>,document.getElementById("space"));
</script>
</body>
</html>
