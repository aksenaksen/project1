<%--
  Created by IntelliJ IDEA.
  User: 교육생16
  Date: 2023-11-03
  Time: 오후 3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <title>Login</title>
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

<div class="centered-form">
    <form action="/login" method="post">
        <fieldset>
            <legend>Login</legend>
            <div class="form-group row">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1" class="form-label mt-4">Id</label>
                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter id" name="username" >
                <small id="emailHelp" class="form-text text-muted">아이디를 입력해주세요</small>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1" class="form-label mt-4">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password" >
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
            <button type="button" id="register-btn" class="btn btn-outline-secondary" onclick="openFunc()">Register</button>
        </fieldset>
    </form>
    <div class="modal" id="myModal">

<%--            <div class="modal-dialog modal-dialog-centered modal-lg" role="document"  style="max-width: 800px;">--%>
    <div class="modal-dialog modal-dialog-centered" role="document" style="max-width: 800px;">
    <form action="/register" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="mTitle">Register</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close" onclick="closeFunc()">
                            <span aria-hidden="true"></span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group">
                                <label for="ID" class="form-label mt-4">ID</label>
                                <input type="text" class="form-control" id="ID" placeholder="ID.." name="username" onblur="checkDuplicateID();">
                                <span id="idStatus"></span>
                            </div>
                            <div class="form-group">
                                <label for="PW" class="form-label mt-4">Password</label>
                                <input type="password" class="form-control" id="PW" placeholder="****" name="password" value="">
                            </div>
                            <div class="modal-footer" id="insertDiv">
                                <button type="submit" class="btn btn-primary" id="saveModal" style="display: none">등록</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closemodal" onclick="closeFunc();" value="">닫기</button>
                            </div>
                        </fieldset>
                    </div>
                </div>
                </form>
            </div>

    </div>

</div>
<script>

    function ajaxSend(method, dataJson,url,message) {
        const contextPath = `${pageContext.servletContext.contextPath}`;
        console.log(method);
        console.log(dataJson);
        $.ajax({
            url: contextPath + url
            , method: method

            , success: function (data, textStatus, jqXHR) {
                console.log("success");
                if (response.isDuplicate) {
                    $("#idStatus").html("이미 사용 중인 아이디입니다.");
                } else {
                    $("#idStatus").html("사용 가능한 아이디입니다.");

                }
            }
            , error: function (jqXHR, textStatus, errorThrown) {
                console.log("error");
                console.log(jqXHR);
                console.log(textStatus);
                console.log(errorThrown);
            }
        })
    }

    function checkDuplicateID() {
        var enteredID = $("#ID").val();
        var dataJson={ ID : enteredID};
        // 서버에 중복된 아이디 확인을 위한 AJAX 요청
        $.ajax({
        url: "/checkID", // 실제 서버 측 엔드포인트로 대체
        method: "POST",
            headers: {"Content-Type":"application/json;charset=UTF-8"},
            dataType: "text"
            , data: JSON.stringify(dataJson),
        success: function(response) {
            console.log(response)
        // 서버에서의 응답 처리
        if (response=="false") {
        $("#idStatus").html("이미 사용 중인 아이디입니다.");
            document.getElementById("saveModal").style.display="none";
        } else {
        $("#idStatus").html("사용 가능한 아이디입니다.");
        document.getElementById("saveModal").style.display="block";
    }
    },
        error: function(error) {
        console.log(error);
    }
    });
    }


var modal=document.getElementById("myModal");
    function openFunc(){
        modal.style.display="block";
    }

    function closeFunc(){
        modal.style.display="none";
        divMod.style.display="none";
        addMod.style.display="none";
    }

</script>
</body>
</html>

