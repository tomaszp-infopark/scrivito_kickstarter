module Cms
  module Generators
    module Kickstart
      class SimpleGenerator < ::Rails::Generators::Base
        include Migration

        source_root File.expand_path('../templates', __FILE__)

        def create_theme_structure
          Rails::Generators.invoke('cms:widget:teaser', [], behavior: behavior)
          Rails::Generators.invoke('cms:widget:image', [], behavior: behavior)
          Rails::Generators.invoke('cms:widget:headline', [], behavior: behavior)
          Rails::Generators.invoke('cms:widget:maps', [], behavior: behavior)
          Rails::Generators.invoke('cms:widget:text', [], behavior: behavior)
          Rails::Generators.invoke('cms:widget:two_column', [], behavior: behavior)
          Rails::Generators.invoke('cms:widget:three_column', [], behavior: behavior)
          Rails::Generators.invoke('cms:component:contact_page', [], behavior: behavior)
          Rails::Generators.invoke('cms:component:sitemap', [], behavior: behavior)
          Rails::Generators.invoke('cms:component:blog', [], behavior: behavior)
        end

        def create_theme_content
          migration_template('migration.rb', 'cms/migrate/kickstarter_simple_theme.rb')
        rescue Rails::Generators::Error
        end
      end
    end
  end
end
