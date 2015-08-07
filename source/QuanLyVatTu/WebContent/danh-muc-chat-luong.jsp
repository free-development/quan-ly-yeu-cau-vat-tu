<%@page import="model.ChatLuong"%>
<%@page import="java.util.ArrayList"%>
<%@page import="map.siteMap"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Văn phòng điện tử công ty điện lực Cần Thơ</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/style-giao-dien-chinh.css" type="text/css">
		<link rel="stylesheet" href="style/style.css" type="text/css">
		 <link href="style/style-muc-dich.css" type="text/css" rel="stylesheet">
        <link href="style/style-chat-luong.css" type="text/css" rel="stylesheet">
    <link href="style\font-awesome-4.3.0\font-awesome-4.3.0\css\font-awesome.min.css" type="text/css" rel="stylesheet">
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
		 $(document).ready(function() {
			 	var clMa =  $("input[clMa]").val();
//				var clMa =  $("#updateCl").val();
		      
				$("#updateCl").click(function(event) {
		    	  
					$.ajax({
						url: "/QuanLyVatTu/preEditCl.html",	
					  	type: "GET",
					  	data: { "clMa": clMa},
//					  	beforeSend: function(xhr) {
//					  		xhr.setRequestHeader("Accept", "application/json");
//					  		xhr.setRequestHeader("Content-Type", "application/json");
//					  	},
					  	
					  	success: function(smartphone) {
					  		var respContent = "";
					  		var rowToDelete = $(event.target).closest("tr");
					  		
					  		rowToDelete.remove();
					  		
					  		respContent += "<span class='success'>Smartphone was deleted: [";
					  		respContent += smartphone.producer + " : ";
					  		respContent += smartphone.model + " : " ;
					  		respContent += smartphone.price + "]</span>";
					  		
					  		$("#addForm").html(respContent);   		
					  	}
					});
		  
					event.preventDefault();
				});
		       
		}); 
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
								<li><a href="danh-muc-vat-tu.html">Danh mục vật tư</a></li>
								<li><a href="<%=siteMap.bpsdManage +  "?action=manageBpsd"%>">Danh mục bộ phận sử dụng</a></li>
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
	
				
					<div id="title-content">
		 Danh mục chất lượng
		</div>
		<div id="main-content">
			
			<form id="main-form">
				<div id="view-table" class="scroll">
					<table>
						<tr style="background-color: #199e5e;">
							<td class="left-column"><input type="checkbox" name="" class="checkAll"></td>
							<th class="mid-column"> Mã CL</th>
							<th class="right-column">Tên chất lượng</th>
						
						</tr>
						<%
							if(listChatLuong != null) {
							int count = 0;
							for(ChatLuong chatLuong : listChatLuong) {%>
						<tr<%if (count % 2 == 0) out.println("style=\"background : #CCFFFF;\"");%>>
							<td class="left-column"><input type="checkbox" name="clMa" value="<%=chatLuong.getClMa() %>" class="checkbox"></td>
							<td class="col"><%=chatLuong.getClMa() %></td>
							<td class="col"><%=chatLuong.getClTen() %></td>
						</tr>
						<%} }%>
					</table>		
				</div>				
				
				<div class="group-button">
					<input type="hidden" name="action" value="deleteCl">
					<button type="button" class="button"  onclick="showForm('add-form', true)"><i class="fa fa-plus-circle"></i>&nbsp;Thêm</button>
					<button type="button" class="button" onclick="showForm('update-form', true)"><i class="fa fa-pencil fa-fw"></i>&nbsp;Thay đổi</button>
								 <button class="button" onclick="return confirmDelete()"> <i class="fa fa-trash-o" ></i>&nbsp;&nbsp;Xóa</button>&nbsp;<button class="button" type="reset"><i class="fa fa-spinner"></i>&nbsp;&nbsp;Bỏ qua</button>&nbsp;<button type="button" class="button"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
				</div>
			</form>	
			
			<form id="add-form" method="get" action="<%=siteMap.clManage + "?action=manageCl" %>" >
				<div class="input-table">
					<table>
						<div class="form-title">Thêm chất lượng</div>
						<tr>
							<td class="input"><label for="MCL">Mã CL</label></td>
							<td><input name="clMa" type="text" class="text" required autofocus size="2" maxlength="3" pattern="[a-zA-Z0-9]{3}" title="Mã chất lượng chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt"></td>
						</tr>
						<tr>
							<th class="input"><label for="MMD">Tên CL</label></td>
							<td><input name="clTen" size="30px" align=left type="text" class="text" required title="Tên chất lượng không được để trống"></td>
						</tr>	
					</table>
				</div>
				<div class="button-group">
				<input type="hidden" name="action" value = "AddCl"> 
						<button class="button"><i class="fa fa-plus-circle"></i>&nbsp;Thêm</button>
						<button type="reset" class="button"><i class="fa fa-refresh"></i>&nbsp;&nbsp;Nhập lại</button>
						<button type="button" class="button" onclick="showForm('add-form', false)"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Thoát</button>
				</div>			
			</form>
			
<!-- ---------------Update form-------------- -->			<form id="update-form">
				<div class="input-table">
					<table>
						<div class="form-title">Cập nhật chất lượng</div>
						<tr>
							<td class="input"><label for="MCL">Mã chất lượng</label></td>
							<td><input name="clMaUpdate" type="text" class="text" required autofocus size="2" maxlength="3"value="A80" pattern="[a-zA-Z0-9]{3}" title="Mã chất lượng chỉ gồm 3 ký tự, không chứ khoảng trắng và ký tự đặc biệt" value="MCL" readonly></td>
						</tr>
						<tr>
							<td class="input"><label for="MCL">Tên chất lượng</label></td>
							<td><input name="clTenUpdate" size="30px" align=left type="text" class="text" value="Hàng thu hồi có thể sử dụng được" required title="Tên chất lượng không được để trống"></td>
						</tr>	
					</table>
				</div>
				<div class="group-button">
						<input type="hidden" name="action" value = "UpdateCl"> 
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