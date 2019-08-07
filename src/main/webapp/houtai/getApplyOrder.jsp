<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/8/1
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>采购入库</title>
    <base href="http://localhost:8080/binladen/"></base>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<!-- 已经采购完成的订单读取过来 -->
<div class="panel panel-default">
    <div class="panel-heading">采购单</div>
    <div class="panel-body">
        <table class="table">
            <thead>
            <th>采购单号</th>
            <th>采购人</th>
            <th>采购时间</th>
            <th>操作</th>
            </thead>
            <tbody id="mytbd"></tbody>
        </table>
    </div>
</div>
<hr/>
<div class="panel panel-default">
    <div class="panel-body">
        <button id="submit3">提交</button>
        <form role="form" class="form-inline">
            <div class="form-group">
                <label for="orderid">流水号</label>
                <input type="text" class="form-control" id="orderid" readonly>
            </div>
            <div class="form-group">
                <label for="caigouperson">操作人</label>
                <input type="text" class="form-control" id="caigouperson" value="${emp.name}">
            </div>
            <div class="form-group">
                <div class="layui-input-inline">
                    <label class="layui-form-label">角色</label>
                    <select name="role" lay-verify="required" lay-search="" id="storageNo"
                            style="height: 30px;width: 150px">
                    </select>
                </div>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th>商品编号</th>
                    <th>商品名称</th>
                    <th>商品类别</th>
                    <th>计量单位</th>
                    <th>采购单价</th>
                    <th>数量</th>
                    <th>库存总数</th>
                    <th>备注</th>
                </tr>
                </thead>
                <tbody id="mytbd3">
                </tbody>
            </table>
        </form>
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th>商品编号</th>
                        <th>商品名称</th>
                        <th>采购数量</th>
                        <th>验收数量</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="mytbd2"></tbody>
                </table>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
<script>
    var sor;
    //查出所有仓库
    $.ajax({
        url: "sto/selectNo",
        type: "post",
        dataType: "json",
        success: function (data) {
            sor = data;
            for (var i = 0; i < data.length; i++) {
                var option = "<option value=" + data[i].id + ">" + data[i].storageName + "</option>"
                $("#storageNo").append(option);
            }
        }
    })

    //查询出所有订单
    $.ajax({
        url: "pro/selectPro",
        type: "post",
        dataType: "json",
        success: function (data) {
            for (var i in data) {
                var tr = "<tr>"
                tr += "<td>" + data[i].procurementNo + "</td>"
                tr += "<td>" + data[i].purchaser + "</td>"
                tr += "<td>" + data[i].purchaseTime + "</td>"
                tr += "<td><button class='btn btn-sm getDetaiOrder' data-toggle='modal' data-target='#myModal' >查看订单详情</button></td>"
                tr += "</tr>";
                $("#mytbd").append(tr);
            }
        }
    })

    //点击查看你详情时,查询当前订单具体的信息
    var goodsinfo;
    var goods;
    $("#mytbd").on("click", ".getDetaiOrder", function () {
        var procurementNo = $(this).parent().parent().children("td").eq(0).text();
        $.ajax({
            url: "pro/selectDet",
            type: "post",
            data: {"procurementNo": procurementNo},
            dataType: "json",
            success: function (data) {
                $("#mytbd2").empty();
                goodsinfo = data;
                for (var i in data) {
                    var tr = "<tr>"
                    tr += "<td>" + data[i].goodNo + "</td>"
                    tr += "<td>" + data[i].goodName + "</td>"
                    tr += "<td>" + data[i].goodAmount + "</td>"
                    tr += "<td><input size='3'/></td>"
                    tr += "<td><button class='btn btn-xs btnAdd'>确认</button></td>"
                    tr += "</tr>"
                    $("#mytbd2").append(tr);
                }
                $("#mytbd3 tr").each(function () {
                    var goodsNo = $(this).children("td").eq(0).text();
                    var orderNo = $(this).children("td").eq(7).text();
                    $("#mytbd2 tr").each(function () {
                        var goodsNo2 = $(this).children("td").eq(0).text();
                        if (goodsNo == goodsNo2 && orderNo == procurementNo) {
                            $(this).find("button").prop("disabled", true)
                        }
                    })
                })
            }
        })
    })

    //点击确认按钮将商品信息添加到入库单中
    $("#mytbd2").on("click", ".btnAdd", function () {
        for (var i in goodsinfo) {
            if (goodsinfo[i].goodNo == $(this).parent().parent().children("td").eq(0).text()) {
                var tr = "<tr>"
                tr += "<td>" + goodsinfo[i].goodNo + "</td>"
                tr += "<td>" + goodsinfo[i].goodName + "</td>"
                tr += "<td>" + goodsinfo[i].goodSpecs + "</td>"
                tr += "<td>" + goodsinfo[i].unit + "</td>"
                tr += "<td>" + goodsinfo[i].purchasePrice + "</td>"
                tr += "<td>" + $(this).parent().prev().find("input").val() + "</td>"
                tr += "<td>" + goodsinfo[i].goodAmount + "</td>"
                tr += "<td>" + goodsinfo[i].procurementNo + "</td>";
                tr += "</tr>";
                $("#mytbd3").append(tr);
                $(this).prop("disabled", true);
            }

        }

    })

    //在页面加载是时添加一个入库单好
    $(function () {
        $.ajax({
            url: "repository/getDepotOrderNo",
            type: "post",
            dataType: "text",
            success: function (data) {
                $("#orderid").val(data)
            }

        })


    })

    //点击提交按钮时把采购单加入数据库
    $("#submit3").click(function () {
        alert(222)
        var storageNo = $("#storageNo").val();
        var inNo = $("#orderid").val();
        var applyperson = $("#caigouperson").val();//入库人
        var goodsarr = new Array();

        //获取所有的订单详情
        $("#mytbd3 tr").each(function () {
            //每一行都是一个对象
            var goods = new Object();
            goods.productNo = $("#orderid").val();
            goods.orderid = $(this).children("td").eq(0).text();
            goods.goodsNum = $(this).children("td").eq(5).text();
            goodsarr.push(goods);//将当前对象存放到数组中
        })

        var jsonstr = {
            "inNo": inNo,
            "storageNo": storageNo,
            "applyperson": applyperson,
            "goods": goodsarr
        }
        alert(11)
        $.ajax({
            url: "sto/insertSto",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(jsonstr),
            success: function (data) {
                if (data == "true") {
                    alert("提交成功");
                    $("#submit3").prop("disabled", true);
                }
                else {
                    alert("提交失败");
                }
            }
        })
    })
</script>