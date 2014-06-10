# When in-place editing is active and the editor is in an editable working copy, check if the
# slider widget is configured properly or otherwise display an error message.

$ ->
  errorMessageTemplate = (headline, message) ->
    template = $('<div></div>')
      .addClass('alert')
      .addClass('alert-danger')

    headline = $('<h4></h4>')
      .text(headline)
      .appendTo(template)

    text = $(message)
      .appendTo(template)

    template

  displayErrorMessage = (headline, message) ->
    widget = $('[data-scrivito-widget-obj-class="SliderWidget"]')
    carousel = widget.find('.carousel')

    # Only display the error message when the carousel is missing or the error message already exists.
    unless carousel.length || widget.find('.alert').length
      errorMessageTemplate(headline, message).appendTo(widget)

  headline = 'Slider widget'
  message = "<p>You don't have any <strong>images</strong> set. Please use the
    <strong>Widget properties</strong> to select them.</p>"

  scrivito.on 'content', ->
    if scrivito.in_editable_view()
      displayErrorMessage(headline, message)
