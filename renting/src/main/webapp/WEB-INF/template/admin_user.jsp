<%@ page import="cn.edu.haust.renting.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<my:layout file="../layouts/AdminLayout.jsp" title="用户管理" />

<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <div class="card">
<%--          <div class="card-header">--%>
<%--            <h3 class="card-title">DataTable with minimal features & hover style</h3>--%>
<%--          </div>--%>
          <!-- /.card-header -->
          <div class="card-body">
            <button type="button" style="margin-bottom: 1em;" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
              添加用户
            </button>
            <table id="example2" class="table table-bordered table-hover">
              <thead>
              <tr>
                <th>ID</th>
                <th>用户名</th>
                <th>手机号</th>
                <th>权限</th>
                <th>创建日期</th>
                <th>操作</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${users}" var="user">
                <tr>
                  <td>${user.id}</td>
                  <td>${user.username}</td>
                  <td>${user.phone}</td>
                  <td>${user.role}</td>
                  <td>${fn:replace(user.createTime, "T", " ")}</td>
                  <td>
                    <button class="btn btn-secondary" onclick="showUpdateUserModal(${user.id})">修改用户</button>
                    <button class="btn btn-danger" onclick="deleteUser(${user.id})">删除用户</button>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container-fluid -->
</section>

<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">添加用户</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="add-form-username">用户名</label>
            <input type="text" class="form-control" id="add-form-username" placeholder="请输入用户名">
          </div>
          <div class="form-group">
            <label for="add-form-password">密码</label>
            <input type="password" class="form-control" id="add-form-password" placeholder="请输入密码">
          </div>
          <div class="form-group">
            <label for="add-form-phone">联系方式</label>
            <input type="text" class="form-control" id="add-form-phone" placeholder="请输入手机号">
          </div>
          <div class="form-group">
            <label>权限</label>
            <input type="number" min="0" max="99" class="form-control" value="0" id="add-form-role" placeholder="请输入权限">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="addUser()">确认提交</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="updateFormModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updateFormModalLabel">修改用户</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="add-form-username">用户名</label>
            <input type="text" readonly class="form-control" id="update-form-username" placeholder="请输入用户名">
          </div>
          <div class="form-group">
            <label for="add-form-password">密码</label>
            <input type="password" class="form-control" id="update-form-password" placeholder="请输入密码">
          </div>
          <div class="form-group">
            <label for="add-form-phone">联系方式</label>
            <input type="text" class="form-control" id="update-form-phone" placeholder="请输入手机号">
          </div>
          <div class="form-group">
            <label>权限</label>
            <input type="number" min="0" max="99" class="form-control" value="0" id="update-form-role" placeholder="请输入权限">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="updateUser()">确认提交</button>
      </div>
    </div>
  </div>
</div>

<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../plugins/jszip/jszip.min.js"></script>
<script src="../../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script src="../../js/jquery.form.min.js"></script>
<script>
  $(function () {
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": false,
      "autoWidth": false,
      "responsive": true,
      "language": {
        "paginate": {
          "next": "下一页",
          "previous": "上一页"
        }
      }
    });
  });

  let updateFormInfo = {

  };

  function deleteUser(id) {
    $.post("#", {
      op: 'delete',
      id
    }, function(res) {
      if(res['status']) {
        alert(res['msg']);
      } else {
        alert(res['msg'])
      }
    });
  }

  function addUser() {
    let username = $("#add-form-username").val().trim();
    let password = $("#add-form-password").val().trim();
    let phone = $("#add-form-phone").val().trim();
    let role = $("#add-form-role").val().trim();
    if(username == "" || password == "") {
      alert("账号或密码不能为空");
      return;
    }
    $.post("#", {
      op: 'add',
      username,
      password,
      phone,
      role
    }, function (res) {
      if(res['status']) {
        alert(res['msg']);
        $("#staticBackdrop").modal("hide");
      } else {
        alert(res['msg']);
      }
      console.log(res);
    });
  }

  function showUpdateUserModal(id) {
    $.post("#", {
      op: 'get',
      id
    }, function (res) {
      updateFormInfo = res['data'];
      $("#update-form-username").val(updateFormInfo['username']);
      $("#update-form-phone").val(updateFormInfo['phone']);
      $("#update-form-role").val(updateFormInfo['role']);
      $("#updateFormModal").modal("show");
    })
  }

  $('#updateFormModal').on('show.bs.modal', function (event) {
    console.log(event);
    // do something...
  })

  function updateUser() {
    let password = $("#update-form-password").val().trim();
    let phone = $("#update-form-phone").val().trim();
    let role = $("#update-form-role").val().trim();
    $.post("#", {
      op: 'update',
      id: updateFormInfo['id'],
      password,
      phone,
      role
    }, function (res) {
      if(res['status']) {
        alert(res['msg']);
        $("#updateFormModal").modal("hide");
      } else {
        alert(res['msg']);
      }
      console.log(res);
    });
  }
</script>