<%@ page import="com.spring.work2.domain.HealthInfoDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 교육생16
  Date: 2023-11-06
  Time: 오전 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../../resources/CSS/Style.css">
  <style>
    .date-picker {
      margin-top: 30px;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .date-input {
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px;
      width: 200px;
    }
    .btn_plus{
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .calendar-icon {
      position: absolute;
      top: 50%;
      right: 10px;
      transform: translateY(-50%);
      cursor: pointer;
    }
    .btn{
      margin-left: 20px;
    }
    .table{
      margin-top: 20px;
    }
  </style>
</head>
<body>
<c:import url="./utils/Navbars.jsp"></c:import>

<div class="date-picker">
  <form action="/health/list" method="get">
    <input type="date" class="date-input" name="date" value=<%=request.getParameter("date")%>>
    <input type="submit" class="btn btn-primary" value="조회">
  </form>


</div>
<div class="bs-component">
  <table class="table table-hover">
    <thead>
    <tr>
      <th scope="col">HalthType</th>
      <th scope="col">Date</th>
      <th scope="col">Weight</th>
      <th scope="col">Count</th>
      <th scope="col">modify</th>
    </tr>
    </thead>
    <tbody>
    <tr class="table-active">
      <c:forEach items="${dtoList}" var="dto">
        <tr class="table-active" id="${dto.getHid()}">
          <th scope="row" id="type${dto.getHid()}">${dto.getHEALTHTYPE()}</th>
          <td id="date${dto.getHid()}">${dto.getDate()}</td>
          <td id="weight${dto.getHid()}">${dto.getWeight()}</td>
          <td id="count${dto.getHid()}">${dto.getCount()}</td>
          <td><input type="button" class="btn btn-danger" data-hid="${dto.getHid()}" value="수정"></td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <div class="btn_plus">
  <input type="submit" class="btn btn-primary" value="+" id="openModal">
  </div>
</div><!-- /example -->
</div>
</div>
</div>
<div class="modal" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="mTitle">일지 추가.</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close" onclick="closeFunc()">
          <span aria-hidden="true"></span>
        </button>
      </div>
      <div class="modal-body">
<%--        <form action="/health/register" method="post" id="addForm">--%>
          <fieldset>
            <div class="form-group" style="display: none">
              <input type="date" class="form-control" id="InputDate" name="date" value="<%=request.getParameter("date")%>">
            </div>
            <div class="form-group">
              <label for="InputType" class="form-label mt-4">Type</label>
              <input type="text" class="form-control" id="InputType" placeholder="Enter Type" name="healthtype" >
            </div>
            <div class="form-group">
              <label for="InputWeight" class="form-label mt-4">Weight</label>
              <input type="text" class="form-control" id="InputWeight" placeholder="Weight" name="weight" >
            </div>
            <div class="form-group">
              <label for="InputCount" class="form-label mt-4">Count</label>
              <input type="text" class="form-control" id="InputCount" placeholder="Count" name="count" >
            </div>
            <div class="modal-footer" id="insertDiv" style="display: none">
              <button type="button" class="btn btn-primary" id="saveModal" onclick="saveMod();">추가</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closemodal" onclick="closeFunc();">닫기</button>
            </div>
            <div class="modal-footer" id="modifyDiv" style="display: none">
              <button type="button" class="btn btn-primary" id="modifyModal" onclick="modifymodal()">수정</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="deleteBtn" onclick="deleteThis()">삭제</button>
            </div>
          </fieldset>
<%--        </form>--%>
      </div>
    </div>
  </div>
</div>
<%--<div class="modal" id="modmodal">--%>
<%--  <div class="modal-dialog" role="document">--%>
<%--    <div class="modal-content">--%>
<%--      <div class="modal-header">--%>
<%--        <h5 class="modal-title">수정</h5>--%>
<%--        <button type="button" class="btn-close" data-bs-dismiss="modal" id="closemodal2" aria-label="Close">--%>
<%--          <span aria-hidden="true"></span>--%>
<%--        </button>--%>
<%--      </div>--%>
<%--      <div class="modal-body">--%>
<%--          <fieldset>--%>
<%--            <div id="mod">--%>
<%--            <div class="form-group" style="display: none;">--%>
<%--              <input type="date" class="form-control" id="InputDate" name="date" value="<%=request.getParameter("date")%>">--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--              <label for="HEALTHTYPE" class="form-label mt-4">Type</label>--%>
<%--              <input type="text" class="form-control" id="HEALTHTYPE" placeholder="Enter Type" name="healthtype" >--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--              <label for="InputWeihgt" class="form-label mt-4">Weight</label>--%>
<%--              <input type="text" class="form-control" id="InputWeihgt" placeholder="Weight" name="weight" >--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--              <label for="InputCount2" class="form-label mt-4">Count</label>--%>
<%--              <input type="text" class="form-control" id=InputCount2 placeholder="Count" name="count" >--%>
<%--            </div>--%>
<%--            --%>
<%--            </div>--%>
<%--          </fieldset>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>

<script>
  var openModalBtn=document.getElementById("openModal");
  var modal=document.getElementById("myModal");
  var close=document.getElementById("close");
  var save=document.getElementById("saveModal");
  var modModal=document.getElementById("modmodal");
  var hid;
  var modify=document.getElementById("mod");
  var close2=document.getElementById("closemodal2");
  const divMod = document.getElementById("modifyDiv");
  const addMod =document.getElementById("insertDiv");
  <%--<input type="date" className="form-control" id="exampleInputDate" name="date" value="<%=request.getParameter("date")%>">--%>
  // <input type="text" className="form-control" id="InputType" placeholder="Enter Type" name="healthtype" >
  //   <input type="text" className="form-control" id="Inputweight" placeholder="Weight" name="weight" >
  //     div>
  //     <input type="text" className="form-control" id="InputCount" placeholder="Count" name="count"




  function closeFunc(){
    modal.style.display="none";
    divMod.style.display="none";
    addMod.style.display="none";
  }



  // var mod=document.getElementById("modifyModal");
  // mod.addEventListener("click", function(){
  //   modal.style.display="none";
  //   divMod.style.display="none";
  // })
  function deleteThis(){
    var dataJson = {
      hid: hid,
      type: "",
      weight: 0,
      cnt: 0,
      message: ""
    };
    ajaxSend("delete",dataJson,"/health/delete","성공적으로 삭제되었습니다.");
  }
  function saveMod(){
    var Thealthtype=document.getElementById("InputType").value;
    var Tweight=document.getElementById("InputWeight").value;
    var Tcount=document.getElementById("InputCount").value;
    if (!checkParam()){
      return;
    }
    var form=new FormData();
    form.append("date",<%=request.getParameter("date")%>)
    form.append("type",Thealthtype);
    form.append("weight",Tweight);
    form.append("count",Tcount);
    form.submit();
  }
  function checkParam() {
    var weight = document.getElementById("InputWeight").value;
    var count = document.getElementById("InputCount").value;
    console.log("checkparam");

    if (isNaN(parseFloat(weight)) || !isFinite(weight)) {
      alert("Weight 은 숫자만 입력됩니다..");
      document.getElementById("InputWeight").focus();
      return false;
    } else if (isNaN(parseFloat(count)) || !isFinite(count)) {
      alert("Count 은 숫자만 입력됩니다.");
      document.getElementById("InputCount").focus();
      return false;
    }

    return true;
  }



  openModalBtn.addEventListener("click", function(){
    var doc=document.getElementById("mTitle");
    doc.innerHTML="일지추가";
    modal.style.display="block";
    addMod.style.display="block";


  });
  close.addEventListener("click",function (){

    modal.style.display="none";
    addMod.style.display="none";
  })
  var editBtn=document.querySelectorAll(".btn-danger");
  editBtn.forEach(function(button){
    button.addEventListener('click', function(){
      console.log("here");
      hid=button.getAttribute('data-hid');
      var input = document.createElement("input");
      input.setAttribute("type","hidden");
      input.setAttribute("name","id");
      input.setAttribute("value",hid);
      modal.appendChild(input);
      var doc=document.getElementById("mTitle");
      doc.innerHTML="수정";
      modal.style.display="block";
      divMod.style.display="block";
    })
  })

  //  client side
  function modifymodal(){
    var date = document.getElementById("InputDate").value;
    var Thealthtype=document.getElementById("InputType").value;
    var Tweight=document.getElementById("InputWeight").value;
    var Tcount=document.getElementById("InputCount").value;

    const message="";
    console.log(date);
    if(!checkParam()){
      return;
    }
    var dataJson = {
      hid: hid,
      type: Thealthtype,
      weight: Tweight,
      cnt: Tcount,
      message: ""
    };

    ajaxSend("put", dataJson,"/health/modify","수정되었습니다.");
  }

  function ajaxSend(method, dataJson,url,message) {
    const contextPath = `${pageContext.servletContext.contextPath}`;
    console.log(method);
    console.log(dataJson);
    $.ajax({
      url: contextPath + url
      , method: method
      , headers: {"Content-Type":"application/json;charset=UTF-8"}
      , dataType: "text"
      , data: JSON.stringify(dataJson)
      , success: function (data, textStatus, jqXHR) {
        console.log("success");
        console.log(method);
        console.log(data);
        console.log(textStatus);
        console.log(jqXHR);
        data = JSON.parse(data);
        console.log(document.getElementById("type" + data.hid))
        alert(message);
        if (method === "delete") {
          document.getElementById(hid).remove();
          document.getElementById("modmodal").style.display="none";
        } else {
          location.reload();
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

</script>
</body>


</html>
