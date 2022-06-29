<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<link rel="stylesheet" href="https://unpkg.com/element-ui@2.13.2/lib/theme-chalk/index.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/element-ui@2.13.2/lib/index.js"></script>
<script src = "https://cdn.polyfill.io/v2/polyfill.min.js"></script>

<rapid:override name="description">
    <meta name="description" content="${category.categoryName}"/>
</rapid:override>
<rapid:override name="keywords">
    <meta name="keywords" content="${category.categoryName}"/>
</rapid:override>
<rapid:override name="title">
    <title>${category.categoryName}</title>
</rapid:override>

<%--面包屑导航 start--%>
<rapid:override name="breadcrumb">
    <nav class="breadcrumb">
        <a class="crumbs" href="/">
            <i class="fa fa-home"></i>首页</a>
        <i class="fa fa-angle-right"></i>
        用户信息
    </nav>
</rapid:override>
<%--面包屑导航 end--%>
<rapid:override name="left">
    <%--主体-左侧正文 start--%>
    <div id="primary" class="content-area">
        <header class="entry-header">
            <h1 class="entry-title">
                    用户信息
            </h1>
        </header>
        <main id="main" class="site-main">
            <article class="post">
                <el-card>
                    <div class="bottom clearfix">
                        <time class="time">用户：</time>
                        <el-button type="text" class="button">${sessionScope.user.userNickname}</el-button>
                    </div>

                    <div class="bottom clearfix">
                        <time class="time">邮箱：</time>
                        <el-button type="text" class="button">${sessionScope.user.userEmail}</el-button>
                    </div>

                    <div class="bottom clearfix">
                        <time class="time">角色：</time>
                        <el-button type="text" class="button">

                            <c:choose>
                                <c:when test="${sessionScope.user.userType=='1'}">
                                    <span style="color:#FF5722;">普通用户</span>
                                </c:when>
                                <c:when test="${sessionScope.user.userType=='2'}">
                                    <span style="color:#FF5722;">管理员</span>
                                </c:when>
                                <c:when test="${sessionScope.user.userType=='3'}">
                                    <span style="color:#FF5722;">保安</span>
                                </c:when>
                                <c:when test="${sessionScope.user.userType=='4'}">
                                    <span style="color:#FF5722;">保洁</span>
                                </c:when>
                                <c:when test="${sessionScope.user.userType=='5'}">
                                    <span style="color:#FF5722;">志愿者</span>
                                </c:when>
                            </c:choose>
                        </el-button>
                    </div>
                    <c:choose>
                        <c:when test="${sessionScope.user.userType!= '1' && sessionScope.user.userType != '2'}">
                        <div class="bottom clearfix">
                            <time class="time">部门：</time>
                            <el-button type="text" class="button">${sessionScope.user.department}</el-button>
                        </div>

                        <div class="bottom clearfix">
                            <time class="time">直系领导：</time>
                            <el-button type="text" class="button">${sessionScope.user.leader}</el-button>
                        </div>

                        <div class="bottom clearfix">
                            <time class="time">工资：</time>
                            <el-button type="text" class="button">${sessionScope.user.wage}</el-button>
                        </div>

                        <div class="bottom clearfix">
                            <time class="time">排班开始时间：</time>
                            <el-button type="text" class="button">${sessionScope.user.beginTimeShow}</el-button>

                            <time class="time">排班结束时间：</time>
                            <el-button type="text" class="button">${sessionScope.user.endTimeShow}</el-button>
                        </div>
                        <div class="bottom clearfix">
                            <time class="time">工作状态：</time>
                            <el-button type="text" class="button">${sessionScope.user.workingStatus}</el-button>
                        </div>
                        </c:when>
                        <c:otherwise>
                            <div>
                                <div class="bottom clearfix">
                                    <time class="time">注册时间：</time>
                                    <el-button type="text" class="button"><fmt:formatDate
                                            value="${sessionScope.user.userRegisterTime}"
                                            pattern="yyyy-MM-dd HH:mm"/></el-button>

                                </div>
                                <div class="bottom clearfix">
                                    <time class="time">最后一次登录时间：</time>
                                    <el-button type="text" class="button"><fmt:formatDate
                                            value="${sessionScope.user.userLastLoginTime}"
                                            pattern="yyyy-MM-dd HH:mm"/> </el-button>

                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </el-card>

                <div class="entry-content">
                    <div class="clear"></div>
                </div>
            </article>
        </main>
        <%@ include file="../Public/part/paging.jsp" %>

    </div>
    <%-- 主体-左侧正文 end--%>
</rapid:override>

<%@ include file="../Public/framework.jsp" %>
<script type="text/javascript">
    // 在页面加载好后就初始化vue实例,也可以在外面直接初始化
    $(document).ready(function(){
        const vm = new Vue({
            el:'#primary',
            data() {
                return {
                    reverse: true
                };
            },
            methods:{}
        })
    })
</script>