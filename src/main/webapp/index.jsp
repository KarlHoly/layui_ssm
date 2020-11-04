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
<%--查询数据--%>
<form class="layui-form"  style="margin-left: 80px ;margin-top: 30px" id="queryForm">
    <div class="layui-inline">
        <label class="layui-form-label">专业名称</label>
        <div class="layui-input-inline">
            <input type="text" name="mname"  placeholder="请输入专业编号" autocomplete="off" class="layui-input" id="mname">
        </div>
    </div>
    <div class="layui-inline"style="margin-left: 50px">
        <label class="layui-form-label">所属学院</label>
        <div class="layui-input-inline" >
            <select name="cid" id="queryCollege">
                <option value="-1">------请选择-----</option>
            </select>
        </div>
    </div>
    <div class="layui-inline" style="margin-left: 50px">
        <div class="layui-input-inline">
            <button class="layui-btn" lay-submit lay-filter="goSearch">立即查询</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<div style="width: 100%; margin: 0 auto" >
<table id="showAll" lay-filter="test"></table>
</div>
<button type="button" class="layui-btn" id="addMajor" style="margin-left:130px">
    <i class="layui-icon">&#xe608;</i> 添加专业
</button>

<script type="text/html" id="deletebar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData" id="deletes">批量删除选中行数据</button>
    </div>
</script>


