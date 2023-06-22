<%@ page import="cn.edu.haust.renting.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<my:layout file="../layouts/AdminLayout.jsp" title="资产管理" />

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
              添加资产
            </button>
            <table id="example2" class="table table-bordered table-hover">
              <thead>
              <tr>
                <th>ID</th>
                <th>标题</th>
                <th>位置</th>
                <th>详情</th>
                <th>封面</th>
                <th>价格</th>
                <th>面积</th>
                <th>更新时间</th>
                <th>发布时间</th>
                <th>操作</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${houses}" var="house">
                <tr>
                  <td>${house.id}</td>
                  <td>${house.title}</td>
                  <td>${house.position}</td>
                  <td>${house.details}</td>
                  <td><img width="150px" src="${house.cover}" /></td>
                  <td>${house.price}</td>
                  <td>${house.area}</td>
                  <td>${fn:replace(house.updateTime, "T", " ")}</td>
                  <td>${fn:replace(house.createTime, "T", " ")}</td>
                  <td>
<%--                    <button class="btn btn-secondary" onclick="showUpdateUserModal(${house.id})">修改用户</button>--%>
                    <button class="btn btn-danger" onclick="deleteHouse(${house.id})">删除资产</button>
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
        <h5 class="modal-title" id="staticBackdropLabel">添加资产</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="add-form">
          <input type="hidden" name="op" value="add">
          <div class="form-group">
            <label>标题</label>
            <input type="text" class="form-control" name="title" id="add-form-title" placeholder="请输入资产标题">
          </div>
          <div class="form-group">
            <label>位置</label>
            <input type="text" class="form-control" name="position" id="add-form-position" placeholder="请输入资产位置">
          </div>
          <div class="form-group">
            <label>详情</label>
            <textarea class="form-control" id="add-form-details" name="details" placeholder="请输入资产详情" rows="3"></textarea>
          </div>
          <div class="form-group">
            <label>封面</label>

            <div id="preview">
              <img id="imghead" border="0" src="images/photo_icon.png" width="40%" onclick="$('#previewImg').click();">
            </div>
            <input type="file" name="cover" onchange="previewImage(this)" style="display: none;" id="previewImg">          </div>
          <div class="form-group">
            <label>价格</label>
            <input type="number" min="0" value="0" class="form-control" name="price" id="add-form-price" placeholder="请描述资产详情">
          </div>
          <div class="form-group">
            <label>面积</label>
            <input type="number" min="0" value="0" class="form-control" name="area" id="add-form-area" placeholder="请描述资产详情">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="addHouse()">确认提交</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="updateFormModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updateFormModalLabel">添加用户</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="add-form-username">标题</label>
            <input type="text" class="form-control" id="update-form-title" placeholder="请输入资产标题">
          </div>
          <div class="form-group">
            <label for="add-form-password">位置</label>
            <input type="password" class="form-control" id="update-form-position" placeholder="请输入资产位置">
          </div>
          <div class="form-group">
            <label for="add-form-phone">详情</label>
            <input type="text" class="form-control" id="update-form-details" placeholder="请描述资产详情">
          </div>
          <div class="form-group">
            <label for="add-form-phone">封面</label>
            <input type="text" class="form-control" id="update-form-cover" placeholder="请描述资产详情">
          </div>
          <div class="form-group">
            <label for="add-form-phone">价格</label>
            <input type="text" class="form-control" id="update-form-price" placeholder="请描述资产详情">
          </div>
          <div class="form-group">
            <label for="add-form-phone">面积</label>
            <input type="text" class="form-control" id="update-form-area" placeholder="请描述资产详情">
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
      "autoWidth": true,
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

  function deleteHouse(id) {
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

  function addHouse() {
    // let formData = $("#add-form").formToArray().reduce((obj, item) => {
    //   obj[item['name']] = item['value'];
    //   return obj;
    // }, {});
    // console.log(formData);

    var options = {
      type: 'post',
      dataType: 'json',
      success: function (data) {
        if (data.status) {
          alert(data.msg);
          // frameElement.api.opener.reloadTable();
          //刷新frameElement.api.close();
          // 关闭窗口
          location.reload();
        } else {
          alert(data.msg);
        }
      },
      error: function () {
        frameElement.api.close();
        var win = frameElement.api.opener;
        alert("出现错误!");
        win.reloadTable();
      }
    };
    $('#add-form').ajaxSubmit(options);


    // $.post("#", formData, function (res) {
    //   console.log(res);
    // });

    // let username = $("#add-form-username").val().trim();
    // let password = $("#add-form-password").val().trim();
    // let phone = $("#add-form-phone").val().trim();
    // if(username == "" || password == "") {
    //   alert("账号或密码不能为空");
    //   return;
    // }
    // $.post("#", {
    //   op: 'add',
    //   username,
    //   password,
    //   phone
    // }, function (res) {
    //   if(res['status']) {
    //     alert(res['msg']);
    //     $("#staticBackdrop").modal("hide");
    //   } else {
    //     alert(res['msg']);
    //   }
    //   console.log(res);
    // });
    //   }
    // }
  }
  function showUpdateUserModal(id) {
    $.post("#", {
      op: 'get',
      id
    }, function (res) {
      updateFormInfo = res['data'];
      $("#update-form-username").val(updateFormInfo['username']);
      $("#update-form-phone").val(updateFormInfo['phone']);
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
    $.post("#", {
      op: 'update',
      id: updateFormInfo['id'],
      password,
      phone
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

  function previewImage(file)
  {
    var MAXWIDTH  = 460;
    var MAXHEIGHT = 320;
    var div = document.getElementById('preview');
    if (file.files && file.files[0])
    {
      div.innerHTML ='<img id=imghead onclick=$("#previewImg").click()>';
      var img = document.getElementById('imghead');
      img.onload = function(){
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        img.width  =  rect.width;
        img.height =  rect.height;
//                 img.style.marginLeft = rect.left+'px';
        img.style.marginTop = rect.top+'px';
      }
      var reader = new FileReader();
      reader.onload = function(evt){img.src = evt.target.result;}
      reader.readAsDataURL(file.files[0]);
    }
    else //兼容IE
    {
      var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
      file.select();
      var src = document.selection.createRange().text;
      div.innerHTML = '<img id=imghead>';
      var img = document.getElementById('imghead');
      img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
      var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
      status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
      div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
    }
  }

  function clacImgZoomParam( maxWidth, maxHeight, width, height ){
    var param = {top:0, left:0, width:width, height:height};
    if( width>maxWidth || height>maxHeight ){
      rateWidth = width / maxWidth;
      rateHeight = height / maxHeight;

      if( rateWidth > rateHeight ){
        param.width =  maxWidth;
        param.height = Math.round(height / rateWidth);
      }else{
        param.width = Math.round(width / rateHeight);
        param.height = maxHeight;
      }
    }
    param.left = Math.round((maxWidth - param.width) / 2);
    param.top = Math.round((maxHeight - param.height) / 2);
    return param;
  }
</script>