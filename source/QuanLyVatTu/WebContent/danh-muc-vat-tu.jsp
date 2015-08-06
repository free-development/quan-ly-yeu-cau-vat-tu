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
        <link rel="stylesheet" href="style/style-giao-dien-chinh.css" type="text/css">
		<link rel="stylesheet" href="style/style.css" type="text/css">
		 <link href="style/style-vat-tu.css" type="text/css" rel="stylesheet">
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
			return confirm('Bạn có chắc xóa');
		}
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
								<li><a href="<%=siteMap.ctvtManage + "?action=manageCtvt"%>">Danh mục vật tư</a></li>
								<li><a href="<%=siteMap.bpsdManage + "?action=manageBpsd"%>">Danh mục bộ phận sử dụng</a></li>
								<li><a href="<%=siteMap.mdManage + "?action=manageMd"%>">Danh mục mục đích</a></li>
								<li><a href="<%=siteMap.vtManage + "?action=manageVt"%>">Danh mục vai trò</a></li>
							</ul>
						</li>
						<li><a href="danh-muc-cong-van.html">Công văn</a></li>
						<li><a href="bao-cao.html">Báo cáo</a></li>
<!--						<li><a href="danh-muc-chia-se-cong-van.html">Chia sẽ</a></li>-->
						<li><a href="bao-cao.html">Quản lý người dùng</a></li>
					</ul>
					<div class="clear"></div>
				</div>
			
				<div id="main-content">
					<div id="title-content">
		          Danh mục vật tư 
                    </div>
                
                <div class="lbltk">
                    <table>
                        <tr>
                            <td>
                            <select class="select"style="">
                                        <option value="">--Tùy chọn--</option>
                                        <option value="">Tên vật tư</option>
                                        <option value="">Nơi sản xuất</option>
                                        <option value="">Chất lượng</option>
                                        <option value="">Số lượng tồn</option>
                                        <option value="">Định mức</option>
                            </select>
                            </td>
                            <td>
                            <div class="search_form1" id="search">
                                <form action="" method="post">
                                    <span class="search-text">
                                        &nbsp;
                                    <input type="search" class="text" name="search_box" name="search" placeholder="Tìm kiếm" />
                                    </span>

                                    <span class="search-button">
                                    &nbsp;
                                    <button class="btn-search"><i class="fa fa-search" ></i></button>
                                    </span>
                                </form>
                            </div>
                            </td>
                        </tr>
                    </table>
                </div>
		        
<!--
                    
