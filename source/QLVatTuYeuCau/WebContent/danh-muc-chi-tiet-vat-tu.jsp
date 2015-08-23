<%@page import="model.CTVatTu"%>
<%@page import="model.VatTu"%>
<%@page import="model.NoiSanXuat"%>
<%@page import="model.ChatLuong"%>
<%@page import="map.siteMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Văn phòng điện tử công ty điện lực Cần Thơ</title>
<link rel="stylesheet" href="style/style-giao-dien-chinh.css"
	type="text/css">
<link rel="stylesheet" href="style/style.css" type="text/css">
<link href="style/style-vat-tu.css" type="text/css" rel="stylesheet">
<link
	href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.6.3.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/vattu.js"></script>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="img/logo16.png" type="image/x-icon" />
</head>
<body>
	<%
    
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
			<div id="title-content">Danh mục chi tiết vật tư</div>

			<div class="lbltk">
				<table>
					<tr>
<!-- 						<td><select class="select" style=""> -->
<!-- 								<option value="">--Tùy chọn--</option> -->
<!-- 								<option value="">Tên vật tư</option> -->
<!-- 								<option value="">Nơi sản xuất</option> -->
<!-- 								<option value="">Chất lượng</option> -->
<!-- 								<option value="">Số lượng tồn</option> -->
<!-- 								<option value="">Định mức</option> -->
<!-- 						</select></td> -->
<!-- 						<td> -->
<!-- 							<div class="search_form1" id="search"> -->
<!-- 								<form action="" method="post"> -->
<!-- 									<span class="search-text"> &nbsp; <input type="search" -->
<!-- 										class="text" name="search_box" name="search" -->
<!-- 										placeholder="Tìm kiếm" /> -->
<!-- 									</span> <span class="search-button"> &nbsp; -->
<!-- 										<button class="btn-search"> -->
<!-- 											<i class="fa fa-search"></i> -->
<!-- 										</button> -->
<!-- 									</span> -->
<!-- 								</form> -->
<!-- 							</div> -->
<!-- 						</td> -->
							<td>Tìm kiếm mã</td>
							<td><input type="text" style="size: 20px" /></td>
							<td><input type="checkbox" /></td>
							<td>Theo tên</td>
					</tr>
				</table>
			</div>

			
			<div id="view-table" class="scroll-chi-tiet">
				<table>
					<tr style="background: #199e5e">
						<th class="left-column"><input type="checkbox"
							class="checkAll"></th>
						<th class="a-column">Mã vật tư</th>
						<th class="a-column">Tên vật tư</th>
						<th class="three-column">Nơi sản xuất</th>
						<th class="six-column">Chất lượng</th>
						<th class="four-column">Đơn vị tính</th>
						<th class="five-column">Định mức</th>
						<th class="seven-column">Số lượng tồn</th>
					</tr>
					<%
							if(listCTVatTu != null) {
							int count = 0;
							for(CTVatTu ctVatTu : listCTVatTu) { count++;%>

					<tr
						<%if (count % 2 == 0) out.println("style=\"background : #CCFFFF;\"");%>>
						<td class="left-column"><input type="checkbox" name="vtMa"
							value="<%=ctVatTu.getVatTu().getVtMa() %>" class="checkbox"></td>
						<td class="col"><%=ctVatTu.getVatTu().getVtMa() %></td>
						<td class="col"><%=ctVatTu.getVatTu().getVtTen() %></td>
						<td class="col"><%=ctVatTu.getNoiSanXuat().getNsxTen() %></td>
						<td class="col"><%=ctVatTu.getChatLuong().getClTen() %></td>
						<td class="col"><%=ctVatTu.getVatTu().getDvt() %></td>
						<td class="col"><%=ctVatTu.getDinhMuc() %></td>
						<td class="col"><%=ctVatTu.getSoLuongTon() %></td>

					</tr>
					<%} }%>

				</table>
			</div>

			<div class="group-button">

				<button type="button" class="button"
					onclick="">
					<i class="fa fa-pencil fa-fw"></i>&nbsp;Import
				</button>
				<button class="button" onclick="">
					<i class="fa fa-trash-o"></i>&nbsp;&nbsp;Xuất File
				</button>
				&nbsp;

				&nbsp;
				<button class="button" type="button">
					<i class="fa fa-print"></i>&nbsp;&nbsp;In
				</button>
				&nbsp;
				<button type="button" class="button" onclick="showForm('main-form')">
					<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
				</button>
			</div>
			
			
		</div>
	</div>
</body>
</html>