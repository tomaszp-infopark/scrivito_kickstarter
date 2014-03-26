class ThreeColumnWidget < Widget
  def column_1_width
    self[:column_1_widget].presence || '4'
  end

  def column_2_width
    self[:column_2_widget].presence || '4'
  end

  def column_3_width
    self[:column_3_widget].presence || '4'
  end
end
