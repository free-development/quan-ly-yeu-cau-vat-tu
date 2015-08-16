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
<link href="style/style-cong-van.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="style/style-menu-tree.css" type="text/css">
<link
	href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/cong-van.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="img/logo16.png" type="image/x-icon" />
</head>
<body>
	<%
    	ArrayList<CongVan> congVanList = (ArrayList<CongVan>) request.getAttribute("congVanList");
    	HashMap<Integer, File> fileHash = (HashMap<Integer, File>) request.getAttribute("fileHash");
    	ArrayList<DonVi> donViList = (ArrayList<DonVi>) request.getAttribute("donViList");
    	ArrayList<MucDich> mucDichList = (ArrayList<MucDich>) request.getAttribute("mucDichList");
    	ArrayList<TrangThai> trangThaiList = (ArrayList<TrangThai>) request.getAttribute("trangThaiList");
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
			<div id="title-content">Công văn</div>
			<div id="main-content">
				<!--            <form id="main-form">-->
				<div class="left-content">
					<div id="scroll_time">
						<ol class="tree">
							<li><label for="folder1">Năm 2015</label> <input
								type="checkbox" id="folder1" />
								<ol>
									<li><label for="subfolder1">Tháng 08</label> <input
										type="checkbox" id="subfolder1" />
										<ol>

											<li class="file"><a href="">Ngày 31</a></li>
											<li class="file"><a href="">Ngày 30</a></li>
											<li class="file"><a href="">Ngày 29</a></li>
											<li class="file"><a href="">Ngày 28</a></li>
											<li class="file"><a href="">Ngày 27</a></li>
											<li class="file"><a href="">Ngày 26</a></li>
											<li class="file"><a href="">Ngày 25</a></li>
											<li class="file"><a href="">Ngày 24</a></li>
											<li class="file"><a href="">Ngày 23</a></li>
											<li class="file"><a href="">Ngày 22</a></li>
											<li class="file"><a href="">Ngày 21</a></li>
										</ol></li>

								</ol>
					</div>

					<select class="select">
						<option selected disabled>--Văn bản đến--</option>
						<option class="file"><a href="">Chưa giải quyết</a></option>
						<option class="file"><a href="">Đang giải quyết</a></option>
						<option class="file"><a href="">Đã giải quyết</a></option>
					</select> <br> <br>


				</div>
				<div class="right-content">
					<form id="search-form">
						<div class="a"></div>
						<table>
							<tr>
								<td>Chỉ tiêu lọc dữ liệu</td>
								<td><select class="select">
										<option selected disabled>-- Lọc dữ liệu --</option>
										<option>Ngày đến</option>
										<option>Số đến</option>
										<option>Mục đích nhận</option>
										<option>Nơi gửi</option>
										<option>Trích yếu</option>
										<option>Bút phê</option>
										<option>Nơi GQ chính</option>

								</select></td>
								<td>&nbsp;&nbsp;</td>
								<!--<td>
                                 <select class="select" >
                                <option selected disabled>--Tìm kiếm--</option>
                                <option>Thời gian</option>
                                <option>Số CV</option>
                                <option>Đơn vị</option>
                            </select>
                            </td>-->
								<td>
									<!--                                 <div class="search-form">-->
									<span class="search-text"> <!--								&nbsp;--> <input
										type="search" class="text" name="search_box" name="search"
										placeholder="Nội dung tìm kiếm" />
								</span> <span class="search-button">
										<button class="btn-search">
											<i class="fa fa-search"></i>
										</button>
								</span> <!--                                 </did="test"iv>-->
								</td>
								<!--
                            <td>
                                <span class="search-button">
							&nbsp;
							<button class="btn-search"><i class="fa fa-search" ></i></button>
							</span>
                            </td>
