<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h2>商品管理<span><button id="addbtn" class="btn btn-default" type="submit" data-toggle="modal" data-target="#addModal" style="float: right;margin-right: 100px">添加</button></span></h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">

                <table class="table">
                    <thead>
                    <tr>
                        <th>商品编号</th>
                        <th>商品名</th>
                        <th>商品类型</th>
                        <th>采购价格</th>
                        <th>销售价格</th>
                        <th>零售价</th>
                        <th>产地</th>
                        <th>单位</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="good" items="${goodList}">
                    <tr>
                        <th scope="row" width="10%">${good.goodNo}</th>
                        <td id="id" width="10%">${good.goodName}</td>
                        <td width="15%">${good.goodTypeName}</td>
                        <td width="10%">${good.purchasePrice}</td>
                        <td width="10%">${good.salePrice}</td>
                        <td width="10%">${good.retailPrice}</td>
                        <td width="10%">${good.originPlace}</td>
                        <td width="10%">${good.unit}</td>
                        <td width="15%">
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger">操作</button>
                                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="height: 34px">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a  class="updatebtn" goodNo="${good.goodNo}" data-toggle="modal" data-target="#myModal">修改</a>
                                    </li>
                                    <li class="deletebtn" goodNo="${good.goodNo}"><a >删除</a>
                                    </li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    </c:forEach>
                </table>

            </div>
        </div>
    </div>


    <div class="col-sm-12">
        <div class="dataTables_paginate paging_simple_numbers" id="datatable-checkbox_paginate">
            <ul class="pagination" style="float:right;margin-right:100px">
                <c:if test="${currentPage!=1}">
                    <li class="paginate_button previous" id="datatable-checkbox_previous">
                        <a href="goods/getGoodList?currentPage=${currentPage-1}" aria-controls="datatable-checkbox" data-dt-idx="0" tabindex="0">Previous</a>
                    </li>
                </c:if>
                <li class="paginate_button active">
                    <a  aria-controls="datatable-checkbox" data-dt-idx="1" tabindex="0">第${currentPage}/${totalPage}页</a>
                </li>

                <c:if test="${totalPage!=1 && currentPage<totalPage}">
                    <li class="paginate_button next" id="datatable-checkbox_next">
                        <a href="goods/getGoodList?currentPage=${currentPage+1}" aria-controls="datatable-checkbox" data-dt-idx="7" tabindex="0">Next</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>


    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        修改商品信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="modifyGoodForm" >
                        <table>
                            <tr>
                                <td width="50%">商品编号</td>
                                <td><input type="text" name="goodNo" readonly ></td>
                            </tr>
                            <tr>
                                <td>商品名</td>
                                <td><input type="text" name="goodName"></td>
                            </tr>
                            <tr>
                                <td>商品类型</td>
                                <td>
                                    <select name="goodType">
                                        <c:forEach var="goodType" items="${goodTypeList}">
                                            <option value="${goodType.id}">${goodType.typeName}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>采购价格</td>
                                <td><input type="text" name="purchasePrice"></td>
                            </tr>
                            <tr>
                                <td>销售价格</td>
                                <td><input type="text" name="salePrice"></td>
                            </tr>
                            <tr>
                                <td>零售价</td>
                                <td><input type="text" name="retailPrice"></td>
                            </tr>
                            <tr>
                                <td>产地</td>
                                <td><input type="text" name="originPlace"></td>
                            </tr>
                            <tr>
                                <td>规格</td>
                                <td><input type="text" name="goodSpecs"></td>
                            </tr>
                            <tr>
                                <td>单位</td>
                                <td><input type="text" name="unit"></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="saveupdatebtn" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>



    <!-- 模态框（Modal） -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="addModalLabel">
                        添加商品
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="addGoodForm" >
                        <table>
                            <tr>
                                <td width="50%">商品名</td>
                                <td><input type="text" name="goodName"></td>
                            </tr>
                            <tr>
                                <td>商品类型</td>
                                <td>
                                    <select name="goodType">
                                        <c:forEach var="goodType" items="${goodTypeList}">
                                            <option value="${goodType.id}">${goodType.typeName}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>采购价格</td>
                                <td><input type="text" name="purchasePrice"></td>
                            </tr>
                            <tr>
                                <td>销售价格</td>
                                <td><input type="text" name="salePrice"></td>
                            </tr>
                            <tr>
                                <td>零售价</td>
                                <td><input type="text" name="retailPrice"></td>
                            </tr>
                            <tr>
                                <td>产地</td>
                                <td><input type="text" name="originPlace"></td>
                            </tr>
                            <tr>
                                <td>规格</td>
                                <td><input type="text" name="goodSpecs"></td>
                            </tr>
                            <tr>
                                <td>单位</td>
                                <td><input type="text" name="unit"></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="saveaddbtn" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</div>
</body>
</html>

<script>
    $(document).ready(function(){
        $(".deletebtn").click(function(){
            var obj= $(this);
            var id=obj.attr("goodNo");
            $.ajax({
                url:"goods/delGoodById",
                type:"post",
                data:{goodNo:id},
                datatype:"json",
                success:function(data){
                    if(data.result=="success"){
                        alert("删除成功！");
                        obj.parents("tr").remove();
                    }else{
                        alert("删除成功！");
                    }
                }
            })
        })



        $(".updatebtn").click(function(){
            var obj=$(this);
            $.ajax({
                url:"goods/getGoodByNo",
                type:"post",
                data:{goodNo:obj.attr("goodNo")},
                datatype:"json",
                success:function(data){
                    $("#modifyGoodForm option").each(function(){
                        if(($(this).attr("value"))==data["goodType"]){
                            $(this).attr("selected","selected");
                        }else{
                            $(this).removeAttr("selected");
                        }
                    })

                    $("#modifyGoodForm table input").each(function(){
                        var key=$(this).attr("name");
                        $(this).val(data[key]);
                    })
                }
            })

        })


        $("#saveupdatebtn").click(function(){
            $.ajax({
                url:"goods/updGoodByNo",
                type:"post",
                data:$("#modifyGoodForm").serialize(),
                datatype:"json",
                success:function(data){
                    if(data.result=="success"){
                        alert("修改成功!")
                        window.location.href="goods/getGoodList?currentPage=1";
                    }else{
                        alert("修改失败!")
                    }
                }
            })
        })

        $("#saveaddbtn").click(function(){
            $.ajax({
                url:"goods/addGood",
                type:"post",
                data:$("#addGoodForm").serialize(),
                datatype:"json",
                success:function(data){
                    if(data.result=="success"){
                        alert("添加成功！");
                        window.location.href="goods/getGoodList?currentPage=1";
                    }else{
                        alert("添加失败！")
                    }
                }
            })
        })
    })
</script>
