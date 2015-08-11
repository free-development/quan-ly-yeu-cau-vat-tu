<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>VÄn phÃ²ng Äiá»n tá»­ cÃ´ng ty Äiá»n lá»±c Cáº§n ThÆ¡</title>
        <link rel="stylesheet" href="style/style-giao-dien-chinh.css" type="text/css">
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
			return confirm('Báº¡n cÃ³ cháº¯c xÃ³a');
		}
	</script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="Shortcut Icon" href="img/logo16.png" type="image/x-icon" />  
    </head>
    <body>
        <div class="wrapper">
				<div class="header">
	<!--
					<img src="img/logo.png" alt="" id="logo" width=80 height=80/><br/>
					<img src="img/textlogo.png" alt="" id="logo" width=80 height=20/>
	-->
					<div id="top_title">VÄn phÃ²ng Äiá»n tá»­</div>
					<div id="bottom-title">CÃ´ng ty Äiá»n lá»±c cáº§n thÆ¡</div>
					<div class="search_form" id="search">
						<form action="" method="post">
<!--
							<span class="search-select">
								<select name="" ><option disabled selected>--TÃ¹y chá»n kiáº¿m kiá»m--</option></select>
								<option value=""></option>
							</span>
-->
							
							<span class="search-text">
								&nbsp;
							<input type="search" class="search" name="search_box" name="search" placeholder="TÃ¬m kiáº¿m" />
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
						<li><a href="">Trang chá»§</a></li>
						<li><a>Danh má»¥c</a>
							<ul>
								<li><a href="danh-muc-noi-san-xuat.html">Danh má»¥c nÆ¡i sáº£n xuáº¥t</p></a></li>
								<li><a href="danh-muc-chat-luong.html">Danh má»¥c cháº¥t lÆ°á»£ng</a></li>
								<li><a href="danh-muc-vat-tu.html">Danh má»¥c váº­t tÆ°</a></li>
								<li><a href="danh-muc-bo-phan.html">Danh má»¥c bá» pháº­n sá»­ dá»¥ng</a></li>
								<li><a href="danh-muc-muc-dich.html">Danh má»¥c má»¥c ÄÃ­ch</a></li>
							</ul>
						</li>
						<li><a href="danh-muc-cong-van.html">CÃ´ng vÄn</a></li>
						<li><a href="bao-cao.html">BÃ¡o cÃ¡o</a></li>
<!--						<li><a href="danh-muc-chia-se-cong-van.html">Chia sáº½</a></li>-->
						<li><a href="bao-cao.html">Quáº£n lÃ½ ngÆ°á»i dÃ¹ng</a></li>
					</ul>
					<div class="clear"></div>
				</div>
	
				<div id="main-content">
					
				</div>
				
        </div>
    </body>
</html>
