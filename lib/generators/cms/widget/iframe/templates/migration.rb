class CreateIframeWidget < ::Scrivito::Migration
  def up
    create_obj_class(
      name: 'IframeWidget',
      title: 'Iframe',
      type: 'publication',
      attributes: [
        {
          name: 'height',
          type: :string,
        },
        {
          name: 'width',
          type: :string,
        },
        {
          name: 'source',
          type: :linklist,
        },
        {
          name: 'scrolling',
          type: :enum,
          values: %w(auto yes no),
        },
      ]
    )
  end
end
