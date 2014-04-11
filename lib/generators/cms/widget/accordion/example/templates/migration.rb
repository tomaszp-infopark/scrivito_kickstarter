class AccordionWidgetExample < ::Scrival::Migration
  def up
    text_widget1 = Scrival::BasicWidget.new(
      _obj_class: 'TextWidget',
      content: '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',
    )

    text_widget2 = Scrival::BasicWidget.new(
      _obj_class: 'TextWidget',
      content: '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',
    )

    panel_widget1 = Scrival::BasicWidget.new(
      _obj_class: '<%= panel_obj_class_name %>',
      headline: 'Duis aute irure dolor in reprehenderit',
      main_content: [
        text_widget1,
      ]
    )

    panel_widget2 = Scrival::BasicWidget.new(
      _obj_class: '<%= panel_obj_class_name %>',
      headline: 'Excepteur sint occaecat cupidatat',
      main_content: [
        text_widget2,
      ]
    )

    obj = Obj.find_by_path('<%= example_cms_path %>')

    widget = Scrival::BasicWidget.new(
      _obj_class: '<%= obj_class_name %>',
      panels: [
        panel_widget1,
        panel_widget2,
      ]
    )

    widgets = obj.send('<%= example_widget_attribute %>') << widget
    obj.update('<%= example_widget_attribute %>' => widgets)
  end
end
