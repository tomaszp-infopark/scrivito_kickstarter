$ ->
  # The accordion widget uses the Twitter Bootstrap 3 panel JavaScript. In edit mode, all panels
  # should unfold, so that the editor can manipulate their contents directly.

  scrivito.on 'editing', ->
    $('.panel-collapse').collapse('show')
