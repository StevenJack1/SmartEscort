<%--
  Created by IntelliJ IDEA.
  User: stevenjack
  Date: 2017/3/25/025
  Time: 10:42
  To change this template use File | Settings | File Templates.
  个人中心页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>

<!--页面-->
<div class="page badge js_show" style="background-color: #eeeeeb">
    <div class=" navn1" >
        <img class="img-circle navicon" src="/assets/img/a5.jpg" style="width: 50px;display: block">
    </div>
    <div class=" navn2" >
        <strong><p id="userName" class="navuser"></p></strong>
    </div>
    <div class=" navn3" >
        <p style="font-size: 13px;color: #888888;" class="navuser">摘要信息</p>
    </div>

    <div class="page__hd">
        <div class="weui-grids" style="background-color: #ffffff">
            <a href="/User/MyPublish/" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="/assets/img/daishouhuo.png" alt="">
                </div>
                <p class="weui-grid__label">我的发布</p>
            </a>
            <a href="/User/MyDart/" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="/assets/img/daijiebiao.png" alt="">
                </div>
                <p class="weui-grid__label">我的接单</p>
            </a>
            <a href="/User/WaitingEvaluation/" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="/assets/img/daipingjia.png" alt="">
                </div>
                <p class="weui-grid__label">待评价</p>
            </a>
        </div>
    </div>
    <div class="weui-cells">
        <a href="/User/AllDart/">
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd">
                    <div style="float: left">
                        <span class="fa-stack fa-lg">
                            <i class="fa fa-square fa-stack-2x" style="color: #5090cd"></i>
                          <i class="fa fa-list fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div style="float: left;margin-top: 3px;" class="font_color">
                        <span style="vertical-align: middle; margin-top: 3px;">&nbsp;全部订单</span>
                    </div>
                </div>
                <div class="weui-cell__ft">查看全部订单</div>
            </div>
        </a>
    </div>
    <div class="weui-cells">
        <a href="/User/ManageAddress/">
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd">
                    <div style="float: left">
                         <span class="fa-stack fa-lg">
                            <i class="fa fa-square fa-stack-2x" style="color: #89C6E4"></i>
                            <i class="fa fa-map-marker fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div style="float: left;margin-top: 3px;" class="font_color">
                        <span style="vertical-align: middle; margin-top: 3px;">&nbsp;抵达地点</span>
                    </div>
                </div>
                <div class="weui-cell__ft">详细地址管理</div>
            </div>
        </a>
        <a href="/User/MyConcern/">
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd">
                    <div style="float: left">
                        <span class="fa-stack fa-lg">
                            <i class="fa fa-square fa-stack-2x" style="color: #ADAAE4"></i>
                            <i class="fa fa-star fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div style="float: left;margin-top: 3px;">
                        <span style="vertical-align: middle; margin-top: 3px;" class="font_color">&nbsp;我的关注</span>
                        <span class="weui-badge" style="margin-left: 5px; margin: auto;">8</span>
                    </div>
                </div>
                <div class="weui-cell__ft"></div>
            </div>
        </a>
        <a href="/User/Notice/">
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd">
                    <div style="float: left">
                        <span class="fa-stack fa-lg">
                            <i class="fa fa-square fa-stack-2x" style="color: #158C70"></i>
                            <i class="fa fa-envelope fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div style="float: left;margin-top: 3px;" class="font_color">
                        <span style="vertical-align: middle; margin-top: 3px;font-size: 17px">&nbsp;通知</span>
                        <span class="weui-badge" style="margin-left: 5px; margin: auto;">8</span>
                    </div>
                </div>
                <div class="weui-cell__ft"></div>
            </div>
        </a>
    </div>

    <div class="weui-cells">
        <a href="/User/FeedBack/">
                <div class="weui-cell weui-cell_access">
                    <div class="weui-cell__bd">
                        <div style="float: left">
                            <span class="fa-stack fa-lg">
                                <i class="fa fa-square fa-stack-2x" style="color: #79C3F1"></i>
                                <i class="fa fa-comment fa-stack-1x fa-inverse"></i>
                            </span>
                        </div>
                        <div style="float: left;margin-top: 3px;">
                            <span style="vertical-align: middle; margin-top: 3px; font-size: 17px" class="font_color">&nbsp;意见反馈</span>
                            <span class="weui-badge" style="margin-left: 5px; margin: auto;">8</span>
                        </div>
                    </div>
                    <div class="weui-cell__ft"></div>
                </div>
        </a>
        <a href="/User/UserInfomation/">
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd">
                    <div style="float: left">
                         <span class="fa-stack fa-lg">
                            <i class="fa fa-square fa-stack-2x" style="color: #7FBBB4"></i>
                            <i class="fa fa-cog fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div style="float: left;margin-top: 3px;">
                        <span style="vertical-align: middle; margin-top: 3px;font-size: 17px" class="font_color">&nbsp;设置</span>
                    </div>
                </div>
                <div class="weui-cell__ft"></div>
            </div>
        </a>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#personalCenter").addClass("weui-bar__item_on");
    });
    var fillUser = function(result) {
        $("#userName").text(result.name);
    };
    $(document).ready(function () {
        Get("/UserManagement/UserInfo", fillUser);
    });
</script>
<%@include file="/user_footer.jsp"%>
