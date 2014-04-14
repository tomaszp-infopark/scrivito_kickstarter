module Cms
  module Generators
    module Component
      class BreadcrumbsGenerator < ::Rails::Generators::Base
        source_root File.expand_path('../templates', __FILE__)

        def extend_page_concern
          file = 'app/models/obj.rb'

          data = [
            '  def show_breadcrumbs?',
            '    true',
            '  end',
            '',
            '  def breadcrumbs',
            '    @breadcrumbs ||= begin',
            '      breadcrumbs = ancestors.select { |obj| obj.respond_to?(:show_in_navigation?) && obj.show_in_navigation? }',
            '      breadcrumbs + [self]',
            '    end',
            '  end',
            '',
          ].join("\n")

          insert_point = /^end$/

          insert_into_file(file, data, before: insert_point)
        end

        def extend_layout
          file = 'app/views/layouts/application.html.erb'

          data = [
            '        <div class="row">',
            '          <div class="col-md-12">',
            "            <%= render('layouts/breadcrumbs', page: @obj) %>",
            '          </div>',
            '        </div>',
            "\n",
          ].join("\n")

          insert_point = "      <div class=\"content\">\n"

          insert_into_file(file, data, after: insert_point)
        end

        def copy_app_directory
          directory('app')
        end
      end
    end
  end
end
