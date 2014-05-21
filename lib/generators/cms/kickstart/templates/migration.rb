class Kickstart < ::Scrivito::Migration
  def up
    create_obj_class(
      name: 'Root',
      type: 'publication',
      title: 'Root'
    )

    create_obj_class(
      name: 'Homepage',
      type: 'publication',
      title: 'Homepage',
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

    create_obj_class(
      name: 'ContentPage',
      type: 'publication',
      title: 'Content',
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

    create_obj_class(
      name: 'ErrorPage',
      type: 'publication',
      title: 'Error',
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

    create_obj_class(
      name: 'SearchPage',
      type: 'publication',
      title: 'Search',
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
      ]
    )

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

    create_obj_class(
      name: 'Image',
      type: 'image',
      title: 'Image',
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
      ]
    )

    create_obj_class(
      name: 'Video',
      type: 'generic',
      title: 'Video',
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
      ]
    )
  end
end
