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

function searchCtvt() {
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
	  		
	  		$('#view-search table #row').remove();
	  		for(i = 0; i < ctVatTuList.length; i++){
	  			if (i % 2 ==0 )
	  				$('#view-search table tr:first').after('<tr id="row" style=\"background : #CCFFFF;\">' + '<td>' + ctVatTuList[i].vatTu.vtMa + '</td>'  + '<td>' + ctVatTuList[i].vatTu.vtTen + '</td>'  + '<td>' + ctVatTuList[i].noiSanXuat.nsxTen + '</td>'  + '<td>' + ctVatTuList[i].chatLuong.clTen + '</td>'  + '<td>' + ctVatTuList[i].vatTu.dvt + '</td><td><input type=\"radio\" name=\"ctvtId\" value=\"' + ctVatTuList[i].ctvtId + '\"  onchange=\"preAddSoLuong();\"></td>' + '</tr>');
	  			else
	  				$('#view-search table tr:first').after('<tr id="row">' + '<td>' + ctVatTuList[i].vatTu.vtMa + '</td>'  + '<td>' + ctVatTuList[i].vatTu.vtTen + '</td>'  + '<td>' + ctVatTuList[i].vatTu.noiSanXuat.nsxTen + '</td>'  + '<td>' + ctVatTuList[i].vatTu.chatLuong.clTen + '</td>'  + '<td>' + ctVatTuList[i].vatTu.dvt + '</td><td><input type=\"radio\" name=\"ctvtId\" value=\"' + ctVatTuList[i].ctvtId + '\"></td>' + '</tr>');
	
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
	  		$('#vtTenAdd').html(ctvt.vatTu.vtTen);
	  		$('#nsxTenAdd').html(ctvt.noiSanXuat.nsxTen);
	  		$('#clTenAdd').html(ctvt.chatLuong.clTen);
	  		$('#dvtAdd').html(ctvt.vatTu.dvt);
	  	}
	});
		
	showForm('search-form','add-so-luong-form',true);
}

function addSoLuong(){
	var soLuong = $('input[name=soLuongAdd]').val();
	alert(soLuong);
	count = 0;
	$.ajax({
		url: "/QLVatTuYeuCau/addSoLuong.html",	
	  	type: "GET",
	  	dateType: "JSON",
	  	data: { "soLuong": soLuong},
	  	contentType: 'application/json',
	    mimeType: 'application/json',
	  	
	  	success: function(yeuCau) {
//	  		if(result == "success") {
	  			alert('them so luong thanh cong');
	  			$('input:radio[name=ctvtId]').prop('checked',false);
	  			$('input[name=soLuongAdd]').val('0');
	  			alert('PK');
//	  			showForm('search-form','add-so-luong-form',false);
//	  			$('#view-table'+yeuCau.ycId).remove();
	  			str = '<tr id=\"' + yeuCau.ycId +'\"> '
					+ '<td><input id=\"'+ yeuCau.ycId + '\" type=\"checkbox\" name = \"yeuCau\" value=\"' + yeuCau.ycId + '\"</td>'
  					+ '<td>' + yeuCau.vatTu.vtMa + '</td>'
  					+ '<td>' + yeuCau.vatTu.vtTen + '</td>'
  					+ '<td>' + yeuCau.nsx.nsxTen + '</td>'
  					+ '<td>' + yeuCau.chatLuong.clTen + '</td>'
  					+ '<td>' + yeuCau.vatTu.dvt + '</td>'
  					+ '<td>' + yeuCau.ycSoLuong + '</td>'
  					+ '</tr>';
	  			alert(str);
//	  			$('#view-table table tr:first').after('<tr id=\"' + yeuCau.ycId +'\"> '
//	  					+ '<td><input id=\"'+ yeuCau.ycId + '\" type=\"checkbox\" name = \"yeuCau\" value=\"' + yeuCau.ycId + '\"</td>'
//	  					+ '<td>' + yeuCau.vatTu.vtMa + '</td>'
//	  					+ '<td>' + yeuCau.vatTu.vtTen + '</td>'
//	  					+ '<td>' + yeuCau.nsx.nsxTen + '</td>'
//	  					+ '<td>' + yeuCau.chatLuong.clTen + '</td>'
//	  					+ '<td>' + yeuCau.dvt + '</td>'
//	  					+ '<td>' + yeuCau.ycSoLuong + '</td>'
//	  					+ '</tr>');
	  			alert('them so luong thanh cong :)');
	  			alert('123556');
	  		}
//	  	}
	});
	showForm('search-form','add-so-luong-form',true);
}
function confirmDelete() {
	var ycId = $('#view-table input:checkbox[name=yeuCau]:checked').val();
	if(confirm('Ban co chac xoa yeu cau?'))
		deleteYc(ycId);
}
function deleteYc(ycId) {
	$.ajax({
		url: "/QLVatTuYeuCau/deleteYc.html",	
	  	type: "GET",
	  	dateType: "JSON",
	  	data: { "ycId": ycId},
	  	contentType: 'application/json',
	    mimeType: 'application/json',
	  	success: function() {
		  	alert("yeu cau co da bi xoa");
					$('#view-table table').has('input[name="yeuCau"]:checked').remove();
	    } 
	});  
} 
