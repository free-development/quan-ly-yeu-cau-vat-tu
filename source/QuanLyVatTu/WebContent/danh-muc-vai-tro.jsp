<%@page import="model.VaiTro"%>
<%@page import="map.siteMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>V�n ph?ng �i?n t? c�ng ty �i?n l?c C?n Th�</title>
        <link rel="stylesheet" href="style/style-giao-dien-chinh.css" type="text/css">
		<link rel="stylesheet" href="style/style-noi-san-xuat.css" type="text/css">
        <link rel="stylesheet" href="style/style.css" type="text/css">
		<link href="style/style-muc-dich.css" type="text/css" rel="stylesheet">
    <link href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css" type="text/css" rel="stylesheet">
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
			return confirm('B?n c� ch?c x�a');
		}
	</script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="Shortcut Icon" href="img/logo16.png" type="image/x-icon" />  
    </head>
    <body>
    	<%
    		ArrayList<VaiTro> listVaiTro = (ArrayList<VaiTro>) request.getAttribute("vaiTroList");
    	%>
        <div class="wrapper">
				<div class="header">
	<!--
					<img src="img/logo.png" alt="" id="logo" width=80 height=80/><br/>
					<img src="img/textlogo.png" alt="" id="logo" width=80 height=20/>
	-->
					<div id="top_title">V�n ph?ng �i?n t?</div>
					<div id="bottom-title">C�ng ty �i?n l?c c?n th�</div>
					<div class="search_form" id="search">
						<form action="" method="post">
<!--
							<span class="search-select">
								<select name="" ><option disabled selected>--T�y ch?n ki?m ki?m--</option></select>
								<option value=""></option>
							</span>
-->
							
							<span class="search-text">
								&nbsp;
							<input type="search" class="search" name="search_box" name="search" placeholder="T?m ki?m" />
							</span>
							<span class="search-button">
							&nbsp;
							<button class="btn-search"><i class="fa fa-search" ></i></button>
							</span>
						</form>
					</div>
					
				</div>
				<div class="main_menu">
					<ul>
						<li><a href="">Trang ch?</a></li>
						<li><a href="">Danh m?c</a>
							<ul>
								<li><a href="<%=siteMap.nsxManage + "?action=manageNsx"%>">Danh m?c n�i s?n xu?t</a></li>
								<li><a href="<%=siteMap.clManage + "?action=manageCl"%>">Danh m?c ch?t l�?ng</a></li>
								<li><a href="danh-muc-vat-tu.html">Danh m?c v?t t�</a></li>
								<li><a href="danh-muc-bo-phan.html">Danh m?c b? ph?n s? d?ng</a></li>
								<li><a href="danh-muc-muc-dich.html">Danh m?c m?c ��ch</a></li>
								<li><a href="<%=siteMap.vtManage + "?action=manageVt"%>">Danh m?c vai tr?</a></li>
							</ul>
						</li>
						<li><a href="danh-muc-cong-van.html">C�ng v�n</a></li>
						<li><a href="bao-cao.html">B�o c�o</a></li>
<!--						<li><a href="danh-muc-chia-se-cong-van.html">Chia s?</a></li>-->
						<li><a href="bao-cao.html">Qu?n l? ng�?i d�ng</a></li>
					</ul>
					<div class="clear"></div>
				</div>
	
				<div id="main-content">
					<div id="title-content">
		 Danh m?c vai tr?
		</div>
		<div id="main-content">
			
			<form id="main-form">
				<div id="view-table">
					<table>
						<tr style="background:#199e5e">
							<th class="left-column"><input type="checkbox" class="checkAll"></th>
							<th class="mid-column">ID</th>
							<th class="right-column">T�n vai tr?</th>
						</tr>
						<%
							if(listVaiTro != null) {
							int count = 0;
							for(VaiTro VaiTro : listVaiTro) {%>
						<tr>
							<td class="left-column"><input type="checkbox" name="vtId" value="<%=VaiTro.getVtId() %>" class="checkbox"></td>
							<td class="col"><%=VaiTro.getVtId() %></td>
							<td class="col"><%=VaiTro.getVtTen() %></td>
						</tr>
						<%} }%>
					</table>		
				</div>				
				
				<div class="group-button">
					<input type="hidden" name="action" value="deleteVaiTro">
					<button type="button" class="button"  onclick="showForm('add-form', true)"><i class="fa fa-plus-circle"></i>&nbsp;Th�m</button>
					<button type="button" class="button" onclick="showForm('update-form', true)"><i class="fa fa-pencil fa-fw"></i>&nbsp;Thay �?i</button>
					<button class="button" onclick="return confirmDelete()"> <i class="fa fa-trash-o" ></i>&nbsp;&nbsp;X�a</button>&nbsp;<button class="button" type="reset"><i class="fa fa-spinner"></i>&nbsp;&nbsp;B? qua</button>&nbsp;<button type="button" class="btn"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Tho�t</button>
				</div>
			</form>	
<!-------------- --add-form-------------- -->
			<form id="add-form" method="get" action="<%=siteMap.vtManage %>">
				<div class = "input-table">
					<table>
						<div class = "form-title">Th�m vai tr?</div>
						<tr>
							<th><label for="id">ID</label></th>
							<td><input name="vtId" type="text" class="text" required  title="M? n�i s?n xu?t kh�ng ��?c tr?ng"></td>
						</tr>
						<tr>
							<th class="label"><label for="tenvaitro">T�n vai tr?</label></th>
							<td><input name="vtTen" size="30px" align=left type="text" class="text" required title="T�n vai tr? kh�ng ��?c �? tr?ng"></td>
						</tr>	
					</table>
				</div>
				<div class="group-button">
						<input type="hidden" name="action" value = "addVaiTro"> 
						<button class="button"><i class="fa fa-plus-circle"></i>&nbsp;Th�m</button>
						<button type="reset" class="button"><i class="fa fa-refresh"></i>&nbsp;&nbsp;Nh?p l?i</button>
						<button type="button" class="button" onclick="showForm('add-form', false)"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Tho�t</button>
				</div>			
			</form>
			
<!-- ---------------Update form-------------- -->			
			<form id="update-form">
				<div class="input-table">
					<table>
						<div class="form-title">C?p nh?t vai tr?</div>
						<tr>
							<th><label for="id">ID</label></th>
							<td><input name="vtId" type="text" class="text" required title="M? n�i s?n xu?t kh�ng �? tr?ng" value="MNSX" readonly></td>
						</tr>
						<tr>
							<th><label for="tenvaitro">T�n vai tr?</label></th>
							<td><input name="vtTen" size="30px" type="text" class="text" required title="T�n vai tr? kh�ng ��?c �? tr?ng"></td>
						</tr>	
					</table>
				</div>
				<div class="group-button">
						<input type="hidden" name="action" value = "updateVaiTro"> 
						<button class="button"><i class="fa fa-floppy-o"></i>&nbsp;L�u l?i</button>
						<button type="reset" class="button"><i class="fa fa-refresh"></i>&nbsp;&nbsp;Nh?p l?i</button>
						<button type="button" class="button" onclick="showForm('update-form')"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Tho�t</button>
				</div>			
			</form>			
		</div>
				</div>
				
        </div>
    </body>
</html>