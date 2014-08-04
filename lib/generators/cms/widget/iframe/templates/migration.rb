class CreateIframeWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'IframeWidget',
      is_binary: false,
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
          type: :link,
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
