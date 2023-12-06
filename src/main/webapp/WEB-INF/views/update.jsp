<%--
  Created by IntelliJ IDEA.
  User: 교육생16
  Date: 2023-11-06
  Time: 오후 1:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
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

    .centered-form .form-group {
      margin-bottom: 20px;
    }

    .centered-form .btn {
      margin-top: 20px;
    }
  </style>
</head>
<body>
<c:import url="./utils/Navbars.jsp"></c:import>
<div class="centered-form">
  <form action="/health/update" method="post" id="ModForm">
    <fieldset>
      <legend>변화를 기록하세요</legend>
      <div class="form-group row">
      </div>
      <div class="form-group">
        <label class="col-form-label mt-4" >몸무게</label>
        <input type="text" class="form-control" id="weight" placeholder="Default input" name="weight">
      </div>

      <div class="form-group">
        <label class="col-form-label mt-4">체지방</label>
        <input type="text" class="form-control" id="fat" placeholder="Default input" name="fat">
      </div>
      <div class="form-group">
        <label class="col-form-label mt-4">근육량</label>
        <input type="text" class="form-control" id="muscle_mass" placeholder="Default input" name="muscle_mass">
      </div>
      <button type="button" class="btn btn-primary" onclick="modify();">기록</button>
    </fieldset>
  </form>
</div>
<script>
  function checkParam(){
    var weight = document.getElementById("weight");
    var muscle = document.getElementById("muscle_mass");
    var fat = document.getElementById("fat");
    if (!Number(weight.value)){
      alert("몸무게는 숫자여야합니다.")
      weight.focus();
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

    console.log("폼 제출 전에 실행되는 코드");
    alert("수정되었습니다.");

    form.submit();
  }
</script>
</body>
</html>
