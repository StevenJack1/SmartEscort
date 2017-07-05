<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/15/015
  Time: 15:57
  To change this template use File | Settings | File Templates.
  评价详情页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<style>
    .starShow{float:left;width:26px;height:20px;background:url(/assets/img/star.png) 0 -20px no-repeat;}
    .starPosition{
        position: absolute;
        width: 300px;
        height: 30px;
    }
    .starPosition_inner{
        position: absolute;
        width: 200px;
        height: 20px;
        left: 120px;
    }
    .starPosition_outer{
        position: absolute;
        width: 100px;
        height: 20px;
        left: 20px;
    }
</style>
<div id="frame" style="background-color: #FFFFFF">
    <div id="top">
        <span id="list">
            <a href="/User/WaitingEvaluation/"><img src="/assets/img/goback.png" align="top"></a>
        </span>
        <a id="title">发表评价</a>
        <a id="title_submit" href="javascript:void(0);">提交</a>
    </div>
    <div class="weui-panel__bd">
        <div class="weui-media-box weui-media-box_appmsg">
            <div class="weui-media-box__hd">
                <img class="weui-media-box__thumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg==" alt="">
            </div>
            <div class="weui-media-box__bd">
                <h4 class="weui-media-box__title" style="right: 200px;font-family: Helvetica Neue, Helvetica, Arial, sans-serif;font-size: 20px">&nbsp;评分</h4>
            </div>
        </div>
    </div>
    <div class="starPosition">
        <%--<div class="starPosition_outer" id="scoreShow"></div>--%>
        <div class="starPosition_inner">
            <a href="javascript:;" class="starShow"></a>
            <a href="javascript:;" class="starShow"></a>
            <a href="javascript:;" class="starShow"></a>
            <a href="javascript:;" class="starShow"></a>
            <a href="javascript:;" class="starShow"></a>
        </div>
    </div>
    <br>
    <div class="weui-cells weui-cells_form"style="background-color: #F9F9F9">
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <textarea class="weui-textarea textarea" id="counts" placeholder="请填写您对此次交易的评价，并进行相应的打分" rows="5" style="background-color: #F9F9F9;font-family: SimSun-ExtB;font-size: 15px"></textarea>
                <div class="weui-textarea-counter"><span id="remainingwords">0</span>/500</div>
            </div>
        </div>
    </div>
    <%--<div class="weui-cell">--%>
        <%--<div class="weui-cell__bd">--%>
            <%--<div class="weui-uploader">--%>

                <%--<div class="weui-uploader__bd">--%>
                    <%--<ul class="weui-uploader__files" id="uploaderFiles">--%>
                        <%--<li class="weui-uploader__file" style="background-image:url(/assets/img/a1.jpg)"></li>--%>
                        <%--<li class="weui-uploader__file weui-uploader__file_status" style="background-image:url(./images/pic_160.png)">--%>
                            <%--<div class="weui-uploader__file-content">--%>
                                <%--<i class="weui-icon-warn"></i>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                    <%--<div class="weui-uploader__input-box">--%>
                        <%--<input id="uploaderInput" class="weui-uploader__input" type="file" accept="image/*" multiple="">--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>


</div>

<%--//控制评论字数--%>
<script language="javascript" type="text/javascript">
    $("#counts").keyup(function(){
        if($("#counts").val().length > 500){
            $("#counts").val( $("#counts").val().substring(0,500) );
        }
        $("#remainingwords").text($("#counts").val().length ) ;
    });
</script>

<script>
    $(document).ready(function () {
        $("#personalCenter").addClass("weui-bar__item_on");
    });
</script>

<%--星星评分--%>
<script type="text/javascript">
    window.onload = function(){
        var star = document.getElementsByTagName('a');
        var oDiv = document.getElementsByTagName('div')[0];
        var temp = 0;
        for(var i = 0, len = star.length; i < len; i++){
            star[i].index = i;
            star[i].onmouseover = function(){
                clear();
                for(var j = 0; j < this.index + 1; j++){
                    star[j].style.backgroundPosition = '0 0';
                }
            }
            star[i].onmouseout = function(){
                for(var j = 0; j < this.index + 1; j++){
                    star[j].style.backgroundPosition = '0 -20px';
                }
                current(temp);
            }
            star[i].onclick = function(){
                temp = this.index + 1;
//                document.getElementsByTagName('p')[0].innerHTML = temp + ' 颗星';
//                if(temp == 5){
//                    $("#scoreShow").val("90-100分")
//                }
                current(temp);
            }
        }
        //清除所有
        function clear(){
            for(var i = 0, len = star.length; i < len; i++){
                star[i].style.backgroundPosition = '0 -20px';
            }
        }
        //显示当前第几颗星
        function current(temp){
            for(var i = 0; i < temp; i++){
                star[i].style.backgroundPosition = '0 0';
            }
        }
    };
</script>
<%@include file="/user_footer.jsp"%>
