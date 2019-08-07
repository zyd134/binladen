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
    <li class="active select" status="3">
        <a href="#home" data-toggle="tab">
            未通过
        </a>
    </li>
    <li class="select" status="2"><a href="#ios" data-toggle="tab">已通过</a></li>
    <li class="select" status="4"><a href="#notpay" data-toggle="tab">未付款</a></li>
    <li class="select" status="5"><a href="#payed" data-toggle="tab">已付款</a></li>
    <li class="select" status="8"><a href="#buythenpay" data-toggle="tab">先采购再付款</a></li>
    <li class="select" status="7"><a href="#sto_in" data-toggle="tab">已采购未付款</a></li>
    <li class="select" status="6"><a href="#finish" data-toggle="tab">已完成</a></li>
</ul>
<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="home">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>未通过订单</h2>
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
    <div class="tab-pane fade" id="ios">
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
                                <th>采购时间</th>
                                <th>采购人</th>
                                <th>说明</th>
                                <th>采购总价</th>
                                <th>订单状态</th>
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
    <div class="tab-pane fade" id="notpay">
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
                            </tbody>

                        </table>

                    </div>
                </div>
            </div>




        </div>
    </div>
    <div class="tab-pane fade" id="payed">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>已付款订单</h2>
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



    <div class="tab-pane fade" id="finish">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>已完成订单</h2>
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


    <div class="tab-pane fade" id="buythenpay">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>已完成订单</h2>
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



    <div class="tab-pane fade" id="sto_in">
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
        var empNo=${emp.empNo};


        $(".select").click(function(){
            var obj= $(this);
            var status=obj.attr("status");
            var flag = obj.children().attr("href");
            $.ajax({
                url:"pur/selectPurOrderByStatus",
                type:"post",
                data:{status:status,empNo:empNo},
                datatype:"json",
                success:function(data){
                    if(statusflag!=status){
                        for(var i=0;i<data.length;i++){
                            var tr="<tr index="+i+" style=\"background-color: #d4edda\">\n" +
                                "                                <td>"+data[i].procurementNo+"</td>\n" +
                                "                                <td>"+data[i].purchaseTime+"</td>\n"+
                                "                                <td>"+data[i].purchaser+"</td>\n" +
                                "                                <td>"+data[i].p_explain+"</td>\n" +
                                "                                <td>"+data[i].purchasePrice+"</td>\n" +
                                "                                <td>"+data[i].statusName+"</td>\n" ;
                                    if(status==3){
                                        tr+="<td>" +
                                            "<button class=\"recheckbtn btn btn-primary btn-sm\">请求重审</button>" +
                                            "</td>"
                                    }
                                    if(status==5){
                                        tr+="<td>" +
                                            "<button pNo="+data[i].procurementNo+" class=\"buybtn btn btn-primary btn-sm\">去采购</button>" +
                                            "</td>"
                                    }

                                    if(status==8){
                                        tr+="<td>" +
                                            "<button pNo="+data[i].procurementNo+" class=\"tobuybtn btn btn-primary btn-sm\">去采购</button>" +
                                            "</td>"
                                    }

                                    if(status==4 || status==7){
                                        tr+="<td>" +
                                            "<button  class=\"toldbuybtn btn btn-primary btn-sm\">催付款</button>" +
                                            "</td>"
                                    }
                               tr+= "                            </tr>"+
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
                                    "                                            <td>"+data[i].purchaseDetailList[j].totalPrice+"</td>\n" +
                                    "                                        </tr>";
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



        //进来获取订单
        $.ajax({
            url:"pur/selectPurOrderByStatus",
            type:"post",
            data:{status:3,empNo:empNo},
            datatype:"json",
            success:function(data){
                    for(var i=0;i<data.length;i++){
                        var tr="<tr index="+i+" style=\"background-color: #d4edda\">\n" +
                            "                                <td>"+data[i].procurementNo+"</td>\n" +
                            "                                <td>"+data[i].purchaseTime+"</td>\n"+
                            "                                <td>"+data[i].purchaser+"</td>\n" +
                            "                                <td>"+data[i].p_explain+"</td>\n" +
                            "                                <td>"+data[i].purchasePrice+"</td>\n" +
                            "                                <td>"+data[i].statusName+"</td>\n" ;
                                    if(statusflag==3){
                                        tr+="<td>" +
                                            "<button pNo="+data[i].procurementNo+" class=\"recheckbtn btn btn-primary btn-sm\">请求重审</button>" +
                                            "</td>"
                                    }
                                    if(statusflag==5){
                                        tr+="<td>" +
                                            "<button pNo="+data[i].procurementNo+" class=\"buybtn btn btn-primary btn-sm\">去采购</button>" +
                                            "</td>"
                                    }
                                    if(statusflag==8){
                                        tr+="<td>" +
                                            "<button pNo="+data[i].procurementNo+" class=\"tobuybtn btn btn-primary btn-sm\">去采购</button>" +
                                            "</td>"
                                    }
                                    if(statusflag==4 || statusflag==7){
                                        tr+="<td>" +
                                            "<button  class=\"toldbuybtn btn btn-primary btn-sm\">催付款</button>" +
                                            "</td>"
                                    }
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
                                "                                            <td>"+data[i].purchaseDetailList[j].totalPrice+"</td>\n" +
                                "                                        </tr>";
                        }
                        $("tbody:first").append(tr);
                    }
                }


            })


        //重新审核
        $("tbody").on("click",".recheckbtn",function(){
            var obj=$(this);
            var pNo =obj.attr("pNo");
            $.ajax({
                url:"pro/updPOrderStatusByNo",
                type:"post",
                data:{status:1,pNo:pNo},
                datatype:"json",
                success:function (data) {
                    if(data.result=="success"){
                        alert("请求重新审核成功！");
                        obj.parents("tr").remove();
                        var index = obj.parents("tr").attr("index");
                        $("tr").each(function(){
                            if($(this).attr("index")==index){
                                $(this).remove();
                            }
                        })
                    }else{
                        alert("请求重新审核失败！");
                    }
                }
            })
        })


        //去采购
        $("tbody").on("click",".buybtn",function(){
            var obj=$(this);
            var pNo =obj.attr("pNo");
            $.ajax({
                url:"pro/updPOrderStatusByNo",
                type:"post",
                data:{status:6,pNo:pNo},
                datatype:"json",
                success:function (data) {
                    if(data.result=="success"){
                        alert("采购完成！");
                        obj.parents("tr").remove();
                        var index = obj.parents("tr").attr("index");
                        $("tr").each(function(){
                            if($(this).attr("index")==index){
                                $(this).remove();
                            }
                        })
                    }else{
                        alert("采购失败！");
                    }
                }
            })
        })



        //先采购再付款
        //去采购
        $("tbody").on("click",".tobuybtn",function(){
            var obj=$(this);
            var pNo =obj.attr("pNo");
            $.ajax({
                url:"pro/updPOrderStatusByNo",
                type:"post",
                data:{status:7,pNo:pNo},
                datatype:"json",
                success:function (data) {
                    if(data.result=="success"){
                        alert("采购完成！");
                        obj.parents("tr").remove();
                        var index = obj.parents("tr").attr("index");
                        $("tr").each(function(){
                            if($(this).attr("index")==index){
                                $(this).remove();
                            }
                        })
                    }else{
                        alert("采购失败！");
                    }
                }
            })
        })


        //催款
        $("tbody").on("click",".toldbuybtn",function(){
            alert("已提醒财务付款")
        })
    })
</script>
