﻿<%@page import="model.DonVi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="map.siteMap"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Văn phòng điện tử công ty điện lực Cần Thơ</title>
<link rel="stylesheet" href="style/style-giao-dien-chinh.css"
	type="text/css">
<link rel="stylesheet" href="style/style.css" type="text/css">
<link href="style/style-bo-phan.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="style/style-noi-san-xuat.css"
	type="text/css">
<link
	href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.6.3.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
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
	
		function preUpdateBp(formId, check){
			dvMa = $('input:checkbox[name=dvMa]:checked').val();
				$.ajax({
					url: "/QuanLyVatTu/preEditBp.html",
					type: "GET",
					dataType: "JSON",
					data: {"dvMa": dvMa},
					contentType: "application/json",
					mimeType: "application/json",
					
					success: function(dv){
						
						$('input:text[name=dvMaUpdate]').val(dv.dvMa);
					  	$('input:text[name=dvTenUpdate]').val(dv.dvTen);
					  	$('input:text[name=sdtUpdate]').val(dv.sdt);
					  	$('input:text[name=diaChiUpdate]').val(dv.diaChi);
					  	$('input:email[name=emailUpdate]').val(dv.email);
					  	showForm(formId, check);
					}
				});
		}
		function addBp() {
 			dvMa = $('#add-form input:text[name=dvMa]').val();
 			dvTen = $('#add-form input:text[name=dvTen]').val();
 			sdt = $('#add-form input:text[name=sdt]').val();
 			diaChi = $('#add-form input:text[name=diaChi]').val();
 			email = $('#add-form input:email[name=email]').val();
 			$.ajax({
 				url: "/QuanLyVatTu/addBp.html",	
			  	type: "GET",
 			  	dateType: "JSON",
 			  	data: { "dvMa": dvMa, "dvTen": dvTen, "sdt": sdt, "diaChi": diaChi, "email": email},
 			  	contentType: 'application/json',
 			    mimeType: 'application/json',
			  	
 			  	success: function(dv) {
//  				  	$('input:text[name=vtId]').val(vt.vtId);
//  				  	$('input:text[name=vtTen]').val(vt.vtTen);
					$('#view-table table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"dvMa\" value=\"'+dv.dvMa + '\"</td><td class=\"col\">'
							 + dvMa +'</td><td class=\"col\">' 
							 + dvTen+'</td><td class=\"col\">' 
							 + sdt+'</td><td class=\"col\">' 
							 + diaChi+'</td><td class=\"col\">' 
							 + email+'</td></tr>');
					$('#add-form input:text[name=dvMa]').val('');
		 			$('#add-form input:text[name=dvTen]').val('');
		 			$('#add-form input:text[name=sdt]').val('');
		 			$('#add-form input:text[name=diaChi]').val('');
		 			$('#add-form input:email[name=email]').val('');
			  		showForm("add-form", false);	
 			  	}
 			});
 		}
 	 	function confirmUpdateBp(){
			var dvMaUpdate = $('input:text[name=dvMaUpdate]').val();
			var dvTenUpdate = $('input:text[name=dvTenUpdate]').val();
			var sdtUpdate = $('input:text[name=sdtUpdate]').val('');
 			var diaChiUpdate = $('input:text[name=diaChiUpdate]').val('');
 			var emailUpdate = $('input:email[name=emailUpdate]').val('');
			if (confirm('Bạn có chắc thay đổi đơn vị có mã ' + dvMaUpdate))
				updateBp(dvMaUpdate, dvTenUpdate, sdtUpdate, diaChiUpdate, emailUpdate);
		}
 	 	function updateBp(dvMaUpdate, dvTenUpdate, sdtUpdate, diaChiUpdate, emailUpdate) {

			$.ajax({
				url: "/QuanLyVatTu/updateBp.html",	
			  	type: "GET",
			  	dateType: "JSON",
			  	data: { "dvMaUpdate": dvMaUpdate, "dvTenUpdate": dvTenUpdate, "sdtUpdate": sdtUpdate, "diaChiUpdate": diaChiUpdate, "emailUpdate": emailUpdate},
			  	contentType: 'application/json',
			    mimeType: 'application/json',
			  	
			  	success: function(dv) {
			  		$('table tr').has('input[name="dvMa"]:checked').remove();
					$('#view-table table tr:first').after('<tr><td class=\"left-column\"><input type=\"checkbox\" name=\"dvMa\" value=\"'+dvMaUpdate + '\"</td><td class=\"col\">'
							 + dvMaUpdate +'</td><td class=\"col\">' 
							 + dvTenUpdate +'</td><td class=\"col\">' 
							 + sdtUpdate +'</td><td class=\"col\">' 
							 + diaChiUpdate +'</td><td class=\"col\">' 
							 + emailUpdate +'</td></tr>');
			  		$('input:text[name=dvMaUpdate]').val('');
					dvTenUpdate = $('input:text[name=dvTenUpdate]').val('');
					sdtUpdate = $('input:text[name=sdtUpdate]').val('');
					diaChiUpdate = $('input:text[name=diaChiUpdate]').val('');
					emailUpdate = $('input:email[name=emailUpdate]').val('');
			  		showForm("update-form", false);	
			  	}
			});
		}
		function confirmDelete(){
			dvMa = $('input:checkbox[name=dvMa]:checked').val();
			if (confirm('Bạn có chắc xóa' + dvMa))
				deleteBp(dvMa);
		}
 		
	 	 function deleteBp(dvMa) {
			 
			$.ajax({
				url: "/QuanLyVatTu/deleteBp.html",	
			  	type: "GET",
			  	dateType: "JSON",
			  	data: { "dvMa": dvMa},
			  	contentType: 'application/json',
			    mimeType: 'application/json',
			  	success: function() {
				  	alert(dvMa + "da bi xoa");
							$('table tr').has('input[name="dvMa"]:checked').remove();
			    } 
			});  
		}
	</script>
