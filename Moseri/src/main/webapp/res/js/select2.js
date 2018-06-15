$(document).ready(function () {
    $("#top").on("change", function () {
        var choose = $("option:selected", this).attr("data-no");
        alert(choose);
        if (choose != $("#mid").children("option").attr("data-topno")) {
            $("#mid").children("option").eq(1).nextAll("option").remove();
            $("#bot").children("option").eq(1).nextAll("option").remove();
        }
        if ($(this).val() == "" || $(this).val() == "undefined") {
            $("#mid").children("option").eq(1).nextAll("option").remove();
            $("#bot").children("option").eq(1).nextAll("option").remove();
            return;
        }
        var dataAll = {
            "no": choose
        };
        $.ajax({
            url: "midList",
            data: dataAll,
            dataType: "json",
            type: "get",
            success: function (json) {
                console.log("mid성공");
                console.log(json);
                $.each(json, function (i) {
                    var data = "";
                    data += json[i].name + "/";
                    data += json[i].no;
                    var option = $("<option/>").text(data).val(json[i].name).attr("data-topno", json[i].topNo)
                        .attr("data-no", json[i].no);
                    $("#mid").append(option);
                });
            },
            error: function (err) {
                console.log("mid실패");
                console.log(err);
            },
        });
    });
    $("#mid").on("change", function () {
        var choose = $("option:selected", this).attr("data-no");
        alert(choose);
        if (choose != $("#bot").children("option").attr("data-midno")) {
            $("#bot").children("option").eq(1).nextAll("option").remove();
        }
        if ($(this).val() == "" || $(this).val() == "undefined") {
            $("#bot").children("option").eq(1).nextAll("option").remove();
            return;
        }
        var dataAll = {
            "no": choose
        };
        $.ajax({
            url: "botList",
            data: dataAll,
            dataType: "json",
            type: "get",
            success: function (json) {
                console.log("bot성공");
                console.log(json);
                $.each(json, function (i) {
                    var data = "";
                    data += json[i].name + "/";
                    data += json[i].no;
                    var option = $("<option/>").text(data).val(json[i].name).attr("data-midno", json[i].midNo)
                        .attr("data-no", json[i].no);
                    $("#bot").append(option);
                });
            },
            error: function (err) {
                console.log("bot실패");
                console.log(err);
            }
        });
    });
});