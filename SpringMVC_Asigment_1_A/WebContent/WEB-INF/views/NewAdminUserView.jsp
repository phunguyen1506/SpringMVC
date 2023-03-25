<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <style>
    body{
      font-size: 14px;
    }
    h3{
      color: #fff;
      background-color: #af9d62;
      border: 1px solid #55989f;
      padding: 8px;
      border-radius: 4px 4px 0 0;
      position: relative;
      top: 20px;
    }
    .container{
      
    }
    .info{
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 10px;
    }

    input{
      width: 100%;
      flex: 6;
      color: #202124;
      padding: 5px;
      border-radius: 4px;
      border: 1px solid darkgrey;
    }
    #status{
      width: 100%;
      flex: 6;
      color: #bcbcbc;
      padding: 5px;
      border-radius: 4px;
      border: 1px solid darkgrey;
    }

    label{
      flex: 1;
    }

    .btn-gr{
      display: flex;
    }
    button{
      width: 100%;
      padding: 5px;
      background-color: #0188bf;
      color: #fff;
      border: none;
      line-height: 25px;
    }

    button:nth-child(1){
      border-radius: 4px 0 0 4px;
    }
    button:nth-child(2){
      border-radius: 0 4px 4px 0;
    }
.form{
  padding: 15px;
      border: 1px solid #55989f;
}
  </style>


<div>
  <h3>manager</h3>
</div>

<div class="container">
  <form:form class="form" action="save" method="post" modelAttribute="adminuser">
    <div class="container">

      <div class="info">
      <label for="name"><b>name *</b></label>
      <form:input type="text" path="name" name="name" id="name" />
    </div>

  	<div class="info">
      <label for="email"><b>email *</b></label>
      <form:input type="email" path="email" name="email" id="email" />
    </div>

    <div class="info">
      <label for="password"><b>password</b></label>
      <form:input type="password" path="password" placeholder="password" name="password" id="password" />
    </div>
    
    <div class="info">
      <label></label>
      <input type="password" placeholder="verify password" name="psw-repeat" id="psw-repeat" />
    </div>

    <div class="info">
      <label for="agent_id"><b>agent id</b></label>
      <form:input type="text" path="agentID" name="agentID" id="agent_id" />
    </div>
    
    <div class="info">
      <label for="status"><b>status *</b></label>
      <form:select name="status" path="statusCD" id="status">
      	<option value="" selected="selected">select</option>
      	<option value="1" >Active</option>
      	<option value="2" >Preapproval</option>
      	<option value="3" >Suspended</option>
      	<option value="4">Inactive</option>
      	<option value="5">Locked</option>
        	
      </form:select>
    </div>

    <div class="info">
      <label for="note"><b>note</b></label>
      <form:input type="text" path="notes" name="notes" id="note" />
    </div>

    <div class="btn-gr">
      <button type="button" id="btn_Close">Close</button>
      <button type="submit" id="registerbtn" class="registerbtn">Registration</button>
    </div> 
    </div>
  </form:form>
</div>
</body>
<script type="text/javascript">

	
	const handleName = (name, e) => {
		if(name !== ''){
			return true
		}else{
			alert("Please check the name")
			e.preventDefault()	
			return false;
		}	
	}
	
	const handleEmail = (email, e) => {
		if(email !== ''){
			return true
		}else{
			alert("Please check the email")
			e.preventDefault()	
			return false;
		}	
	}
	
	
	const handlePswRepeat = (pswRepeat, password, e) => {
		if(typeof password === 'string' && typeof pswRepeat === 'string' && pswRepeat === password){
			return true 
		}else{
			alert("Please check the password")
			e.preventDefault()	
			return false;
		}
	}
	
	const handleStatus = (status, e) => {
		if(status !== ""){
			return true
		}else{
			alert("Please check the status")
			e.preventDefault()	
			return false;
		}	
	}
	
	
		document.getElementById('registerbtn').addEventListener("click", function(e) {
			const name = document.getElementById('name').value
			const email = document.getElementById('email').value
			const password = document.getElementById('password').value
			const pswRepeat = document.getElementById('psw-repeat').value
			const status = document.getElementById('status').value
			handleName(name, e)
			handleEmail(email, e)
			handlePswRepeat(pswRepeat, password, e)
			handleStatus(status, e)
			if(		handleName(name, e) &&
					handleEmail(email, e) &&
					handlePswRepeat(pswRepeat, password, e)&&
					handleStatus(status, e))
				{
				
				}
		})
	
	document.addEventListener("DOMContentLoaded", function(event) {
		document.getElementById("btn_Close").addEventListener("click", function(e) {
			window.location.href = "http://localhost:8080/Assignment_1/adminuser";
		})
	});


</script>
</html>