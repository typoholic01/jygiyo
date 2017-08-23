function insertComment() {
	var form = $("#insertComment");
	var formData = new FormData(form);
	
	//TODO 폼 데이터가 넘어오지 않고 있다
	alert(formData.get('seq_store'));
	
	/*$.ajax({ 
		type : "GET",
		url:"../shop/bbs/comment/insert", 
		processData: false,
        contentType: false,
		type: 'POST',
		data:formData,
        error : function() {
          alert('통신실패!!');
        },
        success : function(data) {
        }
	});
	
	getBbsList();*/
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