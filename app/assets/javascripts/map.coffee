$ ->
  map.init()
  map.put_marker_on_current()
  map.show_places()
  map.cluster_markers()
  map.get_current_location()

map =
  #параметры карты
  dom: document.getElementById("map-canvas")
  lastValidCenter: app.current_location
  options:
    center: app.current_location,
    disableDefaultUI: true,
    zoom: 13
    minZoom: 4

  show_places: ->
    app.places.objects.forEach(places.get_distance)
    app.places.objects.forEach(places.render)

    google.maps.event.addListener app.google_map, "center_changed", ->
      map.checkBounds()

  set_current_location: (location) ->
    app.google_map.setCenter location
    app.current_location = location
    map.put_marker_on_current()

  nav_geo_success: (position) ->
    app.current_marker.setMap(null)
    unless app.directions_renderer == undefined
      app.directions_renderer.setMap(null)
      #TODO: ресетить кнопку валить, раз уж мы на всякий стираем маршрут
    current_location = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
    map.set_current_location(current_location)
    map.reset_markers()

  nav_geo_error: ->
    console.log "Unable to retrieve your location"

  get_current_location: ->
    #пытается разместить окно по центру текущего местоположения, а также отображает места
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition(map.nav_geo_success, map.nav_geo_error, { enableHighAccuracy:true })

  put_marker_on_current: ->
    #добавляет маркер к текущему месту
    current_loc_marker_options =
      position: app.current_location
      icon: 'assets/logo.jpg'
      map: app.google_map
    app.current_marker = new google.maps.Marker current_loc_marker_options

  reset_markers: ->
    #обновляет маркеры для подготовки к новому текущему местоположению
    app.places.objects.forEach(places.get_distance)
    app.places.objects.forEach(places.update_infobox)

  checkBounds: ->
    map.lastValidCenter = app.google_map.getCenter() if app.bounds.contains(app.google_map.getCenter())
    app.google_map.panTo map.lastValidCenter

  cluster_markers: ->
    markerCluster_styles = [{
      url: 'http://localhost:3000/assets/logo.jpg',
      height: 35,
      width: 35,
      textSize: 1
    }]
    new MarkerClusterer(app.google_map, app.markers, {styles: markerCluster_styles})

  init: ->
    #инициализация карты
    app.google_map = new google.maps.Map(@.dom, @.options)

places =
  #параметры мест
  types:
    1:
      icon: 'assets/places/airplane.png'
    2:
      icon: 'assets/places/seaport.png'
    3:
      icon: 'assets/places/railway.png'
    4:
      icon: 'assets/places/border.png'
    5:
      icon: 'assets/places/car.png'

  render:(place) ->
    #отображение места на карте, принимает json объект места
    position = new google.maps.LatLng(place.lat, place.lng)
    place_marker_options =
      position: position
      map: app.google_map
      icon: places.types[place.type_id].icon
    marker = new google.maps.Marker(place_marker_options)
    app.markers.push(marker)

    place.infobox = new InfoBox(app.infobox_options)
    places.update_infobox(place)

    google.maps.event.addListener marker, 'mouseover', ->
      place.infobox.open(app.google_map, this)

    google.maps.event.addListener marker, 'mouseout', ->
      place.infobox.close()

  update_infobox: (place) ->
    #устанавливает контент у инфобокса места
    infobox_content = "
      <p><b>#{place.type} :</b> #{place.name} </p>
      <p><b>Расстояние:</b> #{place.distance.toFixed(1)} км</p>"
    place.infobox.setContent(infobox_content)

  rad:(x) ->
    #перевод в радианы
    x * Math.PI / 180

  get_distance:(place) ->
    #добавляет значение расстояния от места до текущего положения, принимает json объект места
    cur_loc_lat = app.current_location.lat()
    cur_loc_lng = app.current_location.lng()
    earth_radius = 6371
    place_lat = place.lat
    place_lng = place.lng

    dLat = places.rad(place_lat - cur_loc_lat)
    dLong = places.rad(place_lng - cur_loc_lng)
    a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(places.rad(cur_loc_lat)) * Math.cos(places.rad(cur_loc_lat)) * Math.sin(dLong / 2) * Math.sin(dLong / 2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    place.distance = earth_radius * c

    if app.places.closest == undefined || app.places.closest.distance > place.distance
      app.places.closest = place