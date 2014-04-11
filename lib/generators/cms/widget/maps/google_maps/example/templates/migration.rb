class GoogleMapsWidgetExample < ::Scrival::Migration
  def up
    obj = Obj.find_by_path('<%= example_cms_path %>')

    widget = Scrival::BasicWidget.new(
      _obj_class: 'GoogleMapsWidget',
      address: 'Infopark, Kitzingstrasse 15, 12277 Berlin'
    )

    widgets = obj.send('<%= example_widget_attribute %>') << widget
    obj.update('<%= example_widget_attribute %>' => widgets)
  end
end