<script>
    $(document).ready(function() {
        $('.checkAll').click(function(event) {  //on click 
            if(this.checked) { // check select status
                $('.checkbox').each(function() { //loop through each checkbox
                    this.checked = true;  //select all checkboxes with class "checkbox1"               
                });
            }else{
                $('.checkbox').each(function() { //loop through each checkbox
                    this.checked = false; //deselect all checkboxes with class "checkbox1"                       
                });         
            }
        });
        
    });
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="img/logo16.png" type="image/x-icon" />
</head>
<body>

	<%
    		ArrayList<DonVi> listDonVi = (ArrayList<DonVi>) request.getAttribute("donViList");
    	%>
	<div class="wrapper">
		<div class="header">
			<!--
					<img src="img/logo.png" alt="" id="logo" width=80 height=80/><br/>
					<img src="img/textlogo.png" alt="" id="logo" width=80 height=20/>
	-->
			<div id="top_title">Văn phòng điện tử</div>
			<div id="bottom-title">Công ty điện lực cần thơ</div>
			<div class="search_form" id="search">
				<form action="" method="post">
					<!--
							<span class="search-select">
								<select name="" ><option disabled selected>--Tùy chọn kiếm kiềm--</option></select>
								<option value=""></option>
							</span>
-->

					<span class="search-text"> &nbsp; <input type="search"
						class="search" name="search_box" name="search"
						placeholder="Tìm kiếm" />
					</span> <span class="search-button"> &nbsp;
						<button class="btn-search">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</form>
			</div>

		</div>
		<div class="main_menu">
			<ul>
				<li><a href="">Trang chủ</a></li>
				<li><a href="">Danh mục</a>
					<ul>
<<<<<<< HEAD
						<li><a href="">Trang chủ</a></li>
						<li><a href="">Danh mục</a>
							<ul>
								<li><a href="<%=siteMap.nsxManage + "?action=manageNsx"%>">Danh mục nơi sản xuất</a></li>
								<li><a href="<%=siteMap.clManage + "?action=manageCl"%>">Danh mục chất lượng</a></li>
								<li><a href="<%=siteMap.ctvtManage + "?action=manageCtvt"%>">Danh mục vật tư</a></li>
								<li><a href="<%=siteMap.bpsdManage + "?action=manageBpsd"%>">Danh mục bộ phận sử dụng</a></li>
								<li><a href="<%=siteMap.mdManage + "?action=manageMd"%>">Danh mục mục đích</a></li>
								<li><a href="<%=siteMap.vtManage + "?action=manageVt"%>">Danh mục vai trò</a></li>
							</ul>
						</li>
						<li><a href="danh-muc-cong-van.html">Công văn</a></li>
						<li><a href="bao-cao.html">Báo cáo</a></li>
<!--						<li><a href="danh-muc-chia-se-cong-van.html">Chia sẽ</a></li>-->
						<li><a href"<%=siteMap.ndManage + "?action=manageNd"%>">Quản lý người dùng</a></li>
					</ul>
					<div class="clear"></div>
				</div>
	
				<div id="main-content">
					<div id="title-content">
		 Danh mục bộ phận sử dụng
