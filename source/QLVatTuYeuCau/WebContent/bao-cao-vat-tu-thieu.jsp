<%@page import="model.YeuCau"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="map.siteMap"%>
<%@page import="model.CTVatTu"%>
<%@page import="model.VatTu"%>
<%@page import="model.NoiSanXuat"%>
<%@page import="model.ChatLuong"%>
<%@page import="model.CongVan"%>
<%@page import="model.CongVan"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Văn phòng điện tử công ty điện lực Cần Thơ</title>
<link rel="stylesheet" href="style/style-giao-dien-chinh.css"
	type="text/css">
 <link rel="stylesheet" href="style/style.css" type="text/css">
<link href="style/style-bao-cao-vdat-tu-thieu.css" type="text/css"
	rel="stylesheet">
<link
	href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css"
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
			String loaiBc = (String) session.getAttribute("action"); 
// 	        String exportToExcel = request.getParameter("exportToExel");
// 	        if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
// 	            response.setContentType("application/vnd.ms-excel");
// 	            response.setHeader("Content-Disposition", "inline; filename=" + "excel.xls");
// 	        }
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
						<li><a href="danh-muc-noi-san-xuat.html">Danh mục nơi sản xuất</a></li>
						<li><a href="danh-muc-chat-luong.html">Danh mục chấtlượng</a></li>
						<li><a href="danh-muc-vat-tu.html">Danh mục vật tư</a></li>
						<li><a href="danh-muc-bo-phan.html">Danh mục bộ phận sử dụng</a></li>
						<li><a href="danh-muc-muc-dich.html">Danh mục mục đích</a></li><li><a href="<%=siteMap.nsxManage + "?action=manageNsx"%>">Danh mục nơi sản xuất</a></li>
						<li><a href="<%=siteMap.clManage + "?action=manageCl"%>">Danh mục chất lượng</a></li>
						<li><a href="<%=siteMap.ctvtManage + "?action=manageCtvt"%>">Danh mục vật tư</a></li>
						<li><a href="<%=siteMap.bpsdManage + "?action=manageBpsd"%>">Danh mục bộ phận sử dụng</a></li>
						<li><a href="<%=siteMap.mdManage + "?action=manageMd"%>">Danh mục mục đích</a></li>
						<li><a href="<%=siteMap.vtManage + "?action=manageVt"%>">Danh mục vai trò</a></li>
					</ul></li>
				<li><a href="<%=siteMap.cvManage+ "?action=manageCv" %>">Công văn</a></li>
				<li><a href="">Báo cáo</a>
					<ul>
						<li><a href="<%=siteMap.bcvttManage+ "?action=manageBcvtt" %>">Báo cáo vật tư thiếu</a></li>
						<li><a href="<%=siteMap.bcvttManage+ "?action=manageBcvtt" %>"/>Báo cáo vật tư thiếu</li>
						<li><a href="<%=siteMap.bcbdnManage+ "?action=manageBcbdn" %>"/>Báo cáo bảng đề nghị cấp vật tư</li>
					</ul>
				</li>
