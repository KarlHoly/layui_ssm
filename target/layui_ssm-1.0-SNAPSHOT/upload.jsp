<%--
  Created by IntelliJ IDEA.
  User: 29460
  Date: 2020/10/31
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.2.1.js"></script>
    <script src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
    <style>
        .layui-input-block{
            margin-top: 20px;
            width: 465px;
    }
        .layui-form-item{
          margin-left: 100px;
        }
</style>
</head>

<body>
<h1 align="center">欢迎查看表格</h1>
<div style="width: 80%; margin: 0 auto" >
<table id="showAll" lay-filter="test"></table>
</div>
<button type="button" class="layui-btn" id="addCollege" style="margin-left:130px">
    <i class="layui-icon">&#xe608;</i> 添加学校
</button>


<form class="layui-form" style="display: none" id="add">
    <div class="layui-form-item">
        <label class="layui-form-label">学校编号</label>
        <div class="layui-input-block">
            <input type="text" name="cid" required  lay-verify="" placeholder="请输入专业编号" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">学校名字</label>
        <div class="layui-input-block">
            <input type="text" name="cname" required  lay-verify="required" placeholder="请输入专业名称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-block">
            <input type="text" name="createtime" required  lay-verify="required" placeholder="请输入创建时间" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">学校地址</label>
        <div class="layui-input-block">
            <input type="text" name="caddress" required  lay-verify="required" placeholder="请输学校地址" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">照片</label>
        <div class="layui-input-block">
            <button type="button" class="layui-btn" id="upload1">上传图片</button>
            <input type="hidden" id="img_url" name="cpic" value=""/>
            <div class="layui-upload-list">
                <img class="layui-upload-img" width="100px" height="80px" id="demo1" />
                <p id="demoText"></p>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo" >立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>



<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<%--<button type="button" class="layui-btn layui-btn-sm layui-btn-primary">
    <i class="layui-icon">&#x1002;</i>
</button>--%>
</body>
</html>
<script>
    layui.use(['table','layer','form','upload'], function(){
        var table = layui.table;
        var form = layui.form;
        var layer= layui.layer;
        var upload=layui.upload;
        var tab= table.render({
            elem: '#showAll'
            ,height:500
            ,page:true
            ,url: 'allColleges' //数据接口
           /* ,page: true //开启分页
             ,toolbar: '#deletebar' //开启头部工具栏，并为其绑定左侧模板
             ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                 title: '提示'
                 ,layEvent: 'LAYTABLE_TIPS'
                 ,icon: 'layui-icon-tips'
             }]*/
            ,limit:3
            ,limits:[3,6,9]
            ,cols: [[ //表头
                 {type: 'checkbox', fixed: 'left' ,title:"全选/全不选"},
                {field: 'cid', title: '学校编号', sort: true, fixed: 'left'}
                ,{field: 'cname', title: '学校名字'}
                ,{field: 'createtime', title: '创建时间'}
                ,{field: 'caddress', title: '学校地址'}
                ,{field: 'cpic', title: '照片'}
            ]]
         ,request: {
             pageName: 'page' //页码的参数名称，默认：page
             ,limitName: 'pageSize' //每页数据量的参数名，默认：limit
        }
     });
            $("#addCollege").click(function () {
                layer.open({
                    type:1,
                    title:"添加大学",
                    area:[700,500],
                    content:$("#add")
                });
            });

     var uploadM= upload.render({
            elem: '#upload1' //绑定元素
            ,url: 'upload'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                //上传成功
                alert("已经选择"+res.url);
                document.getElementById("img_url").value = res.url;

            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadM.upload();
                });
            }
        });
        form.on('submit(formDemo)',function () {
            $.ajax({
                type:'post',
                url:'uploadOne',
                data:$('#add').serialize(),
                dataType:'json',
                success:function (resp) {
                    $("#add")[0].reset();
                    $("#demo1").prop("src"," ");
                    tab.reload({page:true});
                    layer.closeAll();
                    layer.msg(resp.msg);
                }
            });
            return false;
        })

    });




</script>
