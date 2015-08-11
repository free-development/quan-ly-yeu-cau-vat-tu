<%@page import="java.util.HashMap"%>
<%@page import="model.CongVan"%>
<%@page import="model.File"%>
<%@page import="map.siteMap"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="img/logo16.png" type="image/x-icon" />
</head>
<body>
	<%
    	ArrayList<CongVan> congVanList = (ArrayList<CongVan>) request.getAttribute("congVanList");
    	HashMap<Integer, File> fileHash = (HashMap<Integer, File>) request.getAttribute("fileHash");
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
					<form id="main-form">
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
						<div class="scroll_content">
							<%
                     	int count = 0;
                     	for(CongVan congVan : congVanList) {
                     		count ++;
                     %>
							<table style="font-size: 16px;" class="border-congvan">
								<tr>
									<td class="column-check" rowspan="6"><input
										type="checkbox" name="congVanId"></td>
									<td class="left-column-first">Ngày đến:</td>

									<td class="column-date"><%=congVan.getCvNgayNhan() %></td>
									<td class="column-so-den">Số đến</td>
									<td class="column-so-den"><%=congVan.getCvSo() %></td>

									<td class="left-column">Ký hiệu</td>
									<td class="column-date">2118/TB-PCCT</td>
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

									<td class="left-column-first">Mục đích</td>

									<td colspan="3"><%=congVan.getMucDich() %></td>

									<td class="left-column">Ngày CV đi:</td>
									<td class="column-date"><%=congVan.getCvNgayDi()%></td>
								</tr>
								<tr>

									<td class="left-column-first">Nơi gửi</td>

									<td colspan="6"><%= congVan.getDonVi()%></td>
								</tr>
								<tr>

									<td class="left-column-first">Trích yếu</td>

									<td colspan="6"><%= congVan.getTrichYeu()%></td>
								</tr>
								<tr>

									<td class="left-column-first">Bút phê</td>

									<td colspan="6"><%= congVan.getButPhe()%></td>
								</tr>
								<tr>

									<td class="left-column-first">Nơi GQ chính</td>

									<td colspan="6"><%=congVan.getDonVi() %></td>
								</tr>
							</table>
							<div class="chi-tiet">
								<a
									href="<%=siteMap.ycvtManage + "action=manageYcvt&congVan="+congVan.getCvId()%>">*Xem
									chi tiết</a>
							</div>
							<%} %>
							<!--
                    <div class="chi-tiet">
                        <a href="">*Xem chi tiết</a>    
                    </div>
                        <br>
                    <table>
                        <tr>
                            <td class="column-check"><input type="checkbox" name=""</td>
                            <td class="left-column-first">Ngày đến:</td>
                            <td class="mid-column"></td>
                            <td class="column-date">23/06/2015</td>
                            <td class="column-so-den">Số đến</td>
                            <td class="column-so-den">2118-0</td>
                            <td class="mid-column"></td>
                            <td class="left-column">Ký hiệu</td>
                            <td  class="column-date">2118/TB-PCCT</td>
                            <td rowspan="2"><a href="">2118 TB ketluanGD trienkhaithuchiencacQC QLNB</a></td>
                        </tr>
                        <tr>
                            <td class="column-check"></td>
                            <td class="left-column-first">Mục đích</td>
                            <td class="mid-column"></td>
                            <td colspan="3">Sửa chữa lớn</td>
                            <td class="mid-column"></td>
                            <td class="left-column">Ngày CV:</td>
                            <td class="column-date">20/05/2015</td>
                        </tr>
                         <tr>
                             <td class="column-check"></td>
                            <td>Nơi gửi</td>
                            <td class="mid-column"></td>
                            <td colspan="4">CTY ĐIỆN LỰC TP CẦN THƠ</td>
                        </tr>
                        <tr>
                            <td class="column-check"></td>
                            <td>Trích yếu</td>
                            <td class="mid-column"></td>
                            <td width=500px colspan="7">Thông báo kết luận Giám Đốc về triển khai thực hiện các Qui chế QLNB</td>
                        </tr>
                        <tr>
                            <td class="column-check"></td>
                            <td class="left-column-first">Bút phê</td>
                            <td class="mid-column"></td>
                            <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td class="column-check"></td>
                            <td class="left-column-first">Nơi GQ chính</td>
                            <td class="mid-column"></td>
                            <td colspan="6">Phòng Kế Hoạch, Phòng Vật Tư</td>
                        </tr>
                    </table>
                    
                        <br>
                   <table>
                        <tr>
                            <td class="column-check"><input type="checkbox" name=""</td>
                            <td class="left-column-first">Ngày đến:</td>
                            <td class="mid-column"></td>
                            <td class="column-date">23/06/2015</td>
                            <td class="column-so-den">Số đến</td>
                            <td class="column-so-den">2118-0</td>
                            <td class="mid-column"></td>
                            <td class="left-column">Ký hiệu</td>
                            <td  class="column-date">2118/TB-PCCT</td>
                            <td rowspan="2"><a href="">2118 TB ketluanGD trienkhaithuchiencacQC QLNB</a></td>
                        </tr>
                        <tr>
                            <td class="column-check"></td>
                            <td class="left-column-first">Mục đích</td>
                            <td class="mid-column"></td>
                            <td colspan="3">Sửa chữa lớn</td>
                            <td class="mid-column"></td>
                            <td class="left-column">Ngày CV:</td>
                            <td class="column-date">20/05/2015</td>
                        </tr>
                         <tr>
                             <td class="column-check"></td>
                            <td>Nơi gửi</td>
                            <td class="mid-column"></td>
                            <td colspan="4">CTY ĐIỆN LỰC TP CẦN THƠ</td>
                        </tr>
                        <tr>
                            <td class="column-check"></td>
                            <td>Trích yếu</td>
                            <td class="mid-column"></td>
                            <td width=500px colspan="7">Thông báo kết luận Giám Đốc về triển khai thực hiện các Qui chế QLNB</td>
                        </tr>
                        <tr>
                            <td class="column-check"></td>
                            <td class="left-column-first">Bút phê</td>
                            <td class="mid-column"></td>
                            <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td class="column-check"></td>
                            <td class="left-column-first">Nơi GQ chính</td>
                            <td class="mid-column"></td>
                            <td colspan="6">Phòng Kế Hoạch, Phòng Vật Tư</td>
                        </tr>
                    </table>
