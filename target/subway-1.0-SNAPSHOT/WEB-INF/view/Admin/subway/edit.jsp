<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - 编辑线路
    </rapid:override>
<rapid:override name="header-style">
    <style>

    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/subway">地铁线路列表</a>
              <a><cite>编辑线路</cite></a>
        </span>
    </blockquote>


    <form name="post" method="post" id="insertDraftForm"
          class="initial-form hide-if-no-js" action="/admin/subway/editSubway">
        <input type="hidden" name="subwayId" value="${subwayInfo.subwayId}">

        <div class="layui-form-item">
            <label class="layui-form-label">线路名称  <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="subwayName" id="subwayName" value="${subwayInfo.subwayName}" required  lay-verify="required" placeholder="地铁线路" autocomplete="off" class="layui-input" required>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">始发时间  <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="time" name="startingTimeShow" id="startingTimeShow" value="${subwayInfo.startingTimeShow}" required  lay-verify="required" placeholder="始发时间" autocomplete="off" class="layui-input" required>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">结束时间  <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="time" name="endTimeShow" id="endTimeShow" value="${subwayInfo.endTimeShow}" required  lay-verify="required" placeholder="结束时间" autocomplete="off" class="layui-input" required>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">线路介绍</label>
            <div class="layui-input-block">
                <textarea name="subwayRemark" placeholder="请输入内容" id="subwayRemark" class="layui-textarea" required>${subwayInfo.subwayRemark}</textarea>
            </div>
        </div>
        <input type="hidden" name="articleStatus" value="0">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn layui-btn-small" lay-submit lay-filter="formDemo" onclick="insertDraft()">提交</button>
            </div>
        </div>
    </form>



</rapid:override>
<rapid:override name="footer-script">
    <script>
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
