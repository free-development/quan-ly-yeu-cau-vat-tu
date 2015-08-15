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
<title>Insert title here</title>
</head>
<body>
		<%
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
			
				<div id="view-table-bao-cao" >
					<table>
						<thead>
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
								<%}} %>
						</tbody>
						<%} %>
					</table>
				</div>
	
				<div class="group-button">
					<button class="button" type="button">
						<i class="fa fa-print"></i>&nbsp;&nbsp;In
					</button>
					&nbsp;
					 <%
        				if (exportToExcel == null) {
   				 	 %>
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
			<div id="view-table-bao-cao">
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
				 <%
        			if (exportToExcel == null) {
   				 %>
<!--     <a href="excel.jsp?exportToExcel=YES">Export to Excel</a> -->

				<button class="button" type="button" onclick="location.href='<%=siteMap.xuatFile+".jsp"+ "?exportToExel=YES" %>'">
					<i class="fa fa-print"></i>&nbsp;&nbsp;Xuất file
				</button>
				    
				&nbsp;
				<button type="button" class="button" onclick="location.href='<%=siteMap.baoCaoVatTuThieu+"jsp" %>'">
					<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
				</button>
			</div>
				<%}}}%>
<%-- 				<% if(exportToExcel != null) --%>
<%-- 					response.sendRedirect("xuatFile.jsp");%> --%>
</body>
</html>