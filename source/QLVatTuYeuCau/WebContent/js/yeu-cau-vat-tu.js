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
	if(cvId == null)
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
function searchCtvt(formId, check) {
var vtMa = $('input:text[name=vtMa]').val();
var vtTen = $('input:text[name=vtTen]').val();
var nsx = $('select[name=nsx]').val();
var chatLuong = $('select[name=chatLuong]').val();
//alert(vtMa + vtTen + nsx + chatLuong);
$.ajax({
	url: "/QLVatTuYeuCau/searchCtvt.html",	
  	type: "GET",
  	dateType: "JSON",
  	data: { "vtMa": vtMa, "vtTen": vtTen, "nsx": nsx, "chatLuong": chatLuong},
  	contentType: 'application/json',
    mimeType: 'application/json',
  	
  	success: function(ctVatTuList) {
//	  	$('input:text[name=soDensUpdate]').val(nsx.soDen);
//	  	$('input:text[name=cvSoUpdate]').val(congVan.cvSo)
//	  	document.getElementById('personlist').getElementsByTagName('option')[11].selected = 'selected';
//	  	$('input:text[name=cvSoUpdate]').val(congVan.cvSo);
//  		showForm(formId, check);	
  		$('#view-search table #row').remove();
//  		alert(ctVatTuList.length);
  		for(i = 0; i < ctVatTuList.length; i++){
//  			i++;
//  			var str = '';
//  			if (i % 2 == 1)
//  				str += '<tr style=\"background : #CCFFFF;\">' + '<td>' + ctVatTuList[i].vatTu.vtMa + '</td>'  + '<td>' + ctVatTuList[i].vatTu.vtTen + '</td>'  + '<td>' + ctVatTuList[i].noiSanXuat.nsxTen + '</td>'  + '<td>' + ctVatTuList[i].chatLuong.clTen + '</td>'  + '<td>' + ctVatTuList[i].vatTu.dvt + '</td><td><input type=\"radio\" name=\"ctvtId\" value=\"' + ctVatTuList[i].ctvtId + '\"></td>' + '</tr>';
//  			else str += '<tr>' + '<td>' + ctVatTuList[i].vatTu.vtMa + '</td>'  + '<td>' + ctVatTuList[i].vatTu.vtTen + '</td>'  + '<td>' + ctVatTuList[i].noiSanXuat.nsxTen + '</td>'  + '<td>' + ctVatTuList[i].chatLuong.clTen + '</td>'  + '<td>' + ctVatTuList[i].vatTu.dvt + '</td><td><input type=\"radio\" name=\"ctvtId\" value=\"' + ctVatTuList[i].ctvtId + '\"></td>' + '</tr>'; 
//  			str += '>' + '<td>' + ctVatTuList[i].vatTu.vtMa + '</td>'  + '<td>' + ctVatTuList[i].vatTu.vtMa + '</td>'  + '<td>' + ctVatTuList[i].vatTu.vtMa + '</td>'  + '<td>' + ctVatTuList[i].vatTu.vtMa + '</td>' + '</tr>' 
  			if (i % 2 ==0 )
  				$('#view-search table tr:first').after('<tr id="row" style=\"background : #CCFFFF;\">' + '<td>' + ctVatTuList[i].vatTu.vtMa + '</td>'  + '<td>' + ctVatTuList[i].vatTu.vtTen + '</td>'  + '<td>' + ctVatTuList[i].noiSanXuat.nsxTen + '</td>'  + '<td>' + ctVatTuList[i].chatLuong.clTen + '</td>'  + '<td>' + ctVatTuList[i].vatTu.dvt + '</td><td><input type=\"radio\" name=\"ctvtId\" value=\"' + ctVatTuList[i].vatTu.dvt + '\"></td>' + '</tr>');
  			else
  				$('#view-search table tr:first').after('<tr id="row">' + '<td>' + ctVatTuList[i].vatTu.vtMa + '</td>'  + '<td>' + ctVatTuList[i].vatTu.vtTen + '</td>'  + '<td>' + ctVatTuList[i].vatTu.noiSanXuat.nsxTen + '</td>'  + '<td>' + ctVatTuList[i].vatTu.chatLuong.clTen + '</td>'  + '<td>' + ctVatTuList[i].vatTu.dvt + '</td><td><input type=\"radio\" name=\"ctvtId\" value=\"' + ctVatTuList[i].vatTu.dvt + '\"></td>' + '</tr>');
//  			$('#view-search table tr:last').after(str);
//  			alert( ctVatTuList[i].vatTu.vtMa);
//  			alert('ok');
		}
  		
  	}
});
}
function preAddSoLuong(){
	ctvtId = $('input:radio[name=ctvtId]').val();
	alert(5);
	$.ajax({
		url: "/QLVatTuYeuCau/preAddSoLuong.html",	
	  	type: "GET",
	  	dateType: "JSON",
	  	data: { "ctvtId": ctvtId},
	  	contentType: 'application/json',
	    mimeType: 'application/json',
	  	
	  	success: function(ctvt) {
	  		$('#vtMaAdd').html(ctvt.vatTu.vtMa);
//	  		alert('OK');
	  		$('#vtTenAdd').html(ctvt.vatTu.vtTen);
	  		$('#nsxTenAdd').html(ctvt.noiSanXuat.nsxTen);
	  		$('#clTenAdd').html(ctvt.chatLuong.clTen);
	  		$('#dvtAdd').html(ctvt.vatTu.dvt);
	  	}
	});
		
	showForm('search-form','add-so-luong-form',true);
}
function addSoLuong(){
	soLuong = $('input:number[name=soLuongAdd]').val();
	alert(5);
	$.ajax({
		url: "/QLVatTuYeuCau/addSoLuong.html",	
	  	type: "GET",
	  	dateType: "JSON",
	  	data: { "soLuong": soLuong},
	  	contentType: 'application/json',
	    mimeType: 'application/json',
	  	
	  	success: function(result) {
	  		if(result == "success")
	  			alert('them so luong thanh cong');
	  	}
	});
		
	showForm('search-form','add-so-luong-form',true);
}
