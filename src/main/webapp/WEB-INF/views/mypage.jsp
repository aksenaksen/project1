<%--
  Created by IntelliJ IDEA.
  User: 교육생16
  Date: 2023-11-06
  Time: 오후 1:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<%--  <link rel="stylesheet" type="text/css" href="../css/Style.css">--%>
  <link rel="stylesheet" type="text/css" href="../../resources/CSS/Style.css">

  <style>
    .centered-form {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .centered-form form {
      width: 40%;
    }


    .centered-form .btn {
      margin-top: 20px;
    }
  </style>

</head>
<body>
<c:import url="./utils/Navbars.jsp"></c:import>
<div class="centered-form">
  <form action="/health/mypage" method="post" id="ModForm">
    <fieldset>
      <legend>Mypage</legend>
      <div class="form-group row">
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1" class="form-label mt-4">Id</label>
        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter id" name="username"value="${dto.getUsername()}" readonly>
      </div>
      <div class="form-group">
        <label class="col-form-label mt-4" for="height">키</label>
        <input type="text" class="form-control" placeholder="Default input" id="height" name="height" value="${dto.getHeight()}">
      </div>

      <div class="form-group">
        <label class="col-form-label mt-4" for="weight">몸무게</label>
        <input type="text" class="form-control" placeholder="Default input" id="weight" name="weight" value="${dto.getWeight()}">
      </div>

      <div class="form-group">
        <label class="col-form-label mt-4" for="fat">체지방</label>
        <input type="text" class="form-control" placeholder="Default input" id="fat" name="fat" value="${dto.getFat()}">
      </div>

      <div class="form-group">
        <label class="col-form-label mt-4" for="muscle_mass">근육량</label>
        <input type="text" class="form-control" placeholder="Default input" id="muscle_mass" name="muscle_mass" value="${dto.getMuscle_mass()}">
      </div>
      <button type="button" class="btn btn-primary" onclick="modify()">수정</button>
    </fieldset>
  </form>
</div>

<script>
  function checkParam(){
    var weight = document.getElementById("weight");
    var height = document.getElementById("height");
    var muscle = document.getElementById("muscle_mass");
    var fat = document.getElementById("fat");
    console.log("checkparam");
    console.log(typeof (weight.value));
    console.log(weight.value)
    console.log(Number(weight.value))
    if (!Number(weight.value)){
      alert("몸무게는 숫자여야합니다.")
      weight.focus();
      return false;
    }
    else if (!Number(height.value)){
      alert("키는 숫자여야합니다. ")
      height.focus();
      return false;
    }
    else if (!Number(muscle.value)){
      alert("근육량은 숫자여야합니다. ")
      muscle.focus();
      return false;
    }
    else if (!Number(fat.value)){
      alert("체지방는 숫자여야합니다. ")
      fat.focus();
      return false;
    }
    return true;
  }
  function modify(){
    if(!checkParam()){
      return;
    }
    var form = document.getElementById("ModForm");

    form.onsubmit = function () {
      alert("수정되었습니다.");
      location.href = "/health/main";
    };
    form.submit();

  }

</script>

</body>
</html>
