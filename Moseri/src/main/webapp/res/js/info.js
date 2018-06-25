



function check() {
	/* if( $(#useremail).val()=='' || $(#pwd).val()=='' || $(#nick).val()=='' || $(#phone).val()=='' || $(#addr).val()==''){
		alert("전부 다 입력하지 않았습니다");
		idck=0;
	} */
	 // 공통입력폼내의 모든 입력오브젝트
    var inputObjs = $(".commonForm input");
    // 미입력여부(경우에 따라 사용)
    var bEmpty = true;
    var focus;
 	
    // 각 오브젝트에 대해 입력체크
    inputObjs.each(function(index) {
        if ($(this).val() == '') {
            focus = $(this);
            bEmpty = false;
 
            alert($(this).attr('title'));
            focus.focus();
 
            // 여기서는 each문을 탈출
            idck =0;
            return false;
        }
    });
 
    // 필수입력사항에 누락이 있으면 진행금지
    if (!bEmpty) return false;
 
    
	
	if(idck==0){
		
		alert("올바르지 않은 값을 입력하셨습니다");
		return false;
	}else{
		return true;

	}
			
	
} 