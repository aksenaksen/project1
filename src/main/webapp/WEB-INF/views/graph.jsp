<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.time.Instant" %>
<%@ page import="java.lang.reflect.Array" %><%--
  Created by IntelliJ IDEA.
  User: 교육생16
  Date: 2023-11-08
  Time: 오후 1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../resources/CSS/Style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <title>Chart.js 점 그래프 예제</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js/auto"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/moment"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
</head>
<body>
<c:import url="./utils/Navbars.jsp"></c:import>
<form class="select-form" action="/health/graph" method="get">
  <select class="form-select" name="day" onchange="this.form.submit();">
    <option value="day" <c:if test="${param.day=='day'}">selected</c:if>>일간</option>
    <option value="month" <c:if test="${param.day=='month'}">selected</c:if>>월간</option>
    <option value="year" <c:if test="${param.day == 'year'}">selected</c:if>>년간</option>
  </select>
</form>

<canvas id="myChart" width="1500" height="400"></canvas>
<div class="container">
  <div class="row">
    <div class="col-md-4">
      <div class="card bg-light mb-3" style="max-width: 20rem;">
        <div class="card-header" id="textTitle"> </div>
        <div class="card-body">
          <p class="card-text" id="textType"></p>
        </div>
      </div>
    </div>
    <div class="col-md-4" id="warn" style="display:none;">
      <div class="card text-white bg-danger mb-3" style="max-width: 20rem;">
        <div class="card-header">심각합니다 운동하십쇼</div>
        <div class="card-body">
          <h4 class="card-title">운동해</h4>
        </div>
      </div>
    </div>
    <div class="col-md-4" id="soso" style="display:none;">
      <div class="card text-white bg-warning mb-3" style="max-width: 20rem;">
        <div class="card-header">좋진 않아요</div>
        <div class="card-body">
          <h4 class="card-title">더 열심히해야겠죠</h4>
        </div>
      </div>
    </div>
  </div>
  <div class="row" id="good" style="display:none;">
    <div class="col-md-4">
      <div class="card text-white bg-success mb-3" style="max-width: 20rem;e">
        <div class="card-header">잘하고있습니다!</div>
        <div class="card-body">
          <h4 class="card-title">더 증진하세요</h4>
        </div>
      </div>
    </div>
    <!-- Add more cards and columns as needed -->
  </div>
</div>

<%!
  int max=0;
    public ArrayList<String> make_json(List<String> list, List<String> dateList) {
      System.out.println(dateList.toString());
      ArrayList<String> newList = new ArrayList<>();

      for (int i = 0; i < list.size(); i++) {
        int tmp = Integer.parseInt(list.get(i));
        if (tmp > max) {
          max = tmp;
        }
        newList.add(list.get(i));

      }
      return newList;
    }


%>
<%
  List<String> weightList= (List<String>) request.getAttribute("weightList");
  List<String> FatList=(List<String>) request.getAttribute("FatList");
  List<String> MuscleList=(List<String>) request.getAttribute("MuscleList");
  List<String> DateList=(List<String>) request.getAttribute("DateList");
  System.out.println(weightList.size());
  System.out.println(DateList.toString());
  ArrayList<String> json1=make_json(weightList,DateList);
  ArrayList<String> json2=make_json(FatList,DateList);
  ArrayList<String> json3=make_json(MuscleList,DateList);

  List<Double> FatPer = new ArrayList<>();
  for (int i=0;i<FatList.size();i++){
    FatPer.add(Double.parseDouble(FatList.get(i))/Double.parseDouble(weightList.get(i))*100);
  }

//  String jsonData = "[{x: 10, y: 20}, {x: 20, y: 30}, {x: 30, y: 40}, {x: 40, y: 50}, {x: 50, y: 60}]";
%>

<script>
  var date = [<%= DateList.stream().map(date -> "'" + date + "'").collect(java.util.stream.Collectors.joining(",")) %>];
  console.log(date);
  var json1 = <%=json1%>;
  console.log("json1=", json1);
  for (var i=0;i<date.length; i++){
    console.log(date[i]);
  }


  var json2 = <%=json2%>;
  var json3 = <%=json3%>;
  var json4= <%=FatPer%>;
  var length=json4.length;
  var dataJson={
    current_fat:json4[length-1],
    last_fat:json4[length-2]
  }
  if (json4[length-1]<json4[length-2]|| json4[length-1]<10){
    document.getElementById("good").style.display="block";
  }
  else if(json4[length-1]-json4[length-2]<2 || json4[length-1]<13){
    document.getElementById("soso").style.display="block";

  }
  else{
    document.getElementById("warn").style.display="block";
  }

  ajaxSend("put",dataJson,"/health/graph/logic","");
  function ajaxSend(method, dataJson,url,message) {
    const contextPath = `${pageContext.servletContext.contextPath}`;
    console.log(method);
    console.log(dataJson);
    console.log(dataJson);
    $.ajax({
      url: contextPath+ url
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
        data=JSON.parse(data);
        var title=document.getElementById("textTitle");
        var tmp=document.getElementById("textType");
        console.log(data);
        title.innerHTML="추천운동 bmi "+data.mesure_iem_018_value;
        tmp.innerHTML=data.mvm_prscrptn_cn;
      }
      , error: function (jqXHR, textStatus, errorThrown) {
        console.log("error");
        console.log(jqXHR);
        console.log(textStatus);
        console.log(errorThrown);
      }
    })
  }

  var data = {
    labels: date,
    datasets: [
      {
        label: "Weight",
        data: json1,
        pointBackgroundColor: 'blue',
        borderColor: 'blue',
        fill: false,
        tension: 0.2
      },
      {
        label: "Fat",
        data: json2,
        pointBackgroundColor: 'red',
        borderColor: 'red',
        fill: false,
        tension: 0.2
      },
      {
        label: "Muscle",
        data: json3,
        pointBackgroundColor: 'yellow',
        borderColor: 'yellow',
        fill: false,
        tension: 0.2
      },
      {
        label: "FatPer",
        data: json4,
        pointBackgroundColor: 'black',
        borderColor: 'black',
        fill: false,
        tension: 0.2
      }
    ]
  };

  var config = {
    type: 'line',
    data: data,
    options: {
      responsive: false,

      }

  };

  document.addEventListener('DOMContentLoaded', function () {
    var ctx = document.getElementById('myChart').getContext('2d');
    new Chart(ctx, config);
  });
</script>
</body>
</html>
