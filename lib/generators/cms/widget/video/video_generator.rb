module Cms
  module Generators
    module Widget
      class VideoGenerator < ::Rails::Generators::Base
        include Migration

        source_root File.expand_path('../templates', __FILE__)

        def video_tools
          gem('projekktor-rails')

          Bundler.with_clean_env do
            run('bundle --quiet')
          end
        end

        def update_application_js
          data = []

          data << ''
          data << '//= require projekktor'

          data = data.join("\n")

          file = 'app/assets/javascripts/application.js'
          insert_point = "\n//= require_self"
          insert_into_file(file, data, before: insert_point)
        end

        def update_application_css
          data = []

          data << ''
          data << ' *= require projekktor'

          data = data.join("\n")

          file = 'app/assets/stylesheets/application.css'
          insert_point = "\n *= require_self"
          insert_into_file(file, data, before: insert_point)
        end

        def migrations
          migration_template('migration.rb', 'cms/migrate/video_widget.rb')
        rescue Rails::Generators::Error
        end

        def copy_app_directory
          directory('app')
        end

        def notice
          if behavior == :invoke
            log(:migration, 'Make sure to run "rake cms:migrate" to apply CMS changes')
          end
        end
      end
    end
  end
end
