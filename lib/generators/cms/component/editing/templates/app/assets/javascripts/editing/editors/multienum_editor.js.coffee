$ ->
  # Define editor behavior for multienum attributes.

  infopark.on 'editing', ->
    template = (values) ->
      element = $('<select></select>')
        .attr('multiple', 'true')

      $.each values, (index, value) ->
        $('<option></option>')
          .attr('value', value)
          .text(value)
          .appendTo(element)

      element

    save = (event) ->
      element = $(event.currentTarget)
      cmsField = element.data('cmsField')
      content = element.val()
      cmsField.infopark('save', content).done ->
        cmsField.trigger('infopark_reload')

    $(document).on 'click', '[data-ip-field-type="multienum"]:not([data-editor]), [data-editor="multienum"]', (event) ->
      cmsField = $(event.currentTarget)
      selected = cmsField.infopark('content')
      values = cmsField.data('values')

      template(values)
        .data('cmsField', cmsField)
        .val(selected)
        .insertAfter(cmsField)
        .focusout(save)
        .focus()

      cmsField.hide()
