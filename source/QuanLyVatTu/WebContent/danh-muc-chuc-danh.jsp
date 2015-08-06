<%@page import="model.DonVi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="map.siteMap"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Văn phòng điện tử công ty điện lực Cần Thơ</title>
        <link rel="stylesheet" href="style/style-giao-dien-chinh.css" type="text/css">
		<link rel="stylesheet" href="style/style.css	" type="text/css">
		 <link href="style/style-bo-phan.css" type="text/css" rel="stylesheet">
    	<link href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css" type="text/css" rel="stylesheet">
<!--		<script type="text/javascript" src="js/check.js"></script>-->
		<script type="text/javascript" src="js/jquery-1.6.3.min.js"></script>

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
    		ArrayList<DonVi> listDonVi = (ArrayList<DonVi>) request.getAttribute("donViList");
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
							
							<span class="search-text">
								&nbsp;
							<input type="search" class="search" name="search_box" name="search" placeholder="Tìm kiếm" />
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
						<li><a href="">Trang chủ</a></li>
						<li><a href="">Danh mục</a>
							<ul>
								<li><a href="<%=siteMap.nsxManage + "?action=manageNsx"%>">Danh mục nơi sản xuất</a></li>
								<li><a href="<%=siteMap.clManage + "?action=manageCl"%>">Danh mục chất lượng</a></li>
								<li><a href="danh-muc-vat-tu.html">Danh mục vật tư</a></li>
								<li><a href="<%=siteMap.clManage +  "?action=manageBpsd"%>">Danh mục bộ phận sử dụng</a></li>
								<li><a href="<%=siteMap.mdManage + "?action=manageMd"%>">Danh mục mục đích</a></li>
							</ul>
						</li>
						<li><a href="danh-muc-cong-van.html">Công văn</a></li>
						<li><a href="bao-cao.html">Báo cáo</a></li>
<!--						<li><a href="danh-muc-chia-se-cong-van.html">Chia sẽ</a></li>-->
						<li><a href="bao-cao.html">Quản lý người dùng</a></li>
					</ul>
					<div class="clear"></div>
				</div>
	
<!--				<div id="main-content">-->
					<div id="title-content">
		 Danh mục bộ phận sử dụng
		</div>
		<div id="main-content">
			
			<form id="main-form">
				<div id="view-table-bo-phan">
					<table class="scroll_bophan">
						<tr>
							<th class="left-column"><input type="checkbox" class="checkAll"></th>
							<th class="mid-column">Mã BPSD</th>
							<th class="column-2">Tên bộ phận</th>
                            <th class="column-3">Số điện thoại</th>
							<th class="column-4">Địa chỉ</th>
                            <th class="column-5">Email</th>
						</tr>
						<%
							if(listDonVi != null) {
							int count = 0;
							for(DonVi donVi : listDonVi) {%>
						<tr>
							<td class="left-column"><input type="checkbox" name="dvMa" value="<%=donVi.getDvMa() %>" class="checkbox"></td>
							<td class="col"><%=donVi.getDvMa() %></td>
							<td class="col"><%=donVi.getDvTen()%></td>
                            <td><%=donVi.getSdt()%></td>
                            <td class="col"><%=donVi.getDiaChi()%></td>
                            <td class="col"><%=donVi.getEmail()%></td>
						</tr>
						<%} }%>
                    </table>		
				</div>				
				
				<div class="group-button-bo-phan">
					<input type="hidden" name="action" value="deleteBpsd">
					<button type="button" class="button"  onclick="showForm('add-form', true)"><i class="fa fa-plus-circle"></i>&nbsp;Thêm</button>&nbsp;&nbsp;
					<button type="button" class="button" onclick="showForm('update-form', true)"><i class="fa fa-pencil fa-fw"></i>&nbsp;Thay đổi</button>&nbsp;&nbsp;
					<button class="button" onclick="return confirmDelete()"> <i class="fa fa-trash-o" ></i>&nbsp;&nbsp;Xóa</button>&nbsp;&nbsp;<button class="button" type="reset"><i class="fa fa-spinner"></i>&nbsp;&nbsp;Bỏ qua</button>&nbsp;&nbsp;<button type="button" class="button"><i class="fa fa-sign-out"></i>Thoát</button>
				</div>
			</form>	