-->
							</tr>
						</table>
					</form>	
                     <form name="main-form" method="get" action="<%=siteMap.ycvtManage%>">
                     <div class="scroll_content">
							<%
                     	int count = 0;
                     	for(CongVan congVan : congVanList) {
                     		count ++;
                     %>
							<table style="font-size: 16px;" class="border-congvan">
								<tr>
									<td class="column-check" rowspan="6">
										<input type="checkbox" name="cvId" value="<%=congVan.getCvId()%>">
									</td>
									<td class="column-so-den">Số đến: &nbsp;&nbsp;</td>
									<td class="column-so-den" style="text-align: left" colspan=2><%=congVan.getSoDen() %></td>

									<td class="left-column">So cong van: &nbsp;&nbsp;</td>
									<td class="column-date" style="text-align: left"><%=congVan.getCvSo() %></td>
									
									<td class="left-column-first" >Ngày đến: &nbsp;&nbsp;</td>

									<td class="column-date" style="text-align: left"><%=congVan.getCvNgayNhan() %></td>

									<td rowspan="2">
										<div class="file" style="text-decoration: underline;">
											<a
												href="<%=siteMap.cvManage + "?action=download&file=" + congVan.getCvId()%>">
												<div class="mo-ta"><%=fileHash.get(congVan.getCvId()).getMoTa() %></div>
											</a>
										</div>
									</td>


								</tr>
								<tr>

									<td class="left-column-first">Mục đích: &nbsp;&nbsp;</td>

									<td colspan="3" style="text-align: left"><%=congVan.getMucDich() %></td>

									<td class="left-column">Ngày CV đi:&nbsp;&nbsp;</td>
									<td class="column-date" style="text-align: left"><%=congVan.getCvNgayDi()%></td>
								</tr>
								<tr>

									<td class="left-column-first">Nơi gửi: &nbsp;&nbsp;</td>

									<td colspan="6" style="text-align: left"><%= congVan.getDonVi().getDvTen()%></td>
								</tr>
								<tr>

									<td class="left-column-first">Trích yếu: &nbsp;&nbsp;</td>
									<td colspan="6" style="text-align: left"><%= congVan.getTrichYeu()%></td>
								</tr>
								<tr>

									<td class="left-column-first">Bút phê: &nbsp;&nbsp;</td>

									<td colspan="6"><%= congVan.getButPhe()%></td>
								</tr>
								<tr>

									<td class="left-column-first">Nơi GQ chính</td>

									<td colspan="6"><%=congVan.getDonVi().getDvTen() %></td>
								</tr>
							</table>
							<div class="chi-tiet">
								<a
									href="<%=siteMap.ycvtManage + "action=manageYcvt&congVan="+congVan.getCvId()%>">*Xem
									chi tiết</a>
							</div>
							<%} %>

						</div>
						<div class="group-button">
							<input type="hidden" name="action" value="update-yeu-cau">
							<button type="button" class="button" onclick="loadDataCv();">
								<i class="fa fa-plus-circle"></i>&nbsp;Thêm mới
							</button>
							<button type="button" class="button"
								onclick="preUpdateCv('main-form','update-form', true)">
								<i class="fa fa-pencil fa-fw"></i>&nbsp;Sửa
							</button>
							<button class="button" type="button" onclick="confirmDelete();">
								<i class="fa fa-trash-o"></i>&nbsp;&nbsp;Xóa
							</button>
<!-- 							<button class="button" "> -->
<!-- 								<i class="fa fa-trash-o"></i>&nbsp;&nbsp;Xóa -->
<!-- 							</button> -->
							&nbsp;
							<button class="button" onclick="return checkCongVan();">
								<i class="fa fa-spinner"></i>&nbsp;&nbsp;Cập nhật yêu cầu vật tư
							</button>
							&nbsp;
							<button type="button" class="button">
								<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
							</button>
						</div>
					</form>
				</div>



				<!--    		</form>  -->
				<!--                add-form-->
				<form id="add-form" name="add-form" action="/QLVatTuYeuCau/addCongVan.html" enctype="multipart/form-data" method="post">

					<div class="form-title">Thêm công văn</div>
					<div class="input-table">
						<table>
