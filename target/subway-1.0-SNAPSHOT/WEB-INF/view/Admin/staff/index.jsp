<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - 用户列表
    </rapid:override>
<rapid:override name="header-style">
    <style>
        /*覆盖 layui*/

        .layui-table {
            margin-top: 0;
        }

        .layui-btn {
            margin: 2px 0!important;
        }
    </style>
</rapid:override>

<rapid:override name="content">
    <blockquote class="layui-elem-quote">
         <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a><cite>用户列表</cite></a>
        </span>
    </blockquote>

<table class="layui-table" lay-even lay-skin="nob" >
    <colgroup>
        <col width="100">
        <col width=100">
        <col width="100">
        <col width="100">
        <col width="150">
        <col width="100">
        <col width="200">
        <col width="200">
        <col width="100">
    </colgroup>
    <thead>
    <tr>
        <th>用户名</th>
        <th>昵称</th>
        <th>用户角色</th>
        <th>所在部门</th>
        <th>直属领导</th>
        <th>工资</th>
        <th>排班开始时间</th>
        <th>排班结束时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${userList}" var="u">
        <tr>
            <td>
                ${u.userName}
            </td>
            <td>
                ${u.userNickname}
            </td>
            <td>
                <c:choose>
                    <c:when test="${u.userType=='1'}">
                        <span style="color:#FF5722;">普通用户</span>
                    </c:when>
                    <c:when test="${u.userType=='2'}">
                        <span style="color:#FF5722;">管理员</span>
                    </c:when>
                    <c:when test="${u.userType=='3'}">
                        <span style="color:#FF5722;">保安</span>
                    </c:when>
                    <c:when test="${u.userType=='4'}">
                        <span style="color:#FF5722;">保洁</span>
                    </c:when>
                    <c:when test="${u.userType=='5'}">
                        <span style="color:#FF5722;">志愿者</span>
                    </c:when>
                </c:choose>
            </td>
            <td>
                ${u.department}
            </td>
            <td >
                ${u.leader}
            </td>
            <td>
                ${u.wage}
            </td>
            <td>
                    ${u.beginTimeShow}
            </td>
            <td>
                    ${u.endTimeShow}
            </td>
            <td>
                <a href="/admin/staff/edit/${u.userId}" class="layui-btn layui-btn-mini">编辑</a>
                <a href="/admin/staff/delete/${u.userId}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</rapid:override>
<rapid:override name="footer-script">
    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
