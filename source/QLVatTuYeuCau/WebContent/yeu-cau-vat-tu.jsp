<%@page import="model.YeuCau"%>
<%@page import="model.NoiSanXuat"%>
<%@page import="model.ChatLuong"%>
<%@page import="model.VatTu"%>
<%@page import="model.CTVatTu"%>
<%@page import="model.TrangThai"%>
<%@page import="model.MucDich"%>
<%@page import="model.DonVi"%>
<%@page import="util.DateUtil"%>
<%@page import="model.CongVan"%>
<%@page import="model.File"%>
<%@page import="map.siteMap"%>
<%@page import="java.util.HashMap"%> 
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Văn phòng điện tử công ty điện lực Cần Thơ</title>

<link rel="stylesheet" href="style/style-giao-dien-chinh.css"
	type="text/css">
<link rel="stylesheet" href="style/style.css" type="text/css">
<link href="style/style-yeu-cau.css"type="text/css" rel="stylesheet">
<link rel="stylesheet" href="style/style-menu-tree.css" type="text/css">
<link
	href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/yeu-cau-vat-tu.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="img/logo16.png" type="image/x-icon" />
</head>
<body>
	<%
    	ArrayList<CTVatTu> ctVatTuList = (ArrayList<CTVatTu>) request.getAttribute("ctVatTuList");
		ArrayList<YeuCau> yeuCauList = (ArrayList<YeuCau>) request.getAttribute("yeuCauList");
		ArrayList<NoiSanXuat> nsxList = (ArrayList<NoiSanXuat>) request.getAttribute("nsxList");
		ArrayList<ChatLuong> chatLuongList = (ArrayList<ChatLuong>) request.getAttribute("chatLuongList");
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
					<!--							<span class="bg-search">-->
					<span class="search-text"> &nbsp; <input type="search"
						class="search" name="search_box" name="search"
						placeholder="Tìm kiếm" />
					</span> <span class="search-button"> &nbsp;
						<button class="btn-search">
							<i class="fa fa-search"></i>
						</button>
					</span>
					<!--                            </span>-->
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
				<li><a href="login.html">Đăng xuất</a></li>
			</ul>
			<div class="clear"></div>
		</div>
		<div id="greeting">Chào Nguyễn Văn An</div>

		<div id="main-content">
			<div class="form-title">Cập nhật yêu cầu vật tư</div>
			
			<form id="add-yeu-cau-form">
<!-- 			<fieldset style="width: 70%;margin:0 auto;"> -->
<!-- 				<legend style="padding-left: 20px; ">Tìm kiếm</legend> -->
				<div id="yc-table">
				<table>
					<tr>
						<td><label for="vtMa">Mã vật tư: </label></td>
						<td class="column-mavt"><input type="text" maxlength="3" size="3px" name="vtMa" id="vtMa" class="text"></td>
						<td><label for="vtTen">Tên vật tư: </label></td>
						<td class="column-tenvt"><input type="text" maxlength="3" size="3px" name="vtTen" id="vtMa" class="text"></td>
					</tr>
					<tr>
						<td><label for="nsx">Nơi sản xuất: </label></td>
						<td class="column-noisx">
							<select name="nsx" id="nsx" class="select">
							<option selected disabled value="" style="text-decoration: none;">-- Chọn nơi sản xuất --</option>
							<% for(NoiSanXuat nsx : nsxList) {%>
								<option value=<%=nsx.getNsxMa() %>><%=nsx.getNsxTen() %></option>
							<%} %>
							</select>
						</td>
						<td><label for="chatLuong">Chất lượng: </label></td>
						<td>
							<select name="chatLuong" id="chatLuong" class="select">
							<option selected disabled value="" style="text-decoration: none;">-- Chọn chất lượng --</option>
							<% for(ChatLuong chatLuong : chatLuongList) {%>
								<option value=<%=chatLuong.getClMa() %>><%=chatLuong.getClTen()  %></option>
							<%} %>
 							</select> 
						</td>
					</tr>
					
				</table>
				<div class="group-button">
					<button class="button" type="button" onclick="searchCtvt();">Tìm kiếm</button>
				</div>
				</div>
