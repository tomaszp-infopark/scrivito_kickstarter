class TextImageWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'TextImageWidget',
      is_binary: false,
      attributes: [
        {
          name: 'source',
          type: :reference,
        },
        {
          name: 'align',
          type: :enum,
          values: %w(left right),
        },
        {
          name: 'content',
          type: :html,
        },
      ]
    )
  end
end
