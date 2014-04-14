class CreateStructure < ::Scrival::Migration
  def up
    homepage_path = '/en'
    configuration_path = "#{homepage_path}/_configuration"

    destroy_obj_by_path('/logo.png')
    destroy_obj_by_path('/')

    update_obj_class('Publication', is_active: false)

    #
    # Root component
    #

    Obj.create(
      _path: '/',
      _obj_class: 'Root'
    )

    update_obj_class('Root', is_active: false)

    #
    # Homepage component
    #

    Obj.create(
      _path: homepage_path,
      _obj_class: 'Homepage',
      locale: 'en',
      headline: 'Company, Inc.'
    )

    #
    # Example content page component
    #

    Obj.create(
      _path: "#{homepage_path}/example-page",
      _obj_class: 'ContentPage',
      headline: 'Content Page'
    )

    #
    # Error not found page component
    #

    error_not_found_page = Obj.create(
      _path: "#{configuration_path}/error-not-found",
      _obj_class: 'ErrorPage',
      headline: 'Page not found'
    )

    obj = Obj.find_by_path(homepage_path)
    obj.update(
      error_not_found_page: error_not_found_page.id
    )

    #
    # Search component
    #

    search_page = Obj.create(
      _path: "#{configuration_path}/search",
      _obj_class: 'SearchPage',
      headline: 'Search'
    )

    add_attribute_to('Homepage', {
      name: 'search_page',
      type: :reference,
      title: 'Search Page',
    })

    obj = Obj.find_by_path(homepage_path)
    obj.update(
      search_page: search_page.id
    )

    #
    # Login page component
    #

    login_page = Obj.create(
      _path: "#{configuration_path}/login",
      _obj_class: 'LoginPage',
      headline: 'Log in'
    )

    add_attribute_to('Homepage', {
      name: 'login_page',
      type: :reference,
      title: 'Login Page',
    })

    obj = Obj.find_by_path(homepage_path)
    obj.update(
      login_page: login_page.id
    )
  end

  private

  def destroy_obj_by_path(path)
    obj = Obj.find_by_path(path)

    if obj
      obj.destroy
    else
      puts "[delete obj] The object at '#{path}' does not exist."
    end
  rescue Scrival::ClientError => error
  end
end
