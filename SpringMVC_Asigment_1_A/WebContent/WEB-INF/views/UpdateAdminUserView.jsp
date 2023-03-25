<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
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
    .delete-btn{
      background-color: red;
    }

    button:nth-child(1){
      border-radius: 4px 0 0 4px;
    }
    button:nth-child(3){
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
  <form:form class="form" action="update" id="formData" data-id="${adminuser.ID}" method="post" modelAttribute="adminuser">
  	
    <div class="container">

      <div class="info">
      <label for="name"><b>name *</b></label>
      <form:input type="hidden" path="ID" name="ID"/>
      <form:input type="text" path="name" value="${adminuser.name}" name="name" id="name"/>
    </div>

    <div class="info">
      <label for="email"><b>email *</b></label>
      <form:input type="email" disabled='true' path="email" value="${adminuser.email}" name="email" id="email" />
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
      <label for="extention-no"><b>extension number</b></label>
      <form:input type="number" path="agentID" value="${adminuser.agentID}" placeholder="1301" name="extention-no" id="extention-no" />
    </div>

    
    <div class="info">
      <label for="status"><b>status *</b></label>
      <form:select name="status" path="statusCD" id="status" data-status="${adminuser.statusCD}" value="${adminuser.statusCD}">
        <option value="">select</option>
      	<option value="1" >Active</option>
      	<option value="2"  >Preapproval</option>
      	<option value="3"  >Suspended</option>
      	<option value="4" >Inactive</option>
      	<option value="5" >Locked</option>
      </form:select>
    </div>

    <div class="info">
      <label for="memo"><b>memo</b></label>
      <form:input type="text" path="notes" value="${adminuser.notes}" name="memo" id="memo" />
    </div>

    <div class="info">
      <label for="creation-time"><b>creation time</b></label>
      <form:input type="datetime" disabled='true'  path="createdAt" value="${adminuser.createdAt}" name="creation-time" id="creation-time" />
    </div>

    <div class="info">
      <label for="change-time"><b>change time</b></label>
      <form:input type="datetime" disabled='true'  path="updatedAt" value="${adminuser.updatedAt}" name="change-time" id="change-time" />
    </div>

    <div  class="btn-gr">
      <button type="button" id="btn_Cancel">cancellation</button>
      <button type="submit">correction</button>
      <button id="btn_Delete" type="button" class="delete-btn">delete</button>
    </div>
    </div>
  </form:form>
</div>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", () =>{
	document.getElementById("btn_Cancel").addEventListener("click", function(){
		window.location.href = "/Assignment_1/adminuser";
	});
	document.getElementById("btn_Delete").addEventListener("click", function(){
		let id = document.getElementById("formData").getAttribute("data-id");
		if(confirm("Are you sure wanna delete this user ?")){
			window.location.href = "/Assignment_1/adminuser/delete?id=" + id;
		}
		
	});
	let idStatus = document.getElementById("status").getAttribute("data-status");;
	const selectElement = document.getElementById("status");
	console.log(idStatus)
	console.log(selectElement.options[Number(idStatus)])
	selectElement.options[Number(idStatus)].selected = true;
	
	
	
})
</script>
</body>

</html>