=======
						<li><a href="<%=siteMap.nsxManage + "?action=manageNsx"%>">Danh
								mục nơi sản xuất</a></li>
						<li><a href="<%=siteMap.clManage + "?action=manageCl"%>">Danh
								mục chất lượng</a></li>
						<li><a href="<%=siteMap.ctvtManage + "?action=manageCtvt"%>">Danh
								mục vật tư</a></li>
						<li><a href="<%=siteMap.bpsdManage + "?action=manageBpsd"%>">Danh
								mục bộ phận sử dụng</a></li>
						<li><a href="<%=siteMap.mdManage + "?action=manageMd"%>">Danh
								mục mục đích</a></li>
						<li><a href="<%=siteMap.vtManage + "?action=manageVt"%>">Danh
								mục vai trò</a></li>
					</ul></li>
				<li><a href="danh-muc-cong-van.html">Công văn</a></li>
				<li><a href="bao-cao.html">Báo cáo</a></li>
				<!--						<li><a href="danh-muc-chia-se-cong-van.html">Chia sẽ</a></li>-->
				<li><ahref"<%=siteMap.ndManage + "?action=manageNd"%>">Quản lý người dùng</a></li>
			</ul>
			<div class="clear"></div>
>>>>>>> origin/master
		</div>

		<div id="main-content">
<<<<<<< HEAD
			
			<form id="main-form">
				<div id="view-table-bo-phan" class="scroll-nsx">
					<table>
						<tr>
							<th class="left-column"><input type="checkbox" class="checkAll"></th>
							<th class="mid-column">Mã BPSD</th>
							<th class="column-2">Tên bộ phận</th>
                            <th class="mid-column">Số điện thoại</th>
							<th class="column-4">Địa chỉ</th>
                            <th class="column-5">Email</th>
						</tr>
						<%
							if(listDonVi != null) {
							int count = 0;
							for(DonVi donVi : listDonVi) {count++ ;%>
						<tr<%if (count % 2 == 0) out.println("style=\"background : #CCFFFF;\"");%>>
							<td class="left-column"><input type="checkbox" name="dvMa" value="<%=donVi.getDvMa() %>" class="checkbox"></td>
							<td class="col"><%=donVi.getDvMa() %></td>
							<td class="col"><%=donVi.getDvTen()%></td>
                            <td class="col"><%=donVi.getSdt()%></td>
                            <td class="col"><%=donVi.getDiaChi()%></td>
                            <td class="col"><%=donVi.getEmail()%></td>
						</tr>
						<%} }%>
                    </table>		
				</div>				
				
				<div class="group-button-bo-phan">
					<input type="hidden" name="action" value="deleteBpsd">
					<button type="button" class="button"  onclick="showForm('add-form', true)"><i class="fa fa-plus-circle"></i>&nbsp;Thêm</button>&nbsp;&nbsp;
					<button type="button" class="button" onclick="preUpdateBp('update-form', true);"><i class="fa fa-pencil fa-fw"></i>&nbsp;Thay đổi</button>&nbsp;&nbsp;
					<button class="button" onclick="confirmDelete();"> <i class="fa fa-trash-o" ></i>&nbsp;&nbsp;Xóa</button>&nbsp;&nbsp;<button class="button" type="reset"><i class="fa fa-spinner"></i>&nbsp;&nbsp;Bỏ qua</button>&nbsp;&nbsp;<button type="button" class="button"><i class="fa fa-sign-out"></i>Thoát</button>
				</div>
			</form>	
<!-------------- --add-form-------------- -->
			<form id="add-form" method="get" action="<%=siteMap.bpsdManage + "?action=manageBpsd"%>">
				<div class="input-table-bo-phan">
					<table>
						<div class="form-title">Thêm bộ phận sử dụng</div>
						<tr>
							<td class="input"><label for="MBPSD" class="input">Mã BPSD</label></td>
							<td><input name="dvMa" type="text" class="text" required autofocus size="3" maxlength="3" pattern="[a-zA-Z0-9]{3}" title="Mã bộ phận sử dụng chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"></td>
						</tr>
						<tr>
							<td class="input"><label for="MBPSD">Tên BPSD</label></td>
							<td><input name="dvTen" size="30px" align=left type="text" class="text" required title="Tên bộ phận sử dụng không được để trống"></td>
						</tr>
                         <tr>
                        <td class="input"><label>Số điện thoại</label></td>
                            <td><input name="sdt" size="15px" maxlength="11" type="text" class="text"></td>
                        </tr>
                        <tr>
                            <td class="input"><label>Địa chỉ</label></td>
							<td><input name="diaChi" size="30px" align=left type="text" class="text"></td>
                        </tr>
                        <tr>
                            <td class="input"><label>Email</label></td>
                            <td><input name="email" size="30px" align=left type="email" class="text"></td>                         
                        </tr>
                       
