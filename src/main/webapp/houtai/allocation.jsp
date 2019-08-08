<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<base>
<base href="http://localhost:8080/binladen/">
<title>调拨</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<form role="form" class="form-inline">
    <div class="form-group">
        <strong>仓库：</strong><select class='selectSto' id="selectSto">
        <option class="opt">--选择仓库--</option>
    </select>
    </div>&nbsp;&nbsp;&nbsp;
    <div class="form-group">
        <label for="checker">操作员</label>
        <input type="text" class="form-control" id="checker" value="${emp.name}" readonly>
    </div>&nbsp;&nbsp;&nbsp;
    <div class="form-group">
        <label for="goodAmount">商品库存量</label>
        <input type="text" class="form-control" id="goodAmount" readonly>
    </div>&nbsp;&nbsp;&nbsp;
</form>

<table class="table">
    <thead>
    <tr>
        <th>商品编号</th>
        <th>仓库编号</th>
        <th>商品名称</th>
        <th>计量单位</th>
        <th>进货价格</th>
        <th>数量</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytbd">


    </tbody>

</table>
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
                    <label class="layui-form-label">仓库</label>
                    <select name="role" lay-verify="required" lay-search="" id="storageNo"
                            style="height: 30px;width: 150px">
                    </select>
                </div>
            </div>
            <table class="table" id="size">
                <thead>
                <tr>
                    <th>商品编号</th>
                    <th>商品名称</th>
                    <th>调拨数量</th>
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
                        <th>数量</th>
                        <th>调拨数量</th>
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
    var num = 0;//区分到底是第几行
    var acounts = 0;
    $(function () {
        getStorages();
    })

    $(".form-inline").on('change', ".selectSto", function () {
        var storageNo = $(this).val();
        $.ajax({
            url: "goods/selectStoGoods",
            type: "post",
            data: {"storageNo": storageNo},
            // dataType:"json",
            success: function (data) {
                for (var i in data) {
                    var tr = "<tr>\n" +
                        "<td>" + data[i].goodNo + "</td>\n" +
                        "<td>" + data[i].inNo + "</td>\n" +
                        "<td>" + data[i].goodName + "</td>\n" +
                        "<td>" + data[i].unit + "</td>\n" +
                        "<td>" + data[i].purchasePrice + "</td>\n" +
                        "<td>" + data[i].goodAmount + "</td>\n";
                    tr += "<td><button class='btn btn-sm getDetaiOrder' data-toggle='modal' data-target='#myModal' >调拨</button></td>";
                    tr += "</tr>\n";
                    acounts += data[i].acount;
                    //新增的tr追加到
                    $("#mytbd").append(tr);
                }
                $("#goodAmount").val(acounts);
            }
        })


        // getGoods();
    });

    //动态读取商品信息
    function getStorages() {
        $.ajax({
            url: "goods/selectSto",
            type: "post",
            dataType: "json",
            success: function (data) {
                //清空下拉框中的子元素
                for (var i in data) {
                    var option = "<option value='" + data[i].storageNo + "'>" + data[i].storageName + "</option>";
                    $("#selectSto").eq(num).append(option);
                    //$("#mytbd .selectSto").eq(num).append(option);//当前行只会影响，不会影响其他行

                }
                num++;//每添一行num自增1

            }
        })
    }

    $("#mytbd").on("change", ".goodsname", function () {
        //循环进行匹配
        for (var i in goods) {
            if ($(this).val() == goods[i].goodNo) {
                //$(this).parent().prev().text();
                // $(this).parent().next().text(goodsinfo[i].typeName);
                $(this).parent().parent().children("td").eq(0).text(goods[i].goodNo);
                $(this).parent().parent().children("td").eq(2).text(goods[i].typeName);
                $(this).parent().parent().children("td").eq(3).text(goods[i].goodSpecs);
                $(this).parent().parent().children("td").eq(4).text(goods[i].unit);
                $(this).parent().parent().children("td").eq(5).text(goods[i].purchasePrice);
                $(this).parent().parent().children("td").eq(7).text(goods[i].acount);

            }

        }

    })


    //键盘抬起时，小计发生变化
    $("#mytbd").on("keyup", "input", function () {
        var purchasePrice = $(this).parent().prev().text();
        var goodAmount = $(this).parent().prev().text();
        var num = $(this).val();
        $(this).parent().next().text(goodAmount - num);
        $(this).parent().next().next().text(purchasePrice * num);
    })


    var goodNo;
    var goodName;
    var goodAmount;
    var inNo;
    var num;
    var isFlag;

    $("#mytbd").on("click", ".getDetaiOrder", function () {
        document.getElementById("mytbd2").innerHTML = "";
        goodNo = $(this).parent().parent().children("td").eq(0).text();
        inNo = $(this).parent().parent().children("td").eq(1).text();
        goodName = $(this).parent().parent().children("td").eq(2).text();
        goodAmount = $(this).parent().parent().children("td").eq(5).text();
        var tr = "<tr>"
        tr += "<td>" + goodNo + "</td>"
        tr += "<td>" + goodName + "</td>"
        tr += "<td>" + goodAmount + "</td>"
        tr += "<td><input size='3' class='.size'/></td>"
        tr += "<td><button class='btn btn-xs btnAdd'>确认</button></td>"
        tr += "</tr>";
        $("#mytbd2").append(tr);
    })


    //点击确认按钮将商品信息添加到入库单中
    $("#mytbd2").on("click", ".btnAdd", function () {
        isFlag=true;
        var tr = "<tr>"
        tr += "<td>" + goodNo + "</td>"
        tr += "<td>" + goodName + "</td>"
        tr += "<td>" + $(this).parent().prev().find("input").val() + "</td>";
        tr += "</tr>";
        num = $(this).parent().prev().find("input").val()
        if (goodAmount < num) {
            isFlag = false;
            // alert("调拨超出");
        }
        if (isFlag) {
            $("#mytbd3").append(tr);
            $(this).prop("disabled", true);
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

    $("#submit3").click(function () {
        var orderid = $("#orderid").val();
        var size = $("#size").children().children().children("td").eq(2).text();
        var applyperson = $("#caigouperson").val();
        var storageNo = $("#storageNo").val();
        $.ajax({
            //调拨
            url: "sto/updateAndInsert",
            type: "post",
            dataType: "json",
            data: {
                "orderid": orderid,
                "size": size,
                "goodNo": goodNo,
                "inNo": inNo,
                "goodAmount": goodAmount,
                "applyperson": applyperson,
                "storageNo": storageNo
            },
            success: function (date) {
                alert("调拨成功")
            }
        })
    })


</script>