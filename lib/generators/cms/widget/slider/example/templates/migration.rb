class SliderWidgetExample < Scrival::Migration
  def up
    urls = [
      'http://lorempixel.com/1170/400/abstract',
      'http://lorempixel.com/1170/400/sports',
      'http://lorempixel.com/1170/400/city',
    ]

    image_ids = urls.map do |url|
      image = Image.create(blob: File.new(open(url).path))

      image['id']
    end

    obj = Obj.find_by_path('<%= example_cms_path %>')

    widget = Scrival::BasicWidget.new(
      _obj_class: 'SliderWidget',
      images: image_ids
    )

    widgets = obj.send('<%= example_widget_attribute %>') << widget
    obj.update('<%= example_widget_attribute %>' => widgets)
  end
end
