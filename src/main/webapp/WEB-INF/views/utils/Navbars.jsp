<%--
  Created by IntelliJ IDEA.
  User: 교육생16
  Date: 2023-11-06
  Time: 오후 1:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../css/Style.css">
  <style>
    #logout-btn {
      float: right;
    }
  </style>

</head>
<body>
<div class="bs-component">
  <nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Navbar</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor04" aria-controls="navbarColor04" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarColor04">
        <ul class="navbar-nav me-auto">
          <li class="nav-item">
            <a class="nav-link active" href="/health/main">홈으로
              <span class="visually-hidden">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/health/list">일지작성</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/health/mypage">마이페이지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/health/graph">그래프</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/health/update">업데이트</a>
          </li>
          <li class="nav-item" style="display: flex; justify-content: flex-end;">
            <form action="/logout" method="post">
            <input type="submit" id="logout-btn" class="btn-primary" name="logout" value="로그아웃";">
            </form>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</div>
</body>
</html>
