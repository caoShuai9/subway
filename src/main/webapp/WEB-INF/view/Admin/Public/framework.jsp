<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" href="/img/logo.png">
    <title>
        ${options.optionSiteTitle}后台
            <rapid:block name="title"></rapid:block>
    </title>
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="/css/back.css">
    <link rel="stylesheet" href="/plugin/font-awesome/css/font-awesome.min.css">
    <rapid:block name="header-style"></rapid:block>
    <rapid:block name="header-script">
    </rapid:block>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><a href="/admin" style="color:#009688;">
        ${options.optionSiteTitle}后台
        </a>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="/" target="_blank">前台</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    ${sessionScope.user.userName}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="/admin/profile">基本资料</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="/admin/logout">退出</a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">新闻发布</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/article">全部文章</a></dd>
                        <dd><a href="/admin/article/insert">写文章</a></dd>
                    </dl>
                </li>

                <c:if test="${sessionScope.user != null && sessionScope.user.userRole == 'admin'}">

                <li class="layui-nav-item">
                    <a href="javascript:;">公告</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/notice">全部公告</a></dd>
                        <dd><a href="/admin/notice/insert">添加公告</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;">地铁信息维护</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/subway">地铁线路</a></dd>
                        <dd><a href="/admin/subwayStation/">地铁站点</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/user">全部用户</a></dd>
                        <dd><a href="/admin/user/insert">添加用户</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">员工管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/staff">全部员工</a></dd>
                        <dd><a href="/admin/staff/insert">添加员工</a></dd>
                    </dl>
                </li>
            </ul>
            </c:if>

        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <rapid:block name="content">

            </rapid:block>
        </div>
    </div>
</div>


<script src="/plugin/layui/layui.all.js"></script>
<script src="/js/back.js"></script>
<script src="/plugin/layui/layui.js"></script>
<rapid:block name="footer-script">

</rapid:block>
<script>
    //给文本编辑器的iframe引入代码高亮的css
    $("iframe").contents().find("head").append("<link rel=\"stylesheet\" href=\"/css/highlight.css\">\n");

</script>

</body>
</html>
