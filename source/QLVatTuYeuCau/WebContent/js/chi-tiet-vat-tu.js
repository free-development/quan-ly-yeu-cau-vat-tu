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
		function preAddVatTu(formId, check){
			var vtMa = $('input:text[name=vtMa]').val();
			var vtMa = $('input:text[name=vtTen]').val();
			var vtMa = $('select[name=dvt]').val();
			//alert(vtMa);
				$.ajax({
					url: "/QLVatTuYeuCau/preAddVatTu.html",
					type: "GET",
					dataType: "JSON",
					data: {"vtMa": vtMa},
					contentType: "application/json",
					mimeType: "application/json",
					
					success: function(ctvt){
						$('input:text[name=vtMa]').val(ctvt.vtMa);
						$('input:text[name=vtTen]').val(ctvt.vtTen);
						$('select[name=dvt]').val(ctvt.dvt);
						$('input:text[name=dinhMuc]').val(ctvt.dinhMuc);
					  	$('input:text[name=soLuongTon]').val(ctvt.soLuongTon);
					  	
					  	showForm(formId, check);
					}
					
				});
		}
		function addCTVattu() {
 			vtMa = $('#add-chitiet input:text[name=vtMa]').val();
 			vtTen = $('#add-chitiet input:text[name=vtTen]').val();
 			dvt = $('#add-chitiet select[name=dvt]').val();
 			dvt = $('#add-chitiet select[name=dvt]').val();
 			dinhMuc = $('#add-chitiet input:text[name=vtTen]').val();
 			soLuongTon = $('#add-chitiet input:text[name=vtTen]').val();
 			if(dinhMuc == '') {
 				$('#requireDM').html('Vui lòng nhập định mức');
 			}
 			else {

 			$.ajax({
 				url: "/QLVatTuYeuCau/addVattu.html",	
			  	type: "GET",
 			  	dateType: "JSON",
 			  	data: { "vtMa": vtMa, "vtTen": vtTen, "dvt": dvt},
 			  	contentType: 'application/json',
 			    mimeType: 'application/json',
			  	
 			  	success: function(result) {
			  		if(result == "success")
	 				{
					$('#view-table-vat-tu table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"vtMa\" value=\"' +vtMa + '\"</td><td class=\"col\">'+ vtMa +'</td><td class=\"col\">' + vtTen+'</td></tr>');
			  		$('#add-form input:text[name=vtMa]').val('');
					$('#add-form input:text[name=vtTen]').val('');
					$('#add-form select[name=dvt]').val('');
			  		showForm("add-form", false);	
			  		alert("Vai trò "+vtMa + " đã được thêm ");	
				}
		  		else{
		  			alert("Vai trò "+vtMa + " đã tồn tại ");
		  		}
			  	
 			  	}
 			});
 			}
 		}
		function preEditCTVattu(formId, check){
			vtMa = $('input:checkbox[name=vtMa]:checked').val();
			//alert(vtMa);
				$.ajax({
					url: "/QLVatTuYeuCau/preEditVattu.html",
					type: "GET",
					dataType: "JSON",
					data: {"vtMa": vtMa},
					contentType: "application/json",
					mimeType: "application/json",
					
					success: function(vt){
						
						$('input:text[name=vtMaUpdate]').val(vt.vtMa);
					  	$('input:text[name=vtTenUpdate]').val(vt.vtTen);
						$('select[name=dvtUpdate]').val(vt.dvt);
					  	
					  	showForm(formId, check);
					}
					
				});
		}

		function confirmUpdateCTVattu(){
			var vtMaUpdate = $('input:text[name=vtMaUpdate]').val();
			var vtTenUpdate = $('input:text[name=vtTenUpdate]').val();
			var dvtUpdate = $('select[name=dvtUpdate]').val();
			if (confirm('Bạn có chắc thay đổi vật tư có mã ' + vtMaUpdate))
				updateVattu(vtMaUpdate, vtTenUpdate, dvtUpdate);
		}
 		function updateVattu(vtMaUpdate, vtTenUpdate, dvtUpdate){
 			$.ajax({
				url: "/QLVatTuYeuCau/updateVattu.html",	
			  	type: "GET",
			  	dateType: "JSON",
			  	data: { "vtMaUpdate": vtMaUpdate, "vtTenUpdate": vtTenUpdate},
			  	contentType: 'application/json',
			    mimeType: 'application/json',
				  	
				  	success: function(vt) {
				  		$('table tr').has('input[name="vtMa"]:checked').remove();
				  		$('#view-table table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"vtMa\" value=\"' +vtMaUpdate + '\"</td><td class=\"col\">'+ vtMaUpdate +'</td><td class=\"col\">' + vtTenUpdate+'</td></tr>');
				  		$('input:text[name=vtMaUpdate]').val('');
				 
						vtTenUpdate = $('input:text[name=vtTenUpdate]').val('');
						dvtUpdate = $('select[name=dvtUpdate]').val('');
				  		showForm("update-form", false);	
				  	}
				});
 	}
 	function confirmDeleteCTVT(){
 		vtMa = $('input:checkbox[name=vtMa]:checked').val();
 		if (confirm('Bạn có chắc xóa ' + vtMa))
 			deleteCTVattu(vtMa);
 	}
	
  	 function deleteCTVattu(vtMa) {
		 
 		$.ajax({
 			url: "/QLVatTuYeuCau/deleteVattu.html",	
 		  	type: "GET",
 		  	dateType: "JSON",
 		  	data: { "vtMa": vtMa},
 		  	contentType: 'application/json',
 		    mimeType: 'application/json',
 		    
 		    
 		  	success: function() {
 		  		alert(vtMa + "da bi xoa");
				$('#view-table-vat-tu table tr').has('input[name="vtMa"]:checked').remove();
 		    } 
 		});  
 	}

  	function changeCTVtMa(){
  		$('#requireVtMa').html('');
  		$('#add-form input:text[name=vtMa]').focus();
 	} 	
