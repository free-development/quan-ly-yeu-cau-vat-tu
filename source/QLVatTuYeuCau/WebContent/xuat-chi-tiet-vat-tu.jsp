
<%@page import="util.DateUtil"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.swing.text.DateFormatter"%>
<%@page import="java.util.logging.SimpleFormatter"%>
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
  <link rel="stylesheet" href="style/style-bao-cao.css" type="text/css">
<link href="style/style-bao-cao-vat-tu-thieu.css" type="text/css"
	rel="stylesheet">
<link
	href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<meta charset="utf-8">
<title></title>
</head>
<body>
		<% 
    	ArrayList<CTVatTu> listCTVatTu = (ArrayList<CTVatTu>) session.getAttribute("ctVatTuList");
// 	Long pageNum = (Long) request.getAttribute("page");

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
		<table style = "margin: 0 auto;width:960px;">
		<tr>
			<td style="text-align: left; width: 500px;">TỔNG CÔNG TY ĐIỆN LỰC THÀNH PHỐ CẦN THƠ</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td style="text-align: right; width: 350px;">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</td>
			
		<tr>
			<td style="text-align: left; width: 350px;">Địa chỉ: 06 Nguyễn Trãi, Q.Ninh Kiều, TP.Cần Thơ.</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td style="text-align: right; width: 350px;">Độc lập - Tự do - Hạnh phúc</td>
			
		</tr>
		</table>
		<div style="text-align: center;font-size: 20px;font-weight: bold;color: #199e5e;margin-top:20px;">Báo cáo chi tiết vật tư</div>
			
		<div style="margin-right: 20px;padding-left: 900px;">Ngày in:&nbsp;&nbsp; <%=DateUtil.toString(new java.util.Date())%></div>
			<div id="view-table-bao-cao">
					<table style="text-align: center;margin: 0 auto; color: black;border: solid 1px black;width:960px;">
					<thead>
						<tr bgcolor="#199e5e"  style= "border-style: solid;border-color:black;">
						<th class="four-column">Mã vật tư</th>
						<th class="a-column">Tên vật tư</th>
						<th class="three-column">Nơi sản xuất</th>
						<th class="six-column">Chất lượng</th>
						<th class="four-column">Đơn vị tính</th>
						<th class="five-column">Định mức</th>
						<th class="seven-column">Số lượng tồn</th>
							
						</tr>
						</thead>
									<tbody>
									<%
								if(listCTVatTu != null) {
								int count = 0;
								for(CTVatTu ctVatTu : listCTVatTu) { count++;%>
	
										<tr class="rowContent"
											<%if (count % 2 == 0) out.println("style=\"background : #CCFFFF;\"");%>>
											<td class="col"><%=ctVatTu.getVatTu().getVtMa() %></td>
											<td class="col"><%=ctVatTu.getVatTu().getVtTen() %></td>
											<td class="col"><%=ctVatTu.getNoiSanXuat().getNsxTen() %></td>
											<td class="col"><%=ctVatTu.getChatLuong().getClTen() %></td>
											<td class="col"><%=ctVatTu.getVatTu().getDvt() %></td>
											<td class="col"><%=ctVatTu.getDinhMuc() %></td>
											<td class="col"><%=ctVatTu.getSoLuongTon() %></td>
					
										</tr>
										<%} }%>
							</tbody>
				</table>
				</div>
				<div class="group-button">
					<%
        				if (exportToExcel == null) {
   				 	 %>
   				 	 <button class="button" type="button" onclick="window.print();">
						<i class="fa fa-print"></i>&nbsp;&nbsp;In
					</button>
					&nbsp;&nbsp;
					<button class="button" type="button" onclick="location.href='<%=siteMap.xuatCTVatTu+".jsp"+ "?exportToExel=YES" %>'">
						<i class="fa fa-print"></i>&nbsp;&nbsp;Tải file
					</button>
					&nbsp;&nbsp;
					<button type="button" class="button"  onclick="location.href='<%=siteMap.ctVatu+".jsp" %>'">
						<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
					</button>
					<% } %>
					 
				</div>
		</body>
		</html>