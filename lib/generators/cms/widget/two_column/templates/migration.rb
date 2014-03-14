class TwoColumnWidget < ::RailsConnector::Migration
  def up
    create_obj_class(
      name: 'TwoColumnWidget',
      type: 'publication',
      title: 'Two Column',
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
          name: 'column_1_width',
          type: :string,
        },
        {
          name: 'column_2_width',
          type: :string,
        },
      ],
      preset_attributes: {
        column_1_width: '6',
        column_2_width: '6',
      }
    )
  end
end
