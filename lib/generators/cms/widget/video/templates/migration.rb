class VideoWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'VideoWidget',
      is_binary: false,
      attributes: [
        {
          name: 'source',
          type: :reference,
        },
        {
          name: 'poster',
          type: :reference,
        },
        {
          name: 'width',
          type: :string,
        },
        {
          name: 'height',
          type: :string,
        },
        {
          name: 'autoplay',
          type: :enum,
          values: %w(Yes No),
        },
      ]
    )
  end
end
