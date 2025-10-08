//SlideShow
let slideIndex = 1;

// Initialize slideshow
function initSlideshow() {
    showSlides(slideIndex);
}

// Initialize when DOM is done.
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initSlideshow);
} else {
    initSlideshow();
}

// Nav Controls
function navControl(n) {
  showSlides(slideIndex += n);
}

// Img Controls
function thisSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  
  if (slides.length === 0) return;
  
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  
  // Hide slides
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  
  // Remove active class from dots.
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  
  // Show current slide then set corresponding dot.
  if (slides[slideIndex-1]) {
    slides[slideIndex-1].style.display = "block";
  }
  
  if (dots[slideIndex-1]) {
    dots[slideIndex-1].className += " active";
  }
} 
//SlideShow End