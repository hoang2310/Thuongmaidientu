<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>User Template - Index</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/assets/img/favicon.png" rel="icon">
<link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Dosis:300,400,500,,600,700,700i|Lato:300,300i,400,400i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/assets/css/style.css" rel="stylesheet">

</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top">
		<div
			class="container d-flex align-items-center justify-content-between">

			<a href="/" class="logo"><img src="/assets/img/logo.png"
				alt="" class="img-fluid"></a>
			<!-- Uncomment below if you prefer to use text as a logo -->
			<!-- <h1 class="logo"><a href="index.html">Butterfly</a></h1> -->

			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="nav-link scrollto active" href="/">Home</a></li>
					<li><a class="nav-link scrollto" href="/collections">All Product</a></li>
					<li class="dropdown"><a href="#"><span>Menu</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="#">Product</a></li>
							<li class="dropdown"><a href="#"><span>My Account</span>
									<i class="bi bi-chevron-right"></i></a>
								<ul>
									<li><a href="#">Add Account</a></li>
									<li><a href="#">Change information</a></li>
									<li><a href="#">Change Password</a></li>
								</ul></li>
							<li><a href="#">Order Status</a></li>
							<li><a href="#">Log out</a></li>
						</ul></li>
					<li><a class="nav-link scrollto" href="/admin">Manager</a></li>
					<li><a class="nav-link scrollto " href="/">cart</a></li>
					<li><a class="nav-link scrollto" href="#team">Team</a></li>
					<li><a class="nav-link scrollto" href="#contact">Contact</a></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->

		</div>
	</header>
	<!-- End Header -->

	<section id="hero" class="d-flex align-items-center">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 d-flex flex-column justify-content-center">
					<h1>All Product</h1>
					<div>
						<a href="#about" class="btn-get-started scrollto">Get Started</a>
					</div>
				</div>
				<div class="col-lg-6 order-1 order-lg-2 hero-img">
					<img src="/assets/img/hero-img.png" class="img-fluid" alt="">
				</div>
			</div>
		</div>
	</section>

	<main id="main">
		<section id="about" class="about">
			<div class="container">

				<div class="section-title">
					<h2>List All Products</h2>
					<p>Gucci, LV, Channel, G-Shock, Dior, Dolce&Gabbana, Versace,
						Prada, Hermes</p>
				</div>

				<div class="row">
					<div class="">
						<jsp:include page="${ view }"></jsp:include>
					</div>
				</div>
			</div>
		</section>
	</main>


	<!-- ======= Footer ======= -->
	<footer id="footer">

		<div class="footer-newsletter">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6">
						<p>Search for everything</p>
						<form action="" method="post">
							<input type="email" name="email"><input type="submit"
								value="Subscribe">
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">About
									us</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Terms
									of service</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Privacy
									policy</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Services</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web
									Design</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web
									Development</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Product
									Management</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Graphic
									Design</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Social Networks</h4>
						<div class="social-links mt-3">
							<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
								href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
								href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
							<a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
							<a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="container py-4">
			<div class="copyright">
				&copy; Copyright <strong><span>Ola</span></strong>. Hoanghtph13294
			</div>
			<div class="credits">
				Designed by <a href="https://bootstrapmade.com/">PH13294</a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="/assets/vendor/purecounter/purecounter.js"></script>
	<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="/assets/js/main.js"></script>

</body>

</html>