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
<link href="style/style-yeu-cau.css"css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="style/style-menu-tree.css" type="text/css">
<link
	href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/yeu-cau-vat-tu.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
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
			<fieldset style="width: 70%;">
				<legend style="padding-left: 20px; ">Tim kiem</legend>
				<table style="width: 40%; margin: 0 auto;">
					<tr>
						<td><label for="vtMa">Ma vat tu: </label></td>
						<td><input type="text" maxlength="3" size="3px" name="vtMa" id="vtMa" class="text"></td>
						<td><label for="vtTen">Ten vat tu: </label></td>
						<td><input type="text" maxlength="3" size="3px" name="vtTen" id="vtMa" class="text"></td>
					</tr>
					<tr>
						<td><label for="nsx">Noi san xuat: </label></td>
						<td>
							<select name="nsx" id="nsx" class="select">
							<option selected disabled value="" style="text-decoration: none;">-- Chon noi san xuat --</option>
							<% for(NoiSanXuat nsx : nsxList) {%>
								<option value=<%=nsx.getNsxMa() %>><%=nsx.getNsxTen() %></option>
							<%} %>
							</select>
						</td>
						<td><label for="chatLuong">Chat luong: </label></td>
						<td>
							<select name="chatLuong" id="chatLuong" class="select">
							<option selected disabled value="" style="text-decoration: none;">-- Chon chat luong --</option>
							<% for(ChatLuong chatLuong : chatLuongList) {%>
								<option value=<%=chatLuong.getClMa() %>><%=chatLuong.getClTen()  %></option>
							<%} %>
							</select>
						</td>
					</tr>
					
				</table>
				<div class="group-button">
					<button class="button" type="button" onclick="searchCtvt();">Tim kiem</button>
				</div>
			</fieldset>
			<div id="view-search">
				<table>
					<tr><th >Ma vat tu</th><th >Ten vat tu</th><th >Noi san xuat</th><th >Chat luong</th><th >Don vi tinh</th><th ></th></tr>
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
			</form>
			<form id="main-form">
					<div id="view-table" class="scroll-yeu-cau">
<!-- 							<div class="form-title">Cập nhật yêu cầu vật tư</div> -->
							<table>
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
								<button type="button" class="button"
									onclick="showForm('yc-vat-tu', 'add-form-ycvt', true)">
									<i class="fa fa-plus-circle"></i>&nbsp;Thêm mới
								</button>
								<button type="button" class="button"
									onclick="showForm('update-yc-vat-tu','add-yeu-cau-form', true)">
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
						</div>
				</div>
			</form>
			
			<form id="add-so-luong-form">
			<table>
				<tr><th >Ma vat tu</th><th >Ten vat tu</th><th >Noi san xuat</th><th >Chat luong</th><th >Don vi tinh</th><th >So luong</th></tr>
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
			
				<!--    update-vat-tu    -->
<!-- 				<form id="update-yc-vat-tu"> -->
<!-- 					<div class="input-table-vt"> -->
<!-- 						<table> -->
<!-- 							<div class="form-title">Cập nhật yêu cầu vật tư</div> -->
<!-- 							<table> -->
<!-- 								<tr> -->
<!-- 									<th class="a-column">Chọn</th> -->
<!-- 									<th class="b-column">Mã vật tư</th> -->
<!-- 									<th class="c-column">Tên vật tư</th> -->

