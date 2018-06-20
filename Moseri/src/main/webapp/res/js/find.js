$(document).ready(function () {
    $(".profile-btn").css("display", "none");
    $(".search-btn>button").on("click", function () {
        if ($("#bot").val() == "" || $("#info-address").val() == "") {
            alert("소분류와 주소를 선택하세요.");
            return;
        }
        $(".btn-wrap").css("min-height", "152px");
        $(".load").css("display", "block").delay(2000).fadeOut(300);
        $(".profile-btn").delay(3000).fadeIn(300);
        var dataAll = {
            "bot": $("#bot").val(),
            "addr": $("#info-address").val()
        };
        if (dataAll.addr != $(".profile-btn").attr("data-addr") || dataAll.bot != $(".profile-btn").attr("data-bot")) {
            $(".profile-btn").remove();
        }
        $.ajax({
            url: "profileList",
            data: dataAll,
            type: "get",
            dataType: "json",
            success: function (json) {
                console.log("성공");
                console.log(json);
                $.each(json, function (i) {
                    //닉네임주입
                    var data = "";
                    data += json[i].nick;

                    //누르면 이동할 프로필의 url
                    var url = "profile?no=" + json[i].no;

                    //profile(div)append추가
                    var addr = $("#info-address").val().substring(0,6);
                    var div_btn = $("<div class='profile-btn'/>").attr("data-bot",$("#bot").val()).attr("data-addr",addr);
                    var div_img = $("<div class='profile-img'/>");
                    var div_nick = $("<div/>").text(data);
                    var link = $("<a/>").text(url).attr("href", url).attr("target", "_blank");

                    div_btn.append(div_img);
                    div_btn.append(div_nick);
                    div_btn.append(link);
                    $(".right>.btn-wrap").append(div_btn);
                });
            },
            error: function (err) {
                console.log("실패");
                console.log(err);
            },
        });
    });
});