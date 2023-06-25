<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>

<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Brand Logo -->
  <a href="#" class="brand-link" style="text-align: center">
    <span class="brand-text font-weight-light">租房管理系统</span>
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar user panel (optional) -->
<%--    <div class="user-panel mt-3 pb-3 mb-3 d-flex">--%>
<%--      <div class="image">--%>
<%--        <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">--%>
<%--      </div>--%>
<%--      <div class="info">--%>
<%--        <a href="#" class="d-block">Alexander Pierce</a>--%>
<%--      </div>--%>
<%--    </div>--%>

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <!-- Add icons to the links using the .nav-icon class
             with font-awesome or any other icon font library -->
        <my:AdminMenuItem url="/">
          <i class="nav-icon fas fa-tachometer-alt"></i>
          <p>
            返回前端
          </p>
        </my:AdminMenuItem>
        <my:AdminMenuItem url="/admin">
          <i class="nav-icon fas fa-tachometer-alt"></i>
          <p>
            主页
          </p>
        </my:AdminMenuItem>
        <my:AdminMenuItem url="/admin-user">
            <i class="nav-icon fas fa-user-alt"></i>
            <p>
              用户管理
            </p>
        </my:AdminMenuItem>
        <my:AdminMenuItem url="/admin-house">
          <i class="nav-icon fas fa-user-alt"></i>
          <p>
            资产管理
          </p>
        </my:AdminMenuItem>
        <li class="nav-item">
          <a href="/login" class="nav-link">
            <i class="nav-icon far fa-sign-out text-info"></i>
            <p>退出登录</p>
          </a>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>
