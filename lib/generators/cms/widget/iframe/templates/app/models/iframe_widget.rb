class IframeWidget < Widget
  def iframe_src
    source && source.url
  end

  def width
    self[:width].presence || '100%'
  end

  def scrolling
    self[:scrolling].presence || 'auto'
  end
end