-->

						</div>
						<div class="group-button">
							<button type="button" class="button" onclick="loadDataCv();">
								<i class="fa fa-plus-circle"></i>&nbsp;Thêm mới
							</button>
							<button type="button" class="button"
								onclick="preUpdateCv('main-form','update-form', true)">
								<i class="fa fa-pencil fa-fw"></i>&nbsp;Sửa
							</button>
							<button class="button" onclick="return confirmDelete()">
								<i class="fa fa-trash-o"></i>&nbsp;&nbsp;Xóa
							</button>
							&nbsp;
							<button class="button"
								onclick="showForm('main-form','update-yc-vat-tu', true)">
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
				<form id="add-form">

					<div class="form-title">Thêm công văn</div>
					<div class="input-table">
						<table>

							<tr>
								<th style="text-align: left"><label for="MD">Mục
										đích</label></th>
								<td><select class="select">
										<option disabled selected value="">Chọn mục đích</option>
										<option value="">Sửa chữa lớn</option>
										<option value="">Xây dựng cơ bản</option>
										<option value="">Sửa chữa thường xuyên</option>
										<option value="">Sản xuất kinh doanh</option>
								</select></td>
								<th style="text-align: left; padding-left: 20px;"><label
									for="NG">Nơi gửi</label></th>
								<td><select class="select">
										<option></option>
										<option value="">Công ty Điện lực TP.Cần Thơ</option>
										<option value="">Ban QLDA lưới điện</option>
										<option value="">Phòng tổ chức và nhân sự</option>
										<option value="">Phòng kế hoạch</option>
								</select></td>
							</tr>
							<tr>
								<th style="text-align: left"><label for="N">Năm</label></th>
								<td><select class="select">
										<option></option>
										<option>2015</option>
										<option>2014</option>
										<option>2013</option>
										<option>2012</option>
								</select></td>
								<th style="text-align: left; padding-left: 20px;"><label
									for="TN">Từ số</label></th>
								<td><select class="select">
										<option></option>
										<option>2118-0</option>
										<option>2119-0</option>
										<option>2120-0</option>
								</select></td>
								<th style="text-align: left; padding-left: 20px;"><label
									for="TS">Từ ngày</label></th>
								<td><select class="select">
										<option></option>
										<option>23/06/2015</option>
								</select></td>
							</tr>
							<tr>
								<th style="text-align: left"><label for="KH">Ký
										hiệu</label></th>
								<td><input name="" size="10px" align=right type="text"
									class="text" required title=""></td>
								<!--
                                    <th style="text-align: left;padding-left:20px;"><label for="HT">Hình thức</label></th>
                                    <td><select class="select">
                                        <option></option>
                                        </select>
                                    </td>
-->
								<th></th>
								<td></td>
								<th style="text-align: left; padding-left: 20px;"><label
									for="NK">Ngày ký</label></th>
								<td><select class="select">
										<option></option>
										<option>23/06/2015</option>
								</select></td>
							</tr>
							<!--
                                <tr>
                                    <th style="text-align: left"><label for="KH">Lĩnh vực</label></th>
                                    <td><select class="select">
                                        <option></option>
                                        </select>
                                    </td>
                                    <th style="text-align: left;padding-left:20px;";><label for="HT">Loại TL</label></th>
                                    <td><select class="select">
                                        <option></option>
                                        </select>

                                </tr>	
-->

						</table>
						<table>
							<th style="text-align: left"><label for="TY">Trích
									yếu</label></th>
							<td><textarea class="txtarea"></textarea></td>
							</tr>
						</table>
						<!--
                            <table style="padding: 10px">
                                    <td style="text-align: right"><input type="checkbox" name=""</td>
                                    <th style="text-align: left;padding-right:30px;"><label for="M">Mật</label></th>
                                    <td style="text-align: right"><input type="checkbox" name=""</td>
                                    <th style="text-align: left"><label for="M">Khẩn</label></th>
                             </table>
