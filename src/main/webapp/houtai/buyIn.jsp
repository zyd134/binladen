<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<base>
<base href="http://localhost:8080/binladen/">
<title>采购</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<form role="form" class="form-inline">
    <div class="form-group">
        <label for="purNo">流水号</label>
        <input type="text" class="form-control" id="purNo" value="${purNo}" disabled="disabled">
    </div>
    <div class="form-group">
        <label for="explain">说明</label>
        <input type="text" class="form-control" id="explain" >
    </div>
    <div class="form-group">
        <label for="caigouperson">申请人</label>
        <input type="text" class="form-control" id="caigouperson" value="${emp.name}" empNo="${emp.empNo}" readonly>
    </div>
    <div class="form-group">
        <label for="caigoudept">申请部门</label>
        <input type="text" class="form-control" id="caigoudept" >
    </div>

    <div class="form-group">
        <label for="caigoudept">供应商</label>
        <select id="supplier" class="form-control">
            <option >请选择</option>
            <c:forEach var="sup" items="${supplierList}">
                <option value="${sup.supplierNo}">${sup.supplierName}</option>
            </c:forEach>
        </select>
    </div>

</form>
<button id="btn" class="btn btn-success btn-sm">添加商品</button><br><br>
<table  class="table">
    <thead>
    <tr>
        <th>商品编号</th>
        <th>商品名称</th>
        <th>商品类别</th>
        <th>规格型号</th>
        <th>计量单位</th>
        <th>进货价格</th>
        <th>数量</th>
        <th>库存总数</th>
        <th>小计(￥元)</th>
        <th>备注</th>
    </tr>
    </thead>
    <tbody id="mytbd">


    </tbody>

</table>
<button id="submit" class="btn btn-primary btn-sm">提交</button>

</body>
</html>
<script>
    var num=0;//区分到底是第几行
    //点击添加商品时
    $("#btn").click(function(){
        var tr="<tr>"
        tr+="<td></td>";
        tr+="<td><select class='goodsname'><option>--选择商品--</option></select></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td></td>";
        tr+="<td><input></td>";
        tr+="<td></td>";
        tr+="<td>0</td>";
        tr+="<td><button class='btn btn-danger btn-sm'>删除</button></td>";
        tr+="</tr>";
        //新增的tr追加到
        $("#mytbd").append(tr)
        getGoods();
    });


    //动态读取商品信息
    var goods;
    function getGoods(){
        $.ajax({
            url:"goods/selectGoods",
            contextType:"application/json",
            type:"post",
            dataType:"json",
            success:function(data) {
                goods=data;
                //清空下拉框中的子元素

                for (var i in data) {
                    var option = "<option value='" + data[i].goodNo + "'>" + data[i].goodName + "</option>";
                    $("#mytbd .goodsname").eq(num).append(option);//当前行只会影响，不会影响其他行

                }
                num++;//每添一行num自增1

            }
        })
    }
    //因为下拉框时动态生成的，所有不能直接使用change,B必须使用时间绑定
    //下拉框改变时，将对应的商品信息查询出来记载到对应的td中
    $("#mytbd").on("change",".goodsname",function(){
        //循环进行匹配
        for(var i in goods){
            if($(this).val()==goods[i].goodNo){
                //$(this).parent().prev().text();
                // $(this).parent().next().text(goodsinfo[i].typeName);
                $(this).parent().parent().children("td").eq(0).text(goods[i].goodNo);
                $(this).parent().parent().children("td").eq(2).text(goods[i].typeName);
                $(this).parent().parent().children("td").eq(3).text(goods[i].goodSpecs);
                $(this).parent().parent().children("td").eq(4).text(goods[i].unit);
                $(this).parent().parent().children("td").eq(5).text(goods[i].purchasePrice);
                $(this).parent().parent().children("td").eq(7).text(goods[i].acount);

            }

        }

    })

    //删除
    $("#mytbd").on("click",".btn",function(){
        if(confirm("是否删除?")) {
            $(this).parent().parent().remove();
            num--;
        }

    })

    //键盘抬起时，小计发生变化
    $("#mytbd").on("keyup","input",function(){
        var purchasePrice= $(this).parent().prev().text();
        var num= $(this).val();
        $(this).parent().next().next().text(purchasePrice*num);
    })

    //点击提交按钮时
    $("#submit").click(function () {
        var purNo=$("#purNo").val();
        var explain = $("#explain").val();//说明
        var applyperson=$("#caigouperson").attr("empNo");//采购人
        var applydept=$("#caigoudept").val();//申请部门
        var goodsarr=new Array();//采购商品的集合
        var purchasePrice=0;
        var supplier=$("#supplier").val();//供应商
        //获取所有的订单详情
        $("#mytbd tr").each(function () {
            //每一行都是一个对象
            var goods = new Object();
            goods.goodNo=$(this).children("td").eq(0).text();
            goods.goodAmount=$(this).find("input").val();
            goods.totalPrice=$(this).children("td").eq(8).text();
            purchasePrice+=parseInt(goods.totalPrice);
            goodsarr.push(goods);//将当前对象存放到数组中
        })
        var jsonstr={"purNo":purNo,"explain":explain,"applyperson":applyperson,"applydept":applydept,"purchasePrice":purchasePrice,"supplier":supplier,"goods":goodsarr}
        /*alert(JSON.stringify(jsonstr))*/

        $.ajax({
            url:"pur/purchaseGood",
            type:"post",
            data:JSON.stringify(jsonstr),
            contentType:"application/json;charset=UTF-8",
            accept:"/",
            success:function () {

                alert("订单生成成功")
            }
        });
    })

</script>