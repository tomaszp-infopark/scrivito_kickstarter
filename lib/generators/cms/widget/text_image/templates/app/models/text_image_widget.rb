class TextImageWidget < Widget
  def align
    self[:align].presence || 'left'
  end
end
