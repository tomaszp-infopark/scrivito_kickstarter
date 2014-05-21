class VimeoWidget < ::Scrivito::Migration
  def up
    create_obj_class(
      name: 'VimeoWidget',
      type: 'publication',
      title: 'Vimeo',
      attributes: [
        {
          name: 'source',
          type: :linklist,
        },
        {
          name: 'width',
          type: :string,
        },
        {
          name: 'height',
          type: :string,
        },
      ]
    )
  end
end
