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
};

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
};
function preAddSoLuong(){
//	$(document).ready(function() {
//		$('#view-search input:checkbox[name=ctvtId]').clicked(function() {
//			var ctvtId = this.val();
	var ctvtId = $('#view-search input:radio[name=ctvtId]:checked').val();
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
//		});
//	});	
};

function addSoLuong(){
	var soLuong = $('input[name=soLuongAdd]').val();
	count = 0;
	$.ajax({
		url: "/QLVatTuYeuCau/addSoLuong.html",	
	  	type: "GET",
	  	dateType: "JSON",
	  	data: { "soLuong": soLuong},
	  	contentType: 'application/json',
	    mimeType: 'application/json',
	  	
	  	success: function(yeuCau) {
	  			alert('them so luong thanh cong');
	  			$('input:radio[name=ctvtId]').prop('checked',false);
	  			$('input[name=soLuongAdd]').val('0');
	  			var ctVatTu = yeuCau.ctVatTu;
	  			var cells = '<td><input id=\"'+ yeuCau.ycId + '\" type=\"checkbox\" name = \"yeuCau\" value=\"' + yeuCau.ycId + '\"</td>'
					+ '<td>' + ctVatTu.vatTu.vtMa + '</td>'
					+ '<td>' + ctVatTu.vatTu.vtTen + '</td>'
					+ '<td>' + ctVatTu.noiSanXuat.nsxTen + '</td>'
					+ '<td>' + ctVatTu.chatLuong.clTen + '</td>'
					+ '<td>' + ctVatTu.vatTu.dvt + '</td>'
					+ '<td>' + yeuCau.ycSoLuong + '</td>';
					
	  			var row = '<tr id=\"' + yeuCau.ycId +'\"> ' + cells + + '</tr>';
	  			if (yeuCau.ycSoLuong == soLuong) {
		  			$('#view-table-yc table tr:first').after(row);
	  			}
	  			else {
	  				$('#view-table-yc table #' + yeuCau.ycId).html(cells);
	  			}
	  			showForm('search-form','add-so-luong-form',false);
	  	}
	});
	
};
function confirmDelete() {
	var ycList = [];
	$.each($('#view-table-yc input:checkbox[name=yeuCau]:checked'), function(){
		ycList.push($(this).val());
	})
	var str = ycList.join(', ');
	if (ycList.length == 0)
		alert('Bạn phải chọn 1 yêu cầu để sửa đổi!');
	else if (ycList.length > 1)
		alert('Bạn phải chọn 1 yêu cầu để sửa đổi!');
	else if(confirm('Ban co chac xoa yeu cau?'));
		deleteYc(str);
};
function deleteYc(ycList) {
	$.ajax({
		url: "/QLVatTuYeuCau/deleteYc.html",	
	  	type: "GET",
	  	dateType: "JSON",
	  	data: { "ycList": ycList},
	  	contentType: 'application/json',
	    mimeType: 'application/json',
	  	success: function(result) {
		  	alert("Yêu cầu đã được xóa!");
			$('#view-table-yc table tr').has('input:checkbox[name=yeuCau]:checked').remove();
	    } 
	});  
};
function preUpdateYc() {
	var ycList = [];
	$.each($('#view-table-yc input:checkbox[name=yeuCau]:checked'), function(){
		ycList.push($(this).val());
	})
	var str = ycList.join(', ');
	if (ycList.length == 0)
		alert('Bạn phải chọn 1 yêu cầu để sửa đổi!');
	else if (ycList.length > 1)
		alert('Bạn phải chọn 1 yêu cầu để sửa đổi!');
	else {
		
		$.ajax({
			url: "/QLVatTuYeuCau/preUpdateYc.html",	
		  	type: "GET",
		  	dateType: "JSON",
		  	data: { "yeuCau": ycList[0]},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
		  	success: function(yeuCau) {
		  		var ctVatTu = yeuCau.ctVatTu;
		  		$('#vtMaUpdate').html(ctVatTu.vatTu.vtMa);
		  		$('#vtTenUpdate').html(ctVatTu.vatTu.vtTen);
		  		$('#nsxTenUpdate').html(ctVatTu.noiSanXuat.nsxTen);
		  		$('#clTenUpdate').html(ctVatTu.chatLuong.clTen);
		  		$('#dvtUpdate').html(ctVatTu.vatTu.dvt);	
			  	$('#update-so-luong-form input[name=soLuongUpdate]').val(yeuCau.ycSoLuong);
		    } 
		});  
		showForm('search-form','update-so-luong-form',true);
	}
}
function updateYc() {
	var soLuong = $('input[name=soLuongUpdate]').val();
	count = 0;
	$.ajax({
		url: "/QLVatTuYeuCau/updateSoLuong.html",	
	  	type: "GET",
	  	dateType: "JSON",
	  	data: { "soLuong": soLuong},
	  	contentType: 'application/json',
	    mimeType: 'application/json',
	  	
	  	success: function(ycId) {
	  		if (ycId == 'fail')
	  			alert('Số lương yêu cầu không hợp lệ! Số lượng yêu cầu phải lớn hơn số lượng cấp!!!');
	  		else {
	  			alert('cap nhat so luong thanh cong');
	//  			alert('soLuong' + ycId);
	//	  			$('input:radio[name=ctvtId]').prop('checked',false);
	  			$('input[name=soLuongUpdate]').val('0');	
				$('#view-table-yc table tr #soLuong' + ycId).html(soLuong);
	  		}
	  		showForm('search-form','update-so-luong-form',false);
  		}
	});
}
function preCapVatTu() {
	var ycList = [];
	$.each($('#view-table-yc input:checkbox[name=yeuCau]:checked'), function(){
		ycList.push($(this).val());
	})
	var str = ycList.join(', ');
	if (ycList.length == 0)
		alert('Bạn phải chọn 1 yêu cầu để cấp phát!');
	else if (ycList.length > 1)
		alert('Bạn phải chọn 1 yêu cầu để cấp phát!');
	else {
		
		$.ajax({
			url: "/QLVatTuYeuCau/preCapVatTu.html",	
		  	type: "GET",
		  	dateType: "JSON",
		  	data: { "yeuCau": ycList[0]},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
		  	success: function(yeuCau) {
		  		var ctVatTu = yeuCau.ctVatTu;
		  		$('#vtMaCap').html(ctVatTu.vatTu.vtMa);
		  		$('#vtTenCap').html(ctVatTu.vatTu.vtTen);
		  		$('#nsxTenCap').html(ctVatTu.noiSanXuat.nsxTen);
		  		$('#clTenCap').html(ctVatTu.chatLuong.clTen);
		  		$('#dvtCap').html(ctVatTu.vatTu.dvt);	
			  	$('#Cap-so-luong-form input[name=soLuongCap]').val(yeuCau.capSoLuong);
		    } 
		});  
		showForm('search-form','cap-so-luong-form',true)
	}
}
function capVatTu() {
	var soLuong = $('input[name=soLuongCap]').val();
	count = 0;
	$.ajax({
		url: "/QLVatTuYeuCau/capVatTu.html",	
	  	type: "GET",
	  	dateType: "JSON",
	  	data: { "soLuong": soLuong},
	  	contentType: 'application/json',
	    mimeType: 'application/json',
	  	
	  	success: function(ycVatTu) {
	  		if (ycVatTu == 'fail')
	  			alert('Số lương cấp phát không hợp lệ! Số lượng cấp phát phải nhỏ hơn hoặc bằng tổng số lượng yêu cầu!!!');
	  		else {
	  			alert('Cấp phát vật tư thành công');
	  			$('input[name=soLuongCap]').val('0');	
				$('#view-table-yc table tr #soLuongCap' + ycVatTu.ycId).html(ycVatTu.capSoLuong);
	  		}
	  		showForm('search-form','cap-so-luong-form',false);
  		}
	});
}
function searchCtVt(){
	var vtTen = '';
	var vtMa = '';
	var check = $('#checkTen:checked').val();
	if (check != null)
		vtTen = $('#yc-table input[name=search]').val();
	else 
		vtMa = $('#yc-table input[name=search]').val();
	$.ajax({
		url: "/QLVatTuYeuCau/searchCtvtYc.html",	
	  	type: "GET",
		  	dateType: "JSON",
		  	data: { "vtMa": vtMa, "vtTen": vtTen},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
	  	
		  	success: function(objectList){
		  		
		  		var size = objectList[1];
		  		alert(size);	
		  		var ctvtList = objectList[0];
//		  		alert("OK");
		  		var length = ctvtList.length;
		  		alert(objectList[0].noiSanXuat.nsxTen);
//		  		alert(objectList[0][0].vatTu.vtTen);	
		  		if(length > 0){
		  			
		  			$('#view-search table .rowContent').remove();
					for(i = 0; i < length; i++ ) {
						var ctVatTu = ctvtList[i];
						alert(ctVatTu.vatTu.vtTen);
						var style = '';
						if (i % 2 == 1)
							style = 'style=\"background : #CCFFFF;\"';
						var cells =   '<td>' + ctVatTu.vatTu.vtMa + '</td>'
									+ '<td>' + ctVatTu.vatTu.vtTen + '</td>'
									+ '<td>' + ctVatTu.noiSanXuat.nsxTen + '</td>'
									+ '<td>' + ctVatTu.chatLuong.clTen + '</td>'
									+ '<td>' + ctVatTu.dvt.dvtTen + '</td>'
									+ '<td><input class=\"radio\"  type=\"radio\" id="a" name=\"ctvtId\" value=\"' + ctVatTu.ctvtId + '\" onchange=\"preAddSoLuong();\"> </td>';
						var row = '<tr ' +style + '>' + cells + '</tr>';
						$('#view-table-yc table tr:first').after(row);
			  		}
		  		} else {
	  				alert("Không tìm thấy vật tư!");
	  			}
	  			
		  	}
		  	
	});
}
/*
 * keypress event 
 */
