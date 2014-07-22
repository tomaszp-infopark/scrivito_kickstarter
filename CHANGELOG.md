# v2.0.5
  * Use the new Scrivito SDK functionality to retrieve object class information. Migrations and
    the edit helper for `enum` and `multienum` fields now make use of `Scrivito::ObjClass`.
  * The simple theme comes now with a Bootswatch theme selector. You can choose from any of the
    provided Twitter Bootstrap themes to give your webpage a new look and feel.
  * The welcome page of the simple theme is now more beginner friendly. It includes different kinds
    of standard widgets, a nice welcome image and points the user to log in to start editing.

# v2.0.4
  * Bugfix: .env template was not packaged. (Thanks @dcsaszar)
  * The LoginPageController no longer needs a root_path configured.
  * Removed integration test app in favor of
    [infopark/kick-it](https://github.com/infopark/kick-it).

# v2.0.3
  * The kickstarted application is now configured using ENV variables. The gem `dotenv-rails` is
    used to make it easier to setup ENV variables on a local machine.

# v2.0.2
  * Better integration of the editing manifest into the asset pipeline.
  * Integrate new Scrivito SDK JavaScript events.
  * Updated gems.

# v2.0.1
  * Use and configure resource browser.

# v2.0.0
  * Bugfix: The target for a redirect page is now editable, even if a target is already configured.
    (Thanks @gertimon)
  * Updated enum and multienum styles on the details view.
  * Removed content attribute on details view of the Text-Image widget.
  * Removed the edit toggle, because it is no longer necessary, as the scrvial menu bar is displayed
    by default and can't be closed anymore.
  * The slider and youtube widget now display an error message for the editor, if not set up
    correctly.
  * Updated the helper for editing linklist and referencelist attributes, to better separate
    concerns between the application and the inplace editors for these two attribute types. This
    also leads to a better read-only user experience. (Thanks @awendt)
  * Major improvement of the google maps widget. Added autocomplete for places directly on the map
    for editors, which made the properties view not necessary anymore to enter the location.
    Multiple map widgets on the same page are supported. It uses the Google Places API, so your
    number of requests per day are limited without an Google API key.
  * Updated the image class to hold information for the resource browser to display a preview of the
    image, instead of a generic icon.
  * Bugfix: A wrong indentation of the footer section of the login panel caused it to break the
    design.
  * Simple Theme: Removed usage of `valid_from` and `valid_until`, because they are no longer system
    attributes present for all CMS objects.
  * Added an iframe widget, that allows to embedd a URL and set the height, width and scrolling
    property for the iframe. Run `rails g cms:widget:iframe` to install.
  * Simple Theme: Added `autofocus` on the login page for the login input field.
  * Refactored user javascript to use data attributes instead of writing directly into a script tag.
  * Removed homepage and locale logic from `simple` theme, because there only is one homepage and
    one locale.
  * Removed `ForceHttps` module because it depends on the project and there are better solutions,
    than doing it in the application.
  * Removed the homepage selection, because the `simple` theme only runs under a single domain.
  * Removed the language switch from the `simple` theme, because it only creates one homepage for
    one language.
  * Removed `haml` dependency and changed all views from haml to erb.
  * Restructured all examples into a `simple` theme. The Kickstarter now generates a core and themes
    can build upon this core to provide views and overwrite anything necessary. This reduces the
    amount of generators and has a much better separation of concerns. For some components and
    widgets, this means that there are no examples anymore. The generators now create the structure
    for the editor to insert an example anywhere on the page.

# v1.3.0
  * Added `scrivito_editors` as a dependency.

# v1.2.0
  * Rename `edit.html` to `details.html` as it is now required by the latest Scrivito SDK. This also
    changed the method `resourcebrowser_edit_view_path` to `resourcebrowser_details_view_path`.
  * The `dialog.css` file has been removed. The functionality will be provided by the
    scrivito_editors gem. (Thanks @agessler)

# v1.1.0
  * Update Travis Rake task to only use the tenant name and the api key.
  * Update Scrivito SDK configuration.

# v1.0.0
  * Removed usage of `preset_attributes` and moved the logic into the Ruby on Rails application.
  * All generated widgets now use the new view template path under `app/views`.
  * Updated to Ruby on Rails version 4.
  * Add `child_order` referencelist attribut to the homepage to allow to sort child elements in
    place. (Thanks @kostia)
  * The homepage headline is now editable in place, instead of on the property view only.
  * Breadcrumbs access is now memoized for better performance on pages like the search result page,
    where breadcrumbs of one object are potentially displayed multiple times.
  * Removed JavaScript editors and the resource browser. The functionality is now available with the
    new gem `scrivito_editors`. This allows much easier updates of these components and removes many
    more complex files from a starting project.
  * Renamed `menubar` to `edit_toggle` which describes better, what it actually does.
  * Update blog posts to edit the author and date in-place instead of on the property view.
  * Added a slider editor for CMS string attributes that represent an integer. The slider editor
    allows to set the min, max and step value and uses jQuery UI. Simply use `data-editor="slider"`
    on a CMS field to enable it. `enum` fields automatically add the `data-min` and `data-max`
    attributes when the `cms_edit_enum` helper is used instead of `cms_tag`. (Thanks @cedrics)
  * All attribute type JavaScript editors "string", "text", "html", "enum", "multienum", "date",
    "linklist", "reference" and "referencelist" can now be used independently from their attribute
    type. This means it is possible to use the `string-editor` for `enum` values, for example or
    define a custom editor for string attributes. The attribute type editors still work by default
    but the editor can be defined in the `data-editor` HTML attribute on a Scrivito `cms_tag` call.
  * The following generators are removed from the Kickstarter and partially provided by the Scrivito
    SDK: `cms:obj`, `cms:widget`, `cms:controller` and `cms:scaffold`.
  * Removed all generators that only configure the Ruby on Rails application. These generators are:
    `component:amazon_ses`, `monitoring:newrelic`, `error_tracking:airbrake`,
    `error_tracking:honeybadger` and `tracking:google_analytics`. All functionality is fully
    described on their respective webpages and provide extensive documentation on how to extend and
    configure the Ruby on Rails application.
  * The styling for nested widgets is now provided by the Scrivito and not necessary
    anymore in the Kickstarter.
  * Updated the string editor to use the `contenteditable` HTML5 attribute, which allows to edit
    content while keeping style information. (Thanks @cedrics and @dcsaszar)
  * Renamed `Column2Widget` to `TwoColumnWidget` and `Column3Widget` to `ThreeColumnWidget`.
    (Thanks @kostia)
  * Default CMS field placeholder and highlighting is moved into the Scrivito, so it
    can be removed from the Kickstarter.
  * Removed `rails g cms:component:developer_tools` and `rails g cms:component:testing` as both are
    very project specific and have easy installers that are better described on their respective
    websites.
  * Bugfix: Search result page expected breadcrumps component. (Thanks @rouvenbehnke)
  * Removed `WorkspaceSelection` mixin, because the In-Place Editing menu bar allows to easily and
    comfortable switch the current working copy.
  * The `Column2Widget` and `Column3Widget` are now part of the default widget set generated by
    `rails g cms:kickstart`.
  * Made the `login` and `logout` button more prominent and moved it to the main navigation.
  * Extended `Image` and `Video` model to provide a more convenient `.create` method, that retrieves
    the `_path` and `_obj_class` automatically from the given `blob`.
  * `rails g cms:kickstart` can now also be applied to a Ruby on Rails application, that was created
    with the `--skip-git` option. (Thanks @cedrics)
  * Removed +Page+ module and further simplified standard CMS objects. The +menu_title+ is no longer
    used but the +headline+ attribute is now displayed directly.
  * Updated the `not_found` method in the `ApplicationController` to even handle cases, where the
    `ResourceNotFound` exception is thrown within the `not_found` method itself.
  * Removed usage of `Time#to_iso` because in all circumstances the `Time`, `Date` or `DateTime`
    object could be used directly.
  * Added a Flickr widget that is based on the Flickr Badge API. It allows to display 1 to 10 images
    and adds a whole set of customization options for the editor.
  * Removed all CRM related generators and related code like the profile page, the reset password
    page, and the form builder. The user authentication is changed to fixed credentials "root" for
    both login and password. The "custom_cloud.yml" file is no longer needed and the
    "infopark_crm_connector" is no longer included.
  * Bugfix: It is no longer the case that a resource is uploaded twice when dropped into the
    resource browser. (Thanks @gertimon)
  * Bugfix: The page is now reloaded if a resource is deleted in the resource browser to update all
    references on the page. (Thanks @gertimon)
  * The `slug` method is no longer overwritten by the generated Kickstarter code to allow full
    customization by gems or the developer within the project.
  * We removed the `NullHomepage` concept that was displayed if no homepage was published yet.
    Instead we recommend to publish right after running your generated migrations to have a homepage
    and login page available in your project.
  * Added customizable filters to the resource browser. You can now define a set of available filters
    that have a name, title, icon and a Scrivito JavaScript search query. A list of filter names can
    then be handed over to the resource browser that looks up the filters and displays them in the left
    filter column. This allows to restrict or display any kind of filter in the resource browser.
  * Removed dependency on `less` by using plain CSS and referencing bootstrap from a CDN.
  * Removed `bootstrap-datepicker-rails` dependency and switched to a jQuery UI datepicker with a
    timepicker addon.
  * renamed `infopark_kickstarter` to `scrivito_kickstarter`
