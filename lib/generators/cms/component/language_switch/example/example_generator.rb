module Cms
  module Generators
    module Component
      module LanguageSwitch
        class ExampleGenerator < ::Rails::Generators::Base
          source_root File.expand_path('../../templates', __FILE__)

          def extend_homepage
            data = []

            data << ''
            data << ''
            data << "        <%= render('layouts/languages', current: homepage, homepages: homepage.homepages) %>"

            data = data.join("\n")

            file = 'app/views/layouts/_main_navigation.html.erb'
            insert_point = "\n      </div>"
            insert_into_file(file, data, before: insert_point)
          end
        end
      end
    end
  end
end
