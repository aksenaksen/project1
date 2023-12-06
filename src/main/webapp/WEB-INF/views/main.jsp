<%--
  Created by IntelliJ IDEA.
  User: 교육생16
  Date: 2023-11-06
  Time: 오전 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" type="text/css" href="../../resources/CSS/Style.css">
  <style>
    .form-group{
      display: flex;
      justify-content: center;
      align-items: center;
      height: 40vh;
    }
    .btn {
      margin-bottom: 10px;
      margin-right: 10px;
    }
    .welcome-message{
      font-size: 140px;
      margin-top: 50px;
      text-align: center;
    }
    #message{
      font-size:50px;
      text-align: center;
    }

  </style>
</head>
<body>
<c:import url="./utils/Navbars.jsp"></c:import>

<form>
  <fieldset>
    <p class="welcome-message">${sessionScope.ID}님, 환영합니다.</p>
    <h1 id="message">운동안한지 <c:if test="${Long!=null}">${Long}</c:if>일째</h1>
  </fieldset>
</form>
<script>
  console.log(${Long});
</script>
</body>
</html>
