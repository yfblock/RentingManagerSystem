<%@ page import="cn.edu.haust.renting.entity.House" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>租房系统</title>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="css/theme.css">

</head>
<body>

<%@include file="../components/home_bar.jsp"%>

<main role="main">
    <section class="mt-4 mb-5">
        <div class="container mb-4" style="text-align: center">
            <h1 class="font-weight-bold title">房屋列表</h1>
            <div class="row" style="justify-content: center;">
                <ul class="navbar-nav" style="display: flex; flex-direction: row;flex-wrap: wrap;width: 120px;justify-content: space-between;">
                    <li class="nav-item">
                        <a class="nav-link" href="#" style="color: #000;">全部</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" style="color: #888;">可租</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" style="color: #888;">已租</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="card-columns">
                    <% for(House house : (List<House>)request.getAttribute("houses")) { %>
                    <div class="card card-pin">
                        <img class="card-img" src="<%=house.getCover()%>" alt="Card image">
                        <div>
                            <h4><%=house.getTitle()%></h4>
                            <div>
                                <a href="/details?id=<%=house.getId()%>">
                                    <i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> 点击查看 </a>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </section>

</main>

<%--<script src="assets/js/app.js"></script>--%>
<%--<script src="assets/js/theme.js"></script>--%>
</body>

</html>
