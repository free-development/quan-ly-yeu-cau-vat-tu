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
    //document.getElementById('danh-sach-vat-tu').style.display="none";
    
};
/*
function searchCtvt() {
	var vtMa = $('input:text[name=vtMa]').val();
	var vtTen = $('input:text[name=vtTen]').val();
	var nsx = $('select[name=nsx]').val();
	var chatLuong = $('select[name=chatLuong]').val();
	//alert(vtMa + vtTen + nsx + chatLuong);
	$.ajax({
		url: "/QuanLyVatTuYeuCau/searchCtvt.html",	
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
*/
function preAddSoLuong(){
//	$(document).ready(function() {
//		$('#view-search input:checkbox[name=ctvtId]').clicked(function() {
//			var ctvtId = this.val();
	var ctvtId = $('#view-search input:radio[name=ctvtId]:checked').val();
			$.ajax({
				url: "/QuanLyVatTuYeuCau/preAddSoLuong.html",	
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
			  		$('#dvtAdd').html(ctvt.vatTu.dvt.dvtTen);
			  	}
			});
				
			showForm('add-yeu-cau-form','add-so-luong-form',true);
			$('#danh-sach-vat-tu').hide();
//		});
//	});	
};

function addSoLuong(){
	var soLuong = $('input[name=soLuongAdd]').val();
	count = 0;
	$.ajax({
		url: "/QuanLyVatTuYeuCau/addSoLuong.html",	
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
					+ '<td>' + ctVatTu.vatTu.dvt.dvtTen + '</td>'
					+ '<td>' + yeuCau.ycSoLuong + '</td>';
					
	  			var row = '<tr id=\"' + yeuCau.ycId +'\"> ' + cells + + '</tr>';
	  			if (yeuCau.ycSoLuong == soLuong) {
		  			$('#view-table-yc table tr:first').after(row);
	  			}
	  			else {
	  				$('#view-table-yc table #' + yeuCau.ycId).html(cells);
	  			}
	  			showForm('add-yeu-cau-form','add-so-luong-form',false);
	  			$('#danh-sach-vat-tu').show();
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
	else if(confirm('Ban co chac xoa yeu cau?'))
		deleteYc(str);
};
function deleteYc(ycList) {	
	$.ajax({
		url: "/QuanLyVatTuYeuCau/deleteYc.html",	
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
	$.each($('input:checkbox[name=yeuCau]:checked'), function(){
		ycList.push($(this).val());
	})
	var str = ycList.join(', ');
	if (ycList.length == 0)
		alert('Bạn phải chọn 1 yêu cầu để sửa đổi!');
	else if (ycList.length > 1)
		alert('Bạn phải chọn 1 yêu cầu để sửa đổi!');
	else {
		
		$.ajax({
			url: "/QuanLyVatTuYeuCau/preUpdateYc.html",	
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
		  		$('#dvtUpdate').html(ctVatTu.vatTu.dvt.dvtTen);	
			  	$('#update-so-luong-form input[name=soLuongUpdate]').val(yeuCau.ycSoLuong);
		    } 
		});  
		showForm('add-yeu-cau-form','update-so-luong-form',true);
		$('#danh-sach-vat-tu').hide();
	}
}
function updateYc() {
	var soLuong = $('input[name=soLuongUpdate]').val();
	count = 0;
	$.ajax({
		url: "/QuanLyVatTuYeuCau/updateSoLuong.html",	
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
	  		showForm('add-yeu-cau-form','update-so-luong-form',false);
	  		$('#danh-sach-vat-tu').show();
  		}
	});
}
function preCapVatTu() {
	var ycList = [];
	$.each($('input:checkbox[name=yeuCau]:checked'), function(){
		ycList.push($(this).val());
	})
	var str = ycList.join(', ');
	if (ycList.length == 0)
		alert('Bạn phải chọn 1 yêu cầu để cấp phát!');
	else if (ycList.length > 1)
		alert('Bạn phải chọn 1 yêu cầu để cấp phát!');
	else {
		
		$.ajax({
			url: "/QuanLyVatTuYeuCau/preCapVatTu.html",	
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
		  		$('#dvtCap').html(ctVatTu.vatTu.dvt.dvtTen);	
			  	$('#Cap-so-luong-form input[name=soLuongCap]').val(yeuCau.capSoLuong);
		    } 
		});  
		showForm('add-yeu-cau-form','cap-so-luong-form',true);
		$('#danh-sach-vat-tu').hide();
	}
}
function capVatTu() {
	var soLuong = $('input[name=soLuongCap]').val();
	count = 0;
	$.ajax({
		url: "/QuanLyVatTuYeuCau/capVatTu.html",	
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
	  		showForm('add-yeu-cau-form','cap-so-luong-form',false);
	  		$('#danh-sach-vat-tu').show();
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
		url: "/QuanLyVatTuYeuCau/searchCtvtYc.html",	
	  	type: "GET",
		  	dateType: "JSON",
		  	data: { "vtMa": vtMa, "vtTen": vtTen},
		  	contentType: 'application/json',
		    mimeType: 'application/json',
	  	
		  	success: function(objectList){
		  		
		  		var size = objectList[1];
		  		var ctvtList = objectList[0];
		  		var length = ctvtList.length;
		  		if(length > 0){
		  			
		  			$('#view-table-ds table .rowContent').remove();
					for(i = 0; i < length; i++ ) {
						var ctVatTu = ctvtList[i];
//						alert(ctVatTu.vatTu.vtTen);
						var style = '';
						if (i % 2 == 1)
							style = 'style=\"background : #CCFFFF;\"';
						var cells =   '<td>' + ctVatTu.vatTu.vtMa + '</td>'
									+ '<td>' + ctVatTu.vatTu.vtTen + '</td>'
									+ '<td>' + ctVatTu.noiSanXuat.nsxTen + '</td>'
									+ '<td>' + ctVatTu.chatLuong.clTen + '</td>'
									+ '<td>' + ctVatTu.vatTu.dvt.dvtTen + '</td>'
									+ '<td><input class=\"radio\"  type=\"radio\" id="a" name=\"ctvtId\" value=\"' + ctVatTu.ctvtId + '\" onchange=\"preAddSoLuong();\"> </td>';
						var row = '<tr ' +style + ' class=\"rowContent\">' + cells + '</tr>';
						$('#view-table-ds table tr:first').after(row);
					}
					
						var strPage = '';
						for (i = 0; i <= size; i++) {
							strPage += '<input type=\"button\" class=\"page\" name="\page\" value=\"' + (i + 1) + '\">  ';
							if (i == 10)
								break;
						}
						if (size > 10)
							strPage = '<input type=\"button\" name="\page\" class=\"page\" value=\"<< privious\"> ' +strPage + ' <input type=\"button\" name="\page\" class=\"page\" value=\">> next\">'
						//$('#paging').html(strPage);
						
		  		} else {
	  				alert("Không tìm thấy vật tư!");
	  			}
	  			
		  	}
		  	
	});
};
function loadPageCtvtYc(pageNumber) {
	$.ajax({
		url: "/QuanLyVatTuYeuCau/loadPageCtvtYc.html",	
	  	type: "GET",
	  	dateType: "JSON",
	  	data: { "pageNumber": pageNumber},
	  	contentType: 'application/json',
	    mimeType: 'application/json',
	  	
	  	success: function(objectList) {
	  		var size = objectList[1];
	  		var ctvtList = objectList[0];
	  		var length = ctvtList.length;
	  			$('#view-table-ds table .rowContent').remove();
				for(i = 0; i < length; i++ ) {
					var ctVatTu = ctvtList[i];
//					alert(ctVatTu.vatTu.vtTen);
					var style = '';
					if (i % 2 == 0)
						style = 'style=\"background : #CCFFFF;\"';
					var cells =   '<td>' + ctVatTu.vatTu.vtMa + '</td>'
								+ '<td>' + ctVatTu.vatTu.vtTen + '</td>'
								+ '<td>' + ctVatTu.noiSanXuat.nsxTen + '</td>'
								+ '<td>' + ctVatTu.chatLuong.clTen + '</td>'
								+ '<td>' + ctVatTu.vatTu.dvt.dvtTen + '</td>'
								+ '<td><input class=\"radio\"  type=\"radio\" id="a" name=\"ctvtId\" value=\"' + ctVatTu.ctvtId + '\" onchange=\"preAddSoLuong();\"> </td>';
					var row = '<tr ' +style + 'class = \"rowContent\">' + cells + '</tr>';
					$('#view-table-ds table tr:first').after(row);
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
$(document).ready(function(){
	$('.page').click(function(){
		loadPageCtvtYc($(this).val());
	});
});