<!--
=======
			<div id="title-content">Danh mục bộ phận sử dụng</div>
			<div id="main-content">

				<form id="main-form">
					<div id="view-table-bo-phan" class="scroll-nsx">
						<table>
							<tr>
								<th class="left-column"><input type="checkbox"
									class="checkAll"></th>
								<th class="mid-column">Mã BPSD</th>
								<th class="column-2">Tên bộ phận</th>
								<th class="mid-column">Số điện thoại</th>
								<th class="column-4">Địa chỉ</th>
								<th class="column-5">Email</th>
							</tr>
							<%
							if(listDonVi != null) {
							int count = 0;
							for(DonVi donVi : listDonVi) {count++ ;%>
							<tr
								<%if (count % 2 == 0) out.println("style=\"background : #CCFFFF;\"");%>>
								<td class="left-column"><input type="checkbox" name="dvMa"
									value="<%=donVi.getDvMa() %>" class="checkbox"></td>
								<td class="col"><%=donVi.getDvMa() %></td>
								<td class="col"><%=donVi.getDvTen()%></td>
								<td class="col"><%=donVi.getSdt()%></td>
								<td class="col"><%=donVi.getDiaChi()%></td>
								<td class="col"><%=donVi.getEmail()%></td>
							</tr>
							<%} }%>
						</table>
					</div>

					<div class="group-button-bo-phan">
						<input type="hidden" name="action" value="deleteBpsd">
						<button type="button" class="button"
							onclick="showForm('add-form', true)">
							<i class="fa fa-plus-circle"></i>&nbsp;Thêm
						</button>
						&nbsp;&nbsp;
						<button type="button" class="button"
							onclick="preUpdateBp('update-form', true);">
							<i class="fa fa-pencil fa-fw"></i>&nbsp;Thay đổi
						</button>
						&nbsp;&nbsp;
						<button class="button" onclick="confirmDelete();">
							<i class="fa fa-trash-o"></i>&nbsp;&nbsp;Xóa
						</button>
						&nbsp;&nbsp;
						<button class="button" type="reset">
							<i class="fa fa-spinner"></i>&nbsp;&nbsp;Bỏ qua
						</button>
						&nbsp;&nbsp;
						<button type="button" class="button">
							<i class="fa fa-sign-out"></i>Thoát
						</button>
					</div>
				</form>
				<!-------------- --add-form-------------- -->
				<form id="add-form" method="get"
					action="<%=siteMap.bpsdManage + "?action=manageBpsd"%>">
					<div class="input-table-bo-phan">
						<table>
							<div class="form-title">Thêm bộ phận sử dụng</div>
							<tr>
								<td class="input"><label for="MBPSD" class="input">Mã
										BPSD</label></td>
								<td><input name="dvMa" type="text" class="text" required
									autofocus size="3" maxlength="3" pattern="[a-zA-Z0-9]{3}"
									title="Mã bộ phận sử dụng chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"></td>
							</tr>
							<tr>
								<td class="input"><label for="MBPSD">Tên BPSD</label></td>
								<td><input name="dvTen" size="30px" align=left type="text"
									class="text" required
									title="Tên bộ phận sử dụng không được để trống"></td>
							</tr>
							<tr>
								<td class="input"><label>Số điện thoại</label></td>
								<td><input name="sdt" size="15px" maxlength="11"
									type="text" class="text"></td>
							</tr>
							<tr>
								<td class="input"><label>Địa chỉ</label></td>
								<td><input name="diaChi" size="30px" align=left type="text"
									class="text"></td>
							</tr>
							<tr>
								<td class="input"><label>Email</label></td>
								<td><input name="email" size="30px" align=left type="email"
									class="text"></td>
							</tr>

							<!--
>>>>>>> origin/master
                        <tr>
                            <td class="input"><label>Số TK</label></td>
							<td><input name="" size="15px" align=left type="text" class="text"></td>                            
                        </tr>
                        <tr>
                        <td class="input"><label>Mã số thuế</label></td>
                            <td><input name="" align=left type="text" class="text"></td>
                        </tr>
                        <tr>
                            <td class="input"><label>Loại BP</label></td>
							<td><select name = "" required class="select">
                                    <option class="option" value=""></option>
                                    <option value="" class="option">AAAAAAAAAA</option>
                                    <option>AAAAAAAAAA</option>
                                </select>
                            </td>
                        </tr>
