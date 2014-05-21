atom_feed(language: 'en-US') do |feed|
  feed.title @obj.headline
  feed.updated @posts.first.published_at

  @posts.each do |post|
    feed.entry(post, url: cms_url(post)) do |entry|
      entry.title post.headline

      # create an abstract from the content of text widgets
      widget = post.main_content.detect { |widget| widget.is_a?(TextWidget) }
      if widget
        entry.content truncate(strip_tags(widget.content), length: 150), type: 'text'
      end

      # the strftime is needed to work with Google Reader.
      entry.updated post.published_at.strftime('%Y-%m-%dT%H:%M:%SZ')

      entry.author do |author|
        author.name post.author_name
      end
    end
  end
end
