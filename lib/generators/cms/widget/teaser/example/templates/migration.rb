class TeaserWidgetExample < Scrival::Migration
  def up
    obj = Obj.find_by_path('<%= example_cms_path %>')

    widget = Scrival::BasicWidget.new(
      _obj_class: 'TeaserWidget',
      headline: 'Welcome to Scrival',
      content: '<p>You successfully started your
        project. Basic components such as a top navigation, a search panel, this text widget, and a
        login page have been created for you to experiment with the building blocks of your website
        application. To access the documentation or get in touch with the Scrival support team,
        visit the Scrival Documentation.</p>',
      link_to: [
        Scrival::Link.new(
          url: 'https://scrival.com/preparation',
          title: 'Browse Scrival Documentation'
        ),
      ]
    )

    widgets = obj.send('<%= example_widget_attribute %>') << widget
    obj.update('<%= example_widget_attribute %>' => widgets)
  end
end
