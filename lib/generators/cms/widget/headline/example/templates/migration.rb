class HeadlineWidgetExample < Scrival::Migration
  def up
    obj = Obj.find_by_path('<%= example_cms_path %>')

    widget = Scrival::BasicWidget.new(
      _obj_class: 'HeadlineWidget',
      headline: 'Integer eget justo at ipsum interdum mattis'
    )

    widgets = obj.send('<%= example_widget_attribute %>') << widget
    obj.update('<%= example_widget_attribute %>' => widgets)
  end
end
