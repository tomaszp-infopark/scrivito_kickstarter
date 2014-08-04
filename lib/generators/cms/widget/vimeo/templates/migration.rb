class VimeoWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'VimeoWidget',
      is_binary: false,
      attributes: [
        {
          name: 'source',
          type: :link,
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
