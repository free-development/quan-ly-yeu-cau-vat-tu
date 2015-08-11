<%@page import="model.MucDich"%>
<%@page import="java.util.ArrayList"%>
<%@page import="map.siteMap"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Văn phòng điện tử công ty điện lực Cần Thơ</title>
<link rel="stylesheet" href="style/style-giao-dien-chinh.css"
	type="text/css">
<link rel="stylesheet" href="style/style.css" type="text/css">
<link href="style/style-muc-dich.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.6.3.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<link
	href="style\font-awesome-4.3.0\font-awesome-4.3.0\css\font-awesome.min.css"
	type="text/css" rel="stylesheet">
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
<script type="text/javascript" src="js/mucdich.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="img/logo16.png" type="image/x-icon" />
</head>
<body>
	<%
    		ArrayList<MucDich> listMucDich = (ArrayList<MucDich>) request.getAttribute("mucDichList");
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
								<select name="" required>
								<option disabled selected>--Tùy chọn kiếm kiềm</option>
									<option>ABBB</option>
									<option>ABBB</option>
									<option>ABBB</option>
									<option>ABBB</option>
								</select>
							</span>
-->

					<span class="search-text"> &nbsp; <input type="search"
						required class="search" name="search_box" name="search"
						placeholder="Tìm kiếm" title="Bạn phải nhập nội dung tìm kiếm" />
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
						<li><a href="<%=siteMap.ctvtManage + "?action=manageCtvt"%>">Danh
								mục vật tư</a></li>
						<li><a href="<%=siteMap.bpsdManage +  "?action=manageBpsd"%>">Danh
								mục bộ phận sử dụng</a></li>
						<li><a href="<%=siteMap.mdManage + "?action=manageMd"%>">Danh
								mục mục đích</a></li>
						<li><a href="<%=siteMap.cdManage + "?action=manageCd"%>">Danh
								mục chức danh</a></li>
					</ul></li>
				<li><a href="danh-muc-cong-van.html">Công văn</a></li>
				<li><a href="<%=siteMap.bcManage +  "?action=manageBc"%>">Báo
						cáo</a></li>
				<li><a href="<%=siteMap.ndManage + "?action=manageNd"%>">Quản
						lý người dùng</a></li>
			</ul>
			<div class="clear"></div>
		</div>
		<div id="content">
			<div id="content-wrapper">
				<div id="greeting">Chào Nguyễn Văn An</div>
				<div id="title-content">Danh mục mục đích</div>
				<div id="main-content">

					<form id="main-form">
						<div id="view-table" class="scroll">
							<table>
								<tr style="background: #199e5e">
									<td class="left-column"><input type="checkbox" name=""
										class="checkAll"></td>
									<th class="mid-column">Mã mục đích</th>
									<th class="right-column">Tên mục đích</th>
								</tr>
								<%
							if(listMucDich != null) {
							int count = 0;
							for(MucDich mucDich : listMucDich) { count++;%>
								<tr
									<%if (count % 2 == 0) out.println("style=\"background : #CCFFFF;\"");%>>
									<td class="left-column"><input type="checkbox" name="mdMa"
										value="<%=mucDich.getMdMa() %>" class="checkbox"></td>
									<td class="col"><%=mucDich.getMdMa() %></td>
									<td class="col"><%=mucDich.getMdTen() %></td>
								</tr>
								<%} }%>
							</table>
						</div>

						<div class="group-button">
							<input type="hidden" name="action" value="deleteMd">
							<button type="button" class="button"
								onclick="showForm('add-form', true)">
								<i class="fa fa-plus-circle"></i>&nbsp;Thêm
							</button>
							<button type="button" class="button"
								onclick="preUpdateMd('update-form', true)">
								<i class="fa fa-pencil fa-fw"></i>&nbsp;Thay đổi
							</button>
							<button class="button" onclick="confirmDeleteMsd()">
								<i class="fa fa-trash-o"></i>&nbsp;&nbsp;Xóa
							</button>
							&nbsp;
							<button class="button" type="reset">
								<i class="fa fa-spinner"></i>&nbsp;&nbsp;Bỏ qua
							</button>
							&nbsp;
							<button type="button" class="button">
								<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
							</button>
						</div>
					</form>

					<form id="add-form" method="get"
						action="<%=siteMap.mdManage + "?action=manageMd" %>">
						<div class="input-table">
							<table>
								<div class="form-title">Thêm mục đích</div>
								<tr>
									<th><label for="MMD">Mã mục đích</label></th>
									<td><input name="mdMa" type="text" class="text" required
										autofocus size="2" maxlength="3" pattern="[a-zA-Z0-9]{3}"
										title="Mã mục đích chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"></td>
								</tr>
								<tr>
									<th><label for="MMD">Tên mục đích</label></th>
									<td><input name="mdTen" size="30px" align=left type="text"
										class="text" required title="Tên mục đích không được để trống"></td>
								</tr>
							</table>
						</div>
						<div class="group-button">
							<!-- 						<input type="hidden" name="action" value = "AddMd">  -->
							<button class="button" type="button" onclick="addMd()">
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
								<div class="form-title">Cập nhật mục đích</div>
								<tr>
									<th><label for="MMD">Mã mục đích</label></th>
									<td><input name="mdMaUpdate" type="text" class="text"
										required size="2" maxlength="3" pattern="[a-zA-Z0-9]{3}"
										title="Mã mục đích chỉ gồm 3 ký tự, không chứa khoảng trắng và ký tự đặc biệt"
										value="MMA" readonly></td>
								</tr>
								<tr>
									<th><label for="MMD">Tên mục đích</label></th>
									<td><input name="mdTenUpdate" autofocus size="30px"
										align=left type="text" class="text" required
										title="Tên mục đích không được để trống"></td>
								</tr>
							</table>
						</div>
						<div class="group-button">
							<input type="hidden" name="action" value="UpdateMd">
							<button class="button" type="button" onclick="confirmUpdateMd()">
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