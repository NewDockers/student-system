<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>专业管理</title>

</head>
<body>
<div class="layuimini-container layuimini-page-anim">
    <div class="layuimini-main">
        <script type="text/html" id="toolbar">
            <div class="layui-btn-container">
                <c:if test="${type == 1}">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add">
                    <i class="fa fa-plus"></i>
                    添加
                </button>
                <button class="layui-btn layui-btn-sm layui-btn-normal data-delete-btn" lay-event="update">
                    <i class="fa fa-pencil"></i>
                    修改
                </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete">
                    <i class="fa fa-remove"></i>
                    删除
                </button>
                </c:if>
                <button class="layui-btn layui-btn-sm layui-btn-normal data-delete-btn" lay-event="look">
                <i class="fa fa-pencil"></i>
                查看
            </button>
            </div>
        </script>
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
    </div>
</div>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        //表单渲染
        table.render({
            elem: '#currentTableId',
            url: '${basePath}notice/query',
            contentType: 'application/json',
            method: "post",
            toolbar: '#toolbar',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: true,
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 80, title: 'ID'},
                {field: 'title', title: '标题'},
                {field: 'author', title: '发布人'},
                {field: 'date', title: '时间'}
            ]],
            skin: 'line'
        });

        //监听搜索操作
        form.on('submit(search-btn)', function (data) {
            //执行搜索重载
            table.reload('currentTableId', {
                contentType: 'application/json',
                where: data.field
            }, 'data');
            return false;
        });

        //toolbar事件监听
        table.on('toolbar(currentTableFilter)', function (obj) {
            //监听添加操作
            if (obj.event === 'add') {
                var index = layer.open({
                    title: "添加公告",
                    type: 2, //代表的是iframe风格
                    shade: 0.2,
                    shadeClose: false, //是否设置点击阴影部分关闭弹框
                    area: ['50%', '50%'],
                    content: "${basePath}notice/add",
                    end: function () {
                        table.reload('currentTableId');
                    }
                });

                //监听修改操作
            } else if (obj.event === 'update') {
                //获取到表格中被选中的行
                var checkStatus = table.checkStatus('currentTableId');
                //获取到表格中被选中的行的数据
                var data = checkStatus.data;
                if (data.length != 1) {
                    layer.msg("请选择一行数据修改", {time: 1000});
                    return;
                }
                //弹出框
                var index = layer.open({
                    title: '修改公告',
                    type: 2,
                    shade: 0.2,
                    shadeClose: false,
                    area: ['50%', '50%'],
                    content: '${basePath}notice/detail/' + data[0].id, //把用户选中的行的id作为参数传递给后端控制器
                    end: function () {
                        table.reload('currentTableId');
                    }
                });

                //监听删除操作
            }  else if (obj.event === 'look') {
                //获取到表格中被选中的行
                var checkStatus = table.checkStatus('currentTableId');
                //获取到表格中被选中的行的数据
                var data = checkStatus.data;
                if (data.length != 1) {
                    layer.msg("请选择一行数据修改", {time: 1000});
                    return;
                }
                //弹出框
                var index = layer.open({
                    title: '查看公告',
                    type: 2,
                    shade: 0.2,
                    shadeClose: false,
                    area: ['50%', '50%'],
                    content: '${basePath}notice/look/' + data[0].id, //把用户选中的行的id作为参数传递给后端控制器
                    end: function () {
                        table.reload('currentTableId');
                    }
                });

                //监听删除操作
            }else if (obj.event === 'delete') {
                var checkStatus = table.checkStatus('currentTableId');
                var data = checkStatus.data;
                if (data.length == 0) {
                    layer.msg("请选择行数据删除", {time: 1000});
                    return;
                }
                //定义一个数组
                var arr = [];
                for (index in data) {
                    //将每一行数据的id存入数组
                    arr.push(data[index].id);
                }
                layer.confirm('确定要删除吗', function (index) {
                    $.ajax({
                        url: "${basePath}notice/delete",
                        type: "POST",
                        dataType: 'json',
                        data: "ids=" + arr.join(","),
                        success: function (data) {
                            layer.msg(data.msg, {time: 500}, function () {
                                table.reload("currentTableId");
                            });
                        },
                        error: function (data) {
                            console.log(data);
                        }
                    });
                });

            }
        });
    });
</script>
</body>
</html>
