
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
		function update(formId, check) {
			clMa = $('input:checkbox[name=clMa]:checked').val();
			$.ajax({
				url: "/QuanLyVatTu/preEditCl.html",	
			  	type: "GET",
			  	dateType: "JSON",
			  	data: { "clMa": clMa},
			  	contentType: 'application/json',
			    mimeType: 'application/json',
			  	
			  	success: function(cl) {
				  	$('input:text[name=clMaUpdate]').val(cl.clMa);
				  	$('input:text[name=clTenUpdate]').val(cl.clTen);
// 				  	alert(clList[2].clMa);
/*
				               for (i = 0; i < clList.length; i++) {                          
				                   $('<option>').val(clList[i].clMa).text(clList[i].clTen).appendTo($('#select'));    
				            		}
*/			        
			  		showForm(formId, check);	
			  		
			  	}
			});
// 			event.preventDefault();
		}
		function confirmDelete(){
			clMa = $('input:checkbox[name=clMa]:checked').val();
			if (confirm('Bạn có chắc xóa' + clMa))
				deleteCl(clMa);
		}
 		
	 	 function deleteCl(clMa) {
			 
			$.ajax({
				url: "/QuanLyVatTu/deleteCl.html",	
			  	type: "GET",
			  	dateType: "JSON",
			  	data: { "clMa": clMa},
			  	contentType: 'application/json',
			    mimeType: 'application/json',
			  	success: function() {
				  	alert(clMa + "da bi xoa");
							$('table tr').has('input[name="clMa"]:checked').remove();
			    } 
			});  
		}  