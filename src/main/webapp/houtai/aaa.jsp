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

            /*layui.use(['form', 'layedit', 'laydate'], function(){
                var form = layui.form
                    ,layer = layui.layer
                    ,layedit = layui.layedit
                    ,laydate = layui.laydate;

                //自定义验证规则
                form.verify({
                    title: function(value){
                        if(value.length < 5){
                            return '标题也太短了吧';
                        }
                    }
                    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
                    ,money: [
                        /^\d+\.\b\d{2}\b$/
                        ,'金额必须为小数保留两位'
                    ]
                });

                //日期
                laydate.render({
                    elem: '#date'
                });

                //初始赋值
                form.val('first', {
                    'title': '测试'
                    ,'phone': 11111111111
                    ,'email': 'xu@sentsin.com'
                    ,'password': 123123
                    //,'quiz': 2
                    ,'interest': 3
                    ,'like[write]': true
                    //,'open': false
                    ,'sex': '男'
                    ,'desc': 'form 是我们非常看重的一块'
                    ,xxxxxxxxx: 123
                });


                //事件监听
                form.on('select', function(data){
                    console.log('select: ', this, data);
                });

                form.on('select(quiz)', function(data){
                    console.log('select.quiz：', this, data);
                });

                form.on('select(interest)', function(data){
                    console.log('select.interest: ', this, data);
                });



                form.on('checkbox', function(data){
                    console.log(this.checked, data.elem.checked);
                });

                form.on('switch', function(data){
                    console.log(data);
                });

                form.on('radio', function(data){
                    console.log(data);
                });

                //监听提交
                form.on('submit(*)', function(data){
                    console.log(data)
                    alert(JSON.stringify(data.field));
                    return false;
                });

            });*/

        </script>

</body>
</html>