<form class="layui-form" style="display: none" id="add">
    <div class="layui-form-item">
        <label class="layui-form-label">专业编号</label>
        <div class="layui-input-block">
            <input type="text" name="mid" required  lay-verify="required" placeholder="请输入专业编号" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">专业名称</label>
        <div class="layui-input-block">
            <input type="text" name="mname" required  lay-verify="required" placeholder="请输入专业名称" autocomplete="off" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">学分数</label>
        <div class="layui-input-block">
            <input type="text" name="credit" required  lay-verify="required" placeholder="请输入学分数" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">学制</label>
        <div class="layui-input-block">
            <input type="text" name="lifeyear" required  lay-verify="required" placeholder="请输入学制" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">介绍</label>
        <div class="layui-input-block">
            <textarea name="introduction" placeholder="请输入介绍" class="layui-textarea"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">所属学院</label>
        <div class="layui-input-block">
            <select name="cid" lay-verify="required" id="choseCollege"></select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<form class="layui-form" style="display: none" id="updateMajor" lay-filter="updateFormFilter" >
    <div class="layui-form-item">
        <label class="layui-form-label">专业编号</label>
        <div class="layui-input-block">
            <input type="text" name="mid" required  lay-verify="required" placeholder="请输入专业编号" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">专业名称</label>
        <div class="layui-input-block">
            <input type="text" name="mname" required  lay-verify="required" placeholder="请输入专业名称" autocomplete="off" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">学分数</label>
        <div class="layui-input-block">
            <input type="text" name="credit" required  lay-verify="required" placeholder="请输入学分数" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">学制</label>
        <div class="layui-input-block">
            <input type="text" name="lifeyear" required  lay-verify="required" placeholder="请输入学制" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">介绍</label>
        <div class="layui-input-block">
            <textarea name="introduction" placeholder="请输入介绍" class="layui-textarea"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">所属学院</label>
        <div class="layui-input-block">
            <select name="cid" lay-verify="required" id="selectCollege"></select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="updateBtn">立即提交</button>
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
    layui.use(['table','layer','form'], function(){
        var table = layui.table;
         var form = layui.form;
         var layer= layui.layer;
//给三个地方的下拉框赋值
        $.ajax({
            type:'post',
            dataType:'json',
            url:'colleges',
            success:function (resp) {
                $.each(resp.list,function (index,item) {
                    $("#queryCollege").append(new Option(item.cname,item.cid));
                    $("#choseCollege").append(new Option(item.cname,item.cid));
                    $("#selectCollege").append(new Option(item.cname,item.cid));
                });
                form.render("select");
            }
        }
        );

//打开页面增加
        $("#addMajor").click(function () {
            layer.open({
                type:1,
                title:'表单',
                content:$("#add"),
                shadeClose: true,
                area: ['800px', '500px'],
                shade: 0.8,
                closeBtn: 1
            });
        });
        //filter检测，编辑还是删除
        table.on("tool(test)",function (obj) {
            var id = obj.data.mid;
            console.log(id);
            if (obj.event==='edit'){
                $.ajax({
                    type:'post',
                    dataType:'json',
                    url:'major/findById?id='+id,
                    success:function (resp) {//表赋值
                        form.val('updateFormFilter',{
                            mid:resp.major.mid,
                            mname:resp.major.mname,
                            credit:resp.major.credit,
                            lifeyear:resp.major.lifeyear,
                            introduction:resp.major.introduction,
                            cid:resp.major.cid
                        })
                    }
                });//打开窗口
                layer.open({
                    type:1,
                    title:'修改信息',
                    area:['800px', '500px'],
                    content:$("#updateMajor")//dom节点
                });
            }else {layer.confirm("确定删除吗", {btn:['狠心删除', '算了，不删了'],icon: 3},function () {
                $.ajax({
                    type:'post',
                    dataType:'json',
                    url:'major/deleteById?id='+id,
                    success:function (resp) {
                        tab.reload({page:true});
                        layer.msg(resp.msg)
                    }
                })
            });

            }
        });
        //修改提交；
        form.on('submit(updateBtn)', function(data){
            $.ajax({
                type:"post"
                ,dataType:"json"
                ,data:$("#updateMajor").serialize()
                ,url:"major/update"
                ,success: function (resp) {
                    $("#updateMajor")[0].reset();
                    tab.reload({page:true});
                    layer.closeAll();
                    layer.msg(resp.msg);
                }
            });
            //阻止跳转
            return false;
        });


        //增加的提交
        form.on('submit(formDemo)', function(data){
           $.ajax({
                type:"post"
               ,dataType:"json"
               ,data:$("#add").serialize()
                ,url:"/major/insert"
                ,success: function (resp) {
                    tab.reload({page:true});
                   $("#add")[0].reset();
                    layer.msg(resp.msg);
                    layer.closeAll();
               }
        });
           return false;
        });

        // 查询条件
        form.on('submit(goSearch)', function(data){
            tab.reload({//emp/list?page=1&limit=3
                page:true,//currentPage:1
                method:'post',
                where:{
                    mname:$("#mname").val(),
                    cid:$("#queryCollege").val()
                }
            });
            return false;

        });

        //表格渲染
     var tab= table.render({
            elem: '#showAll'
            ,height:500
            ,url: '/major/list' //数据接口
            ,page: true //开启分页
             ,toolbar: '#deletebar' //开启头部工具栏，并为其绑定左侧模板
             ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                 title: '提示'
                 ,layEvent: 'LAYTABLE_TIPS'
                 ,icon: 'layui-icon-tips'
             }]
            ,limit:3
            ,limits:[3,6,9]
            ,cols: [[ //表头
                 {type: 'checkbox', fixed: 'left' ,title:"全选/全不选"},
                {field: 'mid', title: '专业编号', sort: true, fixed: 'left'}
                ,{field: 'mname', title: '专业名称'}
                ,{field: 'credit', title: '学分总数'}
                ,{field: 'introduction', title: '专业介绍'}
                ,{field: 'lifeyear', title: '学制'}
                ,{field: 'cid', title: '所属学院'}
                 ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
         ,request: {
             pageName: 'page' //页码的参数名称，默认：page
             ,limitName: 'pageSize' //每页数据量的参数名，默认：limit
        }
     }
        );

     //批量删除
        $("#deletes").click(function () {
            var ids = [];
            var checkStatus = table.checkStatus("showAll");
            $.each(checkStatus.data,function (index,item) {
                ids.push(item.mid);
            });
            $.ajax({
                type:'post',
                dataType:'json',
                url:'major/deletes?ids='+ids,
                success:function (resp) {
                    tab.reload({page:true});
                    layer.msg(resp.msg);
                },
                error:function () {
                    console.log("删除失败");
                }
            })
        });
    })
</script>
