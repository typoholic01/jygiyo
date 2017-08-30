function insertComment() {
	var form = document.getElementById('insertComment');

	var formData = new FormData(form);
	
	// Display the key/value pairs
	for(var pair of formData.entries()) {
	   console.log(pair[0]+ ', '+ pair[1]); 
	}
	
	$.ajax({ 
		type: 'POST',
		url:"../shop/bbs/comment/insert", 
		data: formData,                
		processData: false,
    	contentType: false,
        error : function() {
          alert('통신실패!!');
        },
        success : function(data) {
        }
	});
	var currentLocation = window.location;
	$("#view").load(currentLocation + '#view');
}
function insertReply(target) {
	var params = $("#"+target).serialize();
	console.log(params);
	
	$.ajax({ 
		type : "GET",
		url:"../shop/bbs/reply/insert",
		data:params,
        dataType: 'html',
        error : function() {
          alert('통신실패!!'); 
        },
        success : function(data) {
        }
	});
	var currentLocation = window.location;
	$("#view").load(currentLocation + '#view');
}
function deleteComment(target) {
	var params = $("#"+target).serialize();
	console.log(params);
	
	$.ajax({ 
		type : "GET",
		url:"../shop/bbs/comment/delete",
		data:params,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
        dataType: 'html',
        error : function() {
          alert('통신실패!!');
        },
        success : function(data) {
        }
	});
	var currentLocation = window.location;
	$("#view").load(currentLocation + '#view');
}
function modifyComment(target) {
	//타겟 정보를 가져온다
	var inputDiv = $("div."+target);
	
	var comment = inputDiv.find("#wr_content").val();
		
	$.ajax({ 
		type : "GET",
		url:"../shop/bbs/comment/modify",
		data: 
			{
				"seq_bbs" : target,
				"comments" : comment
			},				
        error : function() {
          alert('통신실패!!');
        },
        success : function(data) {
        }
	});
	
//	화면 갱신
	var currentLocation = window.location;
	$("#view").load(currentLocation + '#view');
}

/**********************
 * 
 * 수정, 댓글 CSS 조작 JS
 * 
 **********************/
function showModifyView(target) {
	//타겟 정보를 가져온다
	var inputDiv = $("div."+target);
	inputDiv.find("#btn_modify").css("display", "inline");
	inputDiv.find("#btn_reply").css("display", "none");
	
	if (inputDiv.css("display") == "none") {
		inputDiv.css("display", "inline");
		var text = $("div.comments"+target).text();
		inputDiv.find("#wr_content").val(text);		
	} else {
		inputDiv.css("display", "none");
	}
}

function showReplyView(target) {
	//타겟 정보를 가져온다
	var inputDiv = $("div."+target);
	inputDiv.find("#wr_content").val("");
	inputDiv.find("#btn_modify").css("display", "none");
	inputDiv.find("#btn_reply").css("display", "inline");
	
	if (inputDiv.css("display") == "none") {
		inputDiv.css("display", "inline");
		
	} else {
		inputDiv.css("display", "none");
	}
}
