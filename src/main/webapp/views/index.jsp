<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Softwaves</title>
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

			<div class="container">

				<div class="row gy-3">

					<div class="col-lg-6" >
						<img src="<%=assetspath%>img/about-img.svg" alt="" class="img-fluid">
					</div>

					<div class="col-lg-6 d-flex flex-column justify-content-center"
						>
						<div class="about-content ps-0 ps-lg-3">
							<h3>Voluptatem dignissimos provident quasi corporis
								voluptates sit assumenda.</h3>
							<p class="fst-italic">Lorem ipsum dolor sit amet, consectetur
								adipiscing elit, sed do eiusmod tempor incididunt ut labore et
								dolore magna aliqua.</p>
							<ul>
								<li><i class="bi bi-diagram-3"></i>
									<div>
										<h4>Ullamco laboris nisi ut aliquip consequat</h4>
										<p>Magni facilis facilis repellendus cum excepturi quaerat
											praesentium libre trade</p>
									</div></li>
								<li><i class="bi bi-fullscreen-exit"></i>
									<div>
										<h4>Magnam soluta odio exercitationem reprehenderi</h4>
										<p>Quo totam dolorum at pariatur aut distinctio dolorum
											laudantium illo direna pasata redi</p>
									</div></li>
							</ul>
							<p>Ullamco laboris nisi ut aliquip ex ea commodo consequat.
								Duis aute irure dolor in reprehenderit in voluptate velit esse
								cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
								cupidatat non proident, sunt in culpa qui officia deserunt
								mollit anim id est laborum</p>
						</div>

					</div>
				</div>

			</div>

		</section>
		<!-- /About Section -->
   <section id="services" class="services section light-background">

      <!-- Section Title -->
      <div class="container section-title" >
        <h2>Services</h2>
        <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">

          <div class="col-xl-3 col-md-6 d-flex" >
            <div class="service-item position-relative">
              <div class="icon"><i class="bi bi-activity icon"></i></div>
              <h4><a href="service-details.html" class="stretched-link">Lorem Ipsum</a></h4>
              <p>Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi</p>
            </div>
          </div><!-- End Service Item -->

          <div class="col-xl-3 col-md-6 d-flex" >
            <div class="service-item position-relative">
              <div class="icon"><i class="bi bi-bounding-box-circles icon"></i></div>
              <h4><a href="service-details.html" class="stretched-link">Sed ut perspici</a></h4>
              <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</p>
            </div>
          </div><!-- End Service Item -->

          <div class="col-xl-3 col-md-6 d-flex" >
            <div class="service-item position-relative">
              <div class="icon"><i class="bi bi-calendar4-week icon"></i></div>
              <h4><a href="service-details.html" class="stretched-link">Magni Dolores</a></h4>
              <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia</p>
            </div>
          </div><!-- End Service Item -->

          <div class="col-xl-3 col-md-6 d-flex" >
            <div class="service-item position-relative">
              <div class="icon"><i class="bi bi-broadcast icon"></i></div>
              <h4><a href="service-details.html" class="stretched-link">Nemo Enim</a></h4>
              <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis</p>
            </div>
          </div><!-- End Service Item -->

        </div>

      </div>

    </section><!-- /Services Section -->
     <!-- Portfolio Section -->
    <section id="portfolio" class="portfolio section">

      <!-- Section Title -->
      <div class="container section-title" >
        <h2>Portfolio</h2>
        <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="isotope-layout" data-default-filter="*" >

          <ul class="portfolio-filters isotope-filters" >
            <li data-filter="*" class="filter-active">All</li>
            <li data-filter=".filter-app">App</li>
            <li data-filter=".filter-product">Product</li>
            <li data-filter=".filter-branding">Branding</li>
            <li data-filter=".filter-books">Books</li>
          </ul><!-- End Portfolio Filters -->

          <div class="row gy-4 isotope-container" >

			<%  String [][] details =new String [6][2];
			for(String [] detail: details){
			%>
			
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
              <div class="portfolio-content h-100">
                <img src="<%=assetspath%>img/portfolio/app-1.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4><%= detail[0]%></h4>
                  <p><%= detail[1]%></p>
                  <a href="<%=assetspath%>img/portfolio/app-1.jpg" title="App 1" data-gallery="portfolio-gallery-app" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                  <a href="portfolio-details.html" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
                </div>
              </div>
            </div><!-- End Portfolio Item -->
<%} %>
           
          </div><!-- End Portfolio Container -->

        </div>

      </div>

    </section><!-- /Portfolio Section -->
    
      <!-- Contact Section -->
    <section id="contact" class="contact section">

      <!-- Section Title -->
      <div class="container section-title" >
        <h2>Contact</h2>
        <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
      </div><!-- End Section Title -->

      <div class="container" >

        <div class="row gy-4">

          <div class="col-lg-5">

            <div class="info-wrap">
              <div class="info-item d-flex" >
                <i class="bi bi-geo-alt flex-shrink-0"></i>
                <div>
                  <h3>Address</h3>
                  <p><%=address %></p>
                </div>
              </div><!-- End Info Item -->

              <div class="info-item d-flex" >
                <i class="bi bi-telephone flex-shrink-0"></i>
                <div>
                  <h3>Call Us</h3>
                  <p><%=phoneNo %></p>
                </div>
              </div><!-- End Info Item -->

              <div class="info-item d-flex" >
                <i class="bi bi-envelope flex-shrink-0"></i>
                <div>
                  <h3>Email Us</h3>
                  <p>info@example.com</p>
                </div>
              </div><!-- End Info Item -->

              <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14717.698711082146!2d75.8954922!3d22.7496158!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3962fd59647039bb%3A0x44d7a6fa61af32f2!2sSoftwaves%20Technologies!5e0!3m2!1sen!2sin!4v1721888879748!5m2!1sen!2sin" frameborder="0" style="border:0; width: 100%; height: 270px;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
          </div>

          <div class="col-lg-7">
            <form action="forms/contact.php" method="post" class="php-email-form" >
              <div class="row gy-4">

                <div class="col-md-6">
                  <label for="name-field" class="pb-2">Your Name</label>
                  <input type="text" name="name" id="name-field" class="form-control" required="">
                </div>

                <div class="col-md-6">
                  <label for="email-field" class="pb-2">Your Email</label>
                  <input type="email" class="form-control" name="email" id="email-field" required="">
                </div>

                <div class="col-md-12">
                  <label for="subject-field" class="pb-2">Subject</label>
                  <input type="text" class="form-control" name="subject" id="subject-field" required="">
                </div>

                <div class="col-md-12">
                  <label for="message-field" class="pb-2">Message</label>
                  <textarea class="form-control" name="message" rows="10" id="message-field" required=""></textarea>
                </div>

                <div class="col-md-12 text-center">
                  <div class="loading">Loading</div>
                  <div class="error-message"></div>
                  <div class="sent-message">Your message has been sent. Thank you!</div>

                  <button type="submit">Send Message</button>
                </div>

              </div>
            </form>
          </div><!-- End Contact Form -->

        </div>

      </div>

    </section><!-- /Contact Section -->

	</main>
	<%@ include file="component/footer.jsp"%>
</body>
</html>