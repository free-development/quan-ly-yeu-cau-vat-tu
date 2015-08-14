<%@page import="java.util.ArrayList"%>
<%@page import="map.siteMap"%>
<%@page import="model.CTVatTu"%>
<%@page import="model.VatTu"%>
<%@page import="model.NoiSanXuat"%>
<%@page import="model.ChatLuong"%>
<%@page import="model.CongVan"%>
<%@page import="model.CongVan"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Văn phòng điện tử công ty điện lực Cần Thơ</title>
<link rel="stylesheet" href="style/style-giao-dien-chinh.css"
	type="text/css">
<link rel="stylesheet" href="style/style.css" type="text/css">
<link href="style/style-bao-cao-vat-tu-thieu.css" type="text/css"
	rel="stylesheet">
<link
	href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
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
<%
    	ArrayList<VatTu> listVatTu = (ArrayList<VatTu>) request.getAttribute("vatTuList");
    	ArrayList<CTVatTu> listCTVatTu = (ArrayList<CTVatTu>) request.getAttribute("ctVatTuList");
   		ArrayList<NoiSanXuat> listNoiSanXuat = (ArrayList<NoiSanXuat>) request.getAttribute("noiSanXuatList");
   		ArrayList<ChatLuong> listChatLuong = (ArrayList<ChatLuong>) request.getAttribute("chatLuongList");
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
						<li><a href="danh-muc-noi-san-xuat.html">Danh mục nơi sản
								xuất
								</p>
						</a></li>
						<li><a href="danh-muc-chat-luong.html">Danh mục chất
								lượng</a></li>
						<li><a href="danh-muc-vat-tu.html">Danh mục vật tư</a></li>
						<li><a href="danh-muc-bo-phan.html">Danh mục bộ phận sử
								dụng</a></li>
						<li><a href="danh-muc-muc-dich.html">Danh mục mục đích</a></li><li><a href="<%=siteMap.nsxManage + "?action=manageNsx"%>">Danh
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
				<li><a href="<%=siteMap.cvManage+ "?action=manageCv" %>">Công văn</a></li>
				<li><a href="">Báo cáo</a></li>
					<ul>
						<li><a href="<%=siteMap.bcvttManage+ "?action=manageBcvtt" %>"/>Báo cáo vật tư thiếu</li>
						<li><a href="<%=siteMap.bcbdnManage+ "?action=manageBcbdn" %>"/>Báo cáo bảng đề nghị cấp vật tư</li>
					</ul>
										<li><a href="danh-muc-chia-se-cong-van.html">Chia sẻ</a></li>
				<li><a href="bao-cao.html">Quản lý người dùng</a></li>
			</ul>
			<div class="clear"></div>
		</div>

		<div id="main-content">
			<div id="title-content">Báo cáo vật tư thiếu</div>
			<br>
			<form id="option-form">
				<fieldset>
					<legend style="margin: 0 auto;">Tùy chọn báo cáo</legend>
					<table style="margin: 0 auto; padding-bottom: 20px;">
                        <tr>
						<th style="text-align: left; padding-right: 10px;"><lable>Chế độ báo cáo:</lable></th>
						<td><input type="radio" name="cdBc" value="bcChiTiet" id="bcChiTiet"> 
						<label class="input" for="bcChiTiet">Chi tiết</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="cdBc" value="bcTongHop" class="input" id="bcTongHop">&nbsp;<label class="lable1" for="bcTongHop">Tổng
								hợp</label> </td>
<!--						<td style="text-align: right"><input type="radio" name="cdBc" value="bcTongHop" class="input" id="bcTongHop"></td>-->
<!--
						<td style="text-align: left"><label class="lable1" for="bcTongHop">Tổng
								hợp&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
-->
                            </tr>
                        <tr>
                            <th style="text-align: left">Thời gian:</th>
                            <td style="text-align: left; " colspan="2" >Từ ngày &nbsp;
                            <input type="date" class="text">
                            &nbsp;&nbsp;&nbsp;&nbsp; đến&nbsp;
                            <input type="date" class="text"></td>
                        </tr>
                        <tr>
                        	<td><input type="button" class="button" value="Xem"></td>
                        </tr>
<!--
                        <tr>
                            <th style="text-align: left">Don vi: </th>
                            <td style="text-align: left; " colspan="2" >Tu ngay &nbsp;
                            <input type="date" class="text">
                            &nbsp;&nbsp;&nbsp;&nbsp; den&nbsp;
                            <input type="date" class="text"></td>
                        </tr>
-->
<!-- 						<td><button class="button" type="button"> -->
<!-- 								<i class="fa fa-eye"></i>&nbsp;&nbsp;Hiển thị -->
<!-- 							</button></td> -->
					</table>
				</fieldset>
			</form>
			<br>
			<div id="view-table" class="scroll">
				<table>
					<tr>
						<th class="a-column">Mã vật tư</th>
						<th class="b-column">Tên vật tư</th>
						<th class="c-column">Nơi sản xuất</th>
						<th class="c-column">Chất lượng</th>
						<th class="d-column">Đơn vị tính</th>
						<th class="e-column">Số lượng thiếu</th>
					</tr>
								<%
							if(listCTVatTu != null) {
							int count = 0;
							for(CTVatTu ctVatTu : listCTVatTu) { count++;%>

					<tr
						<%if (count % 2 == 1) out.println("style=\"background : #CCFFFF;\"");%>>
						<td class="left-column"><input type="checkbox" name="vtMa"
							value="<%=ctVatTu.getVatTu().getVtMa() %>" class="checkbox"></td>
						<td class="a-column"><%=ctVatTu.getVatTu().getVtMa() %></td>
						<td class="b-column"><%=ctVatTu.getVatTu().getVtTen() %></td>
						<td class="c-column"><%=ctVatTu.getNoiSanXuat().getNsxTen() %></td>
						<td class="d-column"><%=ctVatTu.getChatLuong().getClTen() %></td>
						<td class="e-column"><%=ctVatTu.getVatTu().getDvt() %></td>
						<td class="e-column"><%=ctVatTu.getDinhMuc() %></td>
						<td class="e-column"><%=ctVatTu.getSoLuongTon() %></td>

					</tr>
					<%} }%>
				</table>
			</div>

			<div class="group-button">
				<button class="button" type="button">
					<i class="fa fa-print"></i>&nbsp;&nbsp;In
				</button>
				&nbsp;
				<button class="button" type="button">
					<i class="fa fa-print"></i>&nbsp;&nbsp;Xuất file
				</button>
				&nbsp;
				<button type="button" class="button" onclick="showForm('main-form')">
					<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
				</button>
			</div>
			</form>

		</div>
	</div>

	</div>
</body>
</html> �