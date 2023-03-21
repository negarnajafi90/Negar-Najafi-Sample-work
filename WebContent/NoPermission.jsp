 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="CSS/Login.css" type="text/css">

	<link rel="stylesheet" type="text/css" href="CSS/Fonts.css">

	<title>No Permission - Masterre</title>
	<link rel="icon" type="image/png" sizes="16x16" href="favicon-16.png">
</head>

<style>
/* @import url('https://fonts.googleapis.com/css?family=Lato'); */
* {
	 position: relative;
	 margin: 0;
	 padding: 0;
	 box-sizing: border-box;
	 font-family: 'HelveticaNeueCyr', ProximaNova, Arial, Helvetica, sans-serif;
}
body {
	 height: 100vh;
	 display: flex;
	 flex-direction: column;
	 justify-content: center;
	 align-items: center;
	 /* background: linear-gradient(to bottom right, #eee, #aaa); */
}
a{
    background: #29c1e1;
    text-decoration: none;
    color: white;
    padding: 10px;
    margin-top: 10px;
    border-radius: 6px;
    /* font-family: ProximaNova; */
}
h1{
   font-size: 3em;
    margin: auto;
    text-align: center;
    max-width: 400px;
}
 h2 {
    text-align: center;
        margin: 10px;
	margin-top: 40px;
}
.message{
    display: flex;
    flex-direction: column;
     text-align: center;
}
 .lock {
    margin-top: 20px;
	 border-radius: 5px;
	 width: 55px;
	 height: 45px;
	 background-color: #333;
	 animation: dip 1s;
	 animation-delay: 1.5s;
     margin: auto;
}
.border{
    border: 1px solid lightgrey;
    border-radius: 15px;
    padding: 40px;
}
.cent{
    margin:auto;
    margin-top: 50px;
    margin-bottom: 15px;
    }
 .lock::before, .lock::after {
	 content: '';
	 position: absolute;
	 border-left: 5px solid #333;
	 height: 20px;
	 width: 15px;
	 left: calc(50% - 12.5px);
}
 .lock::before {
	 top: -30px;
	 border: 5px solid #333;
	 border-bottom-color: transparent;
	 border-radius: 15px 15px 0 0;
	 height: 30px;
	 animation: lock 2s, spin 2s;
}
 .lock::after {
	 top: -10px;
	 border-right: 5px solid transparent;
	 animation: spin 2s;
}

 @keyframes lock {
	 0% {
		 top: -45px;
	}
	 65% {
		 top: -45px;
	}
	 100% {
		 top: -30px;
	}
}
 @keyframes spin {
	 0% {
		 transform: scaleX(-1);
		 left: calc(50% - 30px);
	}
	 65% {
		 transform: scaleX(1);
		 left: calc(50% - 12.5px);
	}
}
 @keyframes dip {
	 0% {
		 transform: translateY(0px);
	}
	 50% {
		 transform: translateY(10px);
	}
	 100% {
		 transform: translateY(0px);
	}
}
 

</style>

<body>

<div class='border'>
    <h1 class="noaccess">Sorry, you cannot view this page.</h1>
    <%-- <div class="lock"></div> --%>
    <div class="message">
        <h2>The account you signed in with does not have permission to view this page.</h2>
        <p>Please contact your Broker of Record if you need help.</p>
        <div class="cent"><a href="BrokerFiles/Dashboard.jsp">Back to Dashboard</a><div>
    </div>
</div>

</body>

</html>