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
<form role="form" class="form-inline">
    <div class="form-group">
        <strong>仓库：</strong><select class='selectSto' id="selectSto"><option class="opt">--选择仓库--</option></select>
    </div>&nbsp;&nbsp;&nbsp;
    <div class="form-group">
        <label for="checker">操作员</label>
        <input type="text" class="form-control" id="checker" value="${emp.name}" readonly>
    </div>&nbsp;&nbsp;&nbsp;
    <div class="form-group">
        <label for="goodAmount">商品库存量</label>
        <input type="text" class="form-control" id="goodAmount" readonly >
    </div>&nbsp;&nbsp;&nbsp;
</form>

<table  class="table">
    <thead>
    <tr>
        <th>商品编号</th>
        <th>商品名称</th>
        <th>计量单位</th>
        <th>进货价格</th>
        <th>数量</th>
        <th>盘点数量</th>
        <th>损益总数量</th>
        <th>损益总金额</th>
    </tr>
    </thead>
    <tbody id="mytbd">


    </tbody>

</table>

</body>
</html>
<script>
    var num=0;//区分到底是第几行
    var acounts=0;
    $(function () {
        getStorages();
    })

    $(".form-inline").on('change',".selectSto",function(){
        var storageNo = $(this).val();
        alert(storageNo);
        $.ajax({
            url:"goods/selectStoGoods",
            type:"post",
            data:{"storageNo":storageNo},
            // dataType:"json",
            success:function(data) {
                for (var i in data) {
                    var tr="<tr>\n" +
                    "<td>"+data[i].goodNo+"</td>\n" +
                    "<td>"+data[i].goodName+"</td>\n" +
                    "<td>"+data[i].unit+"</td>\n" +
                    "<td>"+data[i].purchasePrice+"</td>\n" +
                    "<td>"+data[i].goodAmount+"</td>\n" +
                    "<td><input></td>\n" +
                    "<td></td>\n" +
                    "<td></td>\n" +
                    "</tr>\n"
                    acounts+=data[i].acount;
                    //新增的tr追加到
                    $("#mytbd").append(tr);
                }
                alert("acounts is "+acounts);
                $("#goodAmount").val(acounts);
            }
        })


        // getGoods();
    });

    //动态读取商品信息
    function getStorages(){
        $.ajax({
            url:"goods/selectSto",
            type:"post",
            dataType:"json",
            success:function(data) {
                //清空下拉框中的子元素
                for (var i in data) {
                    var option = "<option value='"+data[i].storageNo+"'>" + data[i].storageName + "</option>";
                    $("#selectSto").eq(num).append(option);
                     //$("#mytbd .selectSto").eq(num).append(option);//当前行只会影响，不会影响其他行

                }
                 num++;//每添一行num自增1

            }
        })
    }

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


    //键盘抬起时，小计发生变化
    $("#mytbd").on("keyup","input",function(){
        var purchasePrice= $(this).parent().prev().text();
        var goodAmount=$(this).parent().prev().text();
        var num= $(this).val();
        $(this).parent().next().text(goodAmount-num);
        $(this).parent().next().next().text(purchasePrice*num);
    })


</script>