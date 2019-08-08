<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<base href="http://localhost:8080/binladen/"></base>
<head>
    <title>销售出库</title>
    <base href="http://localhost:8080/binladen/"></base>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
</head>

<body>

<div class="panel panel-default">
    <div class="panel-heading">销售订单</div>
    <div class="panel-body">
        <table class="table">
            <thead>

            <th>订单编号</th>
            <th>销售时间</th>
            <th>销售人</th>
            <th>商品编号</th>
            <th>商品名称</th>
            <th>数量</th>
            <th>订单状态</th>
            <th>操作</th>

            </thead>
            <tbody id="saletb">
            </tbody>

        </table>
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
                        <th>销售数量</th>
                        <th>出库数量</th>
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

            <table class="table">
                <thead>
                <tr>
                    <th>商品编号</th>
                    <th>商品名称</th>
                    <th>销售数量</th>
                    <th>出库数量</th>
                </tr>
                </thead>
                <tbody id="mytbd3">
                </tbody>
            </table>
        </form>
    </div>
</div>
</body>
</html>
<script>
    $.ajax({
        url: "sale/selectSaleOrderByStatus",
        type: "post",
        data: {status: 3, empNo:${emp.empNo}},
        datatype: "json",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                var tr =
                    "                                <td>" + data[i].saleNo + "</td>\n" +
                    "                                <td>" + data[i].saleTime + "</td>\n" +
                    "                                <td>" + data[i].salePerson + "</td>\n";
                for (var j = 0; j < data[i].saleDetailList.length; j++) {
                    tr += "<td>" + data[i].saleDetailList[j].goodNo + "</td>\n" +
                        "<td>" + data[i].saleDetailList[j].goodName + "</td>\n"+
                    " <td>"+data[i].saleDetailList[j].goodAmount+"</td>\n" ;
                }
                tr += "                                <td>" + data[i].statusName + "</td>\n";
                tr += "<td><button class='btn btn-sm getDetaiOrder' data-toggle='modal' data-target='#myModal' >加入出库</button></td>";
                $("#saletb").append(tr);
            }
        }
    })
    var saleNo;
    var salePerson;
    var goodNo;
    var goodName;
    var goodAmount;
    var num;
    $("#saletb").on("click", ".getDetaiOrder", function () {
        saleNo=$(this).parent().parent().children("td").eq(0).text();
        salePerson=$(this).parent().parent().children("td").eq(2).text();
        goodNo=$(this).parent().parent().children("td").eq(3).text();
        goodName=$(this).parent().parent().children("td").eq(4).text();
        goodAmount=$(this).parent().parent().children("td").eq(5).text();

        var tr = "<tr>"
        tr += "<td>" + saleNo + "</td>"
        tr += "<td>" + goodName + "</td>"
        tr += "<td>" + goodAmount + "</td>"
        tr += "<td><input size='3' id='qqq'/></td>"
        tr += "<td><button class='btn btn-xs btnAdd'>确认</button></td>";
        tr += "</tr>";
        $("#mytbd2").append(tr);
    })
    $("#mytbd2").on("click", ".btnAdd", function () {

        num=$("#mytbd2").children().children().children().val();
        var tr = "<tr>"
        tr += "<td>" + saleNo + "</td>"
        tr += "<td>" + goodName + "</td>"
        tr += "<td>" + goodAmount + "</td>"
        tr += "<td>"+num+"</td>"
        tr += "</tr>";
        $("#mytbd3").append(tr);
        $(this).prop("disabled", true);
    })
    //在页面加载是时添加一个入库单好
    $(function () {
        $.ajax({
            url: "out/getOutNo",
            type: "post",
            dataType: "text",
            success: function (data) {
                $("#orderid").val(data);
            }

        })
    })

    $("#submit3").click(function () {

        var orderid = $("#orderid").val();
        $.ajax({
            url: "out/insertOutDe",
            type: "post",
            dataType: "json",
            data:{"outNo":orderid,"outGoodNo":goodNo,"goodAmount":goodAmount,"salePerson":salePerson,"num":num},
            success:function (data) {
                alert("出库成功")
            }
        })
    })


</script>
