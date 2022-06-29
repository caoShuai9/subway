<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    - 编辑用户
</rapid:override>
<rapid:override name="header-style">
    <style>
        .layui-form-item .layui-input-inline {
            width: 300px;
        }
        .layui-form-label {
            width: 120px;
        }
        .layui-word-aux {
            color: #FF5722 !important;
        }
    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="layui-elem-quote">
         <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/user">用户列表</a>
              <a><cite>编辑用户</cite></a>
        </span>
    </blockquote>
    <br><br>
    <form class="layui-form" action="/admin/user/editSubmit" id="userForm"
          method="post">
        <input type="hidden" name="userId" id="userId" value="${user.userId}">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="text" value="${user.userName}" name="userName" id="userName" required
                       lay-verify="userName"
                       autocomplete="off" class="layui-input" onblur="checkUserName()">
            </div>
            <div class="layui-form-mid layui-word-aux" id="userNameTips"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="password" name="userPass" value="${user.userPass}" id="userPass" required
                       autocomplete="off" class="layui-input" min="3" max="20">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">昵称 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="text" name="userNickname" value="${user.userNickname}" required
                       placeholder="" autocomplete="off" min="2" max="10"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">权限 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <select name="userType" class="layui-input" id="ifTransfer" lay-filter="articleParentCategoryId" required>
                    <option value="1" <c:if test="${user.userType == '1'}">selected</c:if>>普通用户</option>
                    <option value="2" <c:if test="${user.userType == '2'}"></c:if>>管理员</option>
                    <option value="3" <c:if test="${user.userType == '3'}"></c:if>>保安</option>
                    <option value="4" <c:if test="${user.userType == '4'}"></c:if>>保洁</option>
                    <option value="5" <c:if test="${user.userType == '5'}"></c:if>>志愿者</option>
                </select>
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">Email <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="email" name="userEmail" value="${user.userEmail}" id="userEmail" required
                       lay-verify="userEmail"
                       class="layui-input" onblur="checkUserEmail()">
            </div>
            <div class="layui-form-mid layui-word-aux" id="userEmailTips"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">URL </label>
            <div class="layui-input-inline">
                <input type="url" name="userUrl" value="${user.userUrl}" placeholder="" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="radio" name="userStatus" value="1" title="正常" <c:if test="${user.userStatus==1}">checked</c:if>>
                <input type="radio" name="userStatus" value="0" title="禁用" <c:if test="${user.userStatus==0}">checked</c:if>>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="demo1" id="submit-btn">保存</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>


</rapid:override>
<rapid:override name="footer-script">

    <script>
        //上传图片
        layui.use('upload', function () {
            var $ = layui.jquery,
                upload = layui.upload;
            var uploadInst = upload.render({
                elem: '#test1',
                url: '/admin/upload/img',
                before: function (obj) {
                    obj.preview(function (index, file, result) {
                        $('#demo1').attr('src', result);
                    });
                },
                done: function (res) {
                    $("#").attr("value", res.data.src);
                    if (res.code > 0) {
                        return layer.msg('上传失败');
                    }
                },
                error: function () {
                    var demoText = $('#demoText');
                    demoText.html('' +
                        '<span style="color: #FF5722;">上传失败</span>' +
                        ' <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function () {
                        uploadInst.upload();
                    });
                }
            });

        });
    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp" %>
