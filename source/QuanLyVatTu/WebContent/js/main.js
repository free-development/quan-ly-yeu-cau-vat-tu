/**
 * 
 */
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
			nsxMa = $('input:checkbox[name=nsxMa]:checked').val();
			$.ajax({
				url: "/QuanLyVatTu/preEditNsx.html",	
			  	type: "GET",
			  	dateType: "JSON",
			  	data: { "nsxMa": nsxMa},
			  	contentType: 'application/json',
			    mimeType: 'application/json',
			  	
			  	success: function(nsx) {
				  	$('input:text[name=nsxMaUpdate]').val(nsx.nsxMa);
				  	$('input:text[name=nsxTenUpdate]').val(nsx.nsxTen);
// 				  	alert(nsxList[2].nsxMa);
/*
				               for (i = 0; i < nsxList.length; i++) {                          
				                   $('<option>').val(nsxList[i].nsxMa).text(nsxList[i].nsxTen).appendTo($('#select'));    
				            		}
*/			        
			  		showForm(formId, check);	
			  		
			  	}
			});
// 			event.preventDefault();
		}
		function confirmDelete(){
			nsxMa = $('input:checkbox[name=nsxMa]:checked').val();
			/*nsxList = "";
			for (i = 0; i < nsxMa.length; i++){
				nsxList + nsxMa[i];
			}*/
			if (confirm('Bạn có chắc xóa' + nsxMa))
				deleteNsx(nsxMa);
		}
 		
	 	 function deleteNsx(nsxMa) {
			 
			$.ajax({
				url: "/QuanLyVatTu/deleteNsx.html",	
			  	type: "GET",
			  	dateType: "JSON",
			  	data: { "nsxMa": nsxMa},
			  	contentType: 'application/json',
			    mimeType: 'application/json',
			  	success: function() {
				  	alert(nsxMa + "da bi xoa");
// 				  	jQuery('#view-table input:checkbox').each(function(){
// 			            if(this.checked){
// 			                $this.parents("tr").remove();
// 							$('#nsxMa').remove();
							$('table tr').has('input[name="nsxMa"]:checked').remove();
// 			            }
// 			        })
			    } 
			});  
		} 
	 	
	 	/*function addNsx() {
			nsxMa = $('#add-form input:text[name=nsxMa]').val();
			nsxTen = $('#add-form input:text[name=nsxTen]').val();
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
			  		<td class="left-column"><input type="checkbox" name="nsxMa" value="<%=noiSanXuat.getNsxMa() %>" class="checkbox"></td>
			  		$('#view-table table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"nsxMa\" value=\"' +nsx.nsxMa + '\"</td><td class=\"col\">\"+ nsxMa +\"</tr><tr>\" + nsxTen+\"</tr>');
			  		showForm("add-form", false);	
			  	}
			});*/
		//}