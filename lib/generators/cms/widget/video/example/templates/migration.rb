class VideoWidgetExample < Scrival::Migration
  def up
    poster_url = 'https://ip-saas-infoparkdev-cms.s3.amazonaws.com/public/284444b2216d2bec/7e0b65a4d87d224d622a41327f07a9bd/getting-started-poster.png'
    video_url = 'https://ip-saas-infoparkdev-cms.s3.amazonaws.com/public/506c948822d39176/7d452f7d1bd716d10bcb609cbe7e3c51/getting-started.mp4'

    poster = Image.create(blob: File.new(open(poster_url).path))
    video = Video.create(blob: File.new(open(video_url).path))

    obj = Obj.find_by_path('<%= example_cms_path %>')

    widget = Scrival::BasicWidget.new(
      _obj_class: 'VideoWidget',
      source: video['id'],
      poster: poster['id']
    )

    widgets = obj.send('<%= example_widget_attribute %>') << widget
    obj.update('<%= example_widget_attribute %>' => widgets)
  end
end
