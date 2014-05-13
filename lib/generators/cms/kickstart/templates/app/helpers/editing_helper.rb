module EditingHelper
  def cms_edit_enum(object, attribute_name, options = {})
    attribute_definition = object.cms_attribute_definition(attribute_name)
    values = attribute_definition['values']

    options.reverse_merge!({
      data: {
        values: values,
        min: values.min,
        max: values.max,
      }
    })

    cms_tag(:div, object, attribute_name, options)
  end

  def cms_edit_multienum(object, attribute_name, options = {})
    attribute_definition = object.cms_attribute_definition(attribute_name)

    options.reverse_merge!({
      multiple: true,
      data: {
        values: attribute_definition['values'],
      }
    })

    cms_tag(:div, object, attribute_name, options) do |tag|
      (object[attribute_name] || []).join(', ')
    end
  end

  # Displays a CMS referencelist attribute on an edit page and provides data for the referencelist
  # JavaScript editor.
  #
  # @param [Obj] object the cms object with a referencelist attribute
  # @param [String] attribute_name the name of the referencelist attribute
  # @param [Hash] options html options passed to the tag method
  def cms_edit_referencelist(object, attribute_name, options = {})
    reference_list = object.send(attribute_name)

    cms_tag(:div, object, attribute_name, options) do
      if reference_list.present?
        content_tag(:ul) do
          html = ''.html_safe

          reference_list.each do |reference|
            html << content_tag(:li, data: { name: reference.name, id: reference.id }) do
              reference.to_s
            end
          end

          html
        end
      end
    end
  end

  # Displays a CMS linklist attribute on an edit page and provides data for the linklist
  # JavaScript editor.
  #
  # @param [Obj] object the cms object with a linklist attribute
  # @param [String] attribute_name the name of the linklist attribute
  # @param [Hash] options html options passed to the tag method
  def cms_edit_linklist(object, attribute_name, options = {})
    linklist = object.send(attribute_name)

    cms_tag(:div, object, attribute_name, options) do
      content_tag(:ul) do
        html = ''.html_safe

        linklist.each do |link|
          url = if link.internal?
            "/#{link.obj.id}"
          else
            link.url
          end

          html << content_tag(:li, data: { title: link.title, url: url }) do
            "#{link.title} #{link_to(url, url, target: :_blank)}".html_safe
          end
        end

        html
      end
    end
  end

  def cms_edit_link(object, attribute_name, options = {})
    link = object.send(attribute_name)

    cms_tag(:div, object, attribute_name, options) do
        url = link && link.internal? ? "/#{link.obj.id}" : link.try(:url)
        title = link.try(:title)

      content_tag(:ul) do
        content_tag(:li, title, data: { title: title, url: url })
      end
    end
  end
end
