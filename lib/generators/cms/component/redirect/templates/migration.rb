class Redirect < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'Redirect',
      is_binary: false,
      attributes: [
        {
          name: 'redirect_link',
          type: :link,
        },
      ]
    )
  end
end
