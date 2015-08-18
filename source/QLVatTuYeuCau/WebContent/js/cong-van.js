function showForm(formId1, formId2, check){
    if (check)
        document.getElementById(formId2).style.display="block";
    else 
        document.getElementById(formId2).style.display="none";
    var f = document.getElementById(formId1), s, opacity;
    s = f.style;
    opacity = check? '10' : '100';
    s.opacity = s.MozOpacity = s.KhtmlOpacity = opacity/100;
    s.filter = 'alpha(opacity='+opacity+')';
    for(var i=0; i<f.length; i++) f[i].disabled = check;
}
function checkCongVan() {
	var cvId = $('input:checkbox[name=cvId]:checked').val();
	if(cvId == '')
		return false;
}
function confirmDelete(){
	var cvId = $('input:checkbox[name=cvId]:checked').val();
//	alert('1');
//	confirm('Bạn có chắc xóa' + cvId);
	if (confirm('Bạn có chắc xóa cong van co id = ' + cvId))
		deleteCv(cvId);
}
	
function deleteCv(cvId) {
	$.ajax({
		url: "/QLVatTuYeuCau/deleteCv.html",	
	  	type: "GET",
	  	dateType: "JSON",
	  	data: { "cvId": cvId},
	  	contentType: 'application/json',
	    mimeType: 'application/json',
	  	success: function() {
		  	alert("Cong van co ma " + cvId + "da bi xoa");
					$('table').has('input[name="cvId"]:checked').remove();
	    } 
	});  
}
function loadDataCv() {
	showForm('main-form', 'add-form', true);
}
//function addCongVan() {
//	var nsxMa = $('#add-form input:text[name=nsxMa]').val();
//	var nsxTen = $('#add-form input:text[name=nsxTen]').val();
//	$.ajax({
//		url: "/QLVatTuYeuCau/addNsx.html",	
//	  	type: "GET",
//	  	dateType: "JSON",
//	  	data: { "nsxMa": nsxMa, "nsxTen": nsxTen},
//	  	contentType: 'application/json',
//	    mimeType: 'application/json',
//	  	
//	  	success: function(nsx) {
//		  	$('input:text[name=nsxMa]').val(nsx.nsxMa);
//		  	$('input:text[name=nsxTen]').val(nsx.nsxTen);
//	  		$('#view-table table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"nsxMa\" value=\"' +nsx.nsxMa + '\"</td><td class=\"col\">'+ nsxMa +'</td><td class=\"col\">' + nsxTen+'</td></tr>');
//	  		$('#add-form input:text[name=nsxMa]').val('');
//			$('#add-form input:text[name=nsxTen]').val('');
//	  		showForm("add-form", false);	
//	  	}
//	});
//}
//function preUpdateCv() {
//	
//	showForm('main-form','update-form', true);
//}
//function preUpdatecV(formId, check) {
//	var cvId = $('input:checkbox[name=cvId]:checked').val();
//	$.ajax({
//		url: "/QLVatTuYeuCau/preEditCongVan.html",	
//	  	type: "GET",
//	  	dateType: "JSON",
//	  	data: { "cvId": cvId},
//	  	contentType: 'application/json',
//	    mimeType: 'application/json',
//	  	
//	  	success: function(congVan) {
//		  	$('input:text[name=soDensUpdate]').val(nsx.soDen);
//		  	$('input:text[name=cvSoUpdate]').val(congVan.cvSo)
//		  	document.getElementById('personlist').getElementsByTagName('option')[11].selected = 'selected';
//		  	$('input:text[name=cvSoUpdate]').val(congVan.cvSo);
//	  		showForm(formId, check);	
//	  		
//	  	}
//	});
//	showForm('main-form','update-form', true);
//}
