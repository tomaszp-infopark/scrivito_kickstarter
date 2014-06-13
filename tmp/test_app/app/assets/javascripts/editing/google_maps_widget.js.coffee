$ ->
  initialize = ->
    widgets = $('.google-maps')

    widgets.each ->
      widget = $(this)
      canvas = widget.find('.map')

      unless canvas.data('map')
        googleMapsWidget.initialize()

      map = canvas.data('map')
      infoWindow = canvas.data('infoWindow')
      marker = canvas.data('marker')

      input = widget.find('input')
      input.show()

      content = canvas.attr('data-location')
      input.attr('value', content)

      map.controls[google.maps.ControlPosition.TOP_LEFT] = new Array(input[0])

      autocomplete = new google.maps.places.Autocomplete(input[0])
      autocomplete.bindTo('bounds', map)

      google.maps.event.addListener(autocomplete, 'place_changed', ->
        place = autocomplete.getPlace()
        googleMapsWidget.placeMarker(map, infoWindow, marker, place)
        input.scrivito('save', place.formatted_address)
      )

  scrivito.on 'content', ->
    if scrivito.in_editable_view()
      initialize()
