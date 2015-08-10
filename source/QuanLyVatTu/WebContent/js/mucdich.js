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
	function preUpdateMd(formId, check) {
		var mdMa = $('input:checkbox[name=mdMa]:checked').val();
		$.ajax({
			url: "/QuanLyVatTu/preUpdateMd.html",	
		  	type: "GET",
		  	dateType: "JSON",
		  	data: { "mdMa": mdMa},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
		  	
		  	success: function(md) {
			  	$('input:text[name=mdMaUpdate]').val(md.mdMa);
			  	$('input:text[name=mdTenUpdate]').val(md.mdTen);
		  		showForm(formId, check);	
		  		
		  	}
		});
	}
	function confirmDeleteMd(){
		var mdMa = $('input:checkbox[name=mdMa]:checked').val();
		if (confirm('Bạn có chắc xóa ' + mdMa))
			deleteMd(mdMa);
	}
		
 	 function deleteMd(mdMa) {
		$.ajax({
			url: "/QuanLyVatTu/deleteMd.html",	
		  	type: "GET",
		  	dateType: "JSON",
		  	data: { "mdMa": mdMa},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
		  	success: function() {
			  	alert(mdMa + " da bi xoa.");
						$('table tr').has('input[name="mdMa"]:checked').remove();
		    } 
		});  
	} 
 	
 	function addMd() {
		var mdMa = $('#add-form input:text[name= mdMa]').val();
		var mdTen = $('#add-form input:text[name=mdTen]').val();
		$.ajax({
			url: "/QuanLyVatTu/addMd.html",	
		  	type: "GET",
		  	dateType: "JSON",
		  	data: { "mdMa": mdMa, "mdTen": mdTen},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
		    success: function(result) {
				if(result == "success")
				{
		  		 	$('input:text[name=mdMa]').val(mdMa);
				  	$('input:text[name=mdTen]').val(mdTen);
			  		$('#view-table table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"mdMa\" value=\"' +mdMa + '\"</td><td class=\"col\">'+ mdMa +'</td><td class=\"col\">' + mdTen+'</td></tr>');
			  		$('#add-form input:text[name=mdMa]').val('');
					$('#add-form input:text[name=mdTen]').val('');
			  		showForm("add-form", false);
			  		alert(mdMa + " đã được thêm ");	
				}
		  		else{
		  			alert(mdMa + " đã tồn tại ");
		  		}
		  			
			}
		});
	}
 	
 	function confirmUpdateMd(){
		var mdMaUpdate = $('input:text[name=mdMaUpdate]').val();
		var mdTenUpdate = $('input:text[name=mdTenUpdate]').val();
		if (confirm('Bạn có chắc thay doi noi san xuat co ma ' + mdMaUpdate))
			updateMd(mdMaUpdate, mdTenUpdate);
	}
 	function updateMd(mdMaUpdate, mdTenUpdate) {

		$.ajax({
			url: "/QuanLyVatTu/updateMd.html",	
		  	type: "GET",
		  	dateType: "JSON",
		  	data: { "mdMaUpdate": mdMaUpdate, "mdTenUpdate": mdTenUpdate},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
		  	
		  	success: function(md) {
		  		$('table tr').has('input[name="mdMa"]:checked').remove();
		  		$('#view-table table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"mdMa\" value=\"' +mdMaUpdate + '\"</td><td class=\"col\">'+ mdMaUpdate +'</td><td class=\"col\">' + mdTenUpdate+'</td></tr>');
		  		$('input:text[name=mdMaUpdate]').val('');
				mdTenUpdate = $('input:text[name=mdTenUpdate]').val('');
		  		showForm("update-form", false);	
		  	}
		});
	}