$(document).ready(function(){
	$('#add-so-luong-form').keypress(function(e) {
	var key = e.which;
	 if(key == 13)  // the enter key code
	  {
		addSoLuong();
	    return false;  
	  }
	}); 
});
//$(document).ready(function(){
//	$('#add-so-luong-form').keypress(function(e) {
//	var key = e.which;
//	 if(key == 13)  // the enter key code
//	  {
//		addSoLuong();
//	    return false;  
//	  }
//	}); 
//});
$(document).ready(function(){
	$('#update-so-luong-form').keypress(function(e) {
	var key = e.which;
	 if(key == 13)  // the enter key code
	  {
		updateYc();
	    return false;  
	  }
	}); 
});
$(document).ready(function(){
	$('#cap-so-luong-form').keypress(function(e) {
	var key = e.which;
	 if(key == 13)  // the enter key code
	  {
		capVatTu();
	    return false;  
	  }
	}); 
});
/*
 * click event
 */
$(document).ready(function(){
	$('#pre-update-yc').click(function(){
		preUpdateYc();
		//showForm('update-yc-vat-tu','add-yeu-cau-form', true);
		return false;
	});
});	
$(document).ready(function(){
	$('#updateYc').click(function(){
		updateYc();
	});
});
// cap vap tu
$(document).ready(function(){
	$('#preCapVatTu').click(function(){
		preCapVatTu();
	});
});
$(document).ready(function(){
	$('#capVatTu').click(function(){
		capVatTu();
	});
});
$(document).ready(function(){
	$('#yc-table #search').click(function(){
		searchCtVt();
	});
});