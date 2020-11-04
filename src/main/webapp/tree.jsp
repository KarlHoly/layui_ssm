<%--
  Created by IntelliJ IDEA.
  User: 29460
  Date: 2020/11/4
  Time: 8:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.2.1.js"></script>
    <script src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script>
        layui.use('tree', function(){
            var tree = layui.tree;

            //渲染
            var treeIns = tree.render({
                elem: '#test1'  //绑定元素
                ,data: []
            });
            $.ajax({
                url:'showTree',
                type:'post',
                dataType:'json',
                success:function (resp) {//[{id:101,title:'abc',pid:0]
                    fn(resp.data);//对原始数据处理
                    treeIns.reload({
                        data:resultObj//将处理后的结果赋值的data[数据源]
                    })
                }

            });
            var resultObj=[];
            function fn(jsonData) {
                //取得顶级的数据
                for(var i=0;i<jsonData.length;i++){
                    if(jsonData[i].pid===0){
                        resultObj.push(jsonData[i]);
                    }
                }
                getChildren(resultObj, jsonData)
            }

            function getChildren(nodeList, jsonData) {
                nodeList.forEach(function(elemet, index) {
                    elemet.children = jsonData.filter(function(item, indexI) {
                        return item.pid === elemet.id
                    });
                    if(elemet.children.length > 0) {
                        getChildren(elemet.children, jsonData)
                    }
                })
            }
        });
    </script>
</head>
<body>
<div id="test1"></div>
</body>
</html>
