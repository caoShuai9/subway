<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    - 地铁站点列表
</rapid:override>
<rapid:override name="header-style">
    <script src="/js/jquery.min.js"></script>
    <script src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
          <a><cite>地铁站点列表</cite></a>
        </span>
    </blockquote>

    <div class="abc">
        <a href="/admin/subwayStation/insert" class="layui-btn layui-btn-mini">新增地铁站点</a>

            <%--        <button class="layui-btn layui-btn-small" lay-submit lay-filter="formDemo" onclick="insertDraft()">新增地铁线</button>--%>
    </div>
    <table class="layui-table" id="subway">
        <colgroup>
            <col width="100">
            <col width="100">
            <col width="70">
            <col width="100">
            <col width="100">
            <col width="70">
            <col width="70">
            <col width="150">
            <col width="50">
            <col width="50">
        </colgroup>
        <thead>
        <tr>
            <th>地铁站点名称</th>
            <th>地铁线路名称</th>
            <th>是否换乘站</th>
            <th>换乘线路名称</th>
            <th>所在区名称</th>
            <th>始发时间</th>
            <th>末班时间</th>
            <th>介绍备注</th>
            <th>权重</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${subwayStationList}" var="subwayStation">
            <tr>
                <td>
                        ${subwayStation.subwayStationName}
                </td>
                <td>
                        ${subwayStation.subwayName}
                </td>
                <td>
                        ${subwayStation.ifTransfer}
                </td>
                <td>
                        ${subwayStation.transferSubwayName}
                </td>
                <td>
                        ${subwayStation.districtName}
                </td>
                <td>
                        ${subwayStation.startingTimeShow}
                </td>
                <td>
                        ${subwayStation.endTimeShow}
                </td>
                <td>
                        ${subwayStation.remark}
                </td>
                <td>
                        ${subwayStation.weights}
                </td>
                <td>
<%--                <script type="text/html" id="barDemo">--%>
                    <a href="/admin/subwayStation/edit/${subwayStation.subwayStationId}" class="layui-btn layui-btn-mini">编辑</a>
                    <a href="/admin/subwayStation/delete/${subwayStation.subwayStationId}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">删除</a>
<%--                </script>--%>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
<%--    <div class="container">--%>
<%--    <!-- 标题 -->--%>
<%--    <div class="row">--%>
<%--        <div class="col-md-12">--%>
<%--            <h1>SSM-CRUD</h1>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <!-- 显示表格数据 -->--%>
<%--    <div class="row">--%>
<%--        <div class="col-md-12">--%>
<%--            <table class="table table-hover">--%>
<%--                <tr>--%>
<%--                    <th>地铁站点名称</th>--%>
<%--                    <th>地铁线路名称</th>--%>
<%--                    <th>是否换乘站</th>--%>
<%--                    <th>换乘线路名称</th>--%>
<%--                    <th>所在区名称</th>--%>
<%--                    <th>始发时间</th>--%>
<%--                    <th>末班时间</th>--%>
<%--                    <th>介绍备注</th>--%>
<%--                    <th>权重</th>--%>
<%--                    <th>操作</th>--%>
<%--                </tr>--%>
<%--                <c:forEach items="${pageinfo.list}" var="subwayStation">--%>
<%--                    <tr>--%>
<%--                        <th>${subwayStation.subwayStationName}</th>--%>
<%--                        <th>${subwayStation.subwayName}</th>--%>
<%--                        <th>${subwayStation.ifTransfer}</th>--%>
<%--                        <th>${subwayStation.districtName}</th>--%>
<%--                        <th>${subwayStation.startingTimeShow}</th>--%>
<%--                        <th>${subwayStation.endTimeShow}</th>--%>
<%--                        <th>${subwayStation.remark}</th>--%>
<%--                        <th>${subwayStation.weights}</th>--%>
<%--                        <th>--%>
<%--                            <a href="/admin/subwayStation/edit/${subwayStation.subwayStationId}" class="layui-btn layui-btn-mini">编辑</a>&ndash;%&gt;--%>
<%--                            <a href="/admin/subwayStation/delete/${subwayStation.subwayStationId}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">删除</a>--%>
<%--                        </th>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--            </table>--%>
<%--        </div>--%>
<%--    </div>--%>
    <!-- 显示分页信息 -->
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-5">当前第 ${pageinfo.pageNum } 页,总${pageinfo.pages }
            页,总 ${pageinfo.total } 条记录</div>
        <!-- 分页条信息 -->
        <div class="col-md-7">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="/admin/subwayStation/?pn=1">首页</a></li>
                    <c:if test="${pageinfo.hasPreviousPage }">
                        <li><a href="/admin/subwayStation/?pn=${pageinfo.pageNum-1}"
                               aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        </a></li>
                    </c:if>
                    <c:forEach items="${pageinfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageinfo.pageNum }">
                            <li class="active"><a href="#">${page_Num }</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageinfo.pageNum }">
                            <li><a href="/admin/subwayStation/?pn=${page_Num }">${page_Num }</a></li>
                        </c:if>

                    </c:forEach>
                    <c:if test="${pageinfo.hasNextPage }">
                        <li><a href="/admin/subwayStation/?pn=${pageinfo.pageNum+1 }"
                               aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                        </a></li>
                    </c:if>
                    <li><a href="/admin/subwayStation/?pn=${pageinfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
<%--        <blockquote class="layui-elem-quote layui-quote-nm">--%>
<%--            温馨提示：--%>
<%--            <ul>--%>
<%--                <li>Order的大小决定显示的顺序</li>--%>
<%--            </ul>--%>
<%--        </blockquote>--%>
</rapid:override>
<rapid:override name="footer-script">
    <script>
    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
