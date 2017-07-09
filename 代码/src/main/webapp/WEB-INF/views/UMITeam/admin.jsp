<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/7/8
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>团队接单管理</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class=" m-b-xs col-lg-6">
                            <select class="input-sm   " title="请选择发布方式" id="theWay">
                                <option value="qq">qq</option>
                                <option value="wechat">微信</option>
                            </select>
                            &nbsp;
                            <select id="packageType" class="input-sm input-s-sm inline" title="请选择快递类型">
                            </select>
                            &nbsp;
                            <select id="school" class="input-sm input-s-sm inline" title="请选择学校">
                            </select>
                            &nbsp;
                            <select id="area" class="input-sm input-s-sm inline" title="请选择区域">
                            </select>
                            &nbsp;
                            <select class="input-sm   " title="请选择订单状态" id="packageStatus">
                                <option value="待领取">待领取</option>
                                <option value="待签收">待签收</option>
                                <option value="待评价">已完成</option>
                            </select>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped" >
                            <thead>
                            <tr>
                                <th>发布人</th>
                                <th>手机号码</th>
                                <th>详细地址</th>
                                <th>短信内容</th>
                                <th>发布时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="packageList">
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
        var updatePackageTable=function (data) {
            var resultList = data["results"];
            for (var i = 0; i < data["totalCount"]; i++) {
                var result = resultList[i];
                $("#packageList").append(`
                    <tr>
                        <td>`+result.receiverName+`</td>
                        <td>`+result.receiverPhoneNumber+`</td>
                        <td>`+result.addressDetail+`</td>
                        <td>`+result.message+`</td>
                        <td>`+result.publishTime+`</td>
                        <td></td>
                    </tr>
                `);
            }
        };
        var updateUMIPackageTable=function (data) {
            var resultList = data["results"];
            for (var i = 0; i < data["totalCount"]; i++) {
                var result = resultList[i];
                $("#packageList").append(`
                    <tr>
                        <td>`+result.name+`</td>
                        <td>`+result.phoneNumber+`</td>
                        <td>`+result.detailAddress+`</td>
                        <td>`+result.message+`</td>
                        <td>`+result.createDate+`</td>
                        <td></td>
                    </tr>
                `);
            }
        };
        if($("#theWay").val() === "qq"){
            Paging("/UMITeam/umiPackageList/packageType/"+$("#packageType").val()+"/areaId/"+$("#area").val()+"/packageStatus/" + $("#packageStatus").val(),"packageList",updateUMIPackageTable,pageNumber,10);
        }else {
            Paging("/UMITeam/packageList/packageType/"+$("#packageType").val()+"/areaId/"+$("#area").val()+"/packageStatus/" + $("#packageStatus").val(),"packageList",updatePackageTable,pageNumber,10);
        }
        deleteOne();
    };

    //删除订单
    function deleteOne() {
        $(".md-delete").click(function () {
            var id = this["id"];
            AjaxDeleteRequest("/PackageListManagement/deletePackage/id/" + id);
            loadThis();
        });
    }

    $(document).ready(
        function () {
            loadSchool("school");
            loadArea("area", $("#school").val());
            loadPackageType("packageType");
            loadPage(1);
            $("#packageType").change(function () {
                loadPage(1);
            });
            $("#theWay").change(function () {
                loadPage(1);
            });
            $("#packageStatus").change(function () {
                loadPage(1);
            });
            $("#school").change(function () {
                loadArea("area",$("#school").val());
                loadPage(1);
            });
            $("#area").change(function () {
                loadPage(1);
            });
        });

</script>