<!-- 							<tr style="margin-bottom: 20px;"> -->
<!-- 								<th colspan="1" style="text-align: left"><label for="soDen" style="text-align: left">Số đến</label></th> -->
<!-- 								<td colspan="3"><input type = "text" class="text" readonly value="123" style="background: #D1D1E0;" sise="5" name="soDen"></td> -->
<!-- 							</tr> -->
							<tr style="margin-bottom: 20px;">
								<th style="text-align: left" colspan="1"> <label for="soDen" style="text-align: left">Số công văn: </label></th>
								<td colspan="3"><input type="text" class="text" name="cvSo" id="cvSo"></td>
							</tr>	
							<tr style="margin-bottom: 20px;">	
								<th style="text-align: left"><label for="ngayGoi" class="input">Ngày gởi: </label></th>
								<td><input type="date" class="text" name="ngayGoi" id="ngayGoi" value=<%=DateUtil.convertToSqlDate(new java.util.Date()) %>></td>
								<th style="text-align: left"><label for="ngayNhan" class="input">Ngày nhận: </label></th>
								<td><input type="date" class="text" name="ngayNhan" id="ngayNhan" value=<%=DateUtil.convertToSqlDate(new java.util.Date()) %>>
								</td>
							</tr>
							<tr>
								<th style="text-align: left"><label for="mucDich" class="input">Mục
										đích</label></th>
								<td><select class="select" name="mucDich" id="mucDich">
										<option disabled selected value="">Chọn mục đích</option>
										<%for(MucDich mucDich : mucDichList) {%>
										<option value="<%=mucDich.getMdMa()%>" name="mucDich"><%=mucDich.getMdTen()%></option>
										<%} %>
								</select></td>
								<th style="text-align: left;"><label
									for="noiGoi" class="input">Nơi gửi</label></th>
								<td><select class="select" name="donVi" id="noiGoi">
										<option selected disabled value="">Chon noi gui</option>
										<%for(DonVi donVi : donViList) {%>
										<option value="<%=donVi.getDvMa()%>" ><%=donVi.getDvTen() %></option>
										<%} %>
								</select></td>
							<tr>
								<th style="text-align: left;" colspan="1"><label id="trichYeu" class="input">Trích yếu</label>
								<td colspan="3"><textarea class="txtarea" name="trichYeu"></textarea></td>
							</tr>
							<tr>
								<th style="text-align: left;" colspan="1"><label id="butPhe" class="input">But phe</label>
								<td colspan="3"><textarea class="txtarea" name="butPhe"></textarea></td>
							</tr>
							</tr>
								<th  style="text-align: left;"><label
										for="file" class="input" name="file">Dinh kem cong van: </label></th>
								<td colspan="3"><input type="file" id="file" name="file">
							<tr>	
							</tr>
								<th  style="text-align: left;"><label
										for="moTa" class="input" >Mo ta file: </label></th>
								<td colspan="3"><textarea class="txtarea" name="moTa"></textarea></td>
							<tr>
						</table>
					</div>
					<div class="group-button">
						<input type="hidden" name="action" value="addCongVan">
						<button class="button"
							onclick="showForm('main-form', 'add-form', true)">
							<i class="fa fa-plus-circle"></i>&nbsp;Lưu lại
						</button>
						<button type="reset" class="button">
							<i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại
						</button>
						<button type="button" class="button"
							onclick="showForm('main-form', 'add-form', false)">
							<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
						</button>
					</div>

				</form>
				<!--            update-form-->
				<form id="update-form">
					<div class="input-table">
						<div class="input-table">
						<table>
							<tr style="margin-bottom: 20px;">
								<th colspan="1" style="text-align: left"><label for="soDen" style="text-align: left">Số đến</label></th>
								<td colspan="3"><input type = "text" class="text" value="123" readonly style="background: #D1D1E0;" sise="5" name="soDen"></td>
							</tr>
							<tr style="margin-bottom: 20px;">
								<th style="text-align: left" colspan="1"> <label for="cvSo" style="text-align: left">Số công văn: </label></th>
								<td colspan="3"><input type="text" class="text" name="cvSo" id="cvSo" readonly style="background: #D1D1E0;"></td>
							</tr>	
							<tr style="margin-bottom: 20px;">	
								<th style="text-align: left"><label for="ngayGoi" class="input">Ngày gởi: </label></th>
								<td><input type="date" class="text" name="ngayGoiUpdate" id="ngayGoi" value=<%=DateUtil.convertToSqlDate(new java.util.Date()) %>></td>
								<th style="text-align: left"><label for="ngayNhan" class="input">Ngày nhận: </label></th>
								<td><input type="date" class="text" name="ngayNhanUpdate" id="ngayNhan" value=<%=DateUtil.convertToSqlDate(new java.util.Date()) %>>
								</td>
							</tr>
							<tr>
								<th style="text-align: left"><label for="mucDich" class="input">Mục
										đích</label></th>
								<td><select class="select" name="mucDichUpdate" id="mucDich">
										<option disabled selected value="">Chọn mục đích</option>
										<%for(MucDich mucDich : mucDichList) {%>
										<option value="<%=mucDich.getMdMa()%>" name="mucDich"><%=mucDich.getMdTen()%></option>
										<%} %>
								</select></td>
								<th style="text-align: left;"><label
									for="noiGoi" class="input">Nơi gửi</label></th>
								<td><select class="select" name="donViUpdate" id="noiGoi">
										<option selected disabled value="">Chon noi gui</option>
										<%for(DonVi donVi : donViList) {%>
										<option value="<%=donVi.getDvMa()%>" ><%=donVi.getDvTen() %></option>
										<%} %>
								</select></td>
							<tr>
								<th style="text-align: left;" colspan="1"><label id="trichYeu" class="input">Trích yếu</label>
								<td colspan="3"><textarea class="txtarea" name="trichYeuUpdate"></textarea></td>
							</tr>
							<tr>
								<th style="text-align: left;" colspan="1"><label id="butPhe" class="input">But phe</label>
								<td colspan="3"><textarea class="txtarea" name="butPheUpdate"></textarea></td>
							</tr>
							<tr>
								<th style="text-align: left;"><label
									for="file" class="input" name="file">Tep dinh kem: </label></th>
								<td><input type="file" id="file" name="file">
							</tr>
							<tr>
								<th style="text-align: left"><label for="TT">Trạng
										thái</label></th>
								<td style="text-align: right; padding-left: 10px;">
									<% for (TrangThai trangThai : trangThaiList) {%>
									<input type="radio" name="ttMaUpdate" value="<%=trangThai.getTtMa()%>" id="<%=trangThai.getTtMa()%>"> 
									<label for="<%=trangThai.getTtMa()%>"><%=trangThai.getTtTen()%></label>&nbsp;&nbsp;&nbsp;
									<%}%>
								</td>
							</tr>	
						</table>
						
					</div>
						
					</div>
					<div class="group-button">
						<button class="button">
							<i class="fa fa-floppy-o"></i>&nbsp;Lưu lại
						</button>
						<button type="reset" class="button">
							<i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại
						</button>
						<button type="button" class="button"
							onclick="showForm('main-form', 'update-form', false)">
							<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
						</button>
					</div>
				</form>
				<!--    update-vat-tu    -->
				<form id="update-yc-vat-tu">
					<div class="input-table-vt">
						<table>
							<div class="form-title">Cập nhật yêu cầu vật tư</div>
							<table>
								<tr>
									<th class="a-column">Chọn</th>
									<th class="b-column">Mã vật tư</th>
									<th class="c-column">Tên vật tư</th>

									<th class="e-column">Nơi sản xuất</th>
									<th class="f-column">Chất lượng</th>
									<th class="d-column">Số lượng</th>
									<th class="g-column">Đvt</th>
								</tr>
								<tr>
									<td class="a-column"><input type="checkbox" name=""></td>
									<td class="b-column">315422050</td>
									<td class="c-column">Cáp đòng bọc hạ áp CV 50m...</td>
									<td class="d-column">Viet Nam</td>
									<td class="e-column">Hàng thu hồi</td>
									<td class="f-column">17</td>
									<td class="g-column">m</td>
								</tr>
								<tr>
									<td class="a-column"><input type="checkbox" name=""></td>
									<td class="b-column">31582025</td>
									<td class="c-column">Cáp đồng bọc 24KV CX(CR)...</td>
									<td class="d-column">5</td>
									<td class="e-column">51091.313</td>
									<td class="f-column">255457</td>
									<td class="g-column">m</td>
								</tr>
								<tr>
									<td class="a-column"><input type="checkbox" name=""></td>
									<td class="b-column">32084025</td>
									<td class="c-column">Đầu cosse ép đồng 25cm2</td>
									<td class="d-column">1</td>
									<td class="e-column">19200</td>
									<td class="f-column">19200</td>
									<td class="g-column">cái</td>
								</tr>
								<tr>
									<td class="a-column"><input type="checkbox" name=""></td>
									<td class="b-column">32084050</td>
									<td class="c-column">Đầu cosse ép đồng 50cm2</td>
									<td class="d-column">4</td>
									<td class="e-column">23500</td>
									<td class="f-column">23500</td>
									<td class="g-column">cái</td>
								</tr>
								<tr>
									<td class="a-column"><input type="checkbox" name=""></td>
									<td class="b-column">32005814</td>
									<td class="c-column">Nối ép WR 259</td>
									<td class="d-column">4</td>
									<td class="e-column">11200</td>
									<td class="f-column">44800</td>
									<td class="g-column">cái</td>
								</tr>
							</table>
							</div>
							<div class="group-button">
								<button type="button" class="button"
									onclick="showForm('update-yc-vat-tu', 'add-form-ycvt', true)">
									<i class="fa fa-plus-circle"></i>&nbsp;Thêm mới
								</button>
								<button type="button" class="button"
									onclick="showForm('update-yc-vat-tu','update-form-ycvt', true)">
									<i class="fa fa-pencil fa-fw"></i>&nbsp;Sửa
								</button>
								<button class="button" onclick="return confirmDelete()">
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

							<form id="add-form-ycvt">
								<div class="input-table">
									<table>
										<div class="form-title" style="padding: 10px">Thêm yêu
											cầu vật tư</div>
										<tr>
											<th style="text-align: left"><label for="TKM">Tìm
													kiếm mã</label></th>
											<td><input name="" type="text" class="text" required
												autofocus size="2" maxlength="3" pattern="[a-zA-Z0-9]{3}"
												title="Mã mục đích chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"></td>
											<td class="name" style="text-align: right"><input
												type="checkbox" name=""></td>
											<th style="text-align: left"><label for="TT">Theo
													tên</label></th>
										</tr>
										<tr>
											<th style="text-align: left"><label for="MVT">Mã
													vật tư</label></th>
											<td><input name="" size="3px" class="text" align=right
												type="text" class="text" required
												title="Mã vật tư không được để trống"></td>
										</tr>
										<tr>
											<th style="text-align: left"><label for="MVT">Nơi
													sản xuất</label></th>
											<td><select required
												title="Nơi sản xuất không được để trống">
													<option selected disabled></option>
													<option>aaaaaaaaaaaaaaa</option>
											</select></td>
										</tr>
										<tr>
											<th style="text-align: left"><label for="DVT">Chất
													lượng</label></th>
											<td><select required
												title="Nơi sản xuất không được để trống">
													<option selected disabled></option>
													<option>aaaaa</option>
											</select></td>

										</tr>
										<tr>
											<th style="text-align: left">Số lượng</th>
											<td><input class="text" type="text" size="2px"></td>
										</tr>
										<tr>
											<th style="text-align: left"><label for="DVT">Đơn
													vị tính</label></th>
											<td><select required
												title="Nơi sản xuất không được để trống">
													<option selected disabled></option>
													<option>aaaaa</option>
											</select></td>

										</tr>
									</table>
								</div>
								<div class="group-button">
									<button class="button">
										<i class="fa fa-plus-circle"></i>&nbsp;Thêm
									</button>
									<button type="reset" class="button">
										<i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại
									</button>
									<button type="button" class="button"
										onclick="showForm('update-yc-vat-tu','add-form-ycvt', false)">
										<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
									</button>
								</div>
							</form>
							<form id="update-form-ycvt">
								<div class="input-table">
									<table>
										<div class="form-title" style="padding: 10px">Cập nhật
											yêu cầu vật tư</div>
										<tr>
											<th style="text-align: left"><label for="TKM">Tìm
													kiếm mã</label></th>
											<td><input name="" type="text" class="text" required
												autofocus size="2" maxlength="3" pattern="[a-zA-Z0-9]{3}"
												title="Mã mục đích chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"></td>
											<td class="name" style="text-align: right"><input
												type="checkbox" name=""></td>
											<th style="text-align: left"><label for="TT">Theo
													tên</label></th>
										</tr>
										<tr>
											<th style="text-align: left"><label for="MVT">Mã
													vật tư</label></th>
											<td><input name="" size="3px" align=right class="text"
												type="text" class="text" required
												title="Mã vật tư không được để trống"></td>
										</tr>
										<tr>
											<th style="text-align: left"><label for="MVT">Nơi
													sản xuất</label></th>
											<td><select required
												title="Nơi sản xuất không được để trống">
													<option selected disabled></option>
													<option>aaaaaaaaaaaaaaa</option>
											</select></td>
										</tr>
										<tr>
											<th style="text-align: left"><label for="DVT">Chất
													lượng</label></th>
											<td><select required
												title="Nơi sản xuất không được để trống">
													<option selected disabled></option>
													<option>aaaaa</option>
											</select></td>

										</tr>
										<tr>
											<th style="text-align: left">Số lượng</th>
											<td><input class="text" type="text" size="2px"></td>
										</tr>
										<tr>
											<th style="text-align: left"><label for="DVT">Đơn
													vị tính</label></th>
											<td><select required
												title="Nơi sản xuất không được để trống">
													<option selected disabled></option>
													<option>aaaaa</option>
											</select></td>

										</tr>
									</table>
								</div>
								<div class="group-button">
									<button class="button">
										<i class="fa fa-floppy-o"></i>&nbsp;Lưu lại
									</button>
									<button type="reset" class="button">
										<i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại
									</button>
									<button type="button" class="button"
										onclick="showForm('update-yc-vat-tu', 'update-form-ycvt',false)">
										<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
									</button>
								</div>
							</form>
							</div>
							</div>

							</div>
</body>
</html>
