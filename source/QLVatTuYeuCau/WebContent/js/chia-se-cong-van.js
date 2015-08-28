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
function confirmDelete(){
	return confirm('Bạn có chắc xóa');
}
//$(document).ready(function() {
//	$('#update').click(function(){
//		alert('OK');
//	});
//});

$(document).ready(function() {
	$('#update').click(function() {
		var msnv = $('#view-chia-se input:checkbox[name=msnv]:checked').val();
		alert(msnv);
		var msnvList = [];
		$.each($('#view-chia-se input:checkbox[name=msnv]:checked'), function(){            
			msnvList.push($(this).val());
		});

		if (msnvList.length == 0)
			alert('Bạn phải chọn 1 nhân viên để thay đổi!!');
		else if (msnvList.length > 1)
			alert('Bạn chỉ được chọn 1 nhân viên để thay đổi!!');
		else {
			$.ajax({
				url: "/QLVatTuYeuCau/preUpdateYeuCau.html",	
			  	type: "GET",
			  	dateType: "JSON",
			  	data: { "msnv": msnv},
			  	contentType: 'application/json',
			    mimeType: 'application/json',
			  	success: function(objectList) {
			  		var nguoiDung = objectList[0];
			  		var vaiTroList = objectList[1];
			  		var vtCongVanList= objectList[2];
			  		var head = '';
			  		var length = vaiTroList.length;
			  		for(var i = 0; i < length; i++) {
			  			head += '<th>' + vaiTroList[i].vtTen + '</th>';
			  		}
			  		head = '<tr><th>Msnv</th>' + head + '</tr>';
			  		
			  		var content = '';
			  		for(var i = 0; i < length; i++) {
			  			content += '<td><input type=\"checkbox\" class=\"checkbox\" name=\"vaiTro\" value=\"' + vaiTroList[i].vtId + '\" id=\"' + vaiTroList[i].vtId + '\"></td>';
			  		}
			  		content = '<tr><td>' + nguoiDung +'</td>' + content + '</tr>';
			  		var button = '<button type=\"button\" class=\"button\" id=\"updateCs\">Luu lai</button>';
			  		
			  		$('#update-form table').html(head + content + button);
			  		//$('#updateButton').html(button);
			  		alert(vtCongVanList.length);
			  		for (var i = 0; i < vtCongVanList.length; i++) {
//			  			alert('#update #'+vtCongVanList[i].vtId);
			  			$('#'+vtCongVanList[i].vtId).prop('checked',true);
			  		}
			  	}
			});
			$('#main-form').hide();
			$('#update-form').show();
			
		}	
	});   
});
$(document).ready(function() {
	$('#updateCs').click(function() {
		var vaiTro = $('#update-form input:checkbox[name=vaiTro]:checked').val();
//		alert(msnv);
		var vaiTroList = [];
		$.each($('#update-form input:checkbox[name=vaiTro]:checked'), function(){            
			vaiTroList.push($(this).val());
		});
		var str = vaiTroList.join(', ');
			$.ajax({
				url: "/QLVatTuYeuCau/updateYeuCau.html",	
			  	type: "GET",
			  	dateType: "JSON",
			  	data: { "vaiTroList": str},
			  	contentType: 'application/json',
			    mimeType: 'application/json',
			  	success: function(objectList) {
//			  		alert('OK');
			  		content = objectList[0];
			  		msnv = objectList[1];
			  		if (content == "delete") {
			  			$('#view-chia-se table tr').has('input[name="msnv"]:checked').remove();
//			  			alert('Ban da d')
			  		}
			  		else {
			  			$('#vaiTro' + msnv).html(content);
			  		}
			  	}
			});
			$('#main-form').show();
			$('#update-form').hide();
			
	});   
});