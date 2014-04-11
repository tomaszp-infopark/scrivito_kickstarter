class VimeoWidgetExample < Scrival::Migration
  def up
    obj = Obj.find_by_path('<%= example_cms_path %>')

    widget = Scrival::BasicWidget.new(
      _obj_class: 'VimeoWidget',
      source: [
        Scrival::Link.new(url: 'http://vimeo.com/5545659')
      ]
    )

    widgets = obj.send('<%= example_widget_attribute %>') << widget
    obj.update('<%= example_widget_attribute %>' => widgets)
  end
end