<!-------------- --add-form-------------- -->
			<form id="add-form" method="get" action="<%=siteMap.cdManage + "?action=manageCd" %>">
				<div class="input-table-bo-phan">
					<table>
						<div class="form-title">Thêm bộ phận sử dụng</div>
						<tr>
							<td class="input"><label for="MBPSD" class="input">Mã BPSD</label></td>
							<td><input name="maBpsd" type="text" class="text" required autofocus size="2" maxlength="3" pattern="[a-zA-Z0-9]{3}" title="Mã bộ phận sử dụng chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"></td>
						</tr>
						<tr>
							<td class="input"><label for="MBPSD">Tên BPSD</label></td>
							<td><input name="tenBpsd" size="30px" align=left type="text" class="text" required title="Tên bộ phận sử dụng không được để trống"></td>
						</tr>
                         <tr>
                        <td class="input"><label>Số điện thoại</label></td>
                            <td><input name="sdt" size="15px" align=left type="text" class="text"></td>
                        </tr>
                        <tr>
                            <td class="input"><label>Địa chỉ</label></td>
							<td><input name="diaChi" size="30px" align=left type="text" class="text"></td>
                        </tr>
                        <tr>
                            <td class="input"><label>Email</label></td>
                            <td><input name="email" size="30px" align=left type="email" class="text"></td>                         
                        </tr>
                       
<!--
                        <tr>
                            <td class="input"><label>Số TK</label></td>
							<td><input name="" size="15px" align=left type="text" class="text"></td>                            
                        </tr>
                        <tr>
                        <td class="input"><label>Mã số thuế</label></td>
                            <td><input name="" align=left type="text" class="text"></td>
                        </tr>
                        <tr>
                            <td class="input"><label>Loại BP</label></td>
							<td><select name = "" required class="select">
                                    <option class="option" value=""></option>
                                    <option value="" class="option">AAAAAAAAAA</option>
                                    <option>AAAAAAAAAA</option>
                                </select>
                            </td>
                        </tr>
-->
					</table>
				</div>
				<div class="button-group">
						<input type="hidden" name="action" value = "AddBpsd"> 
						<button class="button"><i class="fa fa-plus-circle"></i>&nbsp;Thêm</button>
						<button type="reset" class="button"><i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại</button>
						<button type="button" class="button" onclick="showForm('add-form', false)"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
				</div>			
			</form>
			
<!-- ---------------Update form-------------- -->			
			<form id="update-form">
				<div class="input-table">
					<table>
						<div class="form-title">Cập nhật bộ phận sử dụng</div>
						<tr>
							<td class="input"><label for="MBPSD" class="input">Mã BPSD</label></td>
							<td><input name="" type="text" class="text" required autofocus size="2" maxlength="3" pattern="[a-zA-Z0-9]{3}" title="Mã bộ phận sử dụng chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"></td>
						</tr>
						<tr>
							<td class="input"><label for="MBPSD">Tên BPSD</label></td>
							<td><input name="" size="30px" align=left type="text" class="text" required title="Tên bộ phận sử dụng không được để trống"></td>
						</tr>
                         <tr>
                        <td class="input"><label>Số điện thoại</label></td>
                            <td><input name="" size="15px" align=left type="text" class="text"></td>
                        </tr>
                        <tr>
                            <td class="input"><label>Địa chỉ</label></td>
							<td><input name="" size="30px" align=left type="text" class="text"></td>
                        </tr>
                        <tr>
                            <td class="input"><label>Email</label></td>
                            <td><input name="" size="30px" align=left type="email" class="text"></td>                         
                        </tr>
                       
<!--
                        <tr>
                            <td class="input"><label>Số TK</label></td>
							<td><input name="" size="15px" align=left type="text" class="text"></td>                            
                        </tr>
                        <tr>
                        <td class="input"><label>Mã số thuế</label></td>
                            <td><input name="" align=left type="text" class="text"></td>
                        </tr>
                        <tr>
                            <td class="input"><label>Loại BP</label></td>
							<td><select name = "" required class="select">
                                    <option class="option" value=""></option>
                                    <option value="" class="option">AAAAAAAAAA</option>
                                    <option>AAAAAAAAAA</option>
                                </select>
                            </td>
                        </tr>
-->
					</table>
				</div>
				<div class="button-group">
						<button class="button"><i class="fa fa-plus-circle"></i>&nbsp;Thêm</button>
						<button type="reset" class="button"><i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại</button>
						<button type="button" class="button" onclick="showForm('update-form', false)"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
				</div>			
			</form>			
		</div>	
				</div>
				
        </div>
    </body>
</html>