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
function confirmDelete(){
    return confirm('Bạn có chắc xóa');
}
function loadDataCv() {
	showForm('main-form', 'add-form', true);
}
function addCongVan() {
	var nsxMa = $('#add-form input:text[name=nsxMa]').val();
	var nsxTen = $('#add-form input:text[name=nsxTen]').val();
	$.ajax({
		url: "/QuanLyVatTu/addNsx.html",	
	  	type: "GET",
	  	dateType: "JSON",
	  	data: { "nsxMa": nsxMa, "nsxTen": nsxTen},
	  	contentType: 'application/json',
	    mimeType: 'application/json',
	  	
	  	success: function(nsx) {
		  	$('input:text[name=nsxMa]').val(nsx.nsxMa);
		  	$('input:text[name=nsxTen]').val(nsx.nsxTen);
	  		$('#view-table table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"nsxMa\" value=\"' +nsx.nsxMa + '\"</td><td class=\"col\">'+ nsxMa +'</td><td class=\"col\">' + nsxTen+'</td></tr>');
	  		$('#add-form input:text[name=nsxMa]').val('');
			$('#add-form input:text[name=nsxTen]').val('');
	  		showForm("add-form", false);	
	  	}
	});
}
function preUpdateCv() {
	
	showForm('main-form','update-form', true);
}