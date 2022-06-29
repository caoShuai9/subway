<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%--导航 start--%>
<header id="masthead" class="site-header">
    <%--顶部菜单 start--%>
    <nav id="top-header">
        <div class="top-nav">
            <div class="user-login">
                <c:choose>
                    <c:when test="${sessionScope.user==null}">
                        <a href="/login">登录</a> | <a href="/register">注册</a>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${sessionScope.user.userType != 1}">
                            <a href="/admin">进入后台</a>
                        </c:if>
                        <c:if test="${sessionScope.user.userType == 1}">
                            欢迎您：${sessionScope.user.userNickname} !!! |
                            <a href="javascript:void(0)" onclick="logout()">退出</a>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="menu-topmenu-container">
                <ul id="menu-topmenu" class="top-menu">
                    <c:forEach items="${menuList}" var="m">
                        <li class="menu-item">
                        <c:if test="${m.menuLevel==1}">
                                <a href="${m.menuUrl}" >
                                    <i class="${m.menuIcon}"></i>
                                    <span class="font-text">${m.menuName}&nbsp;</span>&nbsp;
                                </a>
                            </c:if>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </nav><!-- #top-header -->
    <%--顶部菜单 end--%>
    <%--主要菜单 satrt--%>
    <div id="menu-box">
        <div id="top-menu">
                <span class="nav-search">
                    <i class="fa fa-search"></i>
                </span>
            <div class="logo-site"><h1 class="site-title">
                <a href="/" title="${options.optionSiteTitle}">${options.optionSiteTitle}</a>
            </h1>
                <p class="site-description">${options.optionSiteDescrption}</p>
            </div><!-- .logo-site -->
            <div id="site-nav-wrap">
                <div id="sidr-close">
                    <a href="#sidr-close" class="toggle-sidr-close">×</a>
                </div>
                <nav id="site-nav" class="main-nav">
                    <a href="#sidr-main" id="navigation-toggle" class="bars">
                        <i class="fa fa-bars"></i>
                    </a>
                    <div class="menu-pcmenu-container">
                        <ul id="menu-pcmenu" class="down-menu nav-menu sf-js-enabled sf-arrows">

                            <li>
                                <a href="/">
                                    <i class="fa-home fa"></i>
                                    <span class="font-text">地铁风采</span>
                                </a>
                            </li>
                            <li>
                                <a>
                                    <i class="fa-list-alt fa"></i>
                                    <span class="font-text">地铁线路</span>
                                </a>
                                <ul class="sub-menu">

                                    <li>
                                        <a href="/subway/1">1号线</a>
                                    </li>
                                    <li>
                                        <a href="/subway/2">2号线</a>
                                    </li>
                                    <li>
                                        <a href="/subway/12">12号线</a>
                                    </li>
                                    <li>
                                        <a href="/subway/3">3号线</a>
                                    </li>
                                    <li>
                                        <a href="/subway/4">3号线支线</a>
                                    </li>

                                </ul>
                            </li>
                            <%--主要菜单其余部分--%>
                            <c:forEach items="${menuList}" var="m">
                                <c:if test="${m.menuLevel == 2}">
                                    <li>
                                        <a href="${m.menuUrl}">
                                            <i class="${m.menuIcon}"></i>
                                            <span class="font-text">${m.menuName}&nbsp;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${sessionScope.user!=null}">
                                <li>
                                    <a href="/userInfo">
                                            <%--                                    <i class="${m.menuIcon}"></i>--%>
                                        <span class="font-text">用户信息&nbsp;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </nav>
            </div>
            <div class="clear"></div>
        </div><!-- #top-menu -->
    </div><!-- #menu-box -->
    <%--主要菜单 satrt--%>

</header><!-- #masthead -->
<%--导航 end start--%>

<%--搜索框 start--%>
<div id="search-main">
    <div class="searchbar">
        <form method="get" id="searchform" action="/search" accept-charset="UTF-8">
            <span>
                <input type="text" value="" name="keywords" id="s" placeholder="输入搜索内容"required="">
                <button type="submit" id="searchsubmit">搜索</button>
            </span>
        </form>
    </div>
    <div class="clear"></div>
</div>
<%--搜索框 end--%>

<rapid:block name="breadcrumb"></rapid:block>