function getBbsList() {
	var seq_store = $("#seq_store").val();
	
	$.ajax({ 
		type : "GET",
		url:"../comment/list",
		data:"seq="+seq_store,
        error : function() {
          alert('통신실패!!');
        },
        success : function(data) {
          $('#view').html(data);
        }
	});
}
function insertComment() {
	var seq_store = $("#seq_store").val();
	var comment_id = $("#comment_id").val();
	var comments = $("#comments").val();
	
	$.ajax({ 
		type : "GET",
		url:"../comment/insert",
		data:"seq_store="+seq_store
		+"&comment_id="+comment_id
		+"&comments="+comments,
        error : function() {
          alert('통신실패!!');
        },
        success : function(data) {
        }
	});
	
	getBbsList();
}
function insertReply(target) {
	var params = $("#"+target).serialize();
	console.log(params);
	
	$.ajax({ 
		type : "GET",
		url:"../shop/bbs/reply/insert",
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