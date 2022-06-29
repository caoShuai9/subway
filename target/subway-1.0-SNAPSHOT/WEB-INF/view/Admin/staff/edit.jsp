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
    <form class="layui-form" action="/admin/staff/editSubmit" id="userForm"
          method="post">
        <input type="hidden" name="userId" id="userId" value="${user.userId}">



<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">密码 <span style="color: #FF5722; ">*</span></label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="password" name="userPass" value="${user.userPass}" id="userPass" required--%>
<%--                       autocomplete="off" class="layui-input" min="3" max="20">--%>
<%--            </div>--%>
<%--            <div class="layui-form-mid layui-word-aux"></div>--%>
<%--        </div>--%>
        <div class="layui-form-item">
            <label class="layui-form-label">所在部门 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="text" name="department" id="department" value="${user.department}"  required
                       placeholder="" autocomplete="off" min="2" max="10"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">直属领导 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="text" name="leader" required value="${user.leader}"
                       placeholder="" autocomplete="off" min="2" max="10"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">工资 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="text" name="wage" required value="${user.wage}"
                       placeholder="" autocomplete="off" min="2" max="10"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">排班时间开始 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="time" name="beginTimeShow" id="beginTimeShow" value="${user.beginTimeShow}"
                       lay-verify="required" placeholder="排班时间开始" autocomplete="off" class="layui-input" required>

            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">排班时间结束 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="time" name="endTimeShow" id="endTimeShow" value="${user.endTimeShow}"
                       lay-verify="required" placeholder="排班时间结束" autocomplete="off" class="layui-input" required>
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
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
