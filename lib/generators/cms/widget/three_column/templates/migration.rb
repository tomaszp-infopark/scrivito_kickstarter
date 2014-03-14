class ThreeColumnWidget < ::RailsConnector::Migration
  def up
    create_obj_class(
      name: 'ThreeColumnWidget',
      type: 'publication',
      title: 'Three Column',
      attributes: [
        {
          name: 'column_1',
          type: :widget,
        },
        {
          name: 'column_2',
          type: :widget,
        },
        {
          name: 'column_3',
          type: :widget,
        },
        {
          name: 'column_1_width',
          type: :string,
        },
        {
          name: 'column_2_width',
          type: :string,
        },
        {
          name: 'column_3_width',
          type: :string,
        },
      ],
      preset_attributes: {
        column_1_width: '4',
        column_2_width: '4',
        column_3_width: '4',
      }
    )
  end
end
