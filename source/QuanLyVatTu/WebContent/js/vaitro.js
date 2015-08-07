function update(formId, check){
	vtId = $('input:checkbox[name=vtId]:checked').val();
		$.ajax({
			url: "/QuanLyVatTu/preEditVt.html",
			type: "GET",
			dataType: "JSON",
			data: {"vtId": vtId},
			contentType: "application/json",
			mimeType: "application/json",
			
			success: function(vt){
				$('input:text[name=vtIdUpdate]').val(vt.vtId);
			  	$('input:text[name=vtTenUpdate]').val(vt.vtTen);
			  	
			  	showForm(formId, check);
			}
		});
}
		function confirmDelete(){
			vtId = $('input:checkbox[name=vtId]:checked').val();
			if (confirm('Bạn có chắc xóa' + vtId))
				deleteVt(vtId);
		}
		 function deleteVt(vtId) {
			 
				$.ajax({
					url: "/QuanLyVatTu/deleteVt.html",	
				  	type: "GET",
				  	dateType: "JSON",
				  	data: { "nsxMa": vtId},
				  	contentType: 'application/json',
				    mimeType: 'application/json',
				  	success: function() {
					  	alert(vtId + "da bi xoa");
								$('table tr').has('input[name="vtId"]:checked').remove();
				    } 
				});
}
