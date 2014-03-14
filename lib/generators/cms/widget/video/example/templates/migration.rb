class VideoWidgetExample < Scrival::Migration
  def up
    poster_url = 'https://ip-saas-infoparkdev-cms.s3.amazonaws.com/public/284444b2216d2bec/7e0b65a4d87d224d622a41327f07a9bd/getting-started-poster.png'
    video_url = 'https://ip-saas-infoparkdev-cms.s3.amazonaws.com/public/506c948822d39176/7d452f7d1bd716d10bcb609cbe7e3c51/getting-started.mp4'

    poster = Image.create(blob: File.new(open(poster_url).path))
    video = Video.create(blob: File.new(open(video_url).path))

    homepage = Obj.find_by_path('<%= example_cms_path %>')

    add_widget(homepage, '<%= example_widget_attribute %>', {
      _obj_class: 'VideoWidget',
      source: video['id'],
      poster: poster['id'],
    })
  end

  private

  def add_widget(obj, attribute, widget_params)
    workspace_id = Scrival::Workspace.current.id
    obj_params = Scrival::CmsRestApi.get("workspaces/#{workspace_id}/objs/#{obj.id}")
    widget_id = Scrival::BasicObj.generate_widget_pool_id

    params = {}
    params['_widget_pool'] = { widget_id => widget_params }
    params[attribute] = obj_params[attribute] || {}
    params[attribute]['list'] ||= []
    params[attribute]['list'] << { widget: widget_id }

    update_obj(obj_params['id'], params)
  end
end