<!-- 			</fieldset> -->
			</form>
			<br>
			<br>
			<div id="view-search">
				<table>
					<tr><th >Ma vat tu</th><th >Ten vat tu</th><th >Noi san xuat</th><th >Chat luong</th><th >Don vi tinh</th><th ></th></tr>
					<tr style="background-color: #199e5e"><th >Mã vật tư</th><th >Tên vật tư</th><th >Nơi sản xuất</th><th >Chất lượng</th><th >Đơn vị tính</th><th ></th></tr>
					<tr></tr>
					<%
						int countCtvt = 0;
						for(CTVatTu ctVatTu : ctVatTuList) { 
							countCtvt++;
							VatTu vatTu = ctVatTu.getVatTu();
							NoiSanXuat nsx = ctVatTu.getNoiSanXuat();
							ChatLuong chatLuong = ctVatTu.getChatLuong();
						%>
						<tr id="row" <%if (countCtvt % 2 == 1) out.println("style=\"background : #CCFFFF;\"");%>>
							<td><%=vatTu.getVtMa() %></td>
							<td><%=vatTu.getVtTen() %></td>
							<td><%=nsx.getNsxTen() %></td>
							<td><%=chatLuong.getClTen() %></td>
							<td><%=vatTu.getDvt() %></td>
							<td><input class="radio"  type="radio" id="a" name="ctvtId" value="<%=ctVatTu.getCtvtId() %>" onchange="preAddSoLuong();"> </td>
						</tr>
					<%}%>
				</table>	
			</div>	
			<br><br>
			<form id="main-form">
					<div id="view-table-yc" class="scroll-vat-tu">
<!-- 							<div class="form-title">Cập nhật yêu cầu vật tư</div> -->
							<table >
								<tr>
									<th class="a-column">Chọn</th>
									<th class="b-column">Mã vật tư</th>
									<th class="c-column">Tên vật tư</th>
									<th class="e-column">Nơi sản xuất</th>
									<th class="f-column">Chất lượng</th>
									<th class="g-column">Đvt</th>
									<th class="d-column">Số lượng</th>
								</tr>
								<%
									int count = 0;
									for(YeuCau yeuCau : yeuCauList) {
									CTVatTu ctVatTu = yeuCau.getCtVatTu();
									NoiSanXuat nsx = ctVatTu.getNoiSanXuat();
									VatTu vatTu = ctVatTu.getVatTu();
									ChatLuong chatLuong = ctVatTu.getChatLuong();
								%>
								<tr <%if (count % 2 == 1) out.println("style=\"background : #CCFFFF;\"");%> id="<%=yeuCau.getYcId()	%>">
									<td><input id="<%=yeuCau.getYcId() %>" type="checkbox" name = "yeuCau" value=<%=yeuCau.getYcId()%>> </td>
									<td><%=vatTu.getVtMa()%></td>
									<td><%=vatTu.getVtTen()%></td>
									<td><%=nsx.getNsxTen()%></td>
									<td><%=chatLuong.getClTen()%></td>
									<td><%=vatTu.getDvt()%></td>
									<td><%=yeuCau.getYcSoLuong()%></td>
								<%} %>
							</table>
							</div>
							<div class="group-button">
<!-- 								<button type="button" class="button" -->
<!-- 									onclick="showForm('yc-vat-tu', 'add-form-ycvt', true)"> -->
<!-- 									<i class="fa fa-plus-circle"></i>&nbsp;Thêm mới -->
<!-- 								</button> -->
								<button type="button" class="button" id="update-so-luong">
									<i class="fa fa-pencil fa-fw"></i>&nbsp;Sửa
								</button>
								<button class="button" type="button" onclick="return confirmDelete();">
									<i class="fa fa-trash-o"></i>&nbsp;&nbsp;Xóa
								</button>
								<button type="reset" class="button">
									<i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại
								</button>
								<button type="button" class="button"
									onclick="showForm('main-form', 'update-yc-vat-tu',false)">
									<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
								</button>
							</div>
				</form>
			<form id="add-so-luong-form" onsubmit="return false">
			<table>
				<tr><th >Mã vật tư</th><th >Tên vật tư</th><th >Nơi sản xuất</th><th >Chất lượng</th><th >Đơn vị tính</th><th >Số lượng</th></tr>
				<tr>
					<td><div id="vtMaAdd"></div></td>
					<td><div id="vtTenAdd"></div></td>
					<td><div id="clTenAdd"></div></td>
					<td><div id="nsxTenAdd"></div></td>
					<td><div id="dvtAdd"></div></td>
<!-- 					<td><div id="vtMaAdd"></div></td> -->

					<td><input type="number" min=0 autofocus  name="soLuongAdd" title="So luong phai la so!!!"  class="text" style="width: 80px;"></td>
					<td><button class="button" type="button" onclick="addSoLuong();">Them</button></td>
				</tr>
<!-- 				<t	r> -->
					
<!-- 				</tr> -->
			</table>
			</form>
			

							</div>

							</div>
</body>
</html>
