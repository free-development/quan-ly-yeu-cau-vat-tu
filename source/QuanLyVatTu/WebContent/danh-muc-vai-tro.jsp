﻿<%@page import="model.VaiTro"%>
<%@page import="map.siteMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Văn phòng điện tử công ty điện lực Cần Thơ</title>
        <link rel="stylesheet" href="style/style-giao-dien-chinh.css" type="text/css">
		<link rel="stylesheet" href="style/style-noi-san-xuat.css" type="text/css">
        <link rel="stylesheet" href="style/style.css" type="text/css">
		<link href="style/style-muc-dich.css" type="text/css" rel="stylesheet">
    <link href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/vaitro.js"></script>
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
		function update(formId, check){
			vtId = $('input:checkbox[name=vtId]:checked').val();
				$.ajax({
					url: "/QuanLyVatTu/preEditVt.html",
					type: "GET",
					dataType: "JSON",
					data: {"vtId": vtId},
					contentType: "application/json",
					mimeType: "application/json",
					
					success: function(vt){
						
						$('input:text[name=vtIdUpdate]').val(vt.vtId);
					  	$('input:text[name=vtTenUpdate]').val(vt.vtTen);
					  	
					  	showForm(formId, check);
					}
				});
		}
		function confirmDelete(){
			nsxMa = $('input:checkbox[name=nsxMa]:checked').val();
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
							$('table tr').has('input[name="nsxMa"]:checked').remove();
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
    		String error = (String) request.getAttribute("error");
    		ArrayList<VaiTro> listVaiTro = (ArrayList<VaiTro>) request.getAttribute("vaiTroList");
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
							
							<span class="search-text">
								&nbsp;
							<input type="search" class="search" name="search_box" name="search" placeholder="Tìm kiếm" />
							</span>
							<span class="search-button">
							&nbsp;
							<button class="btn-search"><i class="fa fa-search" ></i></button>
							</span>
						</form>
					</div>
					
				</div>
				<div class="main_menu">
					<ul>
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
						<li><a href="bao-cao.html">Quản lý người dùng</a></li>
					</ul>
					<div class="clear"></div>
				</div>
	
				<div id="main-content">
					<div id="title-content">
		 Danh mục vai trò
		</div>
		<div id="main-content">
			
			<form id="main-form">
				<div id="view-table" class="scroll-vai-tro">
					<table>
						<tr style="background:#199e5e">
							<th class="left-column"><input type="checkbox" class="checkAll"></th>
							<th class="mid-column">ID</th>
							<th class="right-column">Tên vai trò</th>
						</tr>
						<%
							if(listVaiTro != null) {
							int count = 0;
							for(VaiTro VaiTro : listVaiTro) {%>
						<tr>
							<td class="left-column"><input type="checkbox" name="vtId" value="<%=VaiTro.getVtId() %>" class="checkbox"></td>
							<td class="col"><%=VaiTro.getVtId() %></td>
							<td class="col"><%=VaiTro.getVtTen() %></td>
						</tr>
						<%} }%>
					</table>		
				</div>				
				
				<div class="group-button">
					<input type="hidden" name="action" value="deleteVaiTro">
					<button type="button" class="button"  onclick="showForm('add-form', true)"><i class="fa fa-plus-circle"></i>&nbsp;Thêm</button>
					<button type="button" class="button" onclick="update('update-form', true);"><i class="fa fa-pencil fa-fw"></i>&nbsp;Thay đổi</button>
					<button class="button" onclick="return confirmDelete()"> <i class="fa fa-trash-o" ></i>&nbsp;&nbsp;Xóa</button>&nbsp;<button class="button" type="reset"><i class="fa fa-spinner"></i>&nbsp;&nbsp;Bỏ qua</button>&nbsp;<button type="button" class="btn"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
				</div>
			</form>	
<!-------------- --add-form-------------- -->
			<form id="add-form" method="get" action="<%=siteMap.vtManage %>">
				<div class = "input-table">
					<table>
						<div class = "form-title">Thêm vai trò</div>
						<tr>
							<th><label for="id">ID</label></th>
							<td><input name="vtId" type="text" class="text" required  title="Mã nơi sản xuất không được trống"></td>
						</tr>
						<tr>
							<th class="label"><label for="tenvaitro">Tên vai trò</label></th>
							<td><input name="vtTen" size="30px" align=left type="text" class="text" required title="Tên vai trò không được để trống"></td>
						</tr>	
					</table>
				</div>
				<div class="group-button">
						<input type="hidden" name="action" value = "addVaiTro"> 
						<button class="button"><i class="fa fa-plus-circle"></i>&nbsp;Thêm</button>
						<button type="reset" class="button"><i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại</button>
						<button type="button" class="button" onclick="showForm('add-form', false)"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
				</div>			
			</form>
			
<!-- ---------------Update form-------------- -->			
			<form id="update-form">
				<div class="input-table">
					<table>
						<div class="form-title">Cập nhật vai trò</div>
						<tr>
							<th><label for="id">ID</label></th>
							<td><input name="vtIdUpdate" type="text" class="text" required title="ID vai trò không để trống" readonly></td>
						</tr>
						<tr>
							<th><label for="tenvaitro">Tên vai trò</label></th>
							<td><input name="vtTenUpdate" size="30px" type="text" class="text" required title="Tên vai trò không được để trống"></td>
						</tr>	
					</table>
				</div>
				<div class="group-button">
						<input type="hidden" name="action" value = "updateVaiTro"> 
						<button class="button"><i class="fa fa-floppy-o"></i>&nbsp;Lưu lại</button>
						<button type="reset" class="button"><i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại</button>
						<button type="button" class="button" onclick="showForm('update-form')"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
				</div>			
			</form>			
		</div>
				</div>
				
        </div>
    </body>
</html>