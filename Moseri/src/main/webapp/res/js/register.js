var idck = 0;
$(function() {
    //idck 버튼을 클릭했을 때 
    $("#useremail").keyup(function() {
        
        //userid 를 param.
        var useremail =  $("#useremail").val(); 
        if(useremail!=null){
        	
        $.ajax({
            async: true,
            type : 'POST',
            data : useremail,
            url : "register_check",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.cnt > 0) {
                    
                    //alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                     $("#useremail").css("background-color", "#FFCECE");
                    
                
                } else {
                    //alert("사용가능한 아이디입니다.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                   
                   $("#useremail").css("background-color", "#B0F6AC");
                   
                    //아이디가 중복하지 않으면  idck = 1 
                    idck = 1;
                    
                }
            },
            error : function(error) {
                
                //alert("아이디 값을 입력하세요");
                idck = 0;
            }
        });
        }
    });
    
    
    $("#nick").keyup(function() {
        
        //userid 를 param.
        var usernick =  $("#nick").val(); 
        if(usernick!=null){
        	
        $.ajax({
            async: true,
            type : 'POST',
            data : usernick,
            url : "register_ncikcheck",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.cnt > 0) {
                    
                    //alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                     $("#nick").css("background-color", "#FFCECE");
                    
                
                } else {
                    //alert("사용가능한 아이디입니다.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                   
                   $("#nick").css("background-color", "#B0F6AC");
                   
                    //아이디가 중복하지 않으면  idck = 1 
                    idck = 1;
                    
                }
            },
            error : function(error) {
                
                //alert("닉네임값을 입력하세요");
                idck = 0;
            }
        });
        }
    });	
	
    
    
});

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