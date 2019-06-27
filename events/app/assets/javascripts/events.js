window.onload = function () {
  var map = L.map('map');
  var layer = Tangram.leafletLayer({
    scene: 'scene.yaml',
    attribution: '<a href="https://nextzen.org/tangram" target="_blank">Tangram</a> | &copy; OSM contributors | <a href="https://nextzen.com/" target="_blank">Nextzen</a>'
  });
  layer.addTo(map);
  map.setView([40.70531887544228, -74.00976419448853], 15);
}
