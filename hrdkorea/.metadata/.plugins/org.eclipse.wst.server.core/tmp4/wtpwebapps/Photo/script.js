function chkForm(){
	var f = document.frm; // form 태그
	
	if(f.title.value == '') {
		alert("제목을 입력해주세요");
		return false;
	}
	
		if(f.user_id.value == '') {
		alert("아이디을 입력해주세요");
		return false;
	}
	
	f.submit(); // 폼태그 전송
	
}

function chkDelete(board_no) {
	const result = confirm("삭제하시겠습니까?");
	
	if(result) {
		const url = location.origin; // http://localhost:8082
		location.href = url + "/board2/delete?board_no=" + board_no; // 페이지이동
	} else {
		return false;
	}
}