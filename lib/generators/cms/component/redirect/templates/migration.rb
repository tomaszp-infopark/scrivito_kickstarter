class Redirect < ::Scrival::Migration
  def up
    create_obj_class(
      name: 'Redirect',
      type: 'publication',
      title: 'Redirect',
      attributes: [
        {
          name: 'redirect_link',
          type: :linklist,
        },
      ]
    )
  end
end
