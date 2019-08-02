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
        <a href="#notpay" data-toggle="tab">
            未付款
        </a>
    </li>
    <li class="select" status="7"><a href="#notpaybutbuy" data-toggle="tab">已采购未付款</a></li>
</ul>
<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="notpay">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>未付款订单</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th>订单编号</th>
                                    <th>采购时间</th>
                                    <th>采购人</th>
                                    <th>说明</th>
                                    <th>采购总价</th>
                                    <th>订单状态</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="procure" items="${procurementList}" varStatus="status" >
                                    <tr index="${status.index}">
                                        <td>${procure.procurementNo}</td>
                                        <td><fmt:formatDate value="${procure.purchaseTime}" pattern="yyyy-MM-dd" /></td>
                                        <td>${procure.purchaser}</td>
                                        <td>${procure.p_explain}</td>
                                        <td>${procure.purchasePrice}</td>
                                        <td>${procure.statusName}</td>
                                        <td>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-danger">操作</button>
                                                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="height: 34px">
                                                    <span class="caret"></span>
                                                    <span class="sr-only">Toggle Dropdown</span>
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li  class="paybtn" pNo="${procure.procurementNo}"><a>付款</a>
                                                    </li>
                                                    <li class="notpaybtn" pNo="${procure.procurementNo}"><a>先采购再付款</a>
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

                                    <c:forEach var="pdList" items="${procure.purchaseDetailList}">
                                        <tr index="${status.index}">
                                            <td>${pdList.goodNo}</td>
                                            <td>${pdList.goodName}</td>
                                            <td>${pdList.goodAmount}</td>
                                            <td>${pdList.totalPrice}</td>
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


    <div class="tab-pane fade" id="notpaybutbuy">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>已采购未付款订单</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <table class="table">
                            <thead>
                            <tr>
                                <th>订单编号</th>
                                <th>采购时间</th>
                                <th>采购人</th>
                                <th>说明</th>
                                <th>采购总价</th>
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
        var statusflag=3;


        $(".select").click(function(){
            var obj= $(this);
            var status=obj.attr("status");
            var flag = obj.children().attr("href");
            $.ajax({
                url:"pur/selectPurOrderByStatus",
                type:"post",
                data:{status:status},
                datatype:"json",
                success:function(data){
                    if(statusflag!=status){
                        for(var i=0;i<data.length;i++){
                            var tr="<tr index="+i+">\n" +
                                "                                <td>"+data[i].procurementNo+"</td>\n" +
                                "                                <td>"+data[i].purchaseTime+"</td>\n"+
                                "                                <td>"+data[i].purchaser+"</td>\n" +
                                "                                <td>"+data[i].p_explain+"</td>\n" +
                                "                                <td>"+data[i].purchasePrice+"</td>\n" +
                                "                                <td>"+data[i].statusName+"</td>\n" ;


                            tr+="<td>\n" +
                                "                                        <div class=\"btn-group\">\n" +
                                "                                            <button type=\"button\" class=\"btn btn-danger\">操作</button>\n" +
                                "                                            <button type=\"button\" class=\"btn btn-danger dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\" style=\"height: 34px\">\n" +
                                "                                                <span class=\"caret\"></span>\n" +
                                "                                                <span class=\"sr-only\">Toggle Dropdown</span>\n" +
                                "                                            </button>\n" +
                                "                                            <ul class=\"dropdown-menu\" role=\"menu\">\n" +
                                "                                                <li class=\"paybtn\" pNo=\""+data[i].procurementNo+"\"><a>付款</a>\n" ;
                            if(status!=7){
                                tr+= "                                                </li>\n"+
                                    "                                                <li class=\"notpaybtn\" pNo=\""+data[i].procurementNo+"\"><a >先采购再付款</a>\n" +
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
                            for(var j=0;j<data[i].purchaseDetailList.length;j++){
                                tr+="<tr index="+i+">\n" +
                                    "                                            <td>"+data[i].purchaseDetailList[j].goodNo+"</td>\n" +
                                    "                                            <td>"+data[i].purchaseDetailList[j].goodName+"</td>\n" +
                                    "                                            <td>"+data[i].purchaseDetailList[j].goodAmount+"</td>\n" +
                                    "                                            <td>"+data[i].purchaseDetailList[j].totalPrice+"</td>\n" ;


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
        $("tbody").on("click",".paybtn",function(){
            var obj=$(this);
            var pNo = obj.attr("pNO");
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
            })
        })

        $("tbody").on("click",".notpaybtn",function(){
            var pNo = $(this).attr("pNO");
            $.ajax({
                url:"pro/updPOrderStatusByNo",
                type:"post",
                data:{status:7,pNo:pNo},
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
            })
        })



    })
</script>