-->
						<table>
							<tr>
								<th style="text-align: left"><label for="TT">Trạng
										thái</label></th>
<!-- 								<td style="text-align: right; padding-left: 10px;"><input -->
<!-- 									type="radio" name="add"></td> -->
<!-- 								<th style="text-align: left"><label for="CGQ">Chưa -->
<!-- 										giải quyết</label></th> -->
<!-- 								<td style="text-align: right; padding-left: 10px;"><input -->
<!-- 									type="radio" name="add"></td> -->
<!-- 								<th style="text-align: left"><label for="DGQ">Đã -->
<!-- 										giải quyết</label></th> -->
<!-- 								<td style="text-align: right; padding-left: 10px;"><input -->
<!-- 									type="radio" name="add"></td> -->
<!-- 								<th style="text-align: left"><label for="DGQ1">Đang -->
<!-- 										giải quyết</label></th> -->
							</tr>
						</table>
					</div>
					<div class="group-button">
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
						<table>
							<div class="form-title">Sửa công văn</div>
							<tr>
								<th style="text-align: left"><label for="MD">Mục
										đích</label></th>
								<td><select class="select">
										<option></option>
										<option value="">Sửa chữa lớn</option>
										<option value="">Xây dựng cơ bản</option>
										<option value="">Sửa chữa thường xuyên</option>
										<option value="">Sản xuất kinh doanh</option>
								</select></td>
								<th style="text-align: left; padding-left: 20px;"><label
									for="NG">Nơi gửi</label></th>
								<td><select class="select">
										<option></option>
										<option>EVN</option>
										<option>UBND Thành phố Cần Thơ</option>
										<option value="">Công ty Điện lực TP.Cần Thơ</option>
										<option value="">Ban QLDA lưới điện</option>
										<option value="">Phòng tổ chức và nhân sự</option>
										<option value="">Phòng kế hoạch</option>
								</select></td>
							</tr>
							<tr>
								<th style="text-align: left"><label for="N">Năm</label></th>
								<td><select class="select">
										<option></option>
										<option>2015</option>
										<option>2014</option>
										<option>2013</option>
										<option>2012</option>
								</select></td>
								<th style="text-align: left; padding-left: 20px;"><label
									for="TN">Từ số</label></th>
								<td><select class="select">
										<option></option>
										<option>2118-0</option>
										<option>2119-0</option>
										<option>2120-0</option>
								</select></td>
								<th style="text-align: left; padding-left: 20px;"><label
									for="TS">Từ ngày</label></th>
								<td><select class="select">
										<option></option>
										<option>23/06/2015</option>
								</select></td>
							</tr>
							<tr>
								<th style="text-align: left"><label for="KH">Ký
										hiệu</label></th>
								<td><input name="" size="10px" align=right type="text"
									class="text" required title=""></td>
								<!--
                            <th style="text-align: left;padding-left:20px;"><label for="HT">Hình thức</label></th>
							<td><select class="select">
                                <option></option>
                                </select>
                            </td>
-->
								<th></th>
								<td></td>
								<th style="text-align: left; padding-left: 20px;"><label
									for="NK">Ngày ký</label></th>
								<td><select class="select">
										<option></option>
										<option>23/06/2015</option>
								</select></td>
							</tr>
							<!--
                        <tr>
							<th style="text-align: left"><label for="KH">Lĩnh vực</label></th>
							<td><select class="select">
                                <option></option>
                                </select>
                            </td>
                            <th style="text-align: left;padding-left:20px;";><label for="HT">Loại TL</label></th>
							<td><select class="select">
                                <option></option>
                                </select>
                            
						</tr>	
-->

						</table>
						<table>
							<th style="text-align: left"><label for="TY">Trích
									yếu</label></th>
							<!--                            <td><input name="" size="80px" align=right type="text" class="text" required title=""></td>-->
							<td><textarea class="txtarea"></textarea></td>
							</tr>
						</table>
						<!--
                    <table style="padding: 10px">
                            <td style="text-align: right"><input type="checkbox" name=""</td>
                            <th style="text-align: left;padding-right:30px;"><label for="M">Mật</label></th>
                            <td style="text-align: right"><input type="checkbox" name=""</td>
                            <th style="text-align: left"><label for="M">Khẩn</label></th>
                     </table>
-->
						<table>
							<tr>
								<th style="text-align: left"><label for="TT">Trạng
										thái</label></th>
								<td style="text-align: right; padding-left: 10px;"><input
									type="radio" name="add"></td>
								<th style="text-align: left"><label for="CGQ">Chưa
										giải quyết</label></th>
								<td style="text-align: right; padding-left: 10px;"><input
									type="radio" name="add"></td>
								<th style="text-align: left"><label for="DGQ">Đã
										giải quyết</label></th>
								<td style="text-align: right; padding-left: 10px;"><input
									type="radio" name="add"></td>
								<th style="text-align: left"><label for="DGQ1">Đang
										giải quyết</label></th>
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
