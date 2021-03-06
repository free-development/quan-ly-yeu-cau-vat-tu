﻿<%@page import="model.ChucDanh"%>
<%@page import="java.util.ArrayList"%>
<%@page import="map.siteMap"%>
<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Văn phòng điện tử công ty điện lực Cần Thơ</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style/style-giao-dien-chinh.css"
	type="text/css">
<link rel="stylesheet" href="style/style.css" type="text/css">
<link href="style/style-tao-tai-khoan.css" type="text/css"
	rel="stylesheet">
<link
	href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<!--		<script type="text/javascript" src="js/check.js"></script>-->
<script type="text/javascript" src="js/jquery-1.6.3.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/nguoidung.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="img/logo16.png" type="image/x-icon" />
</head>
<body>

	<%
    		ArrayList<ChucDanh> listChucDanh = (ArrayList<ChucDanh>) request.getAttribute("chucDanhList");
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
								<li><a href="<%=siteMap.nsxManage + "?action=manageNsx"%>">Danh
										mục nơi sản xuất</a></li>
								<li><a href="<%=siteMap.clManage + "?action=manageCl"%>">Danh
										mục chất lượng</a></li>
								<li><a href="<%=siteMap.vattuManage + "?action=manageVattu"%>">Danh
										mục vật tư</a></li>
								<li><a href="<%=siteMap.ctvtManage + "?action=manageCtvt"%>">Danh
										mục chi tiết vật tư</a></li>
								<li><a href="<%=siteMap.bpsdManage +  "?action=manageBpsd"%>">Danh
										mục bộ phận sử dụng</a></li>
								<li><a href="<%=siteMap.mdManage + "?action=manageMd"%>">Danh
										mục mục đích</a></li>
								<li><a href="<%=siteMap.vtManage + "?action=manageVt"%>">Danh mục vai trò</a></li>
								<li><a href="<%=siteMap.dvtManage + "?action=manageDvt"%>">Danh mục đơn vị tính</a></li>
								<li><a href="<%=siteMap.cdManage + "?action=manageCd"%>">Danh
										mục chức danh</a></li>
								
							</ul>
				</li>
				<li><a href="<%=siteMap.cvManage+ "?action=manageCv" %>">Công văn</a></li>
				<li><a href="<%=siteMap.bcManage +  "?action=manageBc"%>">Báo cáo</a>
					<ul>
						<li><a href="<%=siteMap.bcvttManage+ "?action=manageBcvtt" %>"/>Báo cáo vật tư thiếu</li>
						<li><a href="<%=siteMap.bcbdnManage+ "?action=manageBcbdn" %>"/>Báo cáo bảng đề nghị cấp vật tư</li>
					</ul>
				</li>
				<li><a href="">Quản lý người dùng</a>
					<ul>
						<li><a href="<%=siteMap.ndManage + "?action=manageNd"%>">Thêm người dùng</li>
						<li><a href=""/>Khôi phục mật khẩu</li>
					</ul>
				</li>
				<li><a href="<%=siteMap.changePass + "?action=changePassWord"%>">Đổi mật khẩu</a></li>
			</ul>
			<div class="clear"></div>
		</div>
		<div id="main-content">
			<form id="add-form" action="<%=siteMap.ndManage %>?action=addNd" method="post"
				name="taoTaiKhoan" >
				<div class="input-table">
					<table>
						<div class="form-title">Tạo tài khoản</div>
						<tr>
						<td class="input"><label for="msnv">Mã số nhân viên</label></td>
						<td><input type="text" autofocus required size="10"
							maxlength="10"
							title="Mã số nhân viên đủ 10 ký tự, không chứa ký tự đặc biệt"
							pattern="[a-zA-Z0-9]*" class="text" id="msnv" name="msnv"></td>
					</tr>

					<tr>
						<td class="input"><label for="matkhau">Mật khẩu</label></td>
						<td><input type="password" required size="20" maxlength="20"
							title="Mật khẩu phải hơn 7 ký tự và nhỏ hơn 21" pattern=".{8,20}"
							class="text" id="matkhau" name="matkhau"></td>
					</tr>

					<tr>
						<td class="input"><label for="re-matkhau">Nhập lại
								mật khẩu</label></td>
						<td><input type="password" required size="20" maxlength="20"
							title="Mật khẩu phải hơn 7 ký tự và nhỏ hơn 21" pattern=".{8,20}"
							class="text" id="nlmatkhau" name="nlmatkhau"></td>
					</tr>

					<tr>
						<td class="input"><label for="chucdanh">Chức danh</label></td>
						<td><select required title="Chức danh phải được chọn"
							class="select" id="chucdanh" name="chucdanh">
								<option disabled selected value="">-- Chọn chức danh --</option>
								<%
							
									int count = 0;
									for(ChucDanh chucDanh : listChucDanh)
									{%>
								<option value=<%=chucDanh.getCdMa()%>><%=chucDanh.getCdTen()%></option>
								<%}
								%>
						</select></td>
					</tr>

					<tr>
						<td class="input"><label for="hoten">Họ tên</label></td>
						<td><input type="text" required size="20" maxlength="50"
							title="Họ tên không được chứa chữ số và ký tự đặc biệt"
							pattern="[a-zA-Z]*" class="text" id="hoten" name="hoten"></td>
					</tr>

					<tr>
						<td class="input"><label for="sdt">Số điện thoại</label></td>
						<td><input type="text" required size="11" maxlength="11"
							title="Phải nhập đúng định dạng. Ví dụ: 01234567890"
							pattern="[0-9]{10,11}" class="text" id="sdt" name="sdt"></td>
					</tr>

					<tr>
						<td class="input"><label for="email">Email</label></td>
						<td><input type="text" required size="20" maxlength="50"
							title="Email phải được nhập" class="text" id="email" name="email"></td>
					</tr>

					<tr>
						<td class="input"><label for="diachi">Địa chỉ</label></td>
						<td><input type="text" required size="20" maxlength="50"
							title="Địa chỉ phải được nhập" class="text" name="diachi"
							id="diachi"></td>
					</tr>
					</table>
				</div>
				<div class="button-group">
<!-- 					<input type="hidden" name="action" value="AddNd"> -->
					<button class="button" type="button" onclick="checkPassword();">
						<i class="fa fa-plus-circle"></i>&nbsp;Tạo mới
					</button>
					&nbsp;
					<button class="button" type="reset">
						<i class="fa fa-refresh"></i>&nbsp;Nhập lại
					</button>
					&nbsp;
					<button type="button" class="button" onclick="location.href='<%=siteMap.home%>'">
							<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
						</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>