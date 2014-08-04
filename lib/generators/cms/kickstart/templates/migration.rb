class Kickstart < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'Root',
      is_binary: false
    )

    Scrivito::ObjClass.create(
      name: 'Homepage',
      is_binary: false,
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
        {
          name: 'main_content',
          type: :widget,
        },
        {
          name: 'error_not_found_page',
          type: :reference,
        },
        {
          name: 'child_order',
          type: :referencelist,
        },
      ]
    )

    Scrivito::ObjClass.create(
      name: 'ContentPage',
      is_binary: false,
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
        {
          name: 'main_content',
          type: :widget,
        },
        {
          name: 'sidebar_content',
          type: :widget,
        },
      ]
    )

    Scrivito::ObjClass.create(
      name: 'ErrorPage',
      is_binary: false,
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
        {
          name: 'main_content',
          type: :widget,
        },
      ]
    )

    Scrivito::ObjClass.create(
      name: 'SearchPage',
      is_binary: false,
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
      ]
    )

    Scrivito::ObjClass.create(
      name: 'LoginPage',
      is_binary: false,
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
      ]
    )

    Scrivito::ObjClass.create(
      name: 'Image',
      is_binary: true,
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
      ]
    )

    Scrivito::ObjClass.create(
      name: 'Video',
      is_binary: true,
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
      ]
    )
  end
end
