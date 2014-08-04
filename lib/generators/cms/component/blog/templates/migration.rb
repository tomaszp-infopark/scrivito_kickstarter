class Blog < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'Blog',
      is_binary: false,
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
        {
          name: 'disqus_shortname',
          type: :string,
        },
      ]
    )

    Scrivito::ObjClass.create(
      name: 'BlogPost',
      is_binary: false,
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
        {
          name: 'author_email',
          type: :string,
        },
        {
          name: 'author_name',
          type: :string,
        },
        {
          name: 'main_content',
          type: :widget,
        },
        {
          name: 'published_at',
          type: :date,
        },
      ]
    )
  end
end
