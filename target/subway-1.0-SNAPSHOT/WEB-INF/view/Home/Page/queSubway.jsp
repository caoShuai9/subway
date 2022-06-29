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
        <c:choose>
            <c:when test="${category != null}">
                <a href="/category/${category.categoryId}">${category.categoryName}</a>
                <i class="fa fa-angle-right"></i> 查询地铁
            </c:when>
            <c:otherwise>
                地铁线路查询
            </c:otherwise>

        </c:choose>

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

                <el-form :inline="true" :model="formInline" class="demo-form-inline">

                    <el-form-item label="出发站线路">
                        <el-select v-model="form.outset" placeholder="活动区域" @change ="outsetInfo">
                            <c:forEach items="${subwayList}" var="subway">
                                <el-option label="${subway.subwayName}" value="${subway.subwayId}"></el-option>
                            </c:forEach>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="出发站">
                        <el-select v-model="form.outsetStation" placeholder="活动区域">
                            <el-option
                                    v-for="item in outsetStationList"
                                    :key="item.subwayStationId"
                                    :label="item.subwayStationName"
                                    :value="item.subwayStationId"/>
                        </el-select>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="onSubmit">查询</el-button>
                    </el-form-item>

                    <el-form-item label="到达站线路">
                        <el-select v-model="form.reach" placeholder="活动区域" @change ="reachInfo">
                            <c:forEach items="${subwayList}" var="subway">
                                <el-option label="${subway.subwayName}" value="${subway.subwayId}"></el-option>
                            </c:forEach>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="到达站">
                        <el-select v-model="form.reachStation" placeholder="活动区域">
                            <el-option
                                    v-for="item in reachStationList"
                                    :key="item.subwayStationId"
                                    :label="item.subwayStationName"
                                    :value="item.subwayStationId"/>
                        </el-select>
                    </el-form-item>

                    <el-form-item label="出发地点">
                        <el-input v-model="startingAddress" placeholder="出发地点"></el-input>
                    </el-form-item>
                    <el-form-item label="到达地点">
                        <el-input v-model="arrivalAddress" placeholder="到达地点"></el-input>
                    </el-form-item>

                </el-form>


                <el-card>
                    <div v-if>

                    </div>
                    <div class="bottom clearfix">
                        <time class="time">始班时间：{{val.startingTimeShow}}</time>
                        <time class="time">末班时间：{{val.endTimeShow}}</time>
                    </div>

                    <div class="bottom clearfix">
                        <time class="time">票价：{{val.price}}</time>
                    </div>
                    <div class="bottom clearfix">
                        <time class="time">线路：{{val.subwayPath}}</time>
                    </div>
                </el-card>

                <div class="entry-content">
                    <div class="clear"></div>
                </div>
            </article>
        </main>
        <%@ include file="../Public/part/paging.jsp" %>

    </div>
    <%--  主体-左侧正文 end--%>
</rapid:override>

<%@ include file="../Public/framework.jsp" %>
<script type="text/javascript">
    // 在页面加载好后就初始化vue实例,也可以在外面直接初始化
    $(document).ready(function(){
        const vm = new Vue({
            el:'#primary',
            data() {
                return {
                    form: {
                        outset:'',
                        reach: '',
                        outsetStation:'',
                        reachStation:''
                    },
                    outsetStationList: '',
                    reachStationList: '',
                    startingAddress:'',
                    arrivalAddress:'',
                    val:{
                        price:'',
                        subwayPath:'',
                        startingTimeShow:'',
                        endTimeShow:''
                    },
                }
            },
            methods: {
                onSubmit() {
                    var mv = this;

                    mv.form.startingAddress = encodeURI(mv.startingAddress);
                    mv.form.arrivalAddress = encodeURI(mv.arrivalAddress);
                    $.ajax({
                        async: false,
                        type: "GET",
                        url: '/getStationUtil',
                        contentType: "application/json;charset=UTF-8",
                        data: mv.form,
                        success: function (data) {
                            mv.val = data;
                        },
                        error: function () {
                        }
                    })
                    console.log('submit!');
                },
                outsetInfo(){
                    var mv = this;
                    $.ajax({url:"/getStationList?subwayId="+this.form.outset,success:function(result){
                            mv.outsetStationList = result;
                            // alert(JSON.stringify(mv.outsetStationList))
                        }});

                },
                reachInfo(){
                    var mv = this;
                    $.ajax({url:"/getStationList?subwayId="+this.form.reach,success:function(result){
                            mv.reachStationList = result;
                        }});
                },
            }
        })
    })
</script>