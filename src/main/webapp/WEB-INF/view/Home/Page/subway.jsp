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
        地铁线路
    </nav>
</rapid:override>
<%--面包屑导航 end--%>
<rapid:override name="left">
    <%--主体-左侧正文 start--%>
    <div id="primary" class="content-area">
        <header class="entry-header">
            <h1 class="entry-title">
                    ${subwayInfo.subwayName}
            </h1>
        </header>
        <main id="main" class="site-main">
            <article class="post">
                <el-timeline>

                    <c:forEach items="${stationList}" var="station">
                        <el-timeline-item timestamp="${station.subwayStationName}" placement="top">
                            <el-card>
                                <div class="bottom clearfix">
                                    <time class="time">站点：</time>
                                    <el-button type="text" class="button">${station.subwayStationName}</el-button>
                                </div>
                                <div class="bottom clearfix">
                                    <time class="time">始班时间：</time>
                                    <el-button type="text" class="button">${station.startingTimeShow}</el-button>

                                    <time class="time">末班时间：</time>
                                    <el-button type="text" class="button">${station.endTimeShow}</el-button>
                                </div>
                                <c:if test="${station.ifTransfer == '是'}">
                                    <div class="bottom clearfix">
                                        <time class="time">换乘车站：</time>
<%--                                        <el-button type="text" class="button">--%>
                                            <a href="/subway/${station.transferSubwayId}" style="color: #d1a601">
                                                    ${station.transferSubwayName}
                                            </a>
<%--                                        </el-button>--%>
                                    </div>
                                </c:if>
                                <div class="bottom clearfix">
                                    <time class="time">区域：</time>
                                    <a>
                                            ${station.districtName}
                                    </a>
                                </div>
                            </el-card>
                        </el-timeline-item>
                    </c:forEach>


                </el-timeline>

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
                    reverse: true,
                    activities: [{
                        content: '活动按期开始',
                        timestamp: '2018-04-15'
                    }, {
                        content: '通过审核',
                        timestamp: '2018-04-13'
                    }]
                };
            },
            methods:{}
        })
    })
</script>