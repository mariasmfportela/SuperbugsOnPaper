var map;

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 16, lng: 106},
        zoom: 5
    });
}
