
<%@page import="java.util.ArrayList"%>
<%@page import="map.siteMap"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Văn phòng điện tử công ty điện lực Cần Thơ</title>
        <link rel="stylesheet" href="style/style-giao-dien-chinh.css" type="text/css">
		<link rel="stylesheet" href="style/style.css" type="text/css">
		 <link href="style/style-bao-cao-vat-tu-thieu.css" type="text/css" rel="stylesheet">
    <link href="style\font-awesome-4.3.0\font-awesome-4.3.0\css\font-awesome.min.css" type="text/css" rel="stylesheet">
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
	</script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="Shortcut Icon" href="img/logo16.png" type="image/x-icon" />  
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
								<li><a href="danh-muc-noi-san-xuat.html">Danh mục nơi sản xuất</p></a></li>
								<li><a href="danh-muc-chat-luong.html">Danh mục chất lượng</a></li>
								<li><a href="danh-muc-vat-tu.html">Danh mục vật tư</a></li>
								<li><a href="danh-muc-bo-phan.html">Danh mục bộ phận sử dụng</a></li>
								<li><a href="danh-muc-muc-dich.html">Danh mục mục đích</a></li>
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
		              Báo cáo vật tư thiếu
                    </div>
                    <br>
                    <div id="radio">
                     <table >
                        <th><lable>Lựa chọn:&nbsp;&nbsp;&nbsp;&nbsp;</lable></th>
                        <td style="text-align: right"><input type="radio" name="add"></td>
                        <td style="text-align: left"><label class="lable1" for="CGQ">Chi tiết&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                        <td style="text-align: right"><input type="radio" name="add"></td>
                        <td style="text-align: left"><label class="lable1" for="DGQ">Tổng hợp&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                        <td><button class="button" type="button"><i class="fa fa-eye"></i>&nbsp;&nbsp;Hiển thị</button></td> 
                    </table>
                    </div>
                    <br>
					<div id="view-table" class="scroll">
						<table >
							<tr>
                                <th class="a-column"> Mã vật tư</th>
								<th class="b-column"> Tên vật tư</th>
								<th class="c-column">Nơi sản xuất</th>
								<th class="d-column"> Đơn vị tính</th>
								<th class="e-column">Số lượng thiếu</th>
							</tr>
							<tr>
								<th class="a-column"></th>
								<th class="b-column"></th>
								<th class="c-column"></th>
								<th class="d-column"></th>
								<th class="e-column"></th>
							</tr>
						</table>		
					</div>				

					<div class="group-button">
                    <button class="button" type="button"><i class="fa fa-print"></i>&nbsp;&nbsp;In</button>&nbsp;
                    <button class="button" type="button"><i class="fa fa-print"></i>&nbsp;&nbsp;Xuất file</button>&nbsp;
                    <button type="button" class="button" onclick="showForm('main-form')"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
					</div>
				</form>	
					
            </div>
				</div>
				
        </div>
    </body>
</html>