-->
					<div id="view-table" class="scroll-chi-tiet-vat-tu">
					
						<table>
							<tr style="background:#199e5e">
								<th class="left-column"><input type="checkbox" class="checkAll"></th>
                                <th class="a-column"> Mã vật tư</th>
								<th class="a-column"> Tên vật tư</th>
								<th class="three-column">Nơi sản xuất</th>
								<th class="six-column">Chất lượng</th>
								<th class="four-column"> Đơn vị tính</th>
								<th class="five-column">Định mức</th>	
								<th class="seven-column">Số lượng tồn</th>

							</tr>
							<%
							if(listCTVatTu != null) {
							int count = 0;
							for(CTVatTu ctVatTu : listCTVatTu) {%>
						<tr>
							<td class="left-column"><input type="checkbox" name="vtMa" value="<%=ctVatTu.getVatTu().getVtMa() %>" class="checkbox"></td>
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
						<button type="button" class="button"  onclick="showForm('add-form', true)"><i class="fa fa-plus-circle"></i>&nbsp;Thêm</button>
						<button type="button" class="button" onclick="showForm('update-form', true)"><i class="fa fa-pencil fa-fw"></i>&nbsp;Thay đổi</button>
						<button class="button" onclick="return confirmDelete()"> <i class="fa fa-trash-o" ></i>&nbsp;&nbsp;Xóa</button>&nbsp;
						<button class="button" type="reset"><i class="fa fa-spinner"></i>&nbsp;&nbsp;Bỏ qua</button>&nbsp;
						<button class="button" type="button"><i class="fa fa-print"></i>&nbsp;&nbsp;In</button>&nbsp;
						<button type="button" class="button"onclick="showForm('main-form')"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
					</div>
				</form>	
				<form id="add-form" method="get" action="<%=siteMap.ctvtManage %>">
					<div class="input-table">
						<table>
							<div class="form-title"style="padding: 10px">Thêm vật tư</div>
							<tr>
								<th style="text-align: left"><label for="MVT">Mã vật tư</label></th>
								<td><input name="vtMa" size="5px" align=right type="text" class="text" required title="Mã vật tư không được để trống"></td>
							</tr>
                            <tr>
								<th style="text-align: left"><label for="MVT">Tên vật tư</label></th>
								<td><input name="vtTen" size="5px" align=right type="text" class="text" required title="Mã vật tư không được để trống"></td>
							</tr>
							<tr>
								<th style="text-align: left"><label for="MVT">Nơi sản xuất</label></th>
								<td><select  class="select" name="nsxMa">
								 <option disabled selected>--Chọn--</option>
								 <option value="VN">VN</option>
								</select>
								</td>
							</tr>	
							<tr>
								<th style="text-align: left"><label for="DVT">Đơn vị tính</label></th>
								<td><select class="select" name="dvt">
                                    <option disabled selected>--Chọn--</option>
                                    <option value="m">m</option>
                                    <option value="cái">cái</option>
                                    <option value="cuộn">cuộn</option>
                                </select>
                                </td>
								<th style="text-align:left"><label for="DM">Định mức</label></th>
								<td><input name="dinhMuc" size="5px" align=right type="text" class="text" required title="Định mức không được để trống"></td>
							</tr>	
                            <tr>
								<th style="text-align: left"><label for="DVT">Chất lượng</label></th>
								<td><select class="select" name="clMa">
                                    <option disabled selected>--Chọn--</option>
                                    <option value="001">Hàng mới</option>

                                </select>
                                </td>
								<th style="text-align: left"><label for="Sl">Số lượng tồn</label></th>
								<td><input name="soLuongTon" size="5px" align=right type="text" class="text" required title="Số lượng tồn không được để trống"></td>
							</tr>	
						</table>
					</div>
					<div class="group-button">
					  		<input type="hidden" name="action" value="addVatTu">
							<button class="button"><i class="fa fa-plus-circle"></i>&nbsp;Thêm</button>
							<button type="reset" class="button"><i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại</button>
							<button type="button" class="button" onclick="showForm('add-form', false)"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
					</div>			
				</form>
				<form id="update-form">
					<div class="input-table">
						<table>
							<div class="form-title">Cập nhật Vật tư</div>
							<tr>
								<th style="text-align: left"><label for="MVT">Mã vật tư</label></th>
								<td><input name="" size="5px" align=right type="text" class="text" value="10102345"></td>
							</tr>
                            <tr>
								<th style="text-align: left"><label for="MVT">Tên vật tư</label></th>
								<td><input name="" size="5px" align=right type="text" class="text" value="10102345"></td>
							</tr>
                            
							<tr>
								<th style="text-align: left"><label for="MVT">Nơi sản xuất</label></th>
								<td><select class="select">
                                <option value="">Việt Nam</option>
                                <option value="">Không xác định</option>
                                </select>
                            </td>
							</tr>	
							<tr>
								<th style="text-align: left"><label for="DVT">Đơn vị tính</label></th>
								<td><select class="select">
                                    <option value="">m</option>
                                    <option value="">cái</option>
                                    <option value="">cuộn</option>
                                </select>
                                </td>
								<th style="text-align: left"><label for="DM">Định mức</label></th>
								<td><input name="" size="5px" align=right type="text" class="text" value="10"></td>
							</tr>	
                            <tr>
								<th style="text-align: left"><label for="DVT">Chất lượng</label></th>
								<td><select class="select">
                                    <option value="">Hàng mới</option>
                                    <option value="">Vật tư nhập mới</option>
                                </select>
                                </td>
								<th style="text-align: left"><label for="DM">Số lượng tồn</label></th>
								<td><input name="" size="5px" align=right type="text" class="text" value="5"></td>
							</tr>	
						</table>
					</div>
					<div class="group-button">
							<button class="button"><i class="fa fa-floppy-o"></i>&nbsp;Lưu lại</button>
							<button type="reset" class="button"><i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại</button>
							<button type="button" class="button" onclick="showForm('update-form')"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
					</div>			
				</form>		
            </div>
				</div>
				
        </div>
    </body>
</html>