class IframeWidget < Widget
  def iframe_src
    if source.present?
      source.first.url
    end
  end

  def width
    self[:width].presence || '100%'
  end

  def scrolling
    self[:scrolling].presence || 'auto'
  end
end
