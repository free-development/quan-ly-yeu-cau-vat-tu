-help
<%@page import="map.siteMap"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Văn phòng điện tử công ty điện lực Cần Thơ</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style/style-giao-dien-chinh.css"
	type="text/css">
<link rel="stylesheet" href="style/style.css" type="text/css">
<link rel="stylesheet" href="style/style.css" type="text/css">
<link href="style/style-tao-tai-khoan.css" type="text/css"
	rel="stylesheet">
<link
	href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<!--		<script type="text/javascript" src="js/check.js"></script>-->
<script type="text/javascript" src="js/jquery-1.6.3.min.js"></script>

<script type="text/javascript" src="js/doi-mat-khau.js"></script>
<!--         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<link rel="Shortcut Icon" href="img/logo16.png" type="image/x-icon" />
<style type="text/css">
.demo {
	position: relative;
	margin: 20px auto;
	width: 620px;
	height: 28px;
	background-color: #121212;
	border-radius: 12px;
	overflow: hidden;
	border: solid 4px #121212;
}

.circle {
	width: 20px;
	height: 20px;
	background-color: #86cc01;
	position: absolute;
	border-radius: 50%;
	display: inline-block;
	left: -20px;
	top: 4px;
}
</style>
<script type="text/javascript">
var tl = new TimelineMax();

tl.staggerTo(".circle", 1.5, {x:650, repeat:-1, repeatDelay:0.5, force3D:true, ease:SlowMo.ease.config(0.2, 0.5)}, 0.15)
</script>

</head>
<body>
	<div class="wrapper">
		<div class="header">
			<!--
					<img src="img/logo.png" alt="" id="logo" width=80 height=80/><br/>
					<img src="img/textlogo.png" alt="" id="logo" width=80 height=20/>
	-->
			<div id="top_title">Văn phòng điện tử</div>
			<div id="bottom-title">Công ty điện lực cần thơ</div>
			<div class="search_form" id="search">
				<form action="<%=siteMap.changePass%>"-->
					method="post">
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
						<li><a href="danh-muc-noi-san-xuat.html">Danh mục nơi sản
								xuất
								</p>
						</a></li>
						<li><a href="danh-muc-chat-luong.html">Danh mục chất
								lượng</a></li>
						<li><a href="danh-muc-vat-tu.html">Danh mục vật tư</a></li>
						<li><a href="danh-muc-bo-phan.html">Danh mục bộ phận sử
								dụng</a></li>
						<li><a href="danh-muc-muc-dich.html">Danh mục mục đích</a></li>
					</ul></li>
				<li><a href="danh-muc-cong-van.html">Công văn</a></li>
				<li><a href="bao-cao.html">Báo cáo</a></li>
				<!--						<li><a href="danh-muc-chia-se-cong-van.html">Chia sẽ</a></li>-->
				<li><a href="bao-cao.html">Quản lý người dùng</a></li>
			</ul>
			<div class="clear"></div>
		</div>

		<div id="title-content">Đổi mật khẩu</div>
		<div id="main-content">
			<form action="" method="post" name="taoTaiKhoan">
				<table>
					<tr>
						<td class="input"><label for="msnv">Mã số NV</label></td>
						<td><input type="text" autofocus required size="10"
							maxlength="10"
							title="Mã số nhân viên đủ 10 ký tự, không chứa ký tự đặc biệt"
							pattern="[a-zA-Z0-9]*" class="text" id="msnv" name="msnv"></td>
					</tr>
					<tr>
						<td class="input"><label for="matkhau">Mật khẩu cũ</label></td>
						<td><input type="password" required size="20" maxlength="20"
							title="Mật khẩu phải hơn 7 ký tự và nhỏ hơn 21" pattern=".{8,20}"
							class="text" id="matkhau" name="passOld"></td>
					</tr>
					<tr>
						<td class="input"><label for="matkhau">Mật khẩu mới</label></td>
						<td><input type="password" required size="20" maxlength="20"
							title="Mật khẩu phải hơn 7 ký tự và nhỏ hơn 21" pattern=".{8,20}"
							class="text" id="matkhau" name="passNew"></td>
					</tr>

					<tr>
						<td class="input"><label for="re-matkhau">Nhập lại
								mật khẩu mới</label></td>
						<td><input type="password" required size="20" maxlength="20"
							title="Mật khẩu phải hơn 7 ký tự và nhỏ hơn 21" pattern=".{8,20}"
							class="text" id="rePassNew" name="rePassNew"></td>
					</tr>
				</table>
				<div class="button-group">
					<button class="button" type="button" onclick="checkPassword();">
						<i class="fa fa-plus-circle"></i>&nbsp;Lưu lại
					</button>
					&nbsp;
					<button class="button" type="reset">
						<i class="fa fa-refresh"></i>&nbsp;Nhập lại
					</button>
					&nbsp;
					<button class="button" type="button">
						<i class="fa fa-sign-out"></i>&nbsp;Thoát
					</button>
				</div>
			</form>
		</div>
	</div>
	</div>
	<div id='loadhalaman'>
		<div class='loadball'></div>
		<div class='loadball-2'></div>
	</div>
	<!-- <style> -->
	/* #abt-page-loader { */ /* position: fixed!important; */ /* top: 0; */
	/* right: 0; */ /* bottom: 0; */ /* left: 0; */ /* z-index: 9999; */ /*
	background:#000 url("img/loading.gif") no-repeat 50% 30%; */ /* color:
	#FFF; */ /* display: none; */ /* font: 0/0 a; */ /* text-shadow: none;
	*/ /* padding: 1em 1.2em; */ /* } */
	<!-- </style> -->
	<!-- <script type='text/javascript'> -->
	// //
	<![CDATA[
// $(document.body).append('<div id="abt-page-loader">Loading...</div>');
// $(window).on("beforeunload", function() {
//     // ... Show the Animation `.fadeIn()`
//     $('#abt-page-loader').fadeIn(1000).delay(6000).fadeOut(1000);
// });
// //]]>
	//
	</script>
	<div class="demo">
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
	</div>
</body>

</html>
