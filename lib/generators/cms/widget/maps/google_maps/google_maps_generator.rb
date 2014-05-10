module Cms
  module Generators
    module Widget
      module Maps
        class GoogleMapsGenerator < ::Rails::Generators::Base
          include Migration

          source_root File.expand_path('../templates', __FILE__)

          def migrations
            migration_template('migration.rb', 'cms/migrate/google_maps_widget.rb')
          rescue Rails::Generators::Error
          end

          def copy_app_directory
            directory('app')
          end

          def add_external_javascript
            file = 'app/views/layouts/application.html.erb'
            insert_point = "    <%= javascript_include_tag('application') %>\n"

            data = []
            data << "    <%= javascript_include_tag('//maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places') %>\n"
            data = data.join("\n")

            insert_into_file(file, data, after: insert_point)
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
end
