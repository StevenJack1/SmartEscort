<%--
  Created by IntelliJ IDEA.
  User: hujian
  Date: 2017/3/25
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>自定义响应式表格</h5>
                    <%--<div class="ibox-tools">
                        &lt;%&ndash;<a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
                            <i class="fa fa-wrench"></i>
                        </a>&ndash;%&gt;
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="table_basic.html#">选项1</a>
                            </li>
                            <li><a href="table_basic.html#">选项2</a>
                            </li>
                        </ul>
                        &lt;%&ndash;<a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>&ndash;%&gt;
                    </div>--%>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <button type="button" class="btn btn-w-m btn-primary" data-toggle="modal"
                                data-target="#myModal1">添加学校
                        </button>
                        <button type="button" class="btn btn-w-m btn-info" data-toggle="modal" data-target="#myModal2" id="myModal3">
                            添加地址
                        </button>
                        <%--<div class="col-sm-3" style="float: right">
                            <div class="input-group">
                                <input type="text" placeholder="请输入关键词" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary"> 搜索</button> </span>
                            </div>
                        </div>--%>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>学校名称</th>
                                <th>区域名称</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="AddressTable">
                            </tbody>
                        </table>
                    </div>
                    <ul class="pagination" id="pagination"></ul>
                </div>

            </div>
        </div>
    </div>
</div>
<%--弹窗新增学校--%>
<div class="modal inmodal fade in" id="myModal1" tabindex="-1" role="dialog" aria-hidden="true"
     style="display: none ; padding-right: 17px;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">添加学校</h4>
                <small class="font-bold">这里可以显示副标题。
                </small>
            </div>
            <small class="font-bold">
                <div class="modal-body" align="center">
                    <input type="text" placeholder="请输入学校名称" class="form-control" name="min" id="schoolName"
                           style="
                width: 8cm;">
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal" id="schoolCancelButton">取消</button>
                    <button type="button" class="btn btn-primary" id="schoolCreateButton">确认</button>
                </div>
            </small>
        </div>
        <small class="font-bold">
        </small>
    </div>
    <small class="font-bold">
    </small>
</div>
<%--弹窗新增学校的区域--%>
<div class="modal inmodal fade in" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true"
     style="display: none ; padding-right: 17px;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">添加地址</h4>
                <small class="font-bold">这里可以显示副标题。
                </small>
            </div>



                <div class="modal-body">

                    <form class="form-horizontal" role="form">

                        <div class="form-group">
                            <label class="col-sm-4 control-label" >选择学校</label>
                            <div class="col-sm-6">
                                <label>
                                    <select class="form-control" id="selectSchoolName"
                                            data-placeholder="选择学校">

                                    </select>
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">地址</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" placeholder="请输入地址" name="projectTheme"
                                       id="addressDescription">
                            </div>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal" id="createCancelButton">关闭</button>
                    <button type="button" class="btn btn-primary" id="createButton">保存</button>
                </div>

        </div>
        <small class="font-bold">
        </small>
    </div>
    <small class="font-bold">
    </small>
</div>


<script type="text/javascript">

    //删除地址
    var deleteMe = function deleteMe() {
        $(".md-delete").click(function () {
            var id = this["id"];
            var idArr = id.split("/");
            var areaId=idArr[0];
            var schoolId=idArr[1];
            console.log(idArr);
            $.ajax({
                url: "/AddressManagement/DeleteAreaBySchool/schoolId/"+schoolId+"/areaId/"+areaId,
                type: "DELETE",
                success: function () {
                    swal({
                        title: "成功",
                        text: "删除成功",
                        type: "success",
                        confirmButtonText: "知道了"
                    });
                    var pageNumber = $(".pagination .active")[0].innerText;
                    loadPage(pageNumber);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                        swal({
                            title: "出错了！",
                            text: "错误信息" + XMLHttpRequest.status,
                            type: "error",
                            confirmButtonText: "知道了"

                    });
                }
            });
        });
    };

    //分页加载页面
    var loadPage = function (pageNumber) {
        var uploadTable = function (data) {
            var resultList = data["results"];
            $("#AddressTable").empty();
            for (var i = 0; i < data["totalCount"]; i++) {
                var result = resultList[i];
                //console.log(result);
                var areaList=result.areaList;
                //console.log(areaList);
                for(var j=0;j<areaList.length;j++){
                    var area=areaList[j];
                    $("#AddressTable").append(
                        '<tr>' +
                        '<td >' +result.schoolName+
                        '</td>' +
                        '<td>' +area.areaName+
                        '</td>' +
                        '<td><a class="md-delete" id="'+area.id+"/"+result.id+
                        '">删除</a></td>' +
                        '</tr>'
                    );
                }
            }
        };
        Paging("/AddressManagement/getAddressList", "AddressTable", uploadTable, pageNumber, 10);
        deleteMe();
    };
    $(document).ready(
        function () {
            loadPage(1);
        }
    );



    //新增学校
    $("#schoolCreateButton").click(function () {
        var schoolName = $("#schoolName").val();
        if (isNullOrEmpty(schoolName)) {
            swal({
                title: "错误",
                text: "不可为空",
                type: "error",
                confirmButtonText: "知道了"
            });
        } else {

            AjaxPostRequest("/AddressManagement/createSchool/schoolName/" + schoolName);

           $("#schoolCancelButton").click();
            var pageNumber = $(".pagination .active")[0].innerText;
            loadPage(pageNumber);
        }
        $("#schoolName").val("");
    });

    //添加地址时触发
    $("#myModal3").click(function () {
        selectSchoolName("selectSchoolName");
    });
    //加载学校
    var selectSchoolName = function selectSchoolName(id) {
        "use strict";
        var success = function success(list) {
            $("#" + id).empty();
            for (var i = 0; i < list.length; i++)
                $("#" + id).append('<option value="' + list[i].id + '">' + list[i].schoolName + '</option>')
        };
        AjaxGetRequest("/UserManagement/getSchoolList/", success);
    };

    //添加地址
    $("#createButton").click(function () {

        var areaName = $("#addressDescription").val();
        var selectSchoolName = $("#selectSchoolName").val();
        console.log(selectSchoolName);
        if (isNullOrEmpty(areaName) || isNullOrEmpty(selectSchoolName)) {
            swal({
                title: "错误",
                text: "不可为空",
                type: "error",
                confirmButtonText: "知道了"
            });
        } else {
            AjaxPostRequest("/AddressManagement/createArea/areaName/" + areaName +
                "/schoolId/" + selectSchoolName);
            $("#createCancelButton").click();
            var pageNumber = $(".pagination .active")[0].innerText;
            loadPage(pageNumber);
        }
        $("#addressDescription").val("");
    });

</script>
