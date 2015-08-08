/**
 * 
 */
function showForm(formId, check){
			if (check)
				document.getElementById(formId).style.display="block";
			else document.getElementById(formId).style.display="none";
			var f = document.getElementById('main-form'), s, opacity;
			s = f.style;
			opacity = check? '10' : '100';
			s.opacity = s.MozOpacity = s.KhtmlOpacity = opacity/100;
			s.filter = 'alpha(opacity='+opacity+')';
			for(var i=0; i<f.length; i++) f[i].disabled = check;
		}
function update(formId, check){
//	vtId = $('input:checkbox[name=vtId]:checked').val();
	alert('ádfgh');
		/*$.ajax({
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
		});*/
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
				  	data: { "vtId": vtId},
				  	contentType: 'application/json',
				    mimeType: 'application/json',
				  	success: function() {
					  	alert(vtId + "da bi xoa");
								$('table tr').has('input[name="vtId"]:checked').remove();
				    } 
				});
		 }
		 	function updateVt(vtIdUpdate, vtTenUpdate) {

				$.ajax({
					url: "/QuanLyVatTu/updateVt.html",	
				  	type: "GET",
				  	dateType: "JSON",
				  	data: { "vtIdUpdate": vtIdUpdate, "vtTenUpdate": vtTenUpdate},
				  	contentType: 'application/json',
				    mimeType: 'application/json',
				  	
				  	success: function(vt) {
				  		$('table tr').has('input[name="vtId"]:checked').remove();
				  		$('#view-table table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"vtId\" value=\"' +vtIdUpdate + '\"</td><td class=\"col\">'+ vtIdUpdate +'</td><td class=\"col\">' + vtTenUpdate+'</td></tr>');
				  		$('input:text[name=vtIdUpdate]').val('');
						vtTenUpdate = $('input:text[name=vtTenUpdate]').val('');
				  		showForm("update-form", false);	
				  	}
				});
			}
	 		