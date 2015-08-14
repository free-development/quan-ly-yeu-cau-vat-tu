<%@page import="model.DonVi"%>
<%@page import="model.CongVan"%>
<%@page import="model.YeuCau"%>
<%@page import="java.util.ArrayList"%>
<%@page import="map.siteMap"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Văn phòng điện tử công ty điện lực Cần Thơ</title>
<link rel="stylesheet" href="style/style-giao-dien-chinh.css"
	type="text/css">
<link rel="stylesheet" href="style/style.css" type="text/css">
<link href="style/style-bao-cao-bang-de-nghi.css" type="text/css"
	rel="stylesheet">
<link
	href="style\font-awesome-4.3.0\font-awesome-4.3.0\css\font-awesome.min.css"
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
	ArrayList<DonVi> listDonVi = (ArrayList<DonVi>) request.getAttribute("donViList");
	ArrayList<CongVan> congVanList = (ArrayList<CongVan>) request.getAttribute("congVanList");
	HashMap<Integer, ArrayList<YeuCau>> yeuCauHash = (HashMap<Integer, ArrayList<YeuCau>>) request.getAttribute("yeuCau");
    %>
	<div class="wrapper">
		<div class="header">
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
						<li><a href="<%=siteMap.ctvtManage + "?action=manageCtvt"%>">Danh
								mục vật tư</a></li>
						<li><a href="<%=siteMap.bpsdManage +  "?action=manageBpsd"%>">Danh
								mục bộ phận sử dụng</a></li>
						<li><a href="<%=siteMap.mdManage + "?action=manageMd"%>">Danh
								mục mục đích</a></li>
					</ul></li>
				<li><a href="danh-muc-cong-van.html">Công văn</a></li>
				<li><a href="<%=siteMap.bcManage +  "?action=manageBc"%>">Báo cáo</a>
					<ul>
						<li><a href="<%=siteMap.bcvttManage+ "?action=manageBcvtt" %>"/>Báo cáo vật tư thiếu</li>
						<li><a href="<%=siteMap.bcbdnManage+ "?action=manageBcbdn" %>"/>Báo cáo bảng đề nghị cấp vật tư</li>
					</ul>
				</li>
				<li><a href="danh-muc-chia-se-cong-van.html">Chia sẽ</a></li>
				<li><a href="<%=siteMap.ndManage + "?action=manageNd"%>">Quản
						lý người dùng</a></li>
			</ul>
			<div class="clear"></div>
		</div>

		<div id="main-content">
			<div id="title-content">Báo cáo bảng đề nghị cấp vật tư</div>
			<div id="content">
			<form id="option-form" method="get" action ="<%=siteMap.bcbdnManage %>">
				<table style="margin-left: 200px;margin-top: 10px;">
					<tr>
                            <th style="text-align: left;margin-top: 10px;padding-right:10px;" >Thời gian:</th>
                            <td style="text-align: left;margin-top: 10px;" colspan="2" >Từ ngày &nbsp;
                            <input type="date" class="text"name="ngaybd">
                            &nbsp;&nbsp;&nbsp;&nbsp; đến&nbsp;
                            <input type="date" class="text"name="ngaykt"></td>
                    </tr>
					<tr>
						<th style="text-align: left;margin-top: 10px;padding-right:10px;">Đơn vị:</th>
						<td style="text-align: left">
						<select required
							title="" class="select" id="donvi" name="donvi" style="margin-top: 10px;">
								<option disabled selected value="">-- Chọn đơn vị --</option>
								<%						  
 								int count = 0;
 								for (DonVi donVi : listDonVi)
 								{%>  
 								<option value=<%=donVi.getDvMa()%>><%=donVi.getDvTen()%></option> 
 								<%}  
  								%>  
						</select>
						</td>
					</tr>
				</table>
				<table class="radio" style="margin-top: 10px;margin-left: 200px;">
					<th style="text-align: left;padding-right:10px;">Trạng thái:</th>
					
					<td style="text-align: right;"><input type="radio"
						name="trangthai"></td>
					<td style="text-align: left;"><label class="lable1" for="CGQ">Chưa
							giải quyết</label></td>
					<td style="text-align: right;"><input type="radio" name="trangthai"></td>
					<td style="text-align: left;"><label class="lable1" for="DAGQ">Đã
							giải quyết</label></td>
					<td style="text-align: right;"><input type="radio"
						name="trangthai"></td>
					<td style="text-align: left"><label class="lable1" for="DANGGQ">Đang
							giải quyết</label></td>
					
					<td style="text-align: right;"><input type="radio"
						name="trangthai"></td>
					<td style="text-align: left;"><label class="lable1" for="CGQ">Tất cả</label></td>
				</table>
				<input type="hidden" name="action" value="baocaobdn">
				<input class="button" type="submit" value="Xem">
<!-- 					<i class="fa fa-eye"></i>&nbsp;&nbsp;</> -->
				<br>
				<br>
				</form>
			</div>
			<div id="view-table">
				<table>
					<tr>
						<th class="a-column">Số đến</th>
						<th class="b-column">Ngày nhận</th>
						<th class="c-column">Mã vật tư</th>
						<th class="d-column">Tên vật tư</th>
						<th class="e-column">Nơi sản xuất</th>
						<th class="f-column">Đơn vị tính</th>
						<th class="g-column">Trạng thái</th>
						<th class="h-column">Chất lượng</th>
						<th class="k-column">Số lượng</th>
						<th class="k-column">Đơn vị</th>
					</tr>
							<%
							if(yeuCauHash != null) {
							 int cnt = 0;
							for(CongVan congVan  : congVanList) { cnt++;
							ArrayList<YeuCau> yeuCauList = yeuCauHash.get(congVan.getCvId());
							for (YeuCau yeuCau : yeuCauList) {
							%>
									
					<tr
						<%if (cnt % 2 == 1) out.println("style=\"background : #CCFFFF;\"");%>>
						<td class="a-column"><%=congVan.getSoDen() %></td>
						<td class="b-column"><%=congVan.getCvNgayNhan() %></td>
						<td class="a-column"><%=yeuCau.getCtVatTu().getVatTu().getVtMa() %></td>
						<td class="b-column"><%=yeuCau.getCtVatTu().getVatTu().getVtTen() %></td>
						<td class="c-column"><%=yeuCau.getCtVatTu().getNoiSanXuat().getNsxTen() %></td>
						<td class="e-column"><%=yeuCau.getCtVatTu().getVatTu().getDvt() %></td>
						<td class="e-column"><%=congVan.getTrangThai() %></td>
						<td class="e-column"><%=congVan.getDonVi()%></td>
						<td class="d-column"><%=yeuCau.getCtVatTu().getChatLuong().getClTen() %></td>
						<td class="e-column"><%=yeuCau.getYcSoLuong() %></td>

					</tr>
					<%} }}%>
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
</html>