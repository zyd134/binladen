<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<base href="http://localhost:8080/binladen/"></base>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<script src="js/jquery.min.js" ></script>
<script src="js/bootstrap.min.js"></script>
<body>
<ul id="myTab" class="nav nav-tabs">
    <li class="active select" status="4">
        <a href="#notgetpay" data-toggle="tab">
            未收款
        </a>
    </li>
    <li class="select" status="3"><a href="#passed" data-toggle="tab">已通过</a></li>
    <li class="select" status="6"><a href="#payedNotConfirm" data-toggle="tab">已汇款未签收</a></li>

</ul>
<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="notgetpay">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>未收款订单</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <table class="table">
                            <thead>
                            <tr>
                                <th>订单编号</th>
                                <th>销售时间</th>
                                <th>销售人</th>
                                <th>说明</th>
                                <th>销售总价</th>
                                <th>订单状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="sale" items="${saleList}" varStatus="status" >
                                <tr index="${status.index}">
                                    <td>${sale.saleNo}</td>
                                    <td><fmt:formatDate value="${sale.saleTime}" pattern="yyyy-MM-dd" /></td>
                                    <td>${sale.salePerson}</td>
                                    <td>${sale.s_explain}</td>
                                    <td>${sale.salePrice}</td>
                                    <td>${sale.statusName}</td>
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-danger">操作</button>
                                            <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="height: 34px">
                                                <span class="caret"></span>
                                                <span class="sr-only">Toggle Dropdown</span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li  class="toldpaybtn" ><a>催款</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>

                                <tr index="${status.index}">
                                    <th>商品编号</th>
                                    <th>商品名</th>
                                    <th>商品数量</th>
                                    <th>总价</th>
                                </tr>

                                <c:forEach var="sdList" items="${sale.saleDetailList}">
                                    <tr index="${status.index}">
                                        <td>${sdList.goodNo}</td>
                                        <td>${sdList.goodName}</td>
                                        <td>${sdList.goodAmount}</td>
                                        <td>${sdList.totalPrice}</td>
                                    </tr>
                                </c:forEach>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>




        </div>
    </div>


    <div class="tab-pane fade" id="payedNotConfirm">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>已汇款未签收订单</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <table class="table">
                            <thead>
                            <tr>
                                <th>订单编号</th>
                                <th>销售时间</th>
                                <th>销售人</th>
                                <th>说明</th>
                                <th>销售总价</th>
                                <th>订单状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>

                        </table>

                    </div>
                </div>
            </div>




        </div>
    </div>

    <div class="tab-pane fade" id="passed">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>已通过订单</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <table class="table">
                            <thead>
                            <tr>
                                <th>订单编号</th>
                                <th>销售时间</th>
                                <th>销售人</th>
                                <th>说明</th>
                                <th>销售总价</th>
                                <th>订单状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>

                        </table>

                    </div>
                </div>
            </div>




        </div>
    </div>




</div>

</body>
</html>

