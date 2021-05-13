function setParentText() {
	opener.document.getElementById("join_form_univ").value = document.getElementById("univ").value;
	opener.document.getElementById("join_form_level").value = document.getElementById("level").value;
	opener.document.getElementById("join_form_level_toPrint").value = document.getElementById("level_toPrint").value;
	opener.document.getElementById("join_form_ID").value = document.getElementById("ID").value;
	opener.document.getElementById("join_form_u_ID").value = document.getElementById("userID").value;
	opener.document.getElementById("join_isChecked").value = document.getElementById("isChecked").value;
	
	window.close();
}