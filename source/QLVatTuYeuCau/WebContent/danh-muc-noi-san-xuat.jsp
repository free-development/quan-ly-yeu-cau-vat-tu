<%@page import="map.siteMap"%>
<%@page import="model.NoiSanXuat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Văn phòng điện tử công ty điện lực Cần Thơ</title>
<link rel="stylesheet" href="style/style-giao-dien-chinh.css"
	type="text/css">
<link rel="stylesheet" href="style/style-noi-san-xuat.css"
	type="text/css">
<link rel="stylesheet" href="style/style.css" type="text/css">
<link href="style/style-muc-dich.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<link
	href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/noi-san-xuat.js"></script>
<script type="text/javascript">
// $(document).ready(function() {
// 	  	$('.page').click(function(){
// 	    	var page = $(this).val();
// 	    	alert(page);
// 	    });	
// 	});
</script>
<meta charset="UTF-8">
<link rel="Shortcut Icon" href="img/logo16.png" type="image/x-icon" />
</head>
<body>
	<%
    	request.getCharacterEncoding();
    	response.getCharacterEncoding();
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	
    		ArrayList<NoiSanXuat> listNoiSanXuat = (ArrayList<NoiSanXuat>) request.getAttribute("noiSanXuatList");
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
	
				<div id="main-content">
					<div id="title-content">
		 Danh mục nơi sản xuất
		</div>
		<div id="main-content">
			
			<form id="main-form">
				<div id="view-table">
					<table>
						<tr style="background:#199e5e">
							<th class="left-column"><input type="checkbox" class="checkAll"></th>
							<th class="mid-column"> Mã NSX</th>
							<th class="right-column">Tên nơi sản xuất</th>
						</tr>
						<%
							if(listNoiSanXuat != null) {
							int count = 0;
							for(NoiSanXuat noiSanXuat : listNoiSanXuat) { count++ ;%>
						<tr class="rowContent" 
							<%if (count % 2 == 0) out.println("style=\"background : #CCFFFF;\"");%>>
							<td class="left-column"><input type="checkbox" name="nsxMa" value="<%=noiSanXuat.getNsxMa() %>" class="checkbox"></td>
							<td class="col"><%=noiSanXuat.getNsxMa() %></td>
							<td class="col"><%=noiSanXuat.getNsxTen() %></td>
						</tr>
						<%} }%>
<!-- 						<tr> -->
<!-- 							<th colspan="3"> -->
<%-- 								<% --%>

<%-- 									for(int i = 0; i <= pageNum; i++) { %> --%>
<%-- 										<input type="button" value="<%=i+1%>" class="page"> --%>
<%-- 								<%} %> --%>
<!-- 							</th> -->
<!-- 						</tr> -->
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
					<input type="hidden" name="action" value="deleteNsx">
					<button type="button" class="button"  onclick="showForm('add-form', true);"><i class="fa fa-plus-circle"></i>&nbsp;Thêm</button>
					<button type="button" onclick="preUpdateNsx('update-form', true)"
							class="button">
							<i class="fa fa-pencil fa-fw"></i>&nbsp;Thay đổi
					</button> <!-- onclick="return confirmDelete()" -->
						<button class="button" type="button" onclick="confirmDelete();">
							<i class="fa fa-trash-o"></i>&nbsp;&nbsp;Xóa
						</button>&nbsp;
						<button class="button" type="reset">
							<i class="fa fa-spinner"></i>&nbsp;&nbsp;Bỏ qua
						</button>&nbsp;
						<button type="button" class="btn" onclick="location.href='<%=siteMap.home%>'">
							<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
						</button>
				</div>
		</form>
		
		<!-------------- --add-form-------------- -->
		<form id="add-form" onsubmit="addNsx();">
			<div class="input-table">
				<table>
					<div class="form-title">Thêm nơi sản xuất</div>
					<tr>
						<th><label for="MNSX">Mã NSX</label></th>
						<td><input name="nsxMa" type="text" class="text" required onkeypress="changensxMa();"
							autofocus size="2" maxlength="3" pattern="[a-zA-Z0-9]{3}"
							title="Mã nơi sản xuất chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"><div id="requirensxMa" style="color: red"></td>
					</tr>
					<tr>
						<th class="label"><label for="MNSX">Tên NSX</label></th>
						<td><input name="nsxTen" id = "a" size="30px" align=left type="text" onkeypress="changensxTen();"
							class="text" required
							title="Tên nơi sản xuất không được để trống"><div id="requirensxTen" style="color: red"></td>
					</tr>
				</table>
			</div>
			<div class="group-button">
				<button class="button" type="button" onclick="addNsx();">
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
					<div class="form-title">Cập nhật nơi sản xuất</div>
					<tr>
						<th><label for="MNSX">Mã NSX</label></th>
						<td><input name="nsxMaUpdate" type="text" class="text" 
							required  size="2" maxlength="3" readonly style="background-color: #D1D1E0;"
							pattern="[a-zA-Z0-9]{3}"
							title="Mã nơi sản xuất chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"></td>
					</tr>
					<tr>
						<th><label for="MNSX">Tên NSX</label></th>
						<td><input name="nsxTenUpdate" size="30px" type="text" onkeypress="changensxTenUp();"
							class="text" required autofocus
							title="Tên nơi sản xuất không được để trống"><div id="requirensxTenUp" style="color: red"></div></td>
					</tr>
				</table>
			</div>
			<div class="group-button">
				<input type="hidden" name="action" value="UpdateNsx">
				<button class="button" type="button" onclick="confirmUpdateNsx();">
					<i class="fa fa-floppy-o"></i>&nbsp;Lưu lại
				</button>
				<button type="reset" class="button">
					<i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại
				</button>
				<button type="button" class="button"
					onclick="showForm('update-form', false)">
					<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
				</button>
			</div>
		</form>
	</div>
	</div>

	</div>
</body>
</html>