class GoogleMapsWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'GoogleMapsWidget',
      is_binary: false,
      attributes: [
        {
          name: 'address',
          type: :string,
        },
      ]
    )
  end
end
