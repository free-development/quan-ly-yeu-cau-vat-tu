<%@page import="model.CTVatTu"%>
<%@page import="model.VatTu"%>
<%@page import="model.NoiSanXuat"%>
<%@page import="model.ChatLuong"%>
<%@page import="map.siteMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Văn phòng điện tử công ty điện lực Cần Thơ</title>
<link rel="stylesheet" href="style/style-giao-dien-chinh.css"
	type="text/css">
<link rel="stylesheet" href="style/style.css" type="text/css">
<link href="style/style-vat-tu.css" type="text/css" rel="stylesheet">
<link
	href="style/font-awesome-4.3.0/font-awesome-4.3.0/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/vattu.js"></script>
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
    	ArrayList<VatTu> listVatTu = (ArrayList<VatTu>) request.getAttribute("vatTuList");
     	ArrayList<CTVatTu> listCTVatTu = (ArrayList<CTVatTu>) request.getAttribute("ctVatTuList");
   		ArrayList<NoiSanXuat> listNoiSanXuat = (ArrayList<NoiSanXuat>) request.getAttribute("noiSanXuatList");
   		ArrayList<ChatLuong> listChatLuong = (ArrayList<ChatLuong>) request.getAttribute("chatLuongList");
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
						<li><a href="<%=siteMap.vattuManage + "?action=manageVattu"%>">Danh
								mục vật tư</a></li>
						<li><a href="<%=siteMap.ctvtManage + "?action=manageCtvt"%>">Danh
								mục chi tiết vật tư</a></li>
						<li><a href="<%=siteMap.bpsdManage + "?action=manageBpsd"%>">Danh
								mục bộ phận sử dụng</a></li>
						<li><a href="<%=siteMap.mdManage + "?action=manageMd"%>">Danh
								mục mục đích</a></li>
						<li><a href="<%=siteMap.vtManage + "?action=manageVt"%>">Danh
								mục vai trò</a></li>
					</ul></li>
				<li><a href="danh-muc-cong-van.html">Công văn</a></li>
				<li><a href="bao-cao.html">Báo cáo</a></li>
				<!--					<li><a href="danh-muc-chia-se-cong-van.html">Chia sẽ</a></li>-->
				<li><a href"<%=siteMap.ndManage + "?action=manageNd"%>">Quản lý người dùng</a></li>
			</ul>
			<div class="clear"></div>
		</div>

		<div id="main-content">
			<div id="title-content">Danh mục vật tư</div>

									
								<th  style="text-align: left; color: black; font-size: 19px;">* Tìm kiếm mã</th>
								<td><div class="search_form1" id="search">		
										<form action="" method="post">	
											<span class="search-text"> &nbsp; <input type="search" class="text" name="search_box" name="search" placeholder="Tìm kiếm" /> 												
												<td><input type="checkbox" class="checkbox" style="text-align: center;"/></td>
												<td  style="text-align: center; color: black; font-size: 19px;">Theo tên</td>&nbsp;&nbsp;&nbsp;
												<td></span> <span class="search-button"> &nbsp; <button class="btn-search" style="background-color: #00A69B;"><i class="fa fa-search"></i></button></td>
											</span>
						
						</td>
					</tr>
					
				</table>
			</div>

			<div id="view-table-vat-tu" class="scroll-chi-tiet-vat-tu">

				<table>
					<tr style="background: #199e5e; height: 30px">
						<th class="left-column"><input type="checkbox"
							class="checkAll"></th>
						<th class="two-column">Mã vật tư</th>
						<th class="three-column">Tên vật tư</th>					
						<th class="four-column">Đơn vị tính</th>
						<th class="four-column">Xem chi tiết</th>
					</tr>
					<%
							if(listVatTu != null) {
							int count = 0;
							for(VatTu vatTu : listVatTu) { count++;%>

					<tr
						<%if (count % 2 == 0) out.println("style=\"background : #CCFFFF;\"");%>>
						<td class="left-column"><input type="checkbox" name="vtMa"
							value="<%=vatTu.getVtMa() %>" class="checkbox"></td>
						<td class="col" ><%=vatTu.getVtMa() %></td>
						<td class="col" ><%=vatTu.getVtTen() %></td>
						<td class="col" style="text-align: center;"><%=vatTu.getDvt() %></td>
						<td style="text-align: center;"><button type="button" class="button-xem" value="Xem" onclick="showChiTiet('chitiet',true,'<%=vatTu.getVtMa()%>');">Xem</button></td>
					</tr>
					<%} }%>
				</table>
			</div>

			<div class="group-button">
				<input type="hidden" name="action" value="deleteVatTu">
				<button type="button" class="button"
					onclick="showForm('add-form', true)">
					<i class="fa fa-plus-circle"></i>&nbsp;Thêm
				</button>
				<button type="button" class="button"
					onclick="preEditVattu('update-form', true);">
					<i class="fa fa-pencil fa-fw"></i>&nbsp;Thay đổi
				</button>
				<button class="button" onclick="confirmDeleteVT();">
					<i class="fa fa-trash-o"></i>&nbsp;&nbsp;Xóa
				</button>
				&nbsp;
				<button class="button" type="reset">
					<i class="fa fa-spinner"></i>&nbsp;&nbsp;Bỏ qua
				</button>
				&nbsp;
				<button class="button" type="button">
					<i class="fa fa-print"></i>&nbsp;&nbsp;In
				</button>
				&nbsp;
				<button type="button" class="button" onclick="showForm('main-form', false)">
					<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
				</button>
			</div>
			</form>
			
			
			
			
			
					<!-- add-form-->
			
			<form id="add-form" method="get" action="<%=siteMap.vattuManage + "?action=manageVattu"%>">
				<div class="input-table">
					<table>
						<div class="form-title" style="padding: 10px">Thêm vật tư</div>
						<tr>
							<th style="text-align: left"><label for="MVT">Mã vật
									tư</label></th>
							<td><input name="vtMa" size="5px" align=right type="text" onkeypress="changeVtMa();"
								class="text" required autofocus size="8" maxlength="8" id="vtMa"
								title="Mã vật tư không được để trống"><div id="requireVtMa" style="color: red"></div></td>
						</tr>
						<tr>
							<th style="text-align: left"><label for="MVT">Tên vật tư</label></th>
							<td><input name="vtTen" size="30px" align=right type="text" 
								class="text" required title="Mã vật tư không được để trống"><div id="requireVtTen" style="color: red"></div></td>
						</tr>
						
						<tr>
							<th style="text-align: left"><label for="DVT">Đơn vị
									tính</label></th>
							<td><select class="select" name="dvt">
									<option disabled selected>--Chọn--</option>
									<option value="m">m</option>
									<option value="cái">cái</option>
									<option value="cuộn">cuộn</option>
							</select><div id="requireDvt" style="color: red"></div></td>
							
						</tr>
					
					</table>
				</div>
				<div class="group-button">
