<%@page import="util.DateUtil"%>
<%@page import="java.util.Date"%>
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
 <link rel="stylesheet" href="style/style.css" type="text/css">
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
		java.sql.Date ngaybd = (java.sql.Date)session.getAttribute("ngaybd");
		java.sql.Date ngaykt = (java.sql.Date)session.getAttribute("ngaykt");
			String loaiBc = (String) session.getAttribute("action"); 
	        String exportToExcel = request.getParameter("exportToExel");
	        response.setCharacterEncoding("UTF-8");
	        request.setCharacterEncoding("UTF-8");
	        if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
	            response.setContentType("application/vnd.ms-excel");
	            response.setHeader("Content-Disposition", "inline; filename=" + "excel.xls");
	            
	        }
		%>
		<% if("chitiet".equalsIgnoreCase(loaiBc)){
			
				ArrayList<CongVan> congVanList = (ArrayList<CongVan>) session.getAttribute("congVanList");			
		   		HashMap<Integer, ArrayList<YeuCau>> yeuCauHash = (HashMap<Integer, ArrayList<YeuCau>>) session.getAttribute("yeuCau");
		   		HashMap<Integer, ArrayList<YeuCau>> ctvtList = (HashMap<Integer, ArrayList<YeuCau>>) session.getAttribute("ctvtList");
		   		
		    %>
		    <table style = "margin: 0 auto;width:960px;">
		<tr>
			<td style="text-align: left;">TỔNG CÔNG TY ĐIỆN LỰC THÀNH PHỐ CẦN THƠ</td>
			<td style="text-align: right;">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</td>
			
		<tr>
			<td style="text-align: left;">Địa chỉ: 06 Nguyễn Trãi, Q.Ninh Kiều, TP.Cần Thơ.</td>
			<td style="text-align: right;">Độc lập - Tự do - Hạnh phúc</td>
			
		</tr>
		</table>
			<div style="text-align: center;font-size: 20px;font-weight: bold;color: #199e5e;">Báo cáo chi tiết vật tư thiếu</div>
		<div style="text-align: center;">Từ ngày:&nbsp;&nbsp;<%=DateUtil.toString(ngaybd)%>&nbsp;&nbsp;đến ngày:&nbsp;&nbsp;<%=DateUtil.toString(ngaykt)%></div>
		<div style="margin-right: 20px;padding-left: 900px;">Ngày in:&nbsp;&nbsp; <%=DateUtil.toString(new java.util.Date())%></div>
				<div id="view-table-bao-cao" >
					<table  style="border: solid 1px black;">
						<thead >
							<tr bgcolor="#199e5e" >
								<th style="border: 1px solid black;" class="one-column">Số đến</th>
								<th style="border: 1px solid black;" class="three-column">Ngày nhận</th>
								<th style="border: 1px solid black;" class="two-column">Mã vật tư</th>
								<th style="border: 1px solid black;" class="three-column">Tên vật tư</th>
								<th style="border: 1px solid black;" class="three-column">Nơi sản xuất</th>
								<th style="border: 1px solid black;" class="three-column">Chất lượng</th>
								<th style="border: 1px solid black;" class="six-column">Đơn vị tính</th>
								<th style="border: 1px solid black;" class="one-column">Số lượng thiếu</th>
								
							</tr>
						</thead>
						
									<% 								
										if((yeuCauHash != null) && "chitiet".equalsIgnoreCase(loaiBc)){
										int count = 0;
										
									%>
							<tbody>
									<%
										for(CongVan congVan  : congVanList) { 
										ArrayList<YeuCau> yeuCauList = yeuCauHash.get(congVan.getCvId());
										for (YeuCau yeuCau : yeuCauList) {count++;
									%>
												
									<tr
										<%if (count % 2 == 0) out.println("style=\"background : #CCFFFF;\"");%>>
										<td class="a-column"><%=congVan.getSoDen() %></td>
										<td class="b-column"><%=congVan.getCvNgayNhan() %></td>
										<td class="a-column"><%=yeuCau.getCtVatTu().getVatTu().getVtMa() %></td>
										<td class="b-column"><%=yeuCau.getCtVatTu().getVatTu().getVtTen() %></td>
										<td class="c-column"><%=yeuCau.getCtVatTu().getNoiSanXuat().getNsxTen() %></td>
										<td class="d-column"><%=yeuCau.getCtVatTu().getChatLuong().getClTen() %></td>
										<td class="e-column"><%=yeuCau.getCtVatTu().getVatTu().getDvt() %></td>
										<td class="e-column"><%=yeuCau.getYcSoLuong() %></td>
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
   				 	 <button class="button" type="button" onclick="window.print();">
						<i class="fa fa-print"></i>&nbsp;&nbsp;In
					</button>
					&nbsp;
					<button class="button" type="button" onclick="location.href='<%=siteMap.xuatFile+".jsp"+ "?exportToExel=YES" %>'">
						<i class="fa fa-print"></i>&nbsp;&nbsp;Xuất file
					</button>
					<% } %>
					&nbsp;
					<button type="button" class="button" onclick="location.href='<%=siteMap.baoCaoVatTuThieu+".jsp" %>'">
						<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
					</button>
				</div>
			
					<% }%>
					
				<% if("tonghop".equalsIgnoreCase(loaiBc)){
			
	   		HashMap<Integer, CTVatTu> ctvtHash = (HashMap<Integer, CTVatTu>) session.getAttribute("ctvtHash");
	   		HashMap<Integer, Integer> yeuCauHash = (HashMap<Integer, Integer>) session.getAttribute("yeuCau"); %>
	   		<table style = "margin: 0 auto;width:960px;">
		<tr>
			<td style="text-align: left;">TỔNG CÔNG TY ĐIỆN LỰC THÀNH PHỐ CẦN THƠ</td>
			<td style="text-align: right;">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</td>
			
		<tr>
			<td style="text-align: left;">Địa chỉ: 06 Nguyễn Trãi, Q.Ninh Kiều, TP.Cần Thơ.</td>
			<td style="text-align: right;">Độc lập - Tự do - Hạnh phúc</td>
			
		</tr>
		</table>
	   		<div style="text-align: center;font-size: 20px;font-weight: bold;color: #199e5e;">Báo cáo tổng hợp vật tư thiếu</div>
		<div style="text-align: center;">Từ ngày:&nbsp;&nbsp;<%=DateUtil.toString(ngaybd)%>&nbsp;&nbsp;đến ngày:&nbsp;&nbsp;<%=DateUtil.toString(ngaykt)%></div>
		<div style="margin-right: 20px;padding-left: 900px;">Ngày in:&nbsp;&nbsp; <%=DateUtil.toString(new java.util.Date())%></div>
			<div id="view-table-bao-cao" >
				<table style="width:650px;" >
					<tr bgcolor="#199e5e"  style="border: solid 1px black;" >
						<th style="border: 1px solid black;" class="two-column"style="text-align: center;">Mã vật tư</th>
						<th style="border: 1px solid black;" class="three-column">Tên vật tư</th>
						<th style="border: 1px solid black;" class="three-column">Nơi sản xuất</th>
						<th style="border: 1px solid black;" class="three-column">Chất lượng</th>
						<th style="border: 1px solid black;" class="six-column">Đơn vị tính</th>
						<th style="border: 1px solid black;" class="one-column">Tổng số lượng thiếu</th>
						
					</tr>
								<%
								int count = 0;
							if(yeuCauHash != null){
							for(Integer key  : yeuCauHash.keySet()) { count++;
							CTVatTu ctvt = ctvtHash.get(key);
// 							for (YeuCau yeuCau : yeuCauList) {
							%>
									
					<tr <%if (count % 2 == 0) out.println("style=\"background : #CCFFFF;\"");%> >
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

			
				 <%
        			if (exportToExcel == null) {
   				 %>
   				 <div class="group-button">
				<button class="button" type="button"onclick="window.print();">
					<i class="fa fa-print"></i>&nbsp;&nbsp;In
				</button>
				&nbsp;
<!--     <a href="excel.jsp?exportToExcel=YES">Export to Excel</a> -->

				<button class="button" type="button" onclick="location.href='<%=siteMap.xuatFile+".jsp"+ "?exportToExel=YES" %>'">
					<i class="fa fa-print"></i>&nbsp;&nbsp;Tải file
				</button>
				    
				&nbsp;
				<button type="button" class="button" onclick="location.href='<%=siteMap.baoCaoVatTuThieu+".jsp" %>'">
					<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
				</button>
			</div>
				<%}}}%>
<%-- 				<% if(exportToExcel != null) --%>
<%-- 					response.sendRedirect("xuatFile.jsp");%> --%>
</body>
</html>