$ ->
  window.googleMapsWidget =
    placeMarker: (map, infoWindow, marker, place) ->
      infoWindow.close()
      marker.setVisible(false)

      unless place.geometry
        return

      map.setCenter(place.geometry.location)
      map.setZoom(17)

      marker.setPosition(place.geometry.location)
      marker.setVisible(true)

      content = '<div><strong>' + place.name + '</strong></br>' + place.formatted_address
      infoWindow.setContent(content)
      infoWindow.open(map, marker)

    initialize: () ->
      widgets = $('.google-maps')

      widgets.each ->
        widget = $(this)
        canvas = widget.find('.map')

        # Make sure not to initalize a map twice, which can happen if a new
        # map is added dynamically.
        if canvas.data('map')
          return

        mapOptions =
          center: new google.maps.LatLng(-33.8688, 151.2195)
          zoom: 13

        map = new google.maps.Map(canvas[0], mapOptions)
        canvas.data('map', map)

        infoWindow = new google.maps.InfoWindow()
        canvas.data('infoWindow', infoWindow)

        marker = new google.maps.Marker
          map: map
          anchorPoint: new google.maps.Point(0, -29)
        canvas.data('marker', marker)

        if content = canvas.attr('data-location')
          request =
            query: content

          service = new google.maps.places.PlacesService(map)
          service.textSearch request, (results, status) ->
            if status == google.maps.places.PlacesServiceStatus.OK
              place = results[0] # only interested in the first place found
              googleMapsWidget.placeMarker(map, infoWindow, marker, place)

  google.maps.event.addDomListener(window, 'load', googleMapsWidget.initialize)
