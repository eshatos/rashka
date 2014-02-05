$ ->
  map.init()
  map.show_places()
  map.color_countries()

map =
  #параметры карты
  dom: document.getElementById("map-canvas")      
  options:
    center: app.current_location,
    disableDefaultUI: true,
    zoom: 3
    minZoom: 3

  show_places: ->
    #пытается разместить окно по центру текущего местоположения, а также отображает места
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition (position) ->
        current_location = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
        app.google_map.setCenter current_location
        app.current_location = current_location

        current_loc_marker_options =
          position: current_location
          icon: 'assets/logo.jpg'
          map: app.google_map
        new google.maps.Marker current_loc_marker_options

        app.places.objects.forEach(places.get_distance)
        app.places.objects.forEach(places.render)

        #TODO: сделать так, чтобы места появлялись на карте даже в случае отсутствия текущей геолокации

  color_countries: ->
    #окрашивает страны

    field_name = 'geometry'
    table_id = '1uL8KJV0bMb7A8-SkrIe0ko2DMtSypHX52DatEE4'

    layer = new google.maps.FusionTablesLayer({
      suppressInfoWindows: true,
      query: {
        select: field_name,
        from: table_id
      },
      styles: [{
        polygonOptions: {
          fillColor: '#00FF00',
          fillOpacity: 0.3
        }
      }, {
        where: "Name = 'Russia'",
        polygonOptions: {
          fillColor: '#B10909'
        }
      }]
    })

    layer.setMap app.google_map



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

    place_infobox = new InfoBox(infobox_options)
    infobox_content = "
      <p><b>#{place.type} :</b> #{place.name} </p>
      <p><b>Расстояние:</b> #{place.distance.toFixed(1)} км</p>"

    google.maps.event.addListener marker, 'mouseover', ->
      place_infobox.setContent(infobox_content)
      place_infobox.open(app.google_map, this)

    google.maps.event.addListener marker, 'mouseout', ->
      place_infobox.close()


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


infobox_options =
  #параметры отображения окна инфы при ховере поместу
  boxStyle:
    background: "#fff",
    padding: "20px",
    width: "280px",
    fontSize: "18px"
  closeBoxURL: ""