<!-- 									<th class="e-column">Nơi sản xuất</th> -->
<!-- 									<th class="f-column">Chất lượng</th> -->
<!-- 									<th class="d-column">Số lượng</th> -->
<!-- 									<th class="g-column">Đvt</th> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td class="a-column"><input type="checkbox" name=""></td> -->
<!-- 									<td class="b-column">315422050</td> -->
<!-- 									<td class="c-column">Cáp đòng bọc hạ áp CV 50m...</td> -->
<!-- 									<td class="d-column">Viet Nam</td> -->
<!-- 									<td class="e-column">Hàng thu hồi</td> -->
<!-- 									<td class="f-column">17</td> -->
<!-- 									<td class="g-column">m</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td class="a-column"><input type="checkbox" name=""></td> -->
<!-- 									<td class="b-column">31582025</td> -->
<!-- 									<td class="c-column">Cáp đồng bọc 24KV CX(CR)...</td> -->
<!-- 									<td class="d-column">5</td> -->
<!-- 									<td class="e-column">51091.313</td> -->
<!-- 									<td class="f-column">255457</td> -->
<!-- 									<td class="g-column">m</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td class="a-column"><input type="checkbox" name=""></td> -->
<!-- 									<td class="b-column">32084025</td> -->
<!-- 									<td class="c-column">Đầu cosse ép đồng 25cm2</td> -->
<!-- 									<td class="d-column">1</td> -->
<!-- 									<td class="e-column">19200</td> -->
<!-- 									<td class="f-column">19200</td> -->
<!-- 									<td class="g-column">cái</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td class="a-column"><input type="checkbox" name=""></td> -->
<!-- 									<td class="b-column">32084050</td> -->
<!-- 									<td class="c-column">Đầu cosse ép đồng 50cm2</td> -->
<!-- 									<td class="d-column">4</td> -->
<!-- 									<td class="e-column">23500</td> -->
<!-- 									<td class="f-column">23500</td> -->
<!-- 									<td class="g-column">cái</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td class="a-column"><input type="checkbox" name=""></td> -->
<!-- 									<td class="b-column">32005814</td> -->
<!-- 									<td class="c-column">Nối ép WR 259</td> -->
<!-- 									<td class="d-column">4</td> -->
<!-- 									<td class="e-column">11200</td> -->
<!-- 									<td class="f-column">44800</td> -->
<!-- 									<td class="g-column">cái</td> -->
<!-- 								</tr> -->
<!-- 							</table> -->
<!-- 							</div> -->
<!-- 							<div class="group-button"> -->
<!-- 								<button type="button" class="button" -->
<!-- 									onclick="showForm('update-yc-vat-tu', 'add-form-ycvt', true)"> -->
<!-- 									<i class="fa fa-plus-circle"></i>&nbsp;Thêm mới -->
<!-- 								</button> -->
<!-- 								<button type="button" class="button" -->
<!-- 									onclick="showForm('update-yc-vat-tu','update-form-ycvt', true)"> -->
<!-- 									<i class="fa fa-pencil fa-fw"></i>&nbsp;Sửa -->
<!-- 								</button> -->
<!-- 								<button class="button" onclick="return confirmDelete()"> -->
<!-- 									<i class="fa fa-trash-o"></i>&nbsp;&nbsp;Xóa -->
<!-- 								</button> -->
<!-- 								<button type="reset" class="button"> -->
<!-- 									<i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại -->
<!-- 								</button> -->
<!-- 								<button type="button" class="button" -->
<!-- 									onclick="showForm('main-form', 'update-yc-vat-tu',false)"> -->
<!-- 									<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 							</div> -->
<!-- 							</div> -->
<!-- 							</form> -->

<!-- 							<form id="add-form-ycvt"> -->
<!-- 								<div class="input-table"> -->
<!-- 									<table> -->
<!-- 										<div class="form-title" style="padding: 10px">Thêm yêu -->
<!-- 											cầu vật tư</div> -->
<!-- 										<tr> -->
<!-- 											<th style="text-align: left"><label for="TKM">Tìm -->
<!-- 													kiếm mã</label></th> -->
<!-- 											<td><input name="" type="text" class="text" required -->
<!-- 												autofocus size="2" maxlength="3" pattern="[a-zA-Z0-9]{3}" -->
<!-- 												title="Mã mục đích chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"></td> -->
<!-- 											<td class="name" style="text-align: right"><input -->
<!-- 												type="checkbox" name=""></td> -->
<!-- 											<th style="text-align: left"><label for="TT">Theo -->
<!-- 													tên</label></th> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<th style="text-align: left"><label for="MVT">Mã -->
<!-- 													vật tư</label></th> -->
<!-- 											<td><input name="" size="3px" class="text" align=right -->
<!-- 												type="text" class="text" required -->
<!-- 												title="Mã vật tư không được để trống"></td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<th style="text-align: left"><label for="MVT">Nơi -->
<!-- 													sản xuất</label></th> -->
<!-- 											<td><select required -->
<!-- 												title="Nơi sản xuất không được để trống"> -->
<!-- 													<option selected disabled></option> -->
<!-- 													<option>aaaaaaaaaaaaaaa</option> -->
<!-- 											</select></td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<th style="text-align: left"><label for="DVT">Chất -->
<!-- 													lượng</label></th> -->
<!-- 											<td><select required -->
<!-- 												title="Nơi sản xuất không được để trống"> -->
<!-- 													<option selected disabled></option> -->
<!-- 													<option>aaaaa</option> -->
<!-- 											</select></td> -->

