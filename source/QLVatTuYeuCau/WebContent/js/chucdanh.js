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
	function preUpdateCd(formId, check) {
		var cdMa = $('input:checkbox[name=cdMa]:checked').val();
		$.ajax({
			url: "/QuanLyVatTu/preUpdateCd.html",	
		  	type: "GET",
		  	dateType: "JSON",
		  	data: { "cdMa": cdMa},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
		  	
		  	success: function(cd) {
			  	$('input:text[name=cdMaUpdate]').val(cd.cdMa);
			  	$('input:text[name=cdTenUpdate]').val(cd.cdTen);
		  		showForm(formId, check);	
		  		
		  	}
		});
	}
	function confirmDeleteCd(){
		var cdMa = $('input:checkbox[name=cdMa]:checked').val();
		if (confirm('Bạn có chắc xóa ' + cdMa))
			deleteCd(cdMa);
	}
		
 	 function deleteCd(cdMa) {
		$.ajax({
			url: "/QuanLyVatTu/deleteCd.html",	
		  	type: "GET",
		  	dateType: "JSON",
		  	data: { "cdMa": cdMa},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
		  	success: function() {
			  	alert(cdMa + " da bi xoa.");
						$('table tr').has('input[name="cdMa"]:checked').remove();
		    } 
		});  
	} 
 	
 	function addCd() {
		var cdMa = $('#add-form input:text[name= cdMa]').val();
		var cdTen = $('#add-form input:text[name=cdTen]').val();
		$.ajax({
			url: "/QuanLyVatTu/addCd.html",	
		  	type: "GET",
		  	dateType: "JSON",
		  	data: { "cdMa": cdMa, "cdTen": cdTen},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
		  	
		  	success: function(cd) {
			  	$('input:text[name=cdMa]').val(cd.cdMa);
			  	$('input:text[name=cdTen]').val(cd.cdTen);
		  		$('#view-table table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"cdMa\" value=\"' +cd.cdMa + '\"</td><td class=\"col\">'+ cdMa +'</td><td class=\"col\">' + cdTen+'</td></tr>');
		  		$('#add-form input:text[name=cdMa]').val('');
				$('#add-form input:text[name=cdTen]').val('');
		  		showForm("add-form", false);	
		  	}
		});
	}
 	
 	function confirmUpdateCd(){
		var cdMaUpdate = $('input:text[name=cdMaUpdate]').val();
		var cdTenUpdate = $('input:text[name=cdTenUpdate]').val();
		if (confirm('Bạn có chắc thay doi noi san xuat co ma ' + cdMaUpdate))
			updateCd(cdMaUpdate, cdTenUpdate);
	}
 	function updateCd(cdMaUpdate, cdTenUpdate) {

		$.ajax({
			url: "/QuanLyVatTu/updateCd.html",	
		  	type: "GET",
		  	dateType: "JSON",
		  	data: { "cdMaUpdate": cdMaUpdate, "cdTenUpdate": cdTenUpdate},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
		  	
		  	success: function(cd) {
		  		$('table tr').has('input[name="cdMa"]:checked').remove();
		  		$('#view-table table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"cdMa\" value=\"' +cdMaUpdate + '\"</td><td class=\"col\">'+ cdMaUpdate +'</td><td class=\"col\">' + cdTenUpdate+'</td></tr>');
		  		$('input:text[name=cdMaUpdate]').val('');
				cdTenUpdate = $('input:text[name=cdTenUpdate]').val('');
		  		showForm("update-form", false);	
		  	}
		});
	}