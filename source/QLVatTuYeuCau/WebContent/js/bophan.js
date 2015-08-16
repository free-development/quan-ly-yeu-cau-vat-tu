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
	
		
		function addBp() {
 			dvMa = $('#add-form input:text[name=dvMa]').val();
 			dvTen = $('#add-form input:text[name=dvTen]').val();
 			sdt = $('#add-form input:text[name=sdt]').val();
 			diaChi = $('#add-form input:text[name=diaChi]').val();
 			email = $('#add-form input:text[name=email]').val();
 			$.ajax({
 				url: "/QLVatTuYeuCau/addBp.html",	
			  	type: "GET",
 			  	dateType: "JSON",
 			  	data: { "dvMa": dvMa, "dvTen": dvTen, "sdt": sdt, "diaChi": diaChi, "email": email},
 			  	contentType: 'application/json',
 			    mimeType: 'application/json',
			  	
 			  	success: function(result) {
 			  		if(result == "success")
	 				{
$('#view-table-bo-phan table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"dvMa\" value=\"'+ dvMa + '\"</td><td class=\"col\">' + dvMa +'</td><td class=\"col\">' + dvTen+'</td><td class=\"col\">' + sdt+'</td><td class=\"col\">'+ diaChi+'</td><td class=\"col\">'+ email+'</td></tr>');
					$('#add-form input:text[name=dvMa]').val('');
		 			$('#add-form input:text[name=dvTen]').val('');
		 			$('#add-form input:text[name=sdt]').val('');
		 			$('#add-form input:text[name=diaChi]').val('');
		 			$('#add-form input:text[name=email]').val('');
		 			showForm("add-form", false);
		 			alert(dvMa + " đã được thêm ");	
					}
			  		else{
			  			alert(dvMa + " đã tồn tại ");
			  		}
 			  	}
 			 });
 		}
		function preUpdateBp(formId, check){
			dvMa = $('input:checkbox[name=dvMa]:checked').val();
				$.ajax({
					url: "/QLVatTuYeuCau/preEditBp.html",
					type: "GET",
					dataType: "JSON",
					data: {"dvMa": dvMa},
					contentType: "application/json",
					mimeType: "application/json",
					
					success: function(dv){
						
						$('input:text[name=dvMaUpdate]').val(dv.dvMa);
					  	$('input:text[name=dvTenUpdate]').val(dv.dvTen);
					  	$('input:text[name=sdtUpdate]').val(dv.sdt);
					  	$('input:text[name=diaChiUpdate]').val(dv.diaChi);
					  	$('input:text[name=emailUpdate]').val(dv.email);
					  	showForm(formId, check);
					}
				});
		}
 	 	function confirmUpdateBp(){
			var dvMaUpdate = $('input:text[name=dvMaUpdate]').val();
			var dvTenUpdate = $('input:text[name=dvTenUpdate]').val();
			var sdtUpdate = $('input:text[name=sdtUpdate]').val();
 			var diaChiUpdate = $('input:text[name=diaChiUpdate]').val();
 			var emailUpdate = $('input:text[name=emailUpdate]').val();
			if (confirm('Bạn có chắc thay đổi đơn vị có mã ' + dvMaUpdate))
				updateBp(dvMaUpdate, dvTenUpdate, sdtUpdate, diaChiUpdate, emailUpdate);
		}
 	 	function updateBp(dvMaUpdate, dvTenUpdate, sdtUpdate, diaChiUpdate, emailUpdate) {

			$.ajax({
				url: "/QLVatTuYeuCau/updateBp.html",	
			  	type: "GET",
			  	dateType: "JSON",
			  	data: { "dvMaUpdate": dvMaUpdate, "dvTenUpdate": dvTenUpdate, "sdtUpdate": sdtUpdate, "diaChiUpdate": diaChiUpdate, "emailUpdate": emailUpdate},
			  	contentType: 'application/json',
			    mimeType: 'application/json',
			  	
			  	success: function(dv) {
			  		$('table tr').has('input[name="dvMa"]:checked').remove();
					$('#view-table-bo-phan table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"dvMa\" value=\"' +dvMaUpdate + '\"</td><td class=\"col\">'
							 + dvMaUpdate +'</td><td class=\"col\">' 
							 + dvTenUpdate +'</td><td class=\"col\">' 
							 + sdtUpdate +'</td><td class=\"col\">' 
							 + diaChiUpdate +'</td><td class=\"col\">' 
							 + emailUpdate +'</td></tr>');
			  		$('input:text[name=dvMaUpdate]').val('');
					dvTenUpdate = $('input:text[name=dvTenUpdate]').val('');
					sdtUpdate = $('input:text[name=sdtUpdate]').val('');
					diaChiUpdate = $('input:text[name=diaChiUpdate]').val('');
					emailUpdate = $('input:text[name=emailUpdate]').val('');
			  		showForm("update-form", false);	
			  	}
			});
		}
		function confirmDelete(){
			dvMa = $('input:checkbox[name=dvMa]:checked').val();
			if (confirm('Bạn có chắc xóa' + dvMa))
				deleteBp(dvMa);
		}
 		
	 	 function deleteBp(dvMa) {
			 
			$.ajax({
				url: "/QLVatTuYeuCau/deleteBp.html",	
			  	type: "GET",
			  	dateType: "JSON",
			  	data: { "dvMa": dvMa},
			  	contentType: 'application/json',
			    mimeType: 'application/json',
			  	success: function() {
				  	alert(dvMa + "da bi xoa");
							$('table tr').has('input[name="dvMa"]:checked').remove();
			    } 
			});  
		}