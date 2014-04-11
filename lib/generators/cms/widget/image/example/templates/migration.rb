require 'open-uri'

class ImageWidgetExample < Scrival::Migration
  def up
    asset_url = 'http://lorempixel.com/1170/400/abstract'

    asset = Image.create(blob: File.new(open(asset_url).path))

    obj = Obj.find_by_path('<%= example_cms_path %>')

    widget = Scrival::BasicWidget.new(
      _obj_class: 'ImageWidget',
      source: asset['id']
    )

    widgets = obj.send('<%= example_widget_attribute %>') << widget
    obj.update('<%= example_widget_attribute %>' => widgets)
  end
end
