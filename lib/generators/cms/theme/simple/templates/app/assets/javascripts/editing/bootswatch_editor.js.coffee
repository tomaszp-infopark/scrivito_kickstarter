$ ->
  template = ->
    $('<select></select>')
      .addClass('form-control')

  appendOptions = (element, selected) ->
    $.get 'http://api.bootswatch.com/3/', (data) ->
      options = { 'Default': '' }

      $.each data.themes, (index, info) ->
        options[info.name] = info.cssCdn

      $.each options, (name, value) ->
        $('<option></option>')
          .attr('value', value)
          .text(name)
          .appendTo(element)

      element.val(selected)

  save = (event) ->
    element = $(event.currentTarget)
    cmsField = element.data('cmsField')
    content = element.val()

    cmsField.scrivito('save', content)

  initialize = ->
    $(document).on 'click', '[data-scrivito-field-type="string"][data-editor="bootswatch"]', (event) ->
      cmsField = $(event.currentTarget)
      selected = cmsField.scrivito('content')

      cmsField.hide()

      element = template()
        .data('cmsField', cmsField)
        .insertAfter(cmsField)
        .focusout(save)
        .focus()

      appendOptions(element, selected)

  scrivito.on 'load', ->
    if scrivito.in_editable_view()
      initialize()
