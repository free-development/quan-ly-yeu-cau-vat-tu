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

		function preAddCTVatTu(formId, check){
			var vtMa = $('#add-chitiet input:text[name=vtMa]').val();
			
			if(vtMa != null){
				showForm(formId,check);
			}
		}
		function addCTVattu() {
 			vtMa = $('#add-chitiet input:text[name=vtMa]').val();
 			vtTen = $('#add-chitiet input:text[name=vtTen]').val();
 			dvt = $('#add-chitiet input:text[name=dvt]').val();
 			noiSanXuat = $('#add-chitiet select[name=noiSanXuat]').val();
 			chatLuong = $('#add-chitiet select[name=chatLuong]').val();
 			dinhMuc = $('#add-chitiet input[name=dinhMuc]').val();
 			soLuongTon = $('#add-chitiet input[name=soLuongTon]').val();
 			if(dinhMuc == '') {
 				$('#requireDM').html('Vui lòng nhập định mức');
 			}
 			else if(noiSanXuat == '') {
 				$('#requireNsx').html('Vui lòng chọn nơi sản xuất');
 			}
 			else if(chatLuong == '') {
 				$('#requireCl').html('Vui lòng chọn chất lượng');
 			}
 			else if(soLuongTon == '') {
 				$('#requireSl').html('Vui lòng nhập số lượng');
 			}
 			
 			else {

 			$.ajax({
 				url: "/QLVatTuYeuCau/addCTVattu.html",	
			  	type: "GET",
 			  	dateType: "JSON",
 			  	data: { "vtMa": vtMa, "vtTen": vtTen, "dvt": dvt, "noiSanXuat": noiSanXuat, "chatLuong": chatLuong, "dinhMuc": dinhMuc, "soLuongTon": soLuongTon},
 			  	contentType: 'application/json',
 			    mimeType: 'application/json',
			  	
 			  	success: function(ctvt) {
 			  		
			  		if(ctvt != "")
	 				{
					$('#view-table-chi-tiet table tr:first').after('<tr class=\"rowContent\"><td class=\"left-column\"><input type=\"checkbox\" name=\"ctvtId\" value=\"' 
							+ctvt.ctvtId + '\"</td><td class=\"col\">'
							+ vtMa +'</td><td class=\"col\">'
							+ vtTen +'</td><td class=\"col\">'
							+ ctvt.noiSanXuat.nsxTen +'</td><td class=\"col\">' 				
							+ ctvt.chatLuong.clTen +'</td><td class=\"col\">'
							+ dvt +'</td><td class=\"col\">'
							+ dinhMuc +'</td><td class=\"col\">'
							+ soLuongTon +'</td></tr>');
			  		
					$('#add-chitiet select[name=noiSanXuat]').val('');
					$('#add-chitiet select[name=chatLuong]').val('');
					
					$('#add-chitiet input[name=dinhMuc]').val('');
					$('#add-chitiet input[name=soLuongTon]').val('');
			  		
			  		alert("Vật tư "+vtMa + " đã được thêm ");	
				}
		  		else{
		  			alert("Vật tư "+vtMa + " đã tồn tại ");
		  		}
			  	
 			  	}
 			});
 			}
 		}
		function preEditCTVattu(formId, check){
			ctvtId = $('#view-table-chi-tiet input:checkbox[name=ctvtId]:checked').val();
			//alert(ctvtId);
				$.ajax({
					url: "/QLVatTuYeuCau/preEditCTVattu.html",
					type: "GET",
					dataType: "JSON",
					data: {"ctvtId": ctvtId},
					contentType: "application/json",
					mimeType: "application/json",
					
					success: function(vt){
						
						$('#update-chitiet input:text[name=vtMaUpdate]').val(vt.vatTu.vtMa);
					  	$('#update-chitiet input:text[name=vtTenUpdate]').val(vt.vatTu.vtTen);
					  	$('#noisanxuatUp option[value='+vt.noiSanXuat.nsxMa+']').prop('selected',true);
					  	$('#chatluongUp option[value='+vt.chatLuong.clMa+']').prop('selected',true);
						$('#update-chitiet input:text[name=dvtUpdate]').val(vt.vatTu.dvt);
						$('#update-chitiet input[name=dinhMucUpdate]').val(vt.dinhMuc);
						$('#update-chitiet input[name=soLuongTonUpdate]').val(vt.soLuongTon);
					  	
					  	showForm(formId, check);
					}
					
				});
		}

		function confirmUpdateCTVattu(){
			var vtMaUpdate = $('#update-chitiet input:text[name=vtMaUpdate]').val();
			var vtTenUpdate = $('#update-chitiet input:text[name=vtTenUpdate]').val();
			var nsxUpdate = $('#update-chitiet select[name=nsxUpdate]').val();
			var clUpdate = $('#update-chitiet select[name=clUpdate]').val();
			var dvtUpdate = $('#update-chitiet input:text[name=dvtUpdate]').val();
			var dinhMucUpdate = $('#update-chitiet input[name=dinhMucUpdate]').val();
			var soLuongTonUpdate = $('#update-chitiet input[name=soLuongTonUpdate]').val();
			if (confirm('Bạn có chắc thay đổi vật tư có mã ' + vtMaUpdate))
				updateCTVattu(vtMaUpdate, vtTenUpdate, dvtUpdate, nsxUpdate, clUpdate, dinhMucUpdate, soLuongTonUpdate);
		}
 		function updateCTVattu(vtMaUpdate, vtTenUpdate, dvtUpdate, nsxUpdate, clUpdate, dinhMucUpdate, soLuongTonUpdate){
 			$.ajax({
				url: "/QLVatTuYeuCau/updateCTVattu.html",	
			  	type: "GET",
			  	dateType: "JSON",
			  	data: { "vtMaUpdate": vtMaUpdate, "vtTenUpdate": vtTenUpdate, "dvtUpdate": dvtUpdate, "nsxUpdate": nsxUpdate, "clUpdate": clUpdate, "dinhMucUpdate": dinhMucUpdate, "soLuongTonUpdate": soLuongTonUpdate},
			  	contentType: 'application/json',
			    mimeType: 'application/json',
				  	
				  	success: function(ctvt) {
				  		$('table tr').has('input[name="ctvtId"]:checked').remove();
				  		$('#view-table-chi-tiet table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"ctvtId\" value=\"' 
				  				+ctvt.ctvtId + '\"</td><td class=\"col\">'
				  				+ vtMaUpdate +'</td><td class=\"col\">'
				  				+ vtTenUpdate +'</td><td class=\"col\">'
				  				+ ctvt.noiSanXuat.nsxTen +'</td><td class=\"col\">'
				  				+ ctvt.chatLuong.clTen +'</td><td class=\"col\">'
				  				+ dvtUpdate +'</td><td class=\"col\">'
				  				+ dinhMucUpdate +'</td><td class=\"col\">'
				  				+ soLuongTonUpdate+'</td></tr>');
				  		$('input:text[name=vtMaUpdate]').val('');			 
				  		$('input:text[name=vtTenUpdate]').val('');
				  		$('select[name=nsxUpdate]').val('');
				  		$('select[name=clUpdate]').val('');
						$('input:text[name=dvtUpdate]').val('');
						$('input[name=dinhMucUpdate]').val('');
						$('input[name=soLuongTonUpdate]').val('');
				  		showForm("update-chitiet", false);	
				  		alert("Sửa thành công chi tiết vật tư có mã "+vtMaUpdate+ " !")
				  	}
				});
 	}
 	function confirmDeleteCTVT(){
 		ctvtId = $('#view-table-chi-tiet input:checkbox[name=ctvtId]:checked').val();
// 		alert(cvvtId);
 		if (confirm('Bạn có chắc xóa '))
 			deleteCTVattu(ctvtId);
 	}
	
  	 function deleteCTVattu(ctvtId) {
//  		alert(cvvtId); 
 		$.ajax({
 			url: "/QLVatTuYeuCau/deleteCTVattu.html",	
 		  	type: "GET",
 		  	dateType: "JSON",
 		  	data: { "ctvtId": ctvtId},
 		  	contentType: 'application/json',
 		    mimeType: 'application/json',
 		    
 		    
 		  	success: function() {
 		  		$('#view-table-chi-tiet table tr').has('input[name="ctvtId"]:checked').remove();
 		  		alert("Đã xóa thành công!");
				
 		    } 
 		});  
 	}

  	function changeCTVtMa(){
  		$('#requireVtMa').html('');
  		$('#add-form input:text[name=vtMa]').focus();
 	} 	

    $(document).ready(function() {
        $('#view-table-chi-tiet .checkAll').click(function(event) {  //on click 
            if(this.checked) { // check select status
                $('#view-table-chi-tiet .checkbox').each(function() { //loop through each checkbox
                    this.checked = true;  //select all checkboxes with class "checkbox1"    
                });
            }else{
                $('#view-table-chi-tiet .checkbox').each(function() { //loop through each checkbox
                    this.checked = false; //deselect all checkboxes with class "checkbox1"                       
                });
            }
        });
        
    }); 