<script>
    $(document).ready(function(){
        var statusflag=4;

        //一进来就查询
        $.ajax({
            url:"sale/selectSaleOrderByStatus",
            type:"post",
            data:{status:4,empNo:0},
            datatype:"json",
            success:function(data){
                    for(var i=0;i<data.length;i++){
                        var tr="<tr index="+i+" style=\"background-color: #d4edda\">\n" +
                            "                                <td>"+data[i].saleNo+"</td>\n" +
                            "                                <td>"+data[i].saleTime+"</td>\n"+
                            "                                <td>"+data[i].salePersonName+"</td>\n" +
                            "                                <td>"+data[i].s_explain+"</td>\n" +
                            "                                <td>"+data[i].salePrice+"</td>\n" +
                            "                                <td>"+data[i].statusName+"</td>\n" ;


                        tr+="<td>\n" +
                            "                                        <div class=\"btn-group\">\n" +
                            "                                            <button type=\"button\" class=\"btn btn-danger\">操作</button>\n" +
                            "                                            <button type=\"button\" class=\"btn btn-danger dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\" style=\"height: 34px\">\n" +
                            "                                                <span class=\"caret\"></span>\n" +
                            "                                                <span class=\"sr-only\">Toggle Dropdown</span>\n" +
                            "                                            </button>\n" +
                            "                                            <ul class=\"dropdown-menu\" role=\"menu\">\n" ;
                        if(status==6){
                            tr+="                                                <li class=\"confirmbtn\" saleNo=\""+data[i].saleNo+"\"><a>签收</a>\n" ;
                        }else{
                            tr+="                                                <li class=\"toldpaybtn\" ><a >催款</a>\n" +
                                "                                                </li>\n";
                        }

                        tr+="                                            </ul>\n" +
                            "                                        </div>\n" +
                            "                                    </td>";
                        tr+="                            </tr>"+
                            "<tr index="+i+">\n" +
                            "                                        <th>商品编号</th>\n" +
                            "                                        <th>商品名</th>\n" +
                            "                                        <th>商品数量</th>\n" +
                            "                                        <th>总价</th>\n" +
                            "                                    </tr>";
                        for(var j=0;j<data[i].saleDetailList.length;j++){
                            tr+="<tr index="+i+">\n" +
                                "                                            <td>"+data[i].saleDetailList[j].goodNo+"</td>\n" +
                                "                                            <td>"+data[i].saleDetailList[j].goodName+"</td>\n" +
                                "                                            <td>"+data[i].saleDetailList[j].goodAmount+"</td>\n" +
                                "                                            <td>"+data[i].saleDetailList[j].totalPrice+"</td>\n" ;


                            tr+="                                        </tr>";
                        }
                        $("tbody:first").append(tr);

                }


            }
        })


        $(".select").click(function(){
            var obj= $(this);
            var status=obj.attr("status");
            var flag = obj.children().attr("href");
            $.ajax({
                url:"sale/selectSaleOrderByStatus",
                type:"post",
                data:{status:status,empNo:0},
                datatype:"json",
                success:function(data){
                    if(statusflag!=status){
                        for(var i=0;i<data.length;i++){
                            var tr="<tr index="+i+" style=\"background-color: #d4edda\">\n" +
                                "                                <td>"+data[i].saleNo+"</td>\n" +
                                "                                <td>"+data[i].saleTime+"</td>\n"+
                                "                                <td>"+data[i].salePersonName+"</td>\n" +
                                "                                <td>"+data[i].s_explain+"</td>\n" +
                                "                                <td>"+data[i].salePrice+"</td>\n" +
                                "                                <td>"+data[i].statusName+"</td>\n" ;


                            tr+="<td>\n" +
                                "                                        <div class=\"btn-group\">\n" +
                                "                                            <button type=\"button\" class=\"btn btn-danger\">操作</button>\n" +
                                "                                            <button type=\"button\" class=\"btn btn-danger dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\" style=\"height: 34px\">\n" +
                                "                                                <span class=\"caret\"></span>\n" +
                                "                                                <span class=\"sr-only\">Toggle Dropdown</span>\n" +
                                "                                            </button>\n" +
                                "                                            <ul class=\"dropdown-menu\" role=\"menu\">\n" ;
                                    if(status==6){
                                        tr+="                                                <li class=\"confirmbtn\" saleNo=\""+data[i].saleNo+"\"><a>签收</a>\n" ;
                                    }else if(status==3){
                                        tr+= "                                                </li>\n"+
                                            "                                                <li class=\"notpaynowbtn\" saleNo=\""+data[i].saleNo+"\"><a >暂不收款</a>\n" +
                                            "                                                </li>\n";

                                        tr+="                                                <li class=\"toldpaybtn\" ><a >催款</a>\n" +
                                            "                                                </li>\n";
                                    }
                                    else{
                                        tr+="                                                <li class=\"toldpaybtn\" ><a >催款</a>\n" +
                                            "                                                </li>\n";
                                    }


                            tr+="                                            </ul>\n" +
                                "                                        </div>\n" +
                                "                                    </td>";
                            tr+="                            </tr>"+
                                "<tr index="+i+">\n" +
                                "                                        <th>商品编号</th>\n" +
                                "                                        <th>商品名</th>\n" +
                                "                                        <th>商品数量</th>\n" +
                                "                                        <th>总价</th>\n" +
                                "                                    </tr>";
                            for(var j=0;j<data[i].saleDetailList.length;j++){
                                tr+="<tr index="+i+" >\n" +
                                    "                                            <td>"+data[i].saleDetailList[j].goodNo+"</td>\n" +
                                    "                                            <td>"+data[i].saleDetailList[j].goodName+"</td>\n" +
                                    "                                            <td>"+data[i].saleDetailList[j].goodAmount+"</td>\n" +
                                    "                                            <td>"+data[i].saleDetailList[j].totalPrice+"</td>\n" ;


                                tr+="                                        </tr>";
                            }
                            $(flag).find("tbody:first").append(tr);
                        }
                        statusflag=status;
                    }

                    $(".select").each(function(){
                        if($(this).attr("status")!=status){
                            var flag2=$(this).children().attr("href");
                            $(flag2).find("tbody tr").remove();
                        }
                    })

                }
            })
        })


        //异步修改订单状态
        $("tbody").on("click",".toldpaybtn",function(){
            /*var obj=$(this);
            var saleNo = obj.attr("saleNo");
            $.ajax({
                url:"pro/updPOrderStatusByNo",
                type:"post",
                data:{status:5,pNo:pNo},
                datatype:"json",
                success:function (data) {
                    if(data.result=="success"){
                        alert("付款成功！");
                        obj.parents("tr").remove();
                        var index = obj.parents("tr").attr("index");
                        $("tr").each(function(){
                            if($(this).attr("index")==index){
                                $(this).remove();
                            }
                        })
                    }else{
                        alert("付款失败！");
                    }
                }
            })*/

            alert("已催款，等待对方回复");
        })


        $("tbody").on("click",".confirmbtn",function(){
            var obj=$(this);
            var saleNo = obj.attr("saleNo");
            $.ajax({
                url:"sale/updSaleStatusByNo",
                type:"post",
                data:{status:5,saleNo:saleNo},
                datatype:"json",
                success:function (data) {
                    if(data.result=="success"){
                        alert("签收汇款成功！");
                        var index = obj.parents("tr").attr("index");
                        obj.parents("tr").remove();
                        $("tr").each(function(){
                            if($(this).attr("index")==index){
                                $(this).remove();
                            }
                        })
                    }else{
                        alert("签收汇款失败！");
                    }
                }
            })
        })


        $("tbody").on("click",".notpaynowbtn",function(){
            var obj=$(this);
            var saleNo = obj.attr("saleNo");
            $.ajax({
                url:"sale/updSaleStatusByNo",
                type:"post",
                data:{status:4,saleNo:saleNo},
                datatype:"json",
                success:function (data) {
                    if(data.result=="success"){
                        alert("暂不收款成功！");
                        var index = obj.parents("tr").attr("index");
                        obj.parents("tr").remove();
                        $("tr").each(function(){
                            if($(this).attr("index")==index){
                                $(this).remove();
                            }
                        })
                    }else{
                        alert("暂不收款失败！");
                    }
                }
            })
        })



    })
</script>

