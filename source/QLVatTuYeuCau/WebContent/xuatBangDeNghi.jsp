
//Xuat bang de nghi
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
<%@page import="model.DonVi"%>
<%@page import="model.TrangThai"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="style/style.css" type="text/css">
<link href="style/style-bao-cao-vat-tu-thieu.css" type="text/css"
	rel="stylesheet">
<link
	href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
		<% 
		ArrayList<DonVi> listDonVi = (ArrayList<DonVi>) session.getAttribute("donViList");
		ArrayList<TrangThai> listTrangThai = (ArrayList<TrangThai>) session.getAttribute("trangThaiList");
		ArrayList<CongVan> congVanList = (ArrayList<CongVan>) session.getAttribute("congVanList");
		HashMap<Integer, ArrayList<YeuCau>> yeuCauHash = (HashMap<Integer, ArrayList<YeuCau>>) session.getAttribute("yeuCau");
	       %>
	     <% 
		String exportToExcel = request.getParameter("exportToExel");
	        response.setCharacterEncoding("UTF-8");
	        request.setCharacterEncoding("UTF-8");
	        if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
	            response.setContentType("application/vnd.ms-excel");
	            response.setHeader("Content-Disposition", "inline; filename=" + "excel.xls");
	            
	        }
		%>
		<div id="view-table-baocao">
				<table style="text-align: center;margin: 0 auto;">
				<thead>
						<tr bgcolor="lightgreen">
						<th class="a-column">Số đến</th>
						<th class="b-column">Ngày nhận</th>
						<th class="c-column">Mã vật tư</th>
						<th class="d-column">Tên vật tư</th>
						<th class="e-column">Nơi sản xuất</th>
						<th class="f-column">Đơn vị tính</th>
						<th class="g-column">Trạng thái</th>
						<th class="k-column">Đơn vị</th>
						<th class="h-column">Chất lượng</th>
						<th class="m-column">Số lượng</th>
						
					</tr>
					</thead>
							<tbody>
							<%
							if(yeuCauHash != null) {
							 int cnt = 0;
							for(CongVan congVan  : congVanList) {
							ArrayList<YeuCau> yeuCauList = yeuCauHash.get(congVan.getCvId());
							for (YeuCau yeuCau : yeuCauList) {cnt++;
							%>
							<tr
								<%if (cnt % 2 == 0) out.println("style=\"background : #CCFFFF;\"");%>>
								<td class="a-column"><%=congVan.getSoDen() %></td>
								<td class="b-column"><%=congVan.getCvNgayNhan() %></td>
								<td class="c-column"><%=yeuCau.getCtVatTu().getVatTu().getVtMa() %></td>
								<td class="d-column"><%=yeuCau.getCtVatTu().getVatTu().getVtTen() %></td>
								<td class="e-column"><%=yeuCau.getCtVatTu().getNoiSanXuat().getNsxTen() %></td>
								<td class="f-column"><%=yeuCau.getCtVatTu().getVatTu().getDvt() %></td>
								<td class="g-column"><%=congVan.getTrangThai() %></td>
								<td class="h-column"><%=congVan.getDonVi()%></td>
								<td class="k-column"><%=yeuCau.getCtVatTu().getChatLuong().getClTen() %></td>
								<td class="m-column"><%=yeuCau.getYcSoLuong() %></td>

							</tr>
								<%}} %>
						</tbody>
						<%} %>
				</table>
				</div>
				<div class="group-button">
					<%
        				if (exportToExcel == null) {
   				 	 %>
   				 	 <button class="button" type="button">
						<i class="fa fa-print"></i>&nbsp;&nbsp;In
					</button>
					&nbsp;&nbsp;
					<button class="button" type="button" onclick="location.href='<%=siteMap.xuatBangDeNghi+".jsp"+ "?exportToExel=YES" %>'">
						<i class="fa fa-print"></i>&nbsp;&nbsp;Xuất file
					</button>
					&nbsp;&nbsp;
					<button type="button" class="button"  onclick="location.href='<%=siteMap.baoCaoBangDeNghi+".jsp" %>'">
						<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
					</button>
					<% } %>
				</div>
		