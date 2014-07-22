class VimeoWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'VimeoWidget',
      is_binary: false,
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
