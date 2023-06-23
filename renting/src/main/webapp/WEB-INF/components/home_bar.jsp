<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
  <a class="navbar-brand font-weight-bolder mr-3" href="/">租房系统</a>
  <button class="navbar-light navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsDefault" aria-controls="navbarsDefault" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarsDefault">
    <ul class="navbar-nav mr-auto align-items-center">
      <form class="bd-search hidden-sm-down">
        <input type="text" class="form-control bg-graylight border-0 font-weight-bold" id="search-input" placeholder="请输入要搜索的关键词" autocomplete="off">
        <div class="dropdown-menu bd-search-results" id="search-results">
        </div>
      </form>
    </ul>
    <ul class="navbar-nav ml-auto align-items-center">
      <li class="nav-item">
        <a class="nav-link active" href="/">主页</a>
      </li>
      <c:if test="${user.role > 0}">
        <li class="nav-item">
          <a class="nav-link active" href="/admin">后台管理</a>
        </li>
      </c:if>
      <li class="nav-item">
        <c:if test="${user != null}">
          <a class="nav-link" href="#"><span class="align-middle">${user.username}</span></a>
        </c:if>
        <c:if test="${user == null}">
          <a class="nav-link" href="/login"><span class="align-middle">登录</span></a>
        </c:if>
      </li>
    </ul>
  </div>
</nav>
