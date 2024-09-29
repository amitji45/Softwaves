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
				<li><a href="#contact">Contact</a></li>
				<li class="dropdown"><a href="#"><span>Students</span> <i
						class="bi bi-chevron-down toggle-dropdown"></i></a>
					<ul>
						<li><a href="#">Approval</a></li>
						<li class="dropdown"><a href="#"><span>Marks</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
							<ul>
								<li><a href="#">c & C++</a></li>
								<li><a href="#">Core Java</a></li>
								<li><a href="#">Advance Java</a></li>
								
							</ul></li>
						<li><a href="#">Attendance</a></li>
						<li><a href="#">All Students</a></li>
						<li><a href="#">New Batch</a></li>
					</ul></li>
			</ul>
			<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
		</nav>
		<%
		if (session.getAttribute("user") == null) {
		%>
		<a class="btn-getstarted" href="login">Sign In</a>
		<%
		} else {
		%>
		<a class="btn-getstarted" href="logout">Sign Out</a>
		<%
		}
		%>

	</div>
</header>