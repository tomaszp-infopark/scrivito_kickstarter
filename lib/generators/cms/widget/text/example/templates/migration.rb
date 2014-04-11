class TextWidgetExample < Scrival::Migration
  def up
    obj = Obj.find_by_path('<%= example_cms_path %>')

    widget = Scrival::BasicWidget.new(
      _obj_class: 'TextWidget',
      content: '<p>Nullam sed velit libero. Nullam pharetra metus non justo lobortis, eu vehicula magna
        mollis. Suspendisse feugiat volutpat neque, eget volutpat nulla. Phasellus non ipsum ac
        ipsum venenatis iaculis. Maecenas dictum congue nulla id fringilla. Suspendisse sit amet
        enim dapibus, volutpat dui quis, suscipit nunc. Morbi imperdiet pellentesque augue, at
        ornare mauris consectetur faucibus.</p>'
    )

    widgets = obj.send('<%= example_widget_attribute %>') << widget
    obj.update('<%= example_widget_attribute %>' => widgets)
  end
end
