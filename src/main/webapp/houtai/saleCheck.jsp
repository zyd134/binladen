<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<base href="http://localhost:8080/binladen/"></base>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<script src="js/jquery.min.js" ></script>
<script src="js/bootstrap.min.js"></script>
<body>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>销售订单审核</h2>
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
                        <th>客户</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="check" items="${checkList}">
                    <tr style="background-color: #d4edda">
                        <th >${check.saleNo}</th>
                        <td><fmt:formatDate value="${check.saleTime}" pattern="yyyy-MM-dd"/></td>
                        <td>${check.salePerson}</td>
                        <td>${check.s_explain}</td>
                        <td>${check.customer}</td>
                        <td>${check.statusName}</td>
                        <td>
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger">操作</button>
                                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="height: 34px">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li class="pass" saleNo="${check.saleNo}"><a >通过</a>
                                    </li>
                                    <li class="notpass" saleNo="${check.saleNo}"><a >不通过</a>
                                    </li>
                                </ul>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>商品编号</td>
                        <td>商品名</td>
                        <td>商品数量</td>
                        <td>总价</td>
                    </tr>
                        <c:forEach var="good" items="${check.saleDetailList}">
                            <td>${good.goodNo}</td>
                            <td>${good.goodName}</td>
                            <td>${good.goodAmount}</td>
                            <td>${good.totalPrice}</td>
                        </c:forEach>
                    </c:forEach>
                </table>

            </div>
        </div>
    </div>


    <div class="col-sm-12" style="position: fixed;bottom: 10px">
        <div class="dataTables_paginate paging_simple_numbers" id="datatable-checkbox_paginate">
            <ul class="pagination" style="float:right;margin-right:100px">
                <c:if test="${currentPage!=1}">
                    <li class="paginate_button previous" id="datatable-checkbox_previous">
                        <a href="sale/toSaleCheck?currentPage=${currentPage-1}" aria-controls="datatable-checkbox" data-dt-idx="0" tabindex="0">Previous</a>
                    </li>
                </c:if>
                <li class="paginate_button active">
                    <a  aria-controls="datatable-checkbox" data-dt-idx="1" tabindex="0">第${currentPage}/${totalPage}页</a>
                </li>

                <c:if test="${totalPage!=1 && currentPage<totalPage}">
                    <li class="paginate_button next" id="datatable-checkbox_next">
                        <a href="sale/toSaleCheck?currentPage=${currentPage+1}" aria-controls="datatable-checkbox" data-dt-idx="7" tabindex="0">Next</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>



</div>
</body>
</html>

<script>
    $(document).ready(function(){

        $(".pass").click(function(){
            var obj=$(this);
            var saleNo=obj.attr("saleNo");
            $.ajax({
                url:"sale/updSaleStatusByNo",
                type:"post",
                data:{status:3,saleNo:saleNo},
                datatype:"json",
                success:function(data){
                    if(data.result=="success"){
                        alert("审核成功！");
                        obj.parents("tr").remove();
                    }else{
                        alert("审核失败！")
                    }
                }
            })
        })


        $(".notpass").click(function(){
            var obj=$(this);
            var saleNo=obj.attr("saleNo");
            $.ajax({
                url:"sale/updSaleStatusByNo",
                type:"post",
                data:{status:2,saleNo:saleNo},
                datatype:"json",
                success:function(data){
                    if(data.result=="success"){
                        alert("审核成功！");
                        obj.parents("tr").remove();
                    }else{
                        alert("审核失败！")
                    }
                }
            })
        })
    })
</script>
