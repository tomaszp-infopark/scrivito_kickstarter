module Cms
  module Generators
    module Component
      module Editing
        class RedactorGenerator < ::Rails::Generators::Base
          source_root File.expand_path('../templates', __FILE__)

          def create_files
            directory('app')
            directory('vendor')
          end

          def update_application_js
            data = []

            data << ''
            data << '//= require redactor'

            data = data.join("\n")

            file = 'app/assets/javascripts/editing.js'
            insert_point = "\n//= require_self"
            insert_into_file(file, data, before: insert_point)
          end
        end
      end
    end
  end
end
