$ ->
  # When in-place editing is active and the editor is in an editable working
  # copy, a button is inserted to be able to create a new blog post.
  scrival.on 'editing', ->
    # Create a new DOM element for the button, that allows editors to create a
    # new blog post in place.
    button = $('<button />')
      .text('New blog post')
      .css('margin-bottom', '20px')
      .addClass('btn btn-warning')

    # Place the button on top of all blog posts on the blog overview page.
    button.prependTo $('.blog_posts')

    # Define what happens when the editor clicks the inserted button. All
    # required blog post attributes are gathered and a new blog post object is
    # created in the CMS. The current date and user are prefilled. When
    # it is created successfully, the editor is redirected to its details page.
    button.on 'click', ->
      $(this).attr('disabled', true)

      body = $('body')
      prefixPath = body.attr('data-current-obj-path')
      now = moment().utc()
      year = now.year()
      isoDate = now.format('YYYYMMDDHHmmss')

      email = body.attr('data-current-user-email')
      firstName = body.attr('data-current-user-first-name')

      scrival
        .create_obj
          _obj_class: 'BlogPost'
          _path: "#{prefixPath}/#{isoDate}"
          published_at: isoDate
          headline: 'New Blog Post'
          author_email: email
          author_name: firstName
        .done (data) ->
          window.location.href = "/#{data.id}"