<!-- 					<input type="hidden" name="action" value="addVatTu"> -->
					<button type="button" class="button" onclick="addVattu();">
						<i class="fa fa-plus-circle"></i>&nbsp;Thêm
					</button>
<!-- 					<button class="button" onclick="showForm('add-chitiet', true)" > -->
<!-- 						<i class="fa fa-plus-circle"></i>&nbsp;Thêm chi tiết -->
					</button> 
					<button type="reset" class="button" ><i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại</button>
					<button type="button" class="button" onclick="showForm('add-form', false)"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
				</div>
			</form>
			
			<form id="update-form">
				<div class="input-table">
					<table>
						<div class="form-title">Cập nhật Vật tư</div>
						<tr>
							<th style="text-align: left"><label for="MVT">Mã vật
									tư</label></th>
							<td><input name="vtMaUpdate" size="5px" align=right type="text" readonly style="background-color: #D1D1E0;"
								class="text" value="10102345"></td>
						</tr>
						<tr>
							<th style="text-align: left"><label for="MVT">Tên
									vật tư</label></th>
							<td><input name="vtTenUpdate" size="30px" align=right type="text"  
								class="text" value="10102345"></td>
						</tr>
						<tr>
							<th style="text-align: left"><label for="DVT">Đơn vị
									tính</label></th>
							<td><select class="select"  name="dvtUpdate">
									<option value="">m</option>
									<option value="">cái</option>
									<option value="">cuộn</option>
							</select></td>
						</tr>
					</table>
				</div>
				<div class="group-button">
					<button class="button" onclick="confirmUpdateVattu();" ><i class="fa fa-floppy-o"></i>&nbsp;Lưu lại</button> 
					<button type="reset" class="button"><i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại</button>
					<button type="button" class="button" onclick="showForm('update-form')"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
				</div>
			</form>
			
			
	<form id="chitiet">
				<div id="view-table-chi-tiet" class="scroll-chi-tiet-vat-tu">

				<table>
					<tr style="background: #199e5e">
						<th class="left-column"><input type="checkbox"
							class="checkAll"></th>
						<th class="four-column">Mã vật tư</th>
						<th class="three-col">Tên vật tư</th>
						<th class="six-column">Nơi sản xuất</th>
						<th class="six-column">Chất lượng</th>
						<th class="four-column">Đơn vị tính</th>
						<th class="five-column">Định mức</th>
						<th class="seven-column">Số lượng tồn</th>
					</tr>
					<%
							if(listCTVatTu != null){
								
							}
							if(listCTVatTu != null) {
							int count = 0;
							for(CTVatTu ctVatTu : listCTVatTu) { count++;%>

					<tr
						<%if (count % 2 == 0) out.println("style=\"background : #CCFFFF;\"");%>>
						<td class="left-column"><input type="checkbox" name="vtMa"
							value="<%=ctVatTu.getVatTu().getVtMa() %>" class="checkbox"></td>
						<td class="col"><%=ctVatTu.getVatTu().getVtMa() %></td>
						<td class="col"><%=ctVatTu.getVatTu().getVtTen() %></td>
						<td class="col"><%=ctVatTu.getNoiSanXuat().getNsxTen() %></td>
						<td class="col"><%=ctVatTu.getChatLuong().getClTen() %></td>
						<td class="col"><%=ctVatTu.getVatTu().getDvt() %></td>
						<td class="col"><%=ctVatTu.getDinhMuc() %></td>
						<td class="col"><%=ctVatTu.getSoLuongTon() %></td>

					</tr>
					<%} }%>

				</table>
					
			</div>
					<div class="group-button">
				<input type="hidden" name="action" value="deleteVatTu">
				<button type="button" class="button"
					onclick="showForm('add-chitiet', true)">
					<i class="fa fa-plus-circle"></i>&nbsp;Thêm chi tiết
				</button>
				<button type="button" class="button"
					onclick="showForm('update-chitiet', true)">
					<i class="fa fa-pencil fa-fw"></i>&nbsp;Thay đổi
				</button>
				<button class="button" onclick="return confirmDeleteCTVT()">
					<i class="fa fa-trash-o"></i>&nbsp;&nbsp;Xóa
				</button>
				&nbsp;
				<button class="button" type="reset">
					<i class="fa fa-spinner"></i>&nbsp;&nbsp;Bỏ qua
				</button>
				&nbsp;
				<button class="button" type="button">
					<i class="fa fa-print"></i>&nbsp;&nbsp;In
				</button>
				&nbsp;
				<button type="button" class="button" onclick="showForm('main-form', false)">
					<i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát
				</button>
			</div>
		</form>
			<!-- add-chitiet -->
			<form id="add-chitiet"  method="get" action="<%=siteMap.vattuManage + "?action=manageVattu"%>">
									<div class="input-table">
					<table>
						<div class="form-title" style="padding: 10px">Thêm chi tiết vật tư</div>
						<tr>
							<th style="text-align: left"><label for="MVT">Mã vật
									tư</label></th>
							<td><input name="ctvtMaAdd" size="5px" align=right type="text" readonly style="background-color: #D1D1E0;"
								class="text"></td>
						</tr>
						<tr>
							<th style="text-align: left"><label for="MVT">Tên vật
									tư</label></th>
							<td><input name="ctvtTenAdd" size="30px" align=right type="text" readonly style="background-color: #D1D1E0;"
								class="text" ></td>
						</tr>
						<tr>
							<th style="text-align: left"><label for="MVT">Nơi
									sản xuất</label></th>
								<td>
									<select 
									title="" class="select" id="noisanxuat" name="noisanxuat" style="margin-top: 10px;">
										<option disabled selected value="">-- Chọn nơi sản xuất --</option>
										<%						  
		 								
		 								for (NoiSanXuat noiSanXuat : listNoiSanXuat)
		 								{%>  
		 								<option value=<%=noiSanXuat.getNsxMa()%>><%=noiSanXuat.getNsxTen()%></option> 
		 								<%}  
		  								%>  
									</select><div id="requireNSX"></div>
								</td>
						</tr>
						
						<tr>
							<th style="text-align: left"><label for="MVT">Đơn vị tính</label></th>
							<td><input name="ctvtMaAdd" size="5px" align=right type="text" readonly style="background-color: #D1D1E0;"
								class="text"></td>
						</tr>
						<tr>
							<th style="text-align: left"><label for="DM">Định mức</label></th>
							<td><input name="dinhMuc" size="5px" align=right type="text"
								class="text" required title="Định mức không được để trống"><div id="requireDM"></div></td>
						</tr>
						<tr>
							<th style="text-align: left"><label for="DVT">Chất lượng</label></th>
								<td>
									<select 
											title="" class="select" id="chatluong" name="chatluong" style="margin-top: 10px;">
												<option disabled selected value="">-- Chọn chất lượng --</option>
												<%						  
				 								
				 								for (ChatLuong chatLuong : listChatLuong)
				 								{%>  
				 								<option value=<%=chatLuong.getClMa()%>><%=chatLuong.getClTen()%></option> 
				 								<%}  
				  								%>  
									</select><div id="requireNSX"></div>
								</td>
						</tr>
						<tr>
							<th style="text-align: left"><label for="Sl">Số lượng</label></th>
							<td>
								<input name="soLuongTon" size="5px" align=right type="text" class="text" required title="Số lượng tồn không được để trống">
							</td>
						</tr>
					</table>
				</div>
				<div class="group-button">
					<button type="button" class="button" onclick="addCTVattu();"><i class="fa fa-plus-circle"></i>&nbsp;Thêm</button>
					<button type="reset" class="button"><i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại</button>
					<button type="button" class="button" onclick="showForm('add-chitiet', false)"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
				</div>
			</form>
			
			
			<!-- update-chitiet -->
			<form id="update-chitiet">
									<div class="input-table">
					<table>
						<div class="form-title" style="padding: 10px">Thêm chi tiết vật tư</div>
						<tr>
							<th style="text-align: left"><label for="MVT">Mã vật tư</label></th>
							<td><input name="ctvtMaAdd" size="5px" align=right type="text" readonly style="background-color: #D1D1E0;"
								class="text"></td>
						</tr>
						<tr>
							<th style="text-align: left"><label for="MVT">Tên vật
									tư</label></th>
							<td><input name="ctvtTenAdd" size="30px" align=right type="text" readonly style="background-color: #D1D1E0;"
								class="text" ></td>
						</tr>
						<tr>
							<th style="text-align: left"><label for="MVT">Nơi
									sản xuất</label></th>
							<td><select 
							title="" class="select" id="noisanxuat" name="noisanxuat" style="margin-top: 10px;">
								<option disabled selected value="">-- Chọn nơi sản xuất --</option>
								<%						  
 								
 								for (NoiSanXuat noiSanXuat : listNoiSanXuat)
 								{%>  
 								<option value=<%=noiSanXuat.getNsxMa()%>><%=noiSanXuat.getNsxTen()%></option> 
 								<%}  
  								%>  
						</select><div id="requireNSX"></div></td>
						</tr>
						
						<tr>
							<th style="text-align: left"><label for="MVT">Đơn vị tính</label></th>
							<td><input name="ctvtMaAdd" size="5px" align=right type="text" readonly style="background-color: #D1D1E0;"
								class="text"></td>
						</tr>
						<tr>
							<th style="text-align: left"><label for="DM">Định mức</label></th>
							<td><input name="dinhMuc" size="5px" align=right type="text"
								class="text" required title="Định mức không được để trống"><div id="requireDM"></div></td>
						</tr>
						<tr>
							<th style="text-align: left"><label for="DVT">Chất lượng</label></th>
								<td>
									<select 
											title="" class="select" id="chatluong" name="chatluong" style="margin-top: 10px;">
												<option disabled selected value="">-- Chọn chất lượng --</option>
												<%						  
				 								
				 								for (ChatLuong chatLuong : listChatLuong)
				 								{%>  
				 								<option value=<%=chatLuong.getClMa()%>><%=chatLuong.getClTen()%></option> 
				 								<%}  
				  								%>  
									</select><div id="requireNSX"></div>
								</td>
						</tr>
						<tr>
							<th style="text-align: left"><label for="Sl">Số lượng</label></th>
							<td>
								<input name="soLuongTon" size="5px" align=right type="text" class="text" required title="Số lượng tồn không được để trống">
							</td>
						</tr>
					</table>
				</div>
				<div class="group-button">
					<button type="button" class="button" onclick="confirmUpdateCTVattu();"><i class="fa fa-plus-circle"></i>&nbsp;Lưu</button>
					<button type="reset" class="button"><i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại</button>
					<button type="button" class="button" onclick="showForm('update-chitiet', false)"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
				</div>
			</form>
		</div>
	</div>

	</div>
</body>
</html>