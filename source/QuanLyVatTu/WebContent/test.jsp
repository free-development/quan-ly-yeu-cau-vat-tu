<%@page import="java.util.ArrayList"%>
<%@page import="dao.NoiSanXuatDAO"%>
<%@page import="model.NoiSanXuat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
// 	nơi sản xuất
		ArrayList<NoiSanXuat> nsxList = (ArrayList<NoiSanXuat>) new NoiSanXuatDAO().getAllNoiSanXuat();
		System.out.println(nsxList.get(0).getNsxTen());
		for (NoiSanXuat nsx : nsxList) {
			out.println(nsx.getNsxTen());
		}
	%>
</body>
</html>