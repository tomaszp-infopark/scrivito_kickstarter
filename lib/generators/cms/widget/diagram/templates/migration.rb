class DiagramWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'DiagramWidget',
      is_binary: false,
      attributes: [
        {
          name: 'data',
          type: :string,
        },
      ],
    )
  end
end
