<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    - 添加用户
</rapid:override>
<rapid:override name="header-style">
    <style>
        .layui-form-item .layui-input-inline {
            width: 300px;
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
              <a href="/admin/staff">员工列表</a>
              <a><cite>添加员工</cite></a>
        </span>
    </blockquote>
    <br><br>
    <form class="layui-form" action="/admin/staff/editSubmit" id="userForm"
          method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">用户 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <select name="userId" class="layui-input" id="userId" lay-filter="articleParentCategoryId">
                    <option value=""></option>
                    <c:forEach items="${userList}" var="user">
                        <option value="${user.userId}">${user.userName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="layui-form-mid layui-word-aux" id="userNameTips"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所在部门 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="text" name="department"  id="department" required
                       placeholder="" autocomplete="off" min="2" max="10"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">直属领导 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="text" name="leader"  required
                       placeholder="" autocomplete="off" min="2" max="10"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">工资 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="text" name="wage"  required
                       placeholder="" autocomplete="off" min="2" max="10"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">排班时间开始 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="time" name="beginTimeShow" id="beginTimeShow"
                       lay-verify="required" placeholder="排班时间开始" autocomplete="off" class="layui-input" required>

            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">排班时间结束 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="time" name="endTimeShow" id="endTimeShow"
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
    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp" %>
