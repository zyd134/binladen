<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<base>
<base href="http://localhost:8080/binladen/">
<title>Title</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<fieldset style="margin-left: 10px">
    <p><h2>客户信息</h2>
    <button class='btn btn-success btn-sm add' data-toggle='modal' data-target='#myModal2'>增加</button></p>
</fieldset>

<table class="table table-striped">

    <thead>
    <tr>
        <th>
            客户编码
        </th>
        <th>
            姓名
        </th>
        <th>
            电话
        </th>
        <th>
            地址
        </th>
        <th>
            邮箱
        </th>
            开户银行
        <th>
        <th>
            银行卡号
        </th>
            操作
        </th>
    </tr>
    </thead>
    <tbody id="mytbd">
    <ul class="dropdown-menu" role="menu">
        <li><a href="#">修改</a></li>
        <li><a href="#">删除</a></li>
    </ul>
    </tbody>
</table>

<!-- 模态框（Modal）修改 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改学生信息
                </h4>
            </div>
            <div class="modal-body">
                <form id="myform2" method="post">
                    学号：<input class="stuid" id="stuid" name="stuid" readonly/><br><br>
                    姓名：<input class="sname" id="sname" name="sname" /><br><br>
                    班级：<select class="update" id="claid" name="claid"></select>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" id="updateconfirm" class="btn btn-primary">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 模态框（Modal）添加 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加学生信息
                </h4>
            </div>
            <div class="modal-body">
                <form id="myform3" method="post">
                    学号：<input class="stuid" id="stuid" name="stuid" /><br><br>
                    姓名：<input class="sname" id="sname" name="sname" /><br><br>
                    班级：<select class="update" id="claid" name="claid"></select>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" id="addconfirm" class="btn btn-primary">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


</body>

</html>

<script>
    //页面加载完成时
    $(function () {
        query();
        queryCla();
    })

    //页面加载时查询班级信息，以下拉框的形式显示班级
    function queryCla(){
        $.ajax({
            url:"selectCla",
            type:"post",
            dataType:"json",
            success:function(data){
                for(var i=0;i<data.length;i++){
                    //option:value（提交到服务器），text(用户直观看到的)
                    var option="<option value="+data[i].claid+">"+data[i].claname+"</option>";
                    // $("#claid").append(option);
                    $(".modal-body .update").append(option);//修改页面
                    $(".modal-body .add").append(option);//添加页面
                }
            }

        });

    }

    function query(){
        $.ajax({
            url:"selectCust",
            type:"post",
            dataType:"json",
            success:function (data) {
                //每次加载之前请空表格的内容
                document.getElementById("mytbd").innerHTML="";
                for (var i=0;i<data.length;i++){
                    var tr="<tr>\n" +
                        "<td>"+data[i].customerNo+"</td>\n" +
                        "<td>"+data[i].contacts+"</td>\n" +
                        "<td>"+data[i].tel+"</td>\n" +
                        "<td>"+data[i].address+"</td>\n" +
                        "<td>"+data[i].email+"</td>\n" +
                        "<td>"+data[i].bank+"</td>\n" +
                        "<td>"+data[i].bankAccount+"</td>\n" +
                        "<td><div class='btn-group'>" +
                        "<button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown'>操作<span class='caret'></span></button>" +
                        "<ul class='dropdown-menu' role='menu'>" +
                        "<li><button class='btn btn-primary btn-danger' onclick='delStu("+data[i].id+")' type='button'>删除</button></li>" +
                        "<li class=\"divider\"></li>" +
                        "<li><button class='btn btn-primary btn-danger update' data-toggle='modal' data-target='#myModal'>修改</button></li>" +
                        "</ul>" +
                        "</div>" +
                        "</td>\n" +
                        // "<td><button class='btn btn-primary btn-lg' onclick='delStu("+data[i].stuid+")' type=\"button\">删除</button>&nbsp;&nbsp;" +
                        //     "<button class='btn btn-primary btn-lg update' data-toggle='modal' data-target='#myModal'>修改</button>&nbsp;&nbsp;"+"</td>\n" +
                        "</tr>";
                    $("#mytbd").append(tr);
                }
            }
        });
    }

    删除
    function delStu(val){
        $.ajax({
            url:"deleteStu",
            type:"post",
            data:{"id":val},
            dataType:"json",
            success:function (data) {
                query();
            }
        });

    }

    //添加学生
    // btn.onclick=function () {
    //     $.ajax({
    //         url:"addStu",
    //         type:"post",
    //         data:$("#myform").serialize(),//将表单序列化提交，将表单中的数据全部提交
    //         success:function (data) {
    //             query();
    //         }
    //     });
    // }

    //点击修改时需要将被点击行的数据填充到from中
    $("#mytbd").on("click",".update",function () {
        //节点
        alert($(this).parent().parent().parent().parent().parent().children(0).html());
        $(".stuid").val($(this).parent().parent().parent().parent().parent().find("td").eq(0).html());
        $(".sname").val($(this).parent().parent().parent().parent().parent().find("td").eq(1).html());
        // $(".stuid").val($(this).parent().parent().children(0).html());
        // $(".sname").val($(this).parent().parent().find("td").eq(1).html());
    });

    //点击确认修改按钮时，提交表单
    updateconfirm.onclick=function(){
        if(confirm("确认修改？")){
            $.ajax({
                url:"modifyStu",
                type:"post",
                data:$("#myform2").serialize(),//将表单序列化提交，将表单中的数据全部提交
                success:function (data) {
                    query();
                    $('#myModal').modal('hide')
                }
            });
        }
    }

    //点击确认添加按钮时，提交表单
    addconfirm.onclick=function(){
        if(confirm("确认修改？")){
            $.ajax({
                url:"addStu",
                type:"post",
                data:$("#myform3").serialize(),//将表单序列化提交，将表单中的数据全部提交
                success:function (data) {
                    query();
                    $('#myModal2').modal('hide')
                }
            });
        }
    }


</script>