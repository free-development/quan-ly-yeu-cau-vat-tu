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
		function addVattu() {
 			vtMa = $('#add-form input:text[name=vtMa]').val();
 			vtTen = $('#add-form input:text[name=vtTen]').val();
 			dvt = $('#add-form select[name=dvt]').val();
 			if(vtMa == '') {
 				$('#requireVtMa').html('Vui lòng nhập mã vật tư');
 			}
 			else if (vtTen == '')
	 			{
	 				$('#requireVtTen').html('Vui lòng nhập tên vật tư');
	 			}
 			else if(dvt == '')
 				{
 					$('#requireDvt').html('Vui lòng chọn đơn vị tính');
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
		function preEditVattu(formId, check){
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

		function confirmUpdateVattu(){
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
 	function confirmDeleteVT(){
 		vtMa = $('input:checkbox[name=vtMa]:checked').val();
 		if (confirm('Bạn có chắc xóa ' + vtMa))
 			deleteVattu(vtMa);
 	}
	
  	 function deleteVattu(vtMa) {
		 
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
  	function showChiTiet(formId, check, vtMa){  
  		$.ajax({
  			url: "/QLVatTuYeuCau/showCTVatTu.html",
			type: "GET",
		  	dateType: "JSON",
		  	data: {"vtMa": vtMa},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
			
			success: function(listCTVatTu){
				alert("ok");
				$('#view-table-chi-tiet table .rowContent').remove();
				for(i = 0;i < listCTVatTu.length; i++ ) { 

				$('#view-table-chi-tiet table tr:first').after("<tr class=\"rowContent\"><td class=\"left-column\"><input type=\"checkbox\" name=\"vtMa\" value=\""
						+ listCTVatTu[i].vatTu.vtMa + "\" id=\"checkbox\"></td>"
						+"<td class=\"col\">" +listCTVatTu[i].vatTu.vtMa+ "</td>"
						+"<td class=\"col\">" +listCTVatTu[i].vatTu.vtTen+ "</td>"
						+"<td class=\"col\">" +listCTVatTu[i].noiSanXuat.nsxTen+ "</td>"
						+"<td class=\"col\">" +listCTVatTu[i].chatLuong.clTen+ "</td>"
						+"<td class=\"col\">" +listCTVatTu[i].vatTu.dvt+ "</td>"
						+"<td class=\"col\">" +listCTVatTu[i].dinhMuc+ "</td>"
						+"<td class=\"col\">" +listCTVatTu[i].soLuongTon+ "</td></tr>");
				}
			  	showForm(formId, check);
			}
  		});
  	}
  	function clickMe() {
  		
  		vtMa = $('label[name=text]').val();
  		alert(vtMa);
// 		if (confirm('Bạn có chắc xóa ' + vtMa))
// 			deleteVattu(vtMa);
  	} 
  	function changeVtMa(){
  		$('#requireVtMa').html('');
  		$('#add-form input:text[name=vtMa]').focus();
 	} 	
