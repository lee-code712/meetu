var rpp = 5; // 한 화면에 나타낼 데이터 수
var page_cnt = 5; // 한 화면에 나타낼 페이지 수
var total_data;

$(document).ready(function() { // html이 로드되면 실행됨
	total_data = getTotalData();
  	paging(total_data, rpp, page_cnt, 1);
});

function paging(total_data, rpp, page_cnt, current_page) {
	$('#paging').children().remove();
   
    var total_page = Math.ceil(total_data / rpp); // 총 페이지 수
    var page_group = Math.ceil(current_page / page_cnt); // 페이지 그룹
    
    var last = page_group * page_cnt; // 화면에 보여질 마지막 페이지 번호
    if(last > total_page)
        last = total_page;
    var first = last - (page_cnt - 1); // 화면에 보여질 첫번째 페이지 번호
    if (page_cnt > last)
    	first = 1;
    var next = last + 1;
    var prev = first - 1;

    var $pinging_view = $("#paging");
    
    var temp_html = "";
    
    if(prev > 0)
    	temp_html += "<a href=\"#\" class=\"bt\" id=\"prev\">이전</a>";
    
    for(var i = first; i <= last; i++) {
    	if (i == current_page) {
    		temp_html += "<a class=\"num\" id=\"" + i + "\">" + i + "</a>";
    	}
    	else {
    		temp_html += "<a class=\"c_num\" id=\"" + i + "\">" + i + "</a>";
    	}
    }
    
    if(last < total_page)
    	temp_html += "<a href=\"#\" class=\"bt\" id=\"next\">다음</a>";
    
    $("#paging").append(temp_html); // 페이지 목록 생성
                                       
    $("#paging a").click(function() {
        
        var $item = $(this);
        var $id = $item.attr("id");
        var selected_page = $item.text();
        
        if($id == "next")    
        	selected_page = next;
        if($id == "prev")    
        	selected_page = prev;
        
        paging(total_data, rpp, page_cnt, selected_page);
    });
    
    getNotices();
}

function getNotices() {
	$('#noticeList').children().remove();
	
	var option = $('#noticeNav').val();
	var keyword = $('#searchText').val();
	var data = {"option":option, "keyword":keyword};
	
	$.ajax({
	 	type: "POST",
		url: "/notice/getNotices.jsp",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data: data,
		dataType: "text",
		success: updateNotices,
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

function updateNotices(responseText) {
	var notices = JSON.parse(responseText);
	
	var current_page = parseInt($('.num').text());

	var start_no = 0; // 현재 페이지에 나타낼 데이터의 시작 인덱스
	for (var i = 0; i < current_page - 1; i++) {
		start_no += rpp;
	}
	
	var last_no; // 현재 페이지에 나타낼 데이터의 마지막 인덱스
	if (total_data - start_no == 0) {
		last_no = start_no + 1;	
	}
	else if (total_data - start_no < rpp) {
		last_no = total_data;	
	}
	else {
		last_no = start_no + rpp;
	}
	
	for(var key in notices) {
		var idx = Number(key) + 1;
		var no = notices[key].no;
		var notice_id = notices[key].notice_id;
		var title = notices[key].title;
		var write_date = notices[key].write_date;
		write_date = write_date.substring(0, 10);
		var views = notices[key].views;
		
		if(idx >= start_no + 1 && idx <= last_no) {
			var temp_html = '';
			
			temp_html += "<tr id=\"boardList\" onclick=\"location.href='noticeContentPage.do?no=" + notice_id + "'\">";
			temp_html += "<td>" + no + "</td> <td>" + title + "</td> <td>MEETU 관리자</td>";
			temp_html += "<td>" + write_date + "</td> <td>" + views + "</td>";
			temp_html += "</tr>";

			$('#noticeList').append(temp_html);
		}
		
	}
}

function searchNotices() {
	total_data = getTotalData();
	paging(total_data, rpp, page_cnt, 1);
}

function getTotalData() {
	var option = $('#noticeNav').val();
	var keyword = $('#searchText').val();
	var data = {"option":option, "keyword":keyword};
	var size;
	
	$.ajax({
	 	type: "POST",
		url: "/notice/getNoticesCount.jsp",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data: data,
		dataType: "text",
		async: false,
		success: function(response) {
			size = response;
		},
		error: function(jqXHR, textStatus, errorThrown) {
			var message = jqXHR.getResponseHeader("Status");
			if ((message == null) || (message.length <= 0)) {
				alert("Error! Request status is " + jqXHR.status);
			} else {
				alert(message);	
			}
		}
	});
	
	return size;
} 

//알림 내역 확인
function readNewAlerts() {
	window.open("alert.do", "childform", "width=400; height=260; left=400; top=180; resizable = no;");
	$("#noticeCount").text(0);
}

//알림 내역에서 클릭한 바로가기 페이지 url로 이동
window.movePage = function(url) {
	location.href = url;
}