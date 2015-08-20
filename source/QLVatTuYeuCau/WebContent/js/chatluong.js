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
	function preUpdateCl(formId, check) {
		var clMa = $('input:checkbox[name=clMa]:checked').val();
		$.ajax({
			url: "/QLVatTuYeuCau/preUpdateCl.html",	
		  	type: "GET",
		  	dateType: "JSON",
		  	data: { "clMa": clMa},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
		  	
		  	success: function(cl) {
			  	$('input:text[name=clMaUpdate]').val(cl.clMa);
			  	$('input:text[name=clTenUpdate]').val(cl.clTen);
		  		showForm(formId, check);	
		  		
		  	}
		});
	}
	function confirmDeleteCl(){
		var clMa = $('input:checkbox[name=clMa]:checked').val();
		if (confirm('Bạn có chắc xóa ' + clMa))
			deleteCl(clMa);
	}
		
 	 function deleteCl(clMa) {
		$.ajax({
			url: "/QLVatTuYeuCau/deleteCl.html",	
		  	type: "GET",
		  	dateType: "JSON",
		  	data: { "clMa": clMa},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
		  	success: function() {
			  	alert(clMa + " da bi xoa.");
			  	$('table tr').has('input[name="clMa"]:checked').remove();
		  	}
		});  
	}
 	function addCl() {
		var clMa = $('#add-form input:text[name=clMa]').val();
		var clTen = $('#add-form input:text[name=clTen]').val();
		if(clMa == '') 
			{
				$('#requireClMa').html('Vui lòng nhập mã chất lượng');
			}
		else if (clTen == '')
 			{
 				$('#requireClTen').html('Vui lòng nhập tên chất lượng');
 			}
		else{
			$.ajax({
				url: "/QLVatTuYeuCau/addCl.html",	
			  	type: "GET",
			  	dateType: "JSON",
			  	data: { "clMa": clMa, "clTen": clTen},
			  	contentType: 'application/json',
			    mimeType: 'application/json',
			  	success: function(result) {
			  		if(result == "success")
	 				{
 			  		 	$('input:text[name=clMa]').val(clMa);
 					  	$('input:text[name=clTen]').val(clTen);
 				  		$('#view-table table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"clMa\" value=\"' +clMa + '\"</td><td class=\"col\">'+ clMa +'</td><td class=\"col\">' + clTen+'</td></tr>');
 				  		$('#add-form input:text[name=clMa]').val('');
 						$('#add-form input:text[name=clTen]').val('');
 				  		showForm("add-form", false);
 				  		alert(clMa + " đã được thêm ");	
 					}
 			  		else{
 			  			alert(clMa + " đã tồn tại ");
 			  		}
 			  			
			  	}
			});
		}
	}
 	function changeClMa(){
  		$('#requireClMa').html('');
  		$('#add-form input:text[name=clMa]').focus();
 	} 
 	function changeClTen(){
  		$('#requireClTen').html('');
  		$('#add-form input:text[name=clTen]').focus();
 	} 
 	function changeClTenUpdate(){
  		$('#requireClTenUpdate').html('');
  		$('#add-form input:text[name=clTenUpdate]').focus();
 	} 
 	function confirmUpdateCl(){
		var clMaUpdate = $('input:text[name=clMaUpdate]').val();
		var clTenUpdate = $('input:text[name=clTenUpdate]').val();
		 if (clTenUpdate == '')
 			{
 				$('#requireClTenUpdate').html('Vui lòng nhập tên chất lượng');
 			}
		else{
		if (confirm('Bạn có chắc thay doi chất lượng có mã ' + clMaUpdate))
			updateCl(clMaUpdate, clTenUpdate);
		}
	}
 	function updateCl(clMaUpdate, clTenUpdate) {
 		
		$.ajax({
			url: "/QLVatTuYeuCau/updateCl.html",	
		  	type: "GET",
		  	dateType: "JSON",
		  	data: { "clMaUpdate": clMaUpdate, "clTenUpdate": clTenUpdate},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
		  	
		  	success: function(cl) {
		  		$('table tr').has('input[name="clMa"]:checked').remove();
		  		$('#view-table table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"clMa\" value=\"' +clMaUpdate + '\"</td><td class=\"col\">'+ clMaUpdate +'</td><td class=\"col\">' + clTenUpdate+'</td></tr>');
		  		$('input:text[name=clMaUpdate]').val('');
				clTenUpdate = $('input:text[name=clTenUpdate]').val('');
		  		showForm("update-form", false);	
		  		alert("Thay đổi thành công chất lượng có mã "+vtMaUpdate+ " !")
		  	}
		});
	}