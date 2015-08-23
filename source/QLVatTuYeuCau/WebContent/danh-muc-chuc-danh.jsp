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
<link href="style/style-muc-dich.css" type="text/css" rel="stylesheet">
<link href="style/style-chat-luong.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<link
	href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<script >
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
<script type="text/javascript" src="js/chucdanh.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="img/logo16.png" type="image/x-icon" />
</head>
<body>
	<%
    		ArrayList<ChucDanh> listChucDanh = (ArrayList<ChucDanh>) request.getAttribute("chucDanhList");
	Long size = (Long) request.getAttribute("size");
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

		<div id="title-content">Danh mục chức danh</div>
		<div id="main-content">

			<form id="main-form">
				<div id="view-table" class="scroll">
					<table>
						<tr style="background-color: #199e5e;">
							<td class="left-column"><input type="checkbox" name=""
								class="checkAll"></td>
							<th class="mid-column">Mã chức danh</th>
							<th class="right-column">Tên chức danh</th>

						</tr>
						<%
							if(listChucDanh != null) {
							int count = 0;
							for(ChucDanh chucDanh : listChucDanh) { count++;%>
						<tr class="rowContent"
							<%if (count % 2 == 0) out.println("style=\"background : #CCFFFF;\"");%>>
							<td class="left-column"><input type="checkbox" name="cdMa"
								value="<%=chucDanh.getCdMa() %>" class="checkbox"></td>
							<td class="col"><%=chucDanh.getCdMa() %></td>
							<td class="col"><%=chucDanh.getCdTen() %></td>
						</tr>
						<%} }%>
					</table>
				</div>
				
				<div id = "paging" >
							<table style ="border-style: none;">
								<tr>
									<td><a href=""> Previous<< </a></td>
									<td>
										<%
											long pageNum = size / 10;
											for(int i = 0; i <= pageNum; i++) { %>
												<input type="button" value="<%=i+1%>" class="page">
										<%} %>
									</td>
									<td><a href="">>>Next </a> </td>
								</tr>
							</table>
						</div>
				
				<div class="group-button">
					<input type="hidden" name="action" value="deleteCd">
					<button type="button" class="button"
						onclick="showForm('add-form', true)">
						<i class="fa fa-plus-circle"></i>&nbsp;Thêm
					</button>
					<button type="button" onclick="preUpdateCd('update-form', true)"
						class="button" title="Chọn 1 chất lượng để thay đổi">
						<i class="fa fa-pencil fa-fw"></i>&nbsp;Thay đổi
					</button>
					<button class="button" type="button" onclick="confirmDeleteCd();">
						<i class="fa fa-trash-o"></i>&nbsp;&nbsp;Xóa
					</button>
					&nbsp;
					<button class="button" type="reset">
						<i class="fa fa-spinner"></i>&nbsp;&nbsp;Bỏ qua
					</button>
					&nbsp;
					<button type="button" class="btn">
						<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
					</button>
				</div>
			</form>

			

			<form id="add-form" method="get"
				action="<%=siteMap.clManage + "?action=manageCd" %>">
				<div class="input-table">
					<table>
						<div class="form-title">Thêm chức danh</div>
						<tr>
							<td class="input"><label for="MCD">Mã chức danh</label></td>
							<td><input name="cdMa" type="text" class="text" required
								autofocus size="2" maxlength="3" onkeypress="changeCdMa();" pattern="[a-zA-Z0-9]{3}"
								title="Mã chất lượng chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"><div id="requireCdMa" style="color: red"></div></td>
						</tr>
						<tr>
							<th class="input"><label for="TCD">Tên chức danh</label>
							</td>
							<td><input name="cdTen" size="30px" align=left type="text"
								class="text" onkeypress="changeCdTen();"required title="Tên chất lượng không được để trống"><div id="requireCdTen" style="color: red"></div></td>
						</tr>
					</table>
				</div>
				<div class="button-group">
					<!-- 				<input type="hidden" name="action" value = "AddCd">   -->
					<button class="button" onclick="addCd();" type="button">
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
						<div class="form-title">Cập nhật chất lượng</div>
						<tr>
							<td class="input"><label for="MCD">Mã chức danh</label></td>
							<td><input name="cdMaUpdate" type="text" class="text"
								required autofocus size="2" maxlength="3" value="A80"
								pattern="[a-zA-Z0-9]{3}"
								title="Mã chất lượng chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"
								value="MCD" readonly></td>
						</tr>
						<tr>
							<td class="input"><label for="TCD">Tên chức danh</label></td>
							<td><input name="cdTenUpdate" size="30px" align=left
								type="text" class="text" onkeypress="changeCdTenUpdate();"
								value="Hàng thu hồi có thể sử dụng được" required
								title="Tên chất lượng không được để trống"><div id="requireCdTenUpdate" style="color: red"></div></td>
						</tr>
					</table>
				</div>
				<div class="group-button">
					<input type="hidden" name="action" value="UpdateCd">
					<button class="button" onclick="confirmUpdateCd()" type="button">
						<i class="fa fa-floppy-o"></i>&nbsp;Lưu lại
					</button>
					<button type="reset" class="button">
						<i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại
					</button>
					<button type="button" class="button"
						onclick="showForm('update-form')">
						<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
					</button>
				</div>
			</form>
		</div>
	</div>

	</div>
</body>
</html>