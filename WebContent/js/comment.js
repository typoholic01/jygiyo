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
	var commentTr = $("tr."+target);	
	var comment = commentTr.find("input.comments");
	
	if (comment.attr("readonly") == "readonly") {
		comment.removeAttr("readonly");			
	} else {
		comment.attr("readonly","readonly");
		comment = commentTr.find("input.comments").val();
		
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
		var currentLocation = window.location;
		$("#view").load(currentLocation + '#view');
	}
}