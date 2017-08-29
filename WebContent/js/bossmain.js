function deleteShop(seq_store) {
	console.log("seq_store: " + seq_store);
	
	$.ajax({ 
		type: 'POST',
		url:"../shop/delete", 
		data: 
		{
			"seq_store": seq_store
		},                
        error : function() {
        	alert('통신실패!!');
        },
        success : function(data) {
        	alert("폐점했습니다");
        }
	});
	var currentLocation = window.location;
	$("#view").load(currentLocation + '#view');
}