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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>

<table class="table table-striped">
    <thead>
    <tr>
        <th>编号</th>
        <th>采购时间</th>
        <th>采购人</th>
        <th>申请部门</th>
        <th>申请人</th>
        <th>说明</th>
        <th>采购总价</th>
        <th>订单状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytbody">
    </tbody>
</table>
</body>
</html>
<script>
    $(function () {
        query();
    })
    var emp;
    var dic;
    function query() {
        $.ajax({
            url:"pro/selectDic",
            type:"post",
            dataType: "json",
            success:function (data) {
                for(var i=0;i<data.length;i++){
                    dic=data;
                }
            }
        })
        $.ajax({
            url: "pro/selectPro",
            type: "post",
            dataType: "json",
            success: function (data) {
                emp = data;
                document.getElementById("mytbody").innerHTML = "";
                for (var i = 0; i < data.length; i++) {
                    var tr = "<tr>\n" +
                        "    <td>" + data[i].procurementNo + "</td>\n" +
                        "    <td>" + data[i].purchaseTime + "</td>\n" +
                        "    <td>" + data[i].purchaserName + "</td>\n" +
                        "    <td>" + data[i].applyDepartment + "</td>\n" +
                        "    <td>" + data[i].applicant + "</td>\n" +
                        "    <td>" + data[i].p_explain + "</td>\n" +
                        "    <td>" + data[i].purchasePrice + "</td>\n" +
                        "    <td>" + data[i].valueName + "</td>\n";
                        tr+="<td><select name='status' class='form-control myoption' >";
                        tr+="<option selected=\"selected\">--请选择--</option>";
                            for (var j=0;j<3;j++) {
                                if(dic[j].valueId!=1){
                                    if(dic[j].valueName==data[i].valueName){
                                        tr+="<option value="+dic[j].valueId+" selected='selected'>"+dic[j].valueName+"</option>";
                                    }else{
                                        tr+="<option value="+dic[j].valueId+">"+dic[j].valueName+"</option>";
                                    }
                                }

                            }
                        tr+="</select></td>"
                        tr+="</tr>";
                    $("#mytbody").append(tr);
                }
            }

        })
    };
    $('#mytbody').on('change',".myoption",function(){
        var procurementNo=$(this).parent().parent().children("td").eq(0).text();
        var valueName=$(this).parent().parent().children("td").eq(7).text();
        var valueName2 = $(this).children("option:selected").text();
        var status = $(this).val();
        if(valueName==valueName2){
            alert("操作一样，请重新选择·");
            return;
        }
        if(valueName=='已通过'){
            alert("已经通过申请，请勿修改");
            return;
        }
        $.ajax({
            url: "pro/examineById",
            type: "post",
            dataType: "json",
            data:{"status":status,"procurementNo":procurementNo},
            success:function (data) {
                query();
            }
        })
    })

    btrole.onclick = function () {
        var a = $("#myrole").val();
        var b = 1;

        for (var i = 0; i < emp.length; i++) {
            if (emp[i].valueName == a) {
                if (b == 1) {
                    document.getElementById("mytbody").innerHTML = "";
                    b = 0;
                }
                var tr = "<tr>\n" +
                    "    <td>" + emp[i].procurementNo + "</td>\n" +
                    "    <td>" + emp[i].purchaseTime + "</td>\n" +
                    "    <td>" + emp[i].purchaserName + "</td>\n" +
                    "    <td>" + emp[i].applyDepartment + "</td>\n" +
                    "    <td>" + emp[i].applicant + "</td>\n" +
                    "    <td>" + emp[i].p_explain + "</td>\n" +
                    "    <td>" + emp[i].purchasePrice + "</td>\n" +
                    "    <td>" + emp[i].valueName + "</td>\n";
                    tr+="<td><select name='status' class='form-control myoption' >";
                    for (var j=0;j<3;j++) {
                        if(dic[j].valueName==emp[i].valueName){
                            tr+="<option value="+dic[j].valueId+" selected='selected'>"+dic[j].valueName+"</option>";
                        }else{
                            tr+="<option value="+dic[j].valueId+">"+dic[j].valueName+"</option>";
                        }
                    }
                    tr+="</select></td>";
                    tr+="</tr>";
                $("#mytbody").append(tr);
            }
        }
    };
</script>
