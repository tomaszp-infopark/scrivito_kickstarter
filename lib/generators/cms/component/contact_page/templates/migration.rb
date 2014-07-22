class ContactPage < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'ContactPage',
      is_binary: false,
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
      ]
    )
  end
end
