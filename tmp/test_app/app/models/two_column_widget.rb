class TwoColumnWidget < Widget
  def column_1_width
    self[:column_1_width].presence || '6'
  end

  def column_2_width
    self[:column_2_width].presence || '6'
  end
end
