$(document).ready(function(){ // html이 로드되면 실행됨  
  	$(":button").click(searchProfessor); // : - 모든 <button> 선택
});

function searchProfessor() {
	var searchText = $("#searchText").val();
	$("tbody").children().remove();
	
	$.ajax({
	 	type: "GET",
		url: "/reservation/searchProfessor.jsp?searchText=" + searchText,
		dataType: "text",
		success: updatePage,
		error: function(jqXHR, textStatus, errorThrown) {
			var message = jqXHR.getResponseHeader("Status");
			if ((message == null) || (message.length <= 0)) {
				alert("Error! Request status is " + jqXHR.status);
			} else {
				alert(message);	
			}
		}
	});
}

function updatePage(responseText) {
	// alert("profs: " + responseText);
	var profs = JSON.parse(responseText);
	
	if (jQuery.isEmptyObject(profs)) {
		alert("검색 결과가 없습니다.");
	}
	
	Array.from(profs).forEach(function(prof, idx){
		var name = prof.name;
		var major = prof.major;
		
		var newTrElement = document.createElement("tr");
	
		var newNameTdElement = document.createElement("td");
		newNameTdElement.innerHTML = name;
		
		var newMajorTdElement = document.createElement("td");
		newMajorTdElement.innerHTML = major;
		
		var newInfoTdElement = document.createElement("td");
		$(newInfoTdElement).addClass("profInfo");
		var newInfoAElement = document.createElement("a");
		newInfoAElement.innerHTML = "정보보기";
		$(newInfoTdElement).append(newInfoAElement);
		
		var newSelectTdElement = document.createElement("td");
		$(newSelectTdElement).addClass("selectProf");
		var newSelectAElement = document.createElement("a");
		newSelectAElement.innerHTML = "선택하기";
		$(newSelectTdElement).append(newSelectAElement);
	
		$(newTrElement).append(newNameTdElement);
		$(newTrElement).append(newMajorTdElement);
		$(newTrElement).append(newInfoTdElement);
		$(newTrElement).append(newSelectTdElement);
		
		$("tbody").append(newTrElement);
	});
}