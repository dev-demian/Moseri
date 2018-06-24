$(document).ready(function() {
	$('#requester').on('click', function() {
		var url = location.href;
		var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
		var parameter = parameters[0].substring(11);
		console.log(parameter);
		var dataAll = {"no":parameter};
		$.ajax({
			url: "matchingGet",
			data: dataAll,
			type: "get",
			dataType: "json",
			success: function(json){
				var m = json.gosu_end;
				console.log(m);
				if(m == 0){
					alert("상대방 고수가 채팅 완료를 하지 않았습니다.");
					location.replace('');
				}else{
//					alert("review페이지로 이동");
				}
			},
			error: function() {
//				console.log("실패")
				alert("실패");
			},
		});
	});
});
