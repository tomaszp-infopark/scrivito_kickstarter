class TeaserWidgetExample < Scrival::Migration
  def up
    homepage = Obj.find_by_path('<%= example_cms_path %>')

    add_widget(homepage, '<%= example_widget_attribute %>', {
      _obj_class: 'TeaserWidget',
      headline: 'Welcome to Scrival',
      content: '<p>You successfully started your
        project. Basic components such as a top navigation, a search panel, this text widget, and a
        login page have been created for you to experiment with the building blocks of your website
        application. To access the documentation or get in touch with the Scrival support team,
        visit the Scrival Documentation.</p>',
      link_to: [{
        title: 'Browse Scrival Documentation',
        url: 'https://dev.infopark.net/preparation',
      }],
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
