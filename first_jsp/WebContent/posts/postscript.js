function createpost(){
	if(document.postform.name.value == ""){
		alert("이름을 입력하세요");
		document.postform.name.focus();
		return;
	}
	if(document.postform.passwd.value == ""){
		alert("비밀번호를 입력하세요");
		document.postform.passwd.focus();
		return;
	}
	document.postform.menu.value = "create";
	document.postform.submit();
}

function editpost(){
	if(document.postform.name.value == ""){
		alert("이름을 입력하세요");
		document.postform.name.focus();
		return;
	}
	if(document.postform.passwd.value == ""){
		alert("비밀번호를 입력하세요");
		document.postform.passwd.focus();
		return;
	}
	
	document.postform.menu.value = "edit";
	document.postform.submit();
}

function deletepost(){
	if(document.postform.name.value == ""){
		alert("이름을 입력하세요");
		document.postform.name.focus();
		return;
	}
	if(document.postform.passwd.value == ""){
		alert("비밀번호를 입력하세요");
		document.postform.passwd.focus();
		return;
	}
	
	ok = confirm("삭제하시겠습니까");
	if(ok){
		document.postform.menu.value="delete";
		document.postform.submit();
	}else{
		return;
	}
}