<!-- 				<li><a href="danh-muc-chia-se-cong-van.html">Chia sẻ</a></li> -->
				<li><a href="bao-cao.html">Quản lý người dùng</a></li>
			</ul>
			<div class="clear"></div>
		</div>

		<div id="main-content">
			<div id="title-content">Báo cáo vật tư thiếu</div>
			<br>
			<form id="option-form"  method="get" action="<%=siteMap.bcvttManage%>">
				<fieldset>
					<legend style="margin: 0 auto;">Tùy chọn báo cáo</legend>
					<table style="margin: 0 auto; padding-bottom: 20px; cellspading: 30px">

                        <tr>
                            <th style="text-align: left">Thời gian:</th>
                            <td style="text-align: left; " colspan="2" >Từ ngày &nbsp;
                            <input type="date" class="text" name="ngaybd" >
                            &nbsp;&nbsp;&nbsp;&nbsp; đến&nbsp;
                            <input type="date" class="text" name="ngaykt"></td>
                        </tr>
                        
                        <tr>
							<th style="text-align: left; padding-right: 10px;">Chế độ báo cáo:</th>
							<td style="font-size: 20px"><input name="action" type="radio" value="chitiet" required title="Bạn phải chọn chế độ báo cáo"/>&nbsp;&nbsp;Chi tiết</td>
						<td style="font-size: 20px"><input name="action" type="radio" value="tonghop"/>&nbsp;&nbsp;Tổng hợp</td>
	                    </tr>
	                    <tr>
	                    	<td><input type="submit" value="Xem" class="button"/></td>
	                    </tr>
					</table>
				</fieldset>
				
			</form>
			<% if("chitiet".equalsIgnoreCase(loaiBc)){
			
				ArrayList<CongVan> congVanList = (ArrayList<CongVan>) session.getAttribute("congVanList");			
		   		HashMap<Integer, ArrayList<YeuCau>> yeuCauHash = (HashMap<Integer, ArrayList<YeuCau>>) session.getAttribute("yeuCau");
		   		HashMap<Integer, ArrayList<YeuCau>> ctvtList = (HashMap<Integer, ArrayList<YeuCau>>) session.getAttribute("ctvtList");
		   		
		    %>
			
				<div id="view-table-bao-cao" class="scroll">
					<table>
							<tr bgcolor="lightgreen">
								<th class="one-column">Số đến</th>
								<th class="three-column">Ngày nhận</th>
								<th class="two-column">Mã vật tư</th>
								<th class="three-column">Tên vật tư</th>
								<th class="three-column">Nơi sản xuất</th>
								<th class="three-column">Chất lượng</th>
								<th class="six-column">Đơn vị tính</th>
								<th class="one-column">Số lượng thiếu</th>
								
							</tr>
						
									<% 								
										if(yeuCauHash != null){
										int count = 0;	
										for(CongVan congVan  : congVanList) { 
										ArrayList<YeuCau> yeuCauList = yeuCauHash.get(congVan.getCvId());
										for (YeuCau yeuCau : yeuCauList) { count++;
									%>
												
									<tr
										<%if (count % 2 == 1) out.println("style=\"background : #CCFFFF;\"");%>>
										<td class="a-column"><%=congVan.getSoDen() %></td>
										<td class="b-column"><%=congVan.getCvNgayNhan() %></td>
										<td class="a-column"><%=yeuCau.getCtVatTu().getVatTu().getVtMa() %></td>
										<td class="b-column"><%=yeuCau.getCtVatTu().getVatTu().getVtTen() %></td>
										<td class="c-column"><%=yeuCau.getCtVatTu().getNoiSanXuat().getNsxTen() %></td>
										<td class="d-column"><%=yeuCau.getCtVatTu().getChatLuong().getClTen() %></td>
										<td class="e-column"><%=yeuCau.getCtVatTu().getVatTu().getDvt() %></td>
										<td class="e-column"><%=yeuCau.getYcSoLuong() %></td>
									</tr>	
								<%}} }%>			
					</table>
				</div>
	
				<div class="group-button">
					<button class="button" type="button">
						<i class="fa fa-print"></i>&nbsp;&nbsp;In
					</button>
					&nbsp;					 
					<button class="button" type="button" onclick="location.href='<%=siteMap.xuatFile+ ".jsp"%>'">
						<i class="fa fa-print"></i>&nbsp;&nbsp;Xuất file
					</button>
					&nbsp;
					<button type="button" class="button" onclick="showForm('main-form')">
						<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
					</button>
				</div>
			
					<% }%>
					
				<% if("tonghop".equalsIgnoreCase(loaiBc)){
			
	   		HashMap<Integer, CTVatTu> ctvtHash = (HashMap<Integer, CTVatTu>) session.getAttribute("ctvtHash");
	   		HashMap<Integer, Integer> yeuCauHash = (HashMap<Integer, Integer>) session.getAttribute("yeuCau"); %>
			<div id="view-table-bao-cao" class="scroll">
				<table>
					<tr bgcolor="lightgreen">
						<th class="two-column">Mã vật tư</th>
						<th class="three-column">Tên vật tư</th>
						<th class="three-column">Nơi sản xuất</th>
						<th class="three-column">Chất lượng</th>
						<th class="six-column">Đơn vị tính</th>
						<th class="one-column">Tổng số lượng thiếu</th>
					</tr>
								<%
							if(yeuCauHash != null){
							int count = 0;
							for(Integer key  : yeuCauHash.keySet()) { count++;
							CTVatTu ctvt = ctvtHash.get(key);
// 							for (YeuCau yeuCau : yeuCauList) {
							%>
									
					<tr
						<%if (count % 2 == 1) out.println("style=\"background : #CCFFFF;\"");%>>
						<td class="a-column"><%=ctvt.getVatTu().getVtMa() %></td>
						<td class="b-column"><%=ctvt.getVatTu().getVtTen() %></td>
						<td class="c-column"><%=ctvt.getNoiSanXuat().getNsxTen() %></td>
						<td class="d-column"><%=ctvt.getChatLuong().getClTen() %></td>
						<td class="e-column"><%=ctvt.getVatTu().getDvt() %></td>
						<td class="e-column"><%=yeuCauHash.get(key) %></td>
					</tr>
					<%} %>
				</table>
			</div>

			<div class="group-button">
				<button class="button" type="button">
					<i class="fa fa-print"></i>&nbsp;&nbsp;In
				</button>
				&nbsp;
<!--     <a href="excel.jsp?exportToExcel=YES">Export to Excel</a> -->

				<button class="button" type="button" onclick="location.href='<%=siteMap.xuatFile+ ".jsp"%>'">
					<i class="fa fa-print"></i>&nbsp;&nbsp;Xuất file
				</button>
				&nbsp;
				<button type="button" class="button" onclick="location.href='<%=siteMap.home+ ".jsp"%>'">
					<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
				</button>
			</div>
				<%}}%>
	</div>
	</div>
</body>
</html>
