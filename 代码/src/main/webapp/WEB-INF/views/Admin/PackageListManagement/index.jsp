<%--
  Created by IntelliJ IDEA.
  User: hujian
  Date: 2017/3/24
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>任务列表管理</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class=" m-b-xs col-lg-6">
                            <select class="input-sm   " title="请选择来源" id="theWay">
                                <option value="wechat">微信</option>
                                <option value="qq">qq</option>
                            </select>
                            &nbsp;
                            <select class="input-sm   " title="请选择订单状态" id="packageStatus">
                                <option value="待领取">待领取</option>
                                <option value="已撤销">已撤销</option>
                                <option value="待签收">待签收</option>
                                <option value="待评价">待评价</option>
                                <option value="已评价">已评价</option>
                            </select>
                            &nbsp;
                            <select id="school" class="input-sm input-s-sm inline" title="请选择学校">
                            </select>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped" >
                            <thead>
                            <tr>
                                <th>发布人</th>
                                <th>接受人</th>
                                <th>快递类型</th>
                                <th>快递大小</th>
                                <th>发布时间</th>
                                <th>执行时间</th>
                                <th>完成时间</th>
                            </tr>
                            </thead>
                            <tbody id="packageList">
                            <tr>
                                <td> </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <ul class="pagination" id="pagination"></ul>

                </div>
            </div>
        </div>

    </div>
</div>
<script>
    var loadPage=function (pageNumber) {
        var updateTable=function (data) {
            console.log(data);
            var resultList = data["results"];
            //根据订单种类加载
            if($("#theWay").val()=="wechat"){
            for (var i = 0; i < data["totalCount"]; i++) {
                var result = resultList[i];
                var theName=result.agency==null?"":result.agency.name;
                    $("#packageList").append(
                        '<tr>' +
                        '<td >' + result.delegation.name +
                        '</td>' +
                        '<td>' + theName+
                        '</td>' +
                        '<td>' + result.courierCompany.companyName +
                        '</td>'+
                        '<td>' + result.standard.description +
                        '</td>'+
                        '<td>' + getLocalTime(result.publishTime) +
                        '</td>'+
                        '<td>' + getLocalTime(result.beginTime) +
                        '</td>'+
                        '<td>' + getLocalTime(result.endTime) +
                        '</td>'+
                        '</tr>'
                    )
                }
            }else {
                for (var i = 0; i < data["totalCount"]; i++) {
                    var result = resultList[i];
                    var theName=result.agency==null?"":result.agency.name;
                    $("#packageList").append(
                        '<tr>' +
                        '<td >' + result.name +
                        '</td>' +
                        '<td>' + theName+
                        '</td>' +
                        '<td>' + result.courierCompany.companyName +
                        '</td>'+
                        '<td>' + "*" +
                        '</td>'+
                        '<td>' + getLocalTime(result.createDate) +
                        '</td>'+
                        '<td>' + getLocalTime(result.receiveDate) +
                        '</td>'+
                        '<td>' + getLocalTime(result.endDate) +
                        '</td>'+
                        '</tr>'
                    )
                }
            }
        };
        if($("#theWay").val()=="wechat"){
        Paging("/PackageListManagement/PackageList/packageStatus/" + $("#packageStatus").val()+"/schoolId/"+$("#school").val(),"packageList",updateTable,pageNumber,10);
            }else {
            Paging("/PackageListManagement/UMLPackageList/packageStatus/" + $("#packageStatus").val()+"/schoolId/"+$("#school").val(),"packageList",updateTable,pageNumber,10);
        }
    };

    $(document).ready(
        function () {
            loadSchool("school");
            loadPage(1);
            $("#theWay").change(function () {
                loadPage(1);
            });
            $("#packageStatus").change(function () {
                loadPage(1);
            });
            $("#school").change(function () {
                loadPage(1);
            })
        });


</script>
