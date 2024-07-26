
<%
String assetspath = "/assets/";
String siteName = "SoftWaves Technologies";
String address = "414, Shagun Tower Vijay Nagar";
String phoneNo = "+91 9770397704";
%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="<%=assetspath%>img/favicon.png" rel="icon">
<link href="<%=assetspath%>img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="<%=assetspath%>vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=assetspath%>vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="<%=assetspath%>vendor/aos/aos.css" rel="stylesheet">
<link href="<%=assetspath%>vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="<%=assetspath%>vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Main CSS File -->
<link href="<%=assetspath%>css/main.css" rel="stylesheet">

</head>

<body class="index-page">

	<header id="header" class="header d-flex align-items-center sticky-top">
		<div
			class="container-fluid container-xl position-relative d-flex align-items-center">

			<a href="index.html" class="logo d-flex align-items-center me-auto">
				<!-- Uncomment the line below if you also wish to use an image logo -->
				<!-- <img src="assets/img/logo.png" alt=""> -->
				<h1 class="sitename"><%=siteName%></h1>
			</a>

			<nav id="navmenu" class="navmenu">
				<ul>
					<li><a href="#hero" class="active">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#rules">Rules</a></li>
					<li><a href="#review">Review</a></li>
			
					<li class="dropdown"><a href="#"><span>Dropdown</span> <i
							class="bi bi-chevron-down toggle-dropdown"></i></a>
						<ul>
							<li><a href="#">Dropdown 1</a></li>
							<li class="dropdown"><a href="#"><span>Deep
										Dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
								<ul>
									<li><a href="#">Deep Dropdown 1</a></li>
									<li><a href="#">Deep Dropdown 2</a></li>
									<li><a href="#">Deep Dropdown 3</a></li>
									<li><a href="#">Deep Dropdown 4</a></li>
									<li><a href="#">Deep Dropdown 5</a></li>
								</ul></li>
							<li><a href="#">Dropdown 2</a></li>
							<li><a href="#">Dropdown 3</a></li>
							<li><a href="#">Dropdown 4</a></li>
						</ul></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
				<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
			</nav>

			<a class="btn-getstarted" href="index.html#about">Get Started</a>

		</div>
	</header>



	<!-- Vendor JS Files -->
	<script
		src="<%=assetspath%>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=assetspath%>vendor/php-email-form/validate.js"></script>
	<script src="<%=assetspath%>vendor/aos/aos.js"></script>
	<script src="<%=assetspath%>vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="<%=assetspath%>vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script src="<%=assetspath%>vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="<%=assetspath%>vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Main JS File -->
	<script src="<%=assetspath%>js/main.js"></script>

</body>

</html>