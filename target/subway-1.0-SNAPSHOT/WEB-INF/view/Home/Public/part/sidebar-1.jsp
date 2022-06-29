<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--主体-右侧侧边栏 start--%>
<div id="sidebar" class="widget-area all-sidebar"
     style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">

        <%--搜索框--%>
        <aside class="widget widget_search">
            <div class="searchbar">
                <form method="get" id="searchform1" action="/search">
                    <span> <input type="text" value="" name="keywords" id="s1" placeholder="输入搜索内容" required="">
                        <button type="submit" id="searchsubmit1">搜索</button>
                    </span>
                </form>
            </div>
            <div class="clear"></div>
        </aside>
        <%--搜索框--%>

        <%--主体-右侧侧边栏-随机文章 start--%>
        <aside id="random_post-7" class="widget random_post wow fadeInUp" data-wow-delay="0.3s">
            <h3 class="widget-title">
                <i class="fa fa-bars"></i>公告通知
            </h3>
            <div id="random_post_widget">
                <ul>
                    <c:forEach items="${randomArticleList}" var="r">
                        <li>
                            <a href="/article/${r.articleId}" rel="bookmark">
                                    ${r.articleTitle}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="clear"></div>
        </aside>
        <%--主体-右侧侧边栏-近期文章 end--%>

        <%--失物招领 start--%>
        <aside class="widget hot_comment" >
            <h3 class="widget-title">
                <i class="fa fa-bars"></i>失物招领
            </h3>
            <div id="hot_comment_widget">
                <ul>
                    <c:forEach items="${lostAndFoundArticleList}" var="m">
                        <li>
                            <a href="/article/${m.articleId}" rel="bookmark" title=" (${m.articleCommentCount}条评论)">
                                    ${m.articleTitle}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="clear"></div>
        </aside>
        <%--失物招领 end--%>



</div>
