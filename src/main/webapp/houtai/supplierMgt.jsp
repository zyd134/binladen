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
                <h2>供应商管理<span><button id="addbtn" class="btn btn-default" type="submit" data-toggle="modal" data-target="#addModal" style="float: right;margin-right: 100px">添加</button></span></h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">

                <table class="table">
                    <thead>
                    <tr>
                        <th>供应商编号</th>
                        <th>供应商名</th>
                        <th>联系人</th>
                        <th>联系电话</th>
                        <th>邮箱</th>
                        <th>地址</th>
                        <th>开户银行</th>
                        <th>银行账号</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="supplier" items="${supplierList}">
                    <tr>
                        <th scope="row" width="10%">${supplier.supplierNo}</th>
                        <td id="id" width="10%">${supplier.supplierName}</td>
                        <td width="15%">${supplier.contacts}</td>
                        <td width="10%">${supplier.tel}</td>
                        <td width="10%">${supplier.email}</td>
                        <td width="10%">${supplier.address}</td>
                        <td width="10%">${supplier.bank}</td>
                        <td width="10%">${supplier.bankAccount}</td>
                        <td width="15%">
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger">操作</button>
                                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="height: 34px">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li class="updatebtn" supplierId="${supplier.id}" data-toggle="modal" data-target="#myModal"><a >修改</a>
                                    </li>
                                    <li class="deletebtn" supplierId="${supplier.id}"><a >删除</a>
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
                        <a href="sup/getSupplierList?currentPage=${currentPage-1}" aria-controls="datatable-checkbox" data-dt-idx="0" tabindex="0">Previous</a>
                    </li>
                </c:if>
                <li class="paginate_button active">
                    <a  aria-controls="datatable-checkbox" data-dt-idx="1" tabindex="0">第${currentPage}/${totalPage}页</a>
                </li>

                <c:if test="${totalPage!=1 && currentPage<totalPage}">
                    <li class="paginate_button next" id="datatable-checkbox_next">
                        <a href="sup/getSupplierList?currentPage=${currentPage+1}" aria-controls="datatable-checkbox" data-dt-idx="7" tabindex="0">Next</a>
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
                        修改供应商信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="modifySupForm" >
                        <input type="hidden" id="modifyid" name="id" >
                        <table>
                            <tr>
                                <td width="50%">供应商编号</td>
                                <td><input type="text" name="supplierNo" readonly ></td>
                            </tr>
                            <tr>
                                <td>供应商名</td>
                                <td><input type="text" name="supplierName"></td>
                            </tr>
                            <tr>
                                <td>联系人</td>
                                <td><input type="text" name="contacts"></td>
                            </tr>
                            <tr>
                                <td>联系电话</td>
                                <td><input type="text" name="tel"></td>
                            </tr>
                            <tr>
                                <td>邮箱</td>
                                <td><input type="text" name="email"></td>
                            </tr>
                            <tr>
                                <td>地址</td>
                                <td><input type="text" name="address"></td>
                            </tr>
                            <tr>
                                <td>开户银行</td>
                                <td><input type="text" name="bank"></td>
                            </tr>
                            <tr>
                                <td>银行账号</td>
                                <td><input type="text" name="bankAccount"></td>
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
                        添加供应商
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="addSupForm" >
                        <table>
                            <tr>
                                <td width="50%">供应商名</td>
                                <td><input type="text" name="supplierName"></td>
                            </tr>
                            <tr>
                                <td>联系人</td>
                                <td><input type="text" name="contacts"></td>
                            </tr>
                            <tr>
                                <td>联系电话</td>
                                <td><input type="text" name="tel"></td>
                            </tr>
                            <tr>
                                <td>邮箱</td>
                                <td><input type="text" name="email"></td>
                            </tr>
                            <tr>
                                <td>地址</td>
                                <td><input type="text" name="address"></td>
                            </tr>
                            <tr>
                                <td>开户银行</td>
                                <td><input type="text" name="bank"></td>
                            </tr>
                            <tr>
                                <td>银行账号</td>
                                <td><input type="text" name="bankAccount"></td>
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
            var id=obj.attr("supplierId");
            $.ajax({
                url:"sup/deleteSupById",
                type:"post",
                data:{id:id},
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
            $("#modifyid").val(obj.attr("supplierId"))
            $.ajax({
                url:"sup/getSupplierById",
                type:"post",
                data:{id:obj.attr("supplierId")},
                datatype:"json",
                success:function(data){
                    $("#modifySupForm table input").each(function(){
                        var key=$(this).attr("name");
                        $(this).val(data[key])
                    })
                }
            })

        })


        $("#saveupdatebtn").click(function(){
            $.ajax({
                url:"sup/modifySupplier",
                type:"post",
                data:$("#modifySupForm").serialize(),
                datatype:"json",
                success:function(data){
                    if(data.result=="success"){
                        alert("修改成功!")
                        window.location.href="sup/getSupplierList?currentPage=1";
                    }else{
                        alert("修改失败!")
                    }
                }
            })
        })

        $("#saveaddbtn").click(function(){
            $.ajax({
                url:"sup/addSupplier",
                type:"post",
                data:$("#addSupForm").serialize(),
                datatype:"json",
                success:function(data){
                    if(data.result=="success"){
                        alert("添加成功！");
                        window.location.href="sup/getSupplierList?currentPage=1";
                    }else{
                        alert("添加失败！")
                    }
                }
            })
        })
    })
</script>
