<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - 编辑站点
    </rapid:override>
<rapid:override name="header-style">
    <style>

    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/subwayStation">地铁站点列表</a>
              <a><cite>编辑站点</cite></a>
        </span>
    </blockquote>



    <form name="post" method="post" id="insertDraftForm"
          class="initial-form hide-if-no-js" action="/admin/subwayStation/editSubwayStation">
        <input type="hidden" name="subwayStationId" value="${subwayStation.subwayStationId}">
        <div class="layui-form-item">
            <label class="layui-form-label">地铁站名<span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="subwayStationName" id="subwayStationName" value="${subwayStation.subwayStationName}" required  lay-verify="required" placeholder="地铁站名" autocomplete="off" class="layui-input" required>
            </div>
        </div>

        <div class="layui-form-item">

            <label class="layui-form-label">地铁线路<span style="color: #FF5722; ">*</span> </label>
            <div class="layui-input-inline">
                <select name="subwayId" class="layui-input" id="subwayId" value="${subwayStation.subwayId}" lay-filter="articleParentCategoryId" required>
                    <option value=""></option>
                    <c:forEach items="${subwayList}" var="subway">
                        <option value="${subway.subwayId}"
                                <c:if test="${subway.subwayId == subwayStation.subwayId}">selected</c:if>>${subway.subwayName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">是否换乘<span style="color: #FF5722; ">*</span> </label>
            <div class="layui-input-inline">
                <select name="ifTransfer" class="layui-input" id="ifTransfer" value="${subwayStation.ifTransfer}" lay-filter="articleParentCategoryId" required>
                    <option value="是"<c:if test="${subwayStation.ifTransfer == '是'}">selected</c:if>>是</option>
                    <option value="否"<c:if test="${subwayStation.ifTransfer == '否'}">selected</c:if>>否</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">换乘线路</label>
            <div class="layui-input-inline">
                <select name="transferSubwayId" class="layui-input" id="transferSubwayId" value="${subwayStation.transferSubwayId}" lay-filter="articleParentCategoryId">
                    <option value=""></option>
                    <c:forEach items="${subwayList}" var="subway">
                        <option value="${subway.subwayId}"
                                <c:if test="${subway.subwayId == subwayStation.transferSubwayId}">selected</c:if>>${subway.subwayName}</option>
                    </c:forEach>
                </select>
            </div>

        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">站点区域<span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="districtName" id="districtName" value="${subwayStation.districtName}"  lay-verify="required" placeholder="站点区域" autocomplete="off" class="layui-input" required>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">始发时间<span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="time" name="startingTimeShow" id="startingTimeShow" value="${subwayStation.startingTimeShow}"  lay-verify="required" placeholder="始发时间" autocomplete="off" class="layui-input" required>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">末班时间<span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="time" name="endTimeShow" id="endTimeShow"  value="${subwayStation.endTimeShow}" lay-verify="required" placeholder="末班时间" autocomplete="off" class="layui-input" required>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">线路介绍</label>
            <div class="layui-input-block">
                <textarea name="remark" placeholder="请输入内容" id="remark" class="layui-textarea">${subwayStation.remark}</textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">站点权重<span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="weights" id="weights" value="${subwayStation.weights}"  lay-verify="required" placeholder="站点权重" autocomplete="off" class="layui-input" required>
            </div>
        </div>
        <input type="hidden" name="articleStatus" value="0">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button id=""submit class="layui-btn layui-btn-small" lay-submit lay-filter="formDemo">提交</button>
            </div>
        </div>
    </form>




</rapid:override>
<rapid:override name="footer-script">
    <script>

        $("#submit").click(function () {
            window.location.href = "/admin/subwayStation/editSubwayStation"
        })

        layui.use(['form', 'layedit', 'laydate'], function() {
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;


            //上传图片,必须放在 创建一个编辑器前面
            layedit.set({
                uploadImage: {
                    url: '/admin/upload/img' //接口url
                    ,type: 'post' //默认post
                }
            });

            //创建一个编辑器
            var editIndex = layedit.build('content',{
                    height:350,
                }
            );

        });
        //end
    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
