$(document).ready(function(){ // html이 로드되면 실행됨  
  	$(":button").click(searchProfessor); // : - 모든 <button> 선택
});

function searchProfessor() {
	var searchText = $("#searchText").val();
	
	$.ajax({
	 	type: "GET",
		url: "searchProfessor.jsp?searchText=" + searchText,
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
	alert("profs: " + JSON.stringify(responseText));
	var profs = JSON.parse(JSON.stringify(responseText));
	
	Array.from(profs).forEach(function(prof, idx){
		var name = prof.name;
		var major = prof.major;
		
		var newTrElement = "<tr></tr>";
		
		var newNameTdElement = "<td></td>";
		$(newNameTdElement).text(name);
		
		var newMajorTdElement = "<td></td>";
		$(newMajorTdElement).text(major);
		
		var newInfoTdElement = "<td></td>";
		$(newInfoTdElement).addClass("profInfo");
		var newInfoAElement = "<a></a>";
		$(newInfoAElement).text("정보보기");
		$(newInfoTdElement).append(newInfoAElement);
		
		var newSelectTdElement = "<td></td>";
		$(newSelectTdElement).addClass("selectProf");
		var newSelectAElement = "<a></a>";
		$(newSelectAElement).text("선택하기");
		$(newSelectTdElement).append(newSelectAElement);
	
		$(newTrElement).append(newNameTdElement);
		$(newTrElement).append(newMajorTdElement);
		$(newTrElement).append(newInfoTdElement);
		$(newTrElement).append(newSelectTdElement);
		
		$("tbody").append(newTrElement);
	});
}