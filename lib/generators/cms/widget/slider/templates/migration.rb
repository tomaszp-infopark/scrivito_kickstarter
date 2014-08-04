class SliderWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'SliderWidget',
      is_binary: false,
      attributes: [
        {
          name: 'images',
          type: :referencelist,
        },
      ]
    )
  end
end
