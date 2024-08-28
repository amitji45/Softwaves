<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="component/head.jsp"%>
</head>
<body>
	<%@ include file="component/navbar.jsp"%>
	<main class="main">

		<!-- Hero Section -->
		<section id="hero" class="section hero light-background">

			<div class="container">
				<div class="row gy-4">
					<div
						class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
						<h1>
							Bettter digital experience with
							<%=siteName%></h1>
						<p>We are team of talented developer making websites using
							JAVA</p>
						<div class="d-flex">
							<a href="index.html#about" class="btn-get-started">Get
								Started</a> <a target="_blank"
								href="https://youtu.be/13GqYhvDk-c?si=decvfwLXWjjwgjTm"
								class="glightbox btn-watch-video d-flex align-items-center"><i
								class="bi bi-play-circle"></i><span>Watch Video</span></a>
						</div>
					</div>
					<div class="col-lg-6 order-1 order-lg-2 hero-img">
						<img src="<%=assetspath%>img/hero-img.svg"
							class="img-fluid animated" alt="">
					</div>
				</div>
			</div>

		</section>
		<!-- /Hero Section -->

		<section id="about" class="section about">
			<div class="container section-title">
				<h2>About</h2>
			</div>
			<div class="container">

				<div class="row gy-3">

					<div class="col-lg-6">
						<img src="<%=assetspath%>img/about-img.svg" alt=""
							class="img-fluid">
					</div>

					<div class="col-lg-6 d-flex flex-column justify-content-center">

						<div class="about-content ps-0 ps-lg-3">
							<h3>We prioritize quality over quantity in our student
								intake.</h3>
							<p class="fst-italic">SoftWaves is a premier institution
								renowned for its excellence in IT education. Our strong
								reputation is evidenced by the preference shown by industry
								recruiters for our candidates.</p>
							<ul>
								<li><i class="bi bi-diagram-3"></i>
									<div>
										<h4>Corporate Environment</h4>
										<p>Our comprehensive curriculum not only equips students
											with technical expertise but also prepares them to excel in
											the demanding corporate environment.</p>
									</div></li>
								<li><i class="bi bi-fullscreen-exit"></i>
									<div>
										<h4>Motivation that Sparks you to Success</h4>
										<p>we foster holistic development through regular
											motivational sessions covering spirituality, mental health,
											and decision-making.</p>
									</div></li>
							</ul>
							<p>While SoftWaves offers an unparalleled platform for
								aspiring IT professionals, adherence to our institute's rules
								and regulations is essential. These guidelines are designed to
								create a conducive learning environment and contribute to
								students' overall well-being.</p>
						</div>

					</div>
				</div>

			</div>

		</section>
		<!-- /About Section -->

		<!-- Rules Section -->
		<section id="rules" class="services section light-background">

			<!-- Section Title -->
			<div class="container section-title">
				<h2>Rules</h2>
				<p>Shape your world with rules. Discover the power of
					discipline. Create order, achieve goals. Build a better you. Rules
					are your compass, guide your journey. Success starts with
					structure. Master your habits, master your life.</p>
			</div>
			<!-- End Section Title -->

			<div class="container">

				<div class="row gy-4">

					<div class="col-xl-3 col-md-6 d-flex">
						<div class="service-item position-relative">
							<div class="icon">
								<i class="bi bi-activity icon"></i>
							</div>
							<h4>
								<a href="service-details.html" class="stretched-link">Discipline</a>
							</h4>
							<p>Discipline is the foundation of success. Be mindful,
								focused, and present in every action, word, and step.</p>
						</div>
					</div>
					<!-- End Service Item -->

					<div class="col-xl-3 col-md-6 d-flex">
						<div class="service-item position-relative">
							<div class="icon">
								<i class="bi bi-bounding-box-circles icon"></i>
							</div>
							<h4>
								<a href="service-details.html" class="stretched-link">Tasks
									are priority</a>
							</h4>
							<p>Task completion is paramount. Prioritize, focus, and
								deliver results. No excuses.</p>
						</div>
					</div>
					<!-- End Service Item -->

					<div class="col-xl-3 col-md-6 d-flex">
						<div class="service-item position-relative">
							<div class="icon">
								<i class="bi bi-calendar4-week icon"></i>
							</div>
							<h4>
								<a href="service-details.html" class="stretched-link">Daily
									Punctuality</a>
							</h4>
							<p>Daily punctuality builds discipline, respect, and
								efficiency. It's a key to success.</p>
						</div>
					</div>
					<!-- End Service Item -->

					<div class="col-xl-3 col-md-6 d-flex">
						<div class="service-item position-relative">
							<div class="icon">
								<i class="bi bi-broadcast icon"></i>
							</div>
							<h4>
								<a href="service-details.html" class="stretched-link">No
									Phone</a>
							</h4>
							<p>Phones are disruptive and disrespectful. Focus on the
								present moment. Be fully engaged.</p>
						</div>
					</div>
					<!-- End Service Item -->

				</div>
				<div class="container mt-3 section-title">
					<p>Necessitatibus eius consequatur ex aliquid fuga eum quidem
						sint consectetur velit</p>
				</div>
			</div>

		</section>
		<!-- /Rules Section -->

		<!-- Portfolio Section -->
		<section id="review" class="portfolio section">

			<!-- Section Title -->
			<div class="container section-title">
				<h2>Review</h2>
				<p>Reviews are valuable feedback. This will provide a better
					information about us</p>
			</div>
			<!-- End Section Title -->

			<div class="container">

				<div class="row text-center">
					<div class="col-md-12">
						<!-- Carousel wrapper -->
						<div id="carouselBasicExample"
							class="carousel slide carousel-dark" data-ride="carousel">
							<!-- Inner -->
							<div class="carousel-inner">
								<!-- Single item -->
								<div class="carousel-item active">
									<p class="lead font-italic mx-4 mx-md-5">"Lorem ipsum dolor
										sit amet, consectetur adipisicing elit. Fugit, error amet
										numquam iure provident voluptate esse quasi, voluptas nostrum
										quisquam!"</p>
									<div class="mt-5 mb-4">
										<img
											src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(2).webp"
											class="rounded-circle img-fluid shadow-1-strong"
											alt="smaple image" width="100" height="100" />
									</div>
									<p class="text-muted mb-0">- Anna Morian</p>
								</div>

								<!-- Single item -->
								<div class="carousel-item">
									<p class="lead font-italic mx-4 mx-md-5">"Neque cupiditate
										assumenda in maiores repudiandae mollitia adipisci maiores
										repudiandae mollitia consectetur adipisicing architecto elit
										sed adipiscing elit."</p>
									<div class="mt-5 mb-4">
										<img
											src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(31).webp"
											class="rounded-circle img-fluid shadow-1-strong"
											alt="smaple image" width="100" height="100" />
									</div>
									<p class="text-muted mb-0">- Teresa May</p>
								</div>

								<!-- Single item -->
								<div class="carousel-item">
									<p class="lead font-italic mx-4 mx-md-5">"Duis aute irure
										dolor in reprehenderit in voluptate velit esse cillum dolore
										eu fugiat nulla pariatur est laborum neque cupiditate
										assumenda in maiores."</p>
									<div class="mt-5 mb-4">
										<img
											src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(10).webp"
											class="rounded-circle img-fluid shadow-1-strong"
											alt="smaple image" width="100" height="100" />
									</div>
									<p class="text-muted mb-0">- Kate Allise</p>
								</div>
							</div>
							<!-- Inner -->

							<!-- Controls -->
							<a class="carousel-control-prev" role="button"
								href="#carouselBasicExample" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="visually-hidden">Previous</span>
							</a> <a class="carousel-control-next" role="button"
								href="#carouselBasicExample" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="visually-hidden">Next</span>
							</a>
						</div>
						<!-- Carousel wrapper -->
					</div>
				</div>

			</div>

		</section>
		<!-- /Portfolio Section -->

		<!-- Contact Section -->
		<section id="contact" class="contact section">

			<!-- Section Title -->
			<div class="container section-title">
				<h2>Contact</h2>
			</div>
			<!-- End Section Title -->

			<div class="container">

				<div class="row gy-4">

					<div class="col-lg-5">

						<div class="info-wrap">
							<div class="info-item d-flex">
								<i class="bi bi-geo-alt flex-shrink-0"></i>
								<div>
									<h3>Address</h3>
									<p><%=address%></p>
								</div>
							</div>
							<!-- End Info Item -->

							<div class="info-item d-flex">
								<i class="bi bi-telephone flex-shrink-0"></i>
								<div>
									<h3>Call Us</h3>
									<p><%=phoneNo%></p>
								</div>
							</div>
							<!-- End Info Item -->

							<div class="info-item d-flex">
								<i class="bi bi-envelope flex-shrink-0"></i>
								<div>
									<h3>Email Us</h3>
									<p>info@example.com</p>
								</div>
							</div>
							<!-- End Info Item -->

							<iframe
								src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14717.698711082146!2d75.8954922!3d22.7496158!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3962fd59647039bb%3A0x44d7a6fa61af32f2!2sSoftwaves%20Technologies!5e0!3m2!1sen!2sin!4v1721888879748!5m2!1sen!2sin"
								frameborder="0" style="border: 0; width: 100%; height: 270px;"
								allowfullscreen="" loading="lazy"
								referrerpolicy="no-referrer-when-downgrade"></iframe>
						</div>
					</div>

					<div class="col-lg-7">
						<form action="forms/contact.php" method="post"
							class="php-email-form">
							<div class="row gy-4">

								<div class="col-md-6">
									<label for="name-field" class="pb-2">Your Name</label> <input
										type="text" name="name" id="name-field" class="form-control"
										required="">
								</div>

								<div class="col-md-6">
									<label for="email-field" class="pb-2">Your Email</label> <input
										type="email" class="form-control" name="email"
										id="email-field" required="">
								</div>

								<div class="col-md-12">
									<label for="subject-field" class="pb-2">Subject</label> <input
										type="text" class="form-control" name="subject"
										id="subject-field" required="">
								</div>

								<div class="col-md-12">
									<label for="message-field" class="pb-2">Message</label>
									<textarea class="form-control" name="message" rows="10"
										id="message-field" required=""></textarea>
								</div>

								<div class="col-md-12 text-center">
									<div class="loading">Loading</div>
									<div class="error-message"></div>
									<div class="sent-message">Your message has been sent.
										Thank you!</div>

									<button type="submit">Send Message</button>
								</div>

							</div>
						</form>
					</div>
					<!-- End Contact Form -->

				</div>

			</div>

		</section>
		<!-- /Contact Section -->

	</main>
	<%@ include file="component/footer.jsp"%>
	<%@ include file="component/script.jsp"%>
</body>
</html>