<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<th style="text-align: left">Số lượng</th> -->
<!-- 											<td><input class="text" type="text" size="2px"></td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<th style="text-align: left"><label for="DVT">Đơn -->
<!-- 													vị tính</label></th> -->
<!-- 											<td><select required -->
<!-- 												title="Nơi sản xuất không được để trống"> -->
<!-- 													<option selected disabled></option> -->
<!-- 													<option>aaaaa</option> -->
<!-- 											</select></td> -->

<!-- 										</tr> -->
<!-- 									</table> -->
<!-- 								</div> -->
<!-- 								<div class="group-button"> -->
<!-- 									<button class="button"> -->
<!-- 										<i class="fa fa-plus-circle"></i>&nbsp;Thêm -->
<!-- 									</button> -->
<!-- 									<button type="reset" class="button"> -->
<!-- 										<i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại -->
<!-- 									</button> -->
<!-- 									<button type="button" class="button" -->
<!-- 										onclick="showForm('update-yc-vat-tu','add-form-ycvt', false)"> -->
<!-- 										<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát -->
<!-- 									</button> -->
<!-- 								</div> -->
<!-- 							</form> -->
<!-- 							<form id="update-form-ycvt"> -->
<!-- 								<div class="input-table"> -->
<!-- 									<table> -->
<!-- 										<div class="form-title" style="padding: 10px">Cập nhật -->
<!-- 											yêu cầu vật tư</div> -->
<!-- 										<tr> -->
<!-- 											<th style="text-align: left"><label for="TKM">Tìm -->
<!-- 													kiếm mã</label></th> -->
<!-- 											<td><input name="" type="text" class="text" required -->
<!-- 												autofocus size="2" maxlength="3" pattern="[a-zA-Z0-9]{3}" -->
<!-- 												title="Mã mục đích chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"></td> -->
<!-- 											<td class="name" style="text-align: right"><input -->
<!-- 												type="checkbox" name=""></td> -->
<!-- 											<th style="text-align: left"><label for="TT">Theo -->
<!-- 													tên</label></th> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<th style="text-align: left"><label for="MVT">Mã -->
<!-- 													vật tư</label></th> -->
<!-- 											<td><input name="" size="3px" align=right class="text" -->
<!-- 												type="text" class="text" required -->
<!-- 												title="Mã vật tư không được để trống"></td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<th style="text-align: left"><label for="MVT">Nơi -->
<!-- 													sản xuất</label></th> -->
<!-- 											<td><select required -->
<!-- 												title="Nơi sản xuất không được để trống"> -->
<!-- 													<option selected disabled></option> -->
<!-- 													<option>aaaaaaaaaaaaaaa</option> -->
<!-- 											</select></td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<th style="text-align: left"><label for="DVT">Chất -->
<!-- 													lượng</label></th> -->
<!-- 											<td><select required -->
<!-- 												title="Nơi sản xuất không được để trống"> -->
<!-- 													<option selected disabled></option> -->
<!-- 													<option>aaaaa</option> -->
<!-- 											</select></td> -->

<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<th style="text-align: left">Số lượng</th> -->
<!-- 											<td><input class="text" type="text" size="2px"></td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<th style="text-align: left"><label for="DVT">Đơn -->
<!-- 													vị tính</label></th> -->
<!-- 											<td><select required -->
<!-- 												title="Nơi sản xuất không được để trống"> -->
<!-- 													<option selected disabled></option> -->
<!-- 													<option>aaaaa</option> -->
<!-- 											</select></td> -->

<!-- 										</tr> -->
<!-- 									</table> -->
<!-- 								</div> -->
<!-- 								<div class="group-button"> -->
<!-- 									<button class="button"> -->
<!-- 										<i class="fa fa-floppy-o"></i>&nbsp;Lưu lại -->
<!-- 									</button> -->
<!-- 									<button type="reset" class="button"> -->
<!-- 										<i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại -->
<!-- 									</button> -->
<!-- 									<button type="button" class="button" -->
<!-- 										onclick="showForm('update-yc-vat-tu', 'update-form-ycvt',false)"> -->
<!-- 										<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát -->
<!-- 									</button> -->
<!-- 								</div> -->
<!-- 							</form> -->
<!-- 							</div> -->
							</div>

							</div>
</body>
</html>
