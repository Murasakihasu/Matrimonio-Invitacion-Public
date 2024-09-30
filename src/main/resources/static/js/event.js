var map;
var marker;
var geocoder;


function initMap() {
	var defaultLocation = {lat: -33.4489, lng: -70.6693}; // Ubicación inicial

    map = new google.maps.Map(document.getElementById('map'), {
    	center: defaultLocation,
    	zoom: 10
    	});
    	
   	geocoder = new google.maps.Geocoder();

    map.addListener('click', function(event) {
        placeMarker(event.latLng);
        });
        
    document.getElementById('buscar-btn').addEventListener('click', function() {
		geocodeAddress();
		});
}


function geocodeAddress() {
  var address = document.getElementById('place-input').value;

  geocoder.geocode({'address': address}, function(results, status) {
    if (status === 'OK') {
      map.setCenter(results[0].geometry.location);

      if (marker) {
        marker.setPosition(results[0].geometry.location);
      } else {
        marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
      }

      document.getElementById('lat').value = results[0].geometry.location.lat();
      document.getElementById('lng').value = results[0].geometry.location.lng();
    } else {
      alert('No se pudo encontrar la dirección: ' + status);
    }
  });
}

function placeMarker(location) {
	if (marker) {
		marker.setPosition(location);
    } else {
        marker = new google.maps.Marker({
			position: location,
            map: map
          	});
   	}

    document.getElementById('lat').value = location.lat();
    document.getElementById('lng').value = location.lng();
    console.log(lat);
    console.log(lng);
}



function copiarTexto(index) {
    var allCopiedDivs = document.querySelectorAll('[id^="copiado"]');
    
    allCopiedDivs.forEach(function(div) {
        div.classList.remove('copiado');
        div.classList.add('noCopiado');
    });

    var copyText = document.getElementById(`copiable${index}`);
    
    copyText.select();
    copyText.setSelectionRange(0, 99999);

    document.execCommand("copy");

    var copiadoDiv = document.getElementById(`copiado${index}`);
    copiadoDiv.classList.remove('noCopiado');
    copiadoDiv.classList.add('copiado');
}



function updateText() {
    var input = document.getElementById("input").value;
    var output = document.getElementById("output");

    if (input === "Artículos de casa") {
        output.style.display = 'block';
    } else {
        output.style.display = 'none';
    }
}

function confirmSubmit() {
	return confirm("¿Estás seguro de proceder? Toda la información del evento actual será eliminada");
}

