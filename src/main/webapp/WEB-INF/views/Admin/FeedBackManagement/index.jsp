<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/26
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Title</title>
    <link rel="stylesheet" href="/assets/css/mobile.css">
</head>
<body>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>用户反馈管理</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-3" style="float: right">
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped" style="table-layout: fixed">
                            <thead>
                            <tr>
                                <div class="row">
                                    <th width="15%">姓名</th>
                                    <th width="30%">反馈内容</th>
                                    <th width="20%">反馈时间</th>
                                    <th >操作</th>
                                 </div>
                            </tr>
                            </thead>
                            <tbody id="FeedBack">
                            </tbody>
                        </table>
                    </div>
                </div>
                <ul class="pagination" id="pagination"></ul>
            </div>
        </div>
    </div>
</div>

<div class="modal  fade" tabindex="-1" role="dialog" id="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h2 class="modal-title" id="myModalLabel">
                   <b> 反馈内容</b>
                </h2>
            </div>
            <div class="modal-body">
                <p id="feedDetail" style="font-size: large;word-break: break-all">

                </p>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div>

    </div>
</div>
<button data-toggle='modal' data-target='#modal' id="ToDetail" hidden="hidden">123</button>

</body>
<script>

    //分页加载页面
    var loadPage = function (pageNumber) {
        var uploadTable = function (data) {
            var resultList = data["results"];
            for (i = 0; i < resultList.length; i++) {
                var result = resultList[i];
                $("#FeedBack").append(
                    "<tr>"+
                    "<td>" + result.user.name +
                    "</td>" +
                    "<td class='feedContent active avoidOverflow' " +
                    "title='点击查看内容'>" +result.content +
                    "</td>"+
                    "<td>" + getLocalTime(result.submitTime) +
                    "</td>"+
                    '<td><a class="md-delete" id="' + result.id+
                    '">删除</a></td>' +
                    "</tr>"
                );
            }
            deleteMe();
        };
        Paging("/FeedBackManagement/getFeedBack", "FeedBack", uploadTable, pageNumber, 10);
    };

    $(document).ready(
        function () {
            loadPage(1);
    });
    //绑定点击事件
    function deleteMe() {
        $(".md-delete").click(function () {
            var id = this["id"];
            AjaxDeleteRequest("/FeedBackManagement/deleteFeedBack/id/" + id);
            loadThis();
        });
        $(".feedContent").click(function () {
            var content=$(this).text();
            $("#ToDetail").click();
            $("#feedDetail").text(content);
        })
    }

</script>
</html>
