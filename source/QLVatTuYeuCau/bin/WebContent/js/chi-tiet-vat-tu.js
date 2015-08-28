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
							+ ctvt.dvt.dvtTen +'</td><td class=\"col\">'
							+ dinhMuc +'</td><td class=\"col\">'
							+ soLuongTon +'</td></tr>');
			  		
					$('#add-chitiet select[name=noiSanXuat]').val('');
					$('#add-chitiet select[name=chatLuong]').val('');
					
					$('#add-chitiet input[name=dinhMuc]').val('');
					$('#add-chitiet input[name=soLuongTon]').val('');
			  		
			  		alert("Chi tiết vật tư "+vtMa + " đã được thêm ");	
				}
		  		else{
		  			alert("Chi tiết vật tư "+vtMa + " đã tồn tại ");
		  		}
			  	
 			  	}
 			});
 			}
 		}
		function resetAddCTVT()
		{
			$('#add-chitiet select[name=noiSanXuat]').val('');
			$('#add-chitiet select[name=chatLuong]').val('');			
			$('#add-chitiet input[name=dinhMuc]').val('');
			$('#add-chitiet input[name=soLuongTon]').val('');
		}
		function preEditCTVattu(formId, check){
			ctvtId = $('#view-table-chi-tiet input:checkbox[name=ctvtId]:checked').val();
			var ctvtMaList = [];
			$.each($("input[name='ctvtId']:checked"), function(){            
				ctvtMaList.push($(this).val());
		    });
			if (ctvtMaList.length == 0)
				alert('Bạn phải chọn 1 chi tiết vật tư để thay đổi!!');
			else if (ctvtMaList.length > 1)
				alert('Bạn chỉ được chọn 1 chi tiết vật tư để thay đổi!!');
			else {
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
//					  	$('#noisanxuatUp option[value='+vt.noiSanXuat.nsxMa+']').prop('selected',true);
//					  	$('#chatluongUp option[value='+vt.chatLuong.clMa+']').prop('selected',true);
					  	$('#update-chitiet input:text[name=nsxUpdate]').val(vt.noiSanXuat.nsxTen);
						$('#update-chitiet input:text[name=clUpdate]').val(vt.chatLuong.clTen);
						$('#update-chitiet input:text[name=dvtUpdate]').val(vt.vatTu.dvt.dvtTen);
						$('#update-chitiet input[name=dinhMucUpdate]').val(vt.dinhMuc);
						$('#update-chitiet input[name=soLuongTonUpdate]').val(vt.soLuongTon);
					  	
					  	showForm(formId, check);
					}
					
				});
		}
		}

		function confirmUpdateCTVattu(){
			var vtMaUpdate = $('#update-chitiet input:text[name=vtMaUpdate]').val();
			var vtTenUpdate = $('#update-chitiet input:text[name=vtTenUpdate]').val();
			var nsxUpdate = $('#update-chitiet select[name=nsxUpdate]').val();
			var clUpdate = $('#update-chitiet select[name=clUpdate]').val();
			var dvtUpdate = $('#update-chitiet input:text[name=dvtUpdate]').val();
			var dinhMucUpdate = $('#update-chitiet input[name=dinhMucUpdate]').val();
			var soLuongTonUpdate = $('#update-chitiet input[name=soLuongTonUpdate]').val();
			if(dinhMucUpdate == '') {
 				$('#requireDMUp').html('Vui lòng nhập định mức');
 			}
 			
 			else if(soLuongTonUpdate == '') {
 				$('#requireSlUp').html('Vui lòng nhập số lượng');
 			}
 			
 			else {
		
					if (confirm('Bạn có chắc thay đổi vật tư có mã ' + vtMaUpdate))
						updateCTVattu(vtMaUpdate, vtTenUpdate, dvtUpdate, nsxUpdate, clUpdate, dinhMucUpdate, soLuongTonUpdate);
 			}
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
				  		$('#view-table-chi-tiet table tr:first').after('<tr class="rowContent"><td class=\"left-column\"><input type=\"checkbox\" name=\"ctvtId\" value=\"' 
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
 		function resetUpdateCTVT(){
 			$('#update-chitiet input[name=dinhMucUpdate]').val('');
			$('#update-chitiet input[name=soLuongTonUpdate]').val('');
 		}
 	function confirmDeleteCTVT(){
 		ctvtId = $('#view-table-chi-tiet input:checkbox[name=ctvtId]:checked').val();
 		var ctvtMaList = [];
		$.each($("input[name='ctvtId']:checked"), function(){            
			ctvtMaList.push($(this).val());
	    });
		var str = ctvtMaList.join(", ");
		if (ctvtMaList.length == 0)
			alert('Bạn phải chọn 1 hoặc nhiều chi tiết vật tư để xóa!!');
		else if (confirm('Bạn có chắc xóa chi tiết vật tư có mã ' + str))
			deleteCTVattu(str);
 	}
	
  	 function deleteCTVattu(str) {
  	///	alert(str); 
 		$.ajax({
 			url: "/QLVatTuYeuCau/deleteCTVattu.html",	
 		  	type: "GET",
 		  	dateType: "JSON",
 		  	data: { "ctvtList": str},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
 		  	success: function() {
 		  		$('#view-table-chi-tiet table tr').has('input[name="ctvtId"]:checked').remove();
 		  		alert('Chi tiết vật tư có mã ' + str + " đã bị xóa");	
				
 		    } 
 		});  
 	}

  	function changeDM(){
  		$('#requireDM').html('');
  		$('#add-chitiet input[name=dinhMuc]').focus();
 	} 	
  	
  	function changeSL(){
  		$('#requireSl').html('');
  		$('#add-chitiet input[name=soLuongTon]').focus();
 	}
	function changeNsx(){
  		$('#requireNSX').html('');
  		$('#add-chitiet select[name=noisanxuat]').focus();
 	}
	function changeCL(){
  		$('#requireCl').html('');
  		$('#add-chitiet select[name=chatluong]').focus();
 	}
	function changeDMUp(){
  		$('#requireDM').html('');
  		$('#update-chitiet input[name=dinhMucUpdate]').focus();
 	}
	function changeSLUp(){
  		$('#requireSL').html('');
  		$('#update-chitiet input[name=soLuongTonUpdate]').focus();
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
    
    
    $(document).ready(function() {
 	  	$('.page').click(function(){
 		var pageNumber = $(this).val();
 	    	$.ajax({
 				url: "/QLVatTuYeuCau/loadPageCtvt.html",	
 			  	type: "GET",
 			  	dateType: "JSON",
 			  	data: { "pageNumber": pageNumber},
 			  	contentType: 'application/json',
 			    mimeType: 'application/json',
 			  	
 			  	success: function(ctvtList) {
 			  		$('#view-table table .rowContent').remove();
 					if(ctvtList.length>0){
 						for(i = 0;i < ctvtList.length; i++ ) {
 							var ctvt = ctvtList[i] ;
 							var style = '';	
 							if (i % 2 == 0)
 								style = 'style=\"background : #CCFFFF;\"';
 							var str = '';
 							str = '<tr class=\"rowContent\" ' + style + '>'
 								+ '<td class=\"left-column\"><input type=\"checkbox\" name=\"ctvtId\" value=\"' 
 								+ ctvt.ctvtId +'\" class=\"checkbox\"></td>'
 								+ '<td class=\"col\">' + ctvt.ctvtId + '</td>'
 								+ '<td class=\"col\">' + ctvt.noiSanXuat.nsxMa+ '</td>'
 								+ '<td class=\"col\">' + ctvt.chatLuong.clMa+ '</td>'
 								+ '<td class=\"col\">' + ctvt.vatTu.vtMa+ '</td>'
 								+ '<td class=\"col\">' + ctvt.dinhMuc+ '</td>'
 								+ '<td class=\"col\">' + ctvt.soLuongTon+ '</td>'
 								+ '</tr>';
 							$('#view-table table tr:first').after(str);
 						}
 					}
 			  	}
 			});
 	    });	
 	})   
 	$(document).ready(function() {
	$('#add-form').keypress(function(e) {
	 var key = e.which;
	 if(key == 13)  // the enter key code
	  {
		 addCTVatTu();
	    return false;  
	  }
	});   
});   
$(document).ready(function() {
	$('#update-form').keypress(function(e) {
	 var key = e.which;
	 if(key == 13)  // the enter key code
	  {
	    updateCTVatTu();
	    return false;  
	  }
	});   
});  