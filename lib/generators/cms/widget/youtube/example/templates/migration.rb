class YoutubeWidgetExample < Scrival::Migration
  def up
    obj = Obj.find_by_path('<%= example_cms_path %>')

    widget = Scrival::BasicWidget.new(
      _obj_class: 'YoutubeWidget',
      source: [
        Scrival::Link.new(url: 'http://www.youtube.com/watch?v=--6V1EIbHQ0')
      ]
    )

    widgets = obj.send('<%= example_widget_attribute %>') << widget
    obj.update('<%= example_widget_attribute %>' => widgets)
  end
end
