class SlideshareWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'SlideshareWidget',
      is_binary: false,
      attributes: [
        {
          name: 'source',
          type: :linklist,
        },
      ]
    )
  end
end
