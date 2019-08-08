<%--  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/29
  Time: 14:42
  To change this template use File | Settings | File Templates.--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="http://localhost:8080/binladen/"></base>
    <title>Title</title>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<%--<form id="myRegister" method="post">--%>
    <%--员工号: <input type="text" name="empNo"><br>
    名字: <input type="text" name="name"><br>
    密码: <input type="text" name="password"><br>
    性别: <input type="text" name="sex"><br>
    身份证: <input type="text" name="idCard"><br>
    角色: <div class="radio">
    <label>
        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked> 选项 1
    </label>
</div>
    <div class="radio">
        <label>
            <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">选项 2 - 选择它将会取消选择选项 1
        </label>
    </div>
    手机号码: <input type="text" name="tel"><br>
    邮箱: <input type="text" name="email"><br>
    地址: <input type="text" name="address"><br>
    籍贯: <input type="text" name="nativePlace"><br>
    名族: <input type="text" name="national"><br>
    学历: <input type="text" name="educationBg"><br>
    毕业院校: <input type="text" name="school"><br>
    开户银行: <input type="text" name="bank"><br>
    银行卡号: <input type="text" name="bankAccount"><br>
    <button id="tore">添加</button>--%>
        <form class="layui-form" id="myRegister" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">员工号</label>
                <div class="layui-input-block">
                    <input type="text" id="empNo" name="empNo" lay-verify="title" autocomplete="off" placeholder="请输入员工号" class="layui-input" readonly>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">名字</label>
                <div class="layui-input-block">
                    <input type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入名字" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="password" name="password" lay-verify="title" autocomplete="off" placeholder="请输入密码" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="1" title="男" checked="">
                    <input type="radio" name="sex" value="0" title="女">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">身份证</label>
                <div class="layui-input-block">
                    <input type="text" name="idCard" lay-verify="title" autocomplete="off" placeholder="请输入身份证号" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">角色</label>
                <div class="layui-input-inline">
                    <select name="role" lay-verify="required" lay-search="" id="myoption">

                    </select>
                </div>
            </div>
            <div>　　</div>
            <div class="layui-form-item">
                <label class="layui-form-label">手机号码</label>
                <div class="layui-input-block">
                    <input type="text" name="tel" lay-verify="title" autocomplete="off" placeholder="请输入手机号码" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-block">
                    <input type="text" name="email" lay-verify="title" autocomplete="off" placeholder="请输入邮箱" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">地址</label>
                <div class="layui-input-block">
                    <input type="text" name="address" lay-verify="title" autocomplete="off" placeholder="请输入地址" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">籍贯</label>
                <div class="layui-input-block">
                    <input type="text" name="nativePlace" lay-verify="title" autocomplete="off" placeholder="请输入籍贯" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">名族</label>
                <div class="layui-input-block">
                    <input type="text" name="national" lay-verify="title" autocomplete="off" placeholder="请输入名族" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">学历</label>
                <div class="layui-input-block">
                    <input type="text" name="educationBg" lay-verify="title" autocomplete="off" placeholder="请输入学历" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">毕业院校</label>
                <div class="layui-input-block">
                    <input type="text" name="school" lay-verify="title" autocomplete="off" placeholder="请输入毕业院校" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">开户银行</label>
                <div class="layui-input-block">
                    <input type="text" name="bank" lay-verify="title" autocomplete="off" placeholder="请输入开户银行" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">银行卡号</label>
                <div class="layui-input-block">
                    <input type="text" name="bankAccount" lay-verify="title" autocomplete="off" placeholder="请输入银行卡号" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button id="tore" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>

        <script src="layui/layui.js" charset="utf-8"></script>
        <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
        <script>
            layui.use('form', function(){
                var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功

                //……

                //但是，如果你的HTML是动态生成的，自动渲染就会失效
                //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
                form.render();
            });
            /*增加userInfo*/
            tore.onclick=function(){
                $.ajax({
                    url:"emp/register",
                    type:"post",
                    dataType:"json",
                    data:$("#myRegister").serialize(),//将表单序列化提交，将表单中的数据全部提交
                    success: function (data) {
                        if (data == true) {
                            alert("增加成功");
                        } else {
                            alert("增加失败");
                        }
                    }
                });
            };
            $.ajax({
                url:"role/selectRole",
                type:"post",
                dataType:"json",
                success:function (data) {
                    for (var i=0;i<data.length;i++){
                        var option="<option value="+data[i].id+">"+data[i].roleName+"</option>"
                        $("#myoption").append(option);
                    }
                }
            })

            //在页面加载是时添加一个入库单好
            $(function () {
                $.ajax({
                    url: "emp/getEmpNo",
                    type: "post",
                    dataType: "text",
                    success: function (data) {
                        $("#empNo").val(data)
                    }

                })
            })


        </script>

</body>
</html>
