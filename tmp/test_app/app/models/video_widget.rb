class VideoWidget < Widget
  # Determines the mime type of the video.
  def mime_type
    if source.present?
      source.mime_type
    end
  end

  def width
    self[:width].presence || '660'
  end

  def height
    self[:height].presence || '430'
  end
end
