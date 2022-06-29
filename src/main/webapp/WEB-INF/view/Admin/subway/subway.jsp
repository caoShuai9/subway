<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    - 地铁线路列表
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
        .abc{ float:right; width:100px;}
    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
          <a href="/admin">首页</a>
          <a><cite>地铁线路列表</cite></a>
        </span>
    </blockquote>

    <div class="abc">
        <a href="/admin/subway/insert" class="layui-btn layui-btn-mini">新增地铁线</a>

<%--        <button class="layui-btn layui-btn-small" lay-submit lay-filter="formDemo" onclick="insertDraft()">新增地铁线</button>--%>
    </div>
    <table class="layui-table" >
        <colgroup>
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="450">
            <col width="50">
        </colgroup>
        <thead>
        <tr>
            <th>线路</th>
            <th>始发时间</th>
            <th>结束时间</th>
            <th>介绍</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${subwayList}" var="subway">
            <tr>
                <td>
                        ${subway.subwayName}
                </td>
                <td>
                        ${subway.startingTimeShow}
                </td>
                <td>
                        ${subway.endTimeShow}
                </td>
                <td>
                        ${subway.subwayRemark}
                </td>
                <td>
                    <a href="/admin/subway/edit/${subway.subwayId}" class="layui-btn layui-btn-mini">编辑</a>
                    <a href="/admin/subway/delete/${subway.subwayId}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
<%--    <blockquote class="layui-elem-quote layui-quote-nm">--%>
<%--        温馨提示：--%>
<%--        <ul>--%>
<%--            <li>Order的大小决定显示的顺序</li>--%>
<%--        </ul>--%>
<%--    </blockquote>--%>


</rapid:override>
<rapid:override name="footer-script">
    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
