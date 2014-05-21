class YoutubeWidget < Widget
  def embed_html
    @embed_html ||= if source_url.present?
      oembed_information && oembed_information['html'].html_safe
    end
  end

  def width
    self[:width].presence || '660'
  end

  def height
    self[:height].presence || '430'
  end

  private

  def source_url
    if source.first.present?
      @source_url ||= source.first.url
    end
  end

  def oembed_information
    params = {
      url: source_url,
      'max-width' => max_width,
      'max-height' => max_height,
      format: 'json',
    }

    json = RestClient.get("http://www.youtube.com/oembed?#{params.to_param}")

    JSON.parse(json)
  rescue JSON::ParserError => error
    Rails.logger.error("Could not parse oembed response: #{error.message}")

    nil
  rescue RestClient::ResourceNotFound
    Rails.logger.error("Unknown youtube url: #{source_url}")

    nil
  end
end