-->
<<<<<<< HEAD
					</table>
				</div>
				<div class="button-group">
						<input type="hidden" name="action" value = "AddBpsd"> 
						<button type="button" class="button" onclick="addBp();"><i class="fa fa-plus-circle"></i>&nbsp;Thêm</button>
						<button type="reset" class="button"><i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại</button>
						<button type="button" class="button" onclick="showForm('add-form', false)"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
				</div>			
			</form>
			
<!-- ---------------Update form-------------- -->			
			<form id="update-form">
				<div class="input-table">
					<table>
						<div class="form-title">Cập nhật bộ phận sử dụng</div>
						<tr>
							<td class="input"><label for="MBPSD" class="input">Mã BPSD</label></td>
							<td><input name="dvMaUpdate" type="text" class="text" required autofocus size="2" maxlength="3" pattern="[a-zA-Z0-9]{3}" title="Mã bộ phận sử dụng chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"></td>
						</tr>
						<tr>
							<td class="input"><label for="MBPSD">Tên BPSD</label></td>
							<td><input name="dvTenUpdate" size="30px" align=left type="text" class="text" required title="Tên bộ phận sử dụng không được để trống"></td>
						</tr>
                         <tr>
                        <td class="input"><label>Số điện thoại</label></td>
                            <td><input name="sdtUpdate" size="15px" align=left type="text" class="text"></td>
                        </tr>
                        <tr>
                            <td class="input"><label>Địa chỉ</label></td>
							<td><input name="diaChiUpdate" size="30px" align=left type="text" class="text"></td>
                        </tr>
                        <tr>
                            <td class="input"><label>Email</label></td>
                            <td><input name="emailUpdate" size="30px" align=left type="email" class="text"></td>                         
                        </tr>
                       
<!--
=======
						</table>
					</div>
					<div class="button-group">
						<input type="hidden" name="action" value="AddBpsd">
						<button type="button" class="button" onclick="addBp();">
							<i class="fa fa-plus-circle"></i>&nbsp;Thêm
						</button>
						<button type="reset" class="button">
							<i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại
						</button>
						<button type="button" class="button"
							onclick="showForm('add-form', false)">
							<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
						</button>
					</div>
				</form>

				<!-- ---------------Update form-------------- -->
				<form id="update-form">
					<div class="input-table">
						<table>
							<div class="form-title">Cập nhật bộ phận sử dụng</div>
							<tr>
								<td class="input"><label for="MBPSD" class="input">Mã
										BPSD</label></td>
								<td><input name="dvMaUpdate" type="text" class="text"
									required autofocus size="2" maxlength="3"
									pattern="[a-zA-Z0-9]{3}"
									title="Mã bộ phận sử dụng chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"></td>
							</tr>
							<tr>
								<td class="input"><label for="MBPSD">Tên BPSD</label></td>
								<td><input name="dvTenUpdate" size="30px" align=left
									type="text" class="text" required
									title="Tên bộ phận sử dụng không được để trống"></td>
							</tr>
							<tr>
								<td class="input"><label>Số điện thoại</label></td>
								<td><input name="sdtUpdate" size="15px" align=left
									type="text" class="text"></td>
							</tr>
							<tr>
								<td class="input"><label>Địa chỉ</label></td>
								<td><input name="diaChiUpdate" size="30px" align=left
									type="text" class="text"></td>
							</tr>
							<tr>
								<td class="input"><label>Email</label></td>
								<td><input name="emailUpdate" size="30px" align=left
									type="email" class="text"></td>
							</tr>

							<!--
>>>>>>> origin/master
                        <tr>
                            <td class="input"><label>Số TK</label></td>
							<td><input name="" size="15px" align=left type="text" class="text"></td>                            
                        </tr>
                        <tr>
                        <td class="input"><label>Mã số thuế</label></td>
                            <td><input name="" align=left type="text" class="text"></td>
                        </tr>
                        <tr>
                            <td class="input"><label>Loại BP</label></td>
							<td><select name = "" required class="select">
                                    <option class="option" value=""></option>
                                    <option value="" class="option">AAAAAAAAAA</option>
                                    <option>AAAAAAAAAA</option>
                                </select>
                            </td>
                        </tr>
-->
						</table>
					</div>
					<div class="button-group">
						<button type="button" class="button" onclick="confirmUpdateBp();">
							<i class="fa fa-plus-circle"></i>&nbsp;Lưu lại
						</button>
						<button type="reset" class="button">
							<i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại
						</button>
						<button type="button" class="button"
							onclick="showForm('update-form', false)">
							<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
						</button>
					</div>
				</form>
			</div>
		</div>

	</div>
</body>
</html>