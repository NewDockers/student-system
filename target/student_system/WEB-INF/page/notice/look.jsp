<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${basePath}static/lib/layui-src/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath}static/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="${basePath}static/css/style.css" media="all">
<body>
<div class="layuimini-container layuimini-page-anim">
    <div class="layuimini-main width_60">
        <form class="layui-form">
            <input type="hidden" value="${notice.id}" name="id">
            <div class="layui-form-item">
                <label class="layui-form-label">标题</label>
                <div class="layui-input-block">
                    <input type="text" name="title" value="${notice.title}" lay-verify="required" disabled="disabled"
                           placeholder="请输入标题" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">发布人</label>
                <div class="layui-input-block">
                    <input type="text" name="author" value="${notice.author}" lay-verify="required" placeholder="请输入标题"disabled="disabled"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-col-xs9 ">
                <label class="layui-form-label">公告内容</label>
                <div class="layui-input-block">
                    <textarea type="text" name="content" lay-verify="required" class="layui-input" style="width: 300px; height: 100px;"disabled="disabled">${notice.content} </textarea>  </div>
            </div>

        </form>
    </div>
</div>
<script src="${basePath}static/lib/layui-src/layui.js" charset="utf-8"></script>
<script src="${basePath}static/js/lay-config.js?v=2.0.0" charset="utf-8"></script>

</body>
</html>
