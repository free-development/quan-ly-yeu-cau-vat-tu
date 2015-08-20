<%@page import="model.CongVan"%>
<%@page import="model.NguoiDung"%>
<%@page import="model.VaiTro"%>
<%@page import="dao.VaiTroDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%><%@page import="java.util.ArrayList"%>
<%@page import="map.siteMap"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Văn phòng điện tử công ty điện lực Cần Thơ</title>
<link rel="stylesheet" href="style/style-giao-dien-chinh.css"
	type="text/css">
<link rel="stylesheet" href="style/style-chia-se.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--		 <link href="style/style-muc-dich.css" type="text/css" rel="stylesheet">-->
<link href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css"
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
	ArrayList<VaiTro> vaiTroList = (ArrayList<VaiTro>) request.getAttribute("vaiTroList");
	ArrayList<NguoiDung> nguoiDungList = (ArrayList<NguoiDung>) request.getAttribute("nguoiDungList");
	CongVan congVan = (CongVan) session.getAttribute("congVan");
	
	
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
						<li><a href="<%=siteMap.ctvtManage + "?action=manageCtvt"%>">Danh
								mục vật tư</a></li>
						<li><a href="<%=siteMap.bpsdManage +  "?action=manageBpsd"%>">Danh
								mục bộ phận sử dụng</a></li>
						<li><a href="<%=siteMap.mdManage + "?action=manageMd"%>">Danh
								mục mục đích</a></li>
					</ul></li>
				<li><a href="danh-muc-cong-van.html">Công văn</a></li>
				<li><a href="<%=siteMap.cscvManage +  "?action=manageCscv"%>">Chia
						sẽ</a></li>
				<li><a href="<%=siteMap.bcManage +  "?action=manageBc"%>">Báo
						cáo</a></li>
				<li><a href="<%=siteMap.ndManage + "?action=manageNd"%>">Quản
						lý người dùng</a></li>
			</ul>
			<div class="clear"></div>
		</div>

		<div id="main-content">
			<div id="main-content">
				<div id="title-content">Chia sẻ công văn</div>
				<form id="main-form" action="<%=siteMap.updateChiaSeCv%>" method="get">
					
					<div id="input-table" style="width: 75%">
						<table>
							<tr>
								<th style="text-align: ce"">Số công văn:</th>
								<td class="b-column"><%=congVan.getCvSo() %></td>
								<th class="c-column">Ngày đến:</th>
								<td class="b-column"><%=congVan.getCvNgayNhan() %></td>
								<th class="e-column">Người lập phiếu:</th>
								<td class="f-column">NV002</td>
							</tr>
						</table>
					</div>
<!-- 					<br /> -->
<%-- 					<form action="<%=siteMap.chiaSeCv%>" method="get"> --%>
					<div id="view-table" >
						<table style="margin: 0 auto;" class="scroll-chia-se" > 
							<tr style="background-color: #199e5e;">

								<th style="width: 100px;">Mã nhân viên</th>
								<th style="width: 200px;">Tên nhân viên</th>
								<%for (VaiTro vaiTro : vaiTroList) {%>
								<th class="thead-vaitro" style="max-width: 300px;"><%=vaiTro.getVtTen() %></th>
								<%} %>
<!-- 								<th class="four-column">Lập phiếu</th> -->
<!-- 								<th class="five-column">Cập nhật vật tư</th> -->
<!-- 								<th class="six-column">...</th> -->

							</tr>
							<% int count = 0;for(NguoiDung nguoiDung : nguoiDungList) { count ++;%>
							<tr <% if (count % 2 ==0) out.println("style=\"background : #CCFFFF;\"");%>>
								<td class="tbody-nguoidung"><%=nguoiDung.getMsnv() %></td>
								<td class="tbody-nguoidung"><%=nguoiDung.getHoTen() %></td>
								<% for(VaiTro vaiTro : vaiTroList) {%>
								<td class="checkbox"><input type="checkbox" name="vaiTro" value="<%	out.print(nguoiDung.getMsnv() + "#" + vaiTro.getVtId()); %>"></td>
<!-- 								<td class="checkbox"><input type="checkbox" name=""></td> -->
<!-- 								<td class="checkbox"><input type="checkbox" name=""></td> -->
<!-- 								<td class="checkbox"><input type="checkbox" name=""></td> -->
								<%} %>
							</tr>
							<%} %>
<!-- 							<tr> -->

<!-- 								<td class="a-column">NV002</td> -->
<!-- 								<td class="b-column">Trần Thị B</td> -->
<!-- 								<td class="checkbox"><input type="checkbox" name=""></td> -->
<!-- 								<td class="checkbox"><input type="checkbox" name=""></td> -->
<!-- 								<td class="checkbox"><input type="checkbox" name=""></td> -->
<!-- 								<td class="checkbox"><input type="checkbox" name=""></td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->

<!-- 								<td class="a-column">NV003</td> -->
<!-- 								<td class="b-column">Võ Văn C</td> -->
<!-- 								<td class="checkbox"><input type="checkbox" name=""></td> -->
<!-- 								<td class="checkbox"><input type="checkbox" name=""></td> -->
<!-- 								<td class="checkbox"><input type="checkbox" name=""></td> -->
<!-- 								<td class="checkbox"><input type="checkbox" name=""></td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->

<!-- 								<td class="a-column">NV004</td> -->
<!-- 								<td class="b-column">Lê Thị D</td> -->
<!-- 								<td class="checkbox"><input type="checkbox" name=""></td> -->
<!-- 								<td class="checkbox"><input type="checkbox" name=""></td> -->
<!-- 								<td class="checkbox"><input type="checkbox" name=""></td> -->
<!-- 								<td class="checkbox"><input type="checkbox" name=""></td> -->
<!-- 							</tr> -->
						</table>
					</div>
					<div class="group-button">
					<input type="hidden" value="save" name="action">
						<button class="btn">
							<i class="fa fa-floppy-o"></i>&nbsp;Lưu lại
						</button>
						<button type="reset" class="btn">
							<i class="fa fa-refresh"></i>&nbsp;&nbsp;Bỏ qua
						</button>
						<button type="button" class="btn" onclick="showForm('main-form')">
							<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
						</button>
				</form>
			</div>
		</div>

	</div>
</body>
</html>