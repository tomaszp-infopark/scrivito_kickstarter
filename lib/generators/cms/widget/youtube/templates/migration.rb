class YoutubeWidget < ::Scrival::Migration
  def up
    create_obj_class(
      name: 'YoutubeWidget',
      type: 'publication',
      title: 'Youtube',
      attributes: [
        {
          name: 'source',
          type: :linklist,
        },
        {
          name: 'max_width',
          type: :string,
        },
        {
          name: 'max_height',
          type: :string,
        },
      ]
    )
  end
end
