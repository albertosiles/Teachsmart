function showSlide(n) {
  const slides = document.getElementsByClassName("carousel-images")[0].getElementsByTagName("img");
  if (n >= slides.length) { slideIndex = 0; }
  if (n < 0) { slideIndex = slides.length - 1; }
  for (let i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
      slides[i].style.width = "100%";
  }
  slides[slideIndex].style.display = "block";
}

function initMap() {
  var mapOptions = {
      center: { lat: 51.5074, lng: -0.1278 }, // London, UK (default center)
      zoom: 5, // Zoom level
      mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  // Create a new map object
  var map = new google.maps.Map(document.getElementById('map'), mapOptions);

  // Add markers for UK and Germany
  var markers = [
      { lat: 51.5074, lng: -0.1278, title: 'London, UK' }, // London, UK
      { lat: 52.5200, lng: 13.4050, title: 'Berlin, Germany' } // Berlin, Germany
  ];

  // Loop through markers and add them to the map
  for (var i = 0; i < markers.length; i++) {
      var marker = new google.maps.Marker({
          position: { lat: markers[i].lat, lng: markers[i].lng },
          map: map,
          title: markers[i].title
      });
  }
}
