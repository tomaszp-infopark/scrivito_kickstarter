class LoginPage < ::Scrival::Migration
  def up
    create_obj_class(
      name: 'LoginPage',
      type: 'publication',
      title: 'Login',
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
      ]
    )
  end
end
