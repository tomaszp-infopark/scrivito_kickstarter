class YoutubeWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'YoutubeWidget',
      is_binary: false,
      attributes: [
        {
          name: 'source',
          type: :linklist,
        },
        {
          name: 'max_width',
          type: :string,
        },
        {
          name: 'max_height',
          type: :string,
        },
      ]
    )
  end
end
