class SlideshareWidgetExample < Scrival::Migration
  def up
    obj = Obj.find_by_path('<%= example_cms_path %>')

    widget = Scrival::BasicWidget.new(
      _obj_class: 'SlideshareWidget',
      source: [
        Scrival::Link.new(url: 'http://de.slideshare.net/AmazonWebServices/infopark-ag-aws-customer-presentation?from_search=5')
      ]
    )

    widgets = obj.send('<%= example_widget_attribute %>') << widget
    obj.update('<%= example_widget_attribute %>' => widgets)
  end
end
