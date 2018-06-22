$(document).ready(function(){
	$("#key-search>input").on("keyup",function(){
		$(this).on("click",function(){
			$(".key-word").toggle();
		});
		$(".key-word").css("display","block");
		if($(this).val() == ""){
			$(".key-word").css("display","none");
			return false;
		}
		if($(".search-item").attr("data-no") === $(".search-item").attr("data-no")){
			$(".search-item").remove();
		}
		var text = $(this).val();
		var dataAll = {"text":text};
		console.log(text);
		$.ajax({
			url:"botListText",
			data:dataAll,
			type:"get",
			dataType:"json",
			success:function(json){
				console.log("성공");
				console.log(json);
				$.each(json,function(i){
					var data = "";
					data += json[i].name;
					var ul = $(".key-word>ul");
					var li = $("<li class='search-item'/>").attr("data-no",json[i].no);
					var a = $("<a href='#'/>").text(data).attr("onclick","return false");
					li.append(a);
					ul.append(li);
					a.on("click",function(){
						var no = a.parents("li").attr("data-no");
						$("#key-search>input").val(a.text());
						$(".key-word").toggle();
						$(this).parents(".key-word").siblings("span")
						.children("button").attr("onclick","location.href="+"'"+"writeRequest?categoryno="+no+"'");
					});
				});
			},
			error:function(err){
				console.log("실패");
				console.log(err);
			},
		});
	});
});