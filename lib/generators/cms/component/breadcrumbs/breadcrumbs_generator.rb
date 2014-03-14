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
            '    list = ancestors.select { |obj| obj.respond_to?(:show_in_navigation?) && obj.show_in_navigation? }',
            '    list + [self]',
            '  end',
            '',
          ].join("\n")

          insert_point = /^end$/

          insert_into_file(file, data, before: insert_point)
        end

        def extend_layout
          file = 'app/views/layouts/application.html.haml'

          data = [
            '        .row',
            '          .col-md-12',
            "            = render('layouts/breadcrumbs', page: @obj)",
            "\n",
          ].join("\n")

          insert_point = "      .content\n"

          insert_into_file(file, data, after: insert_point)
        end

        def copy_app_directory
          directory('app')
        end
      end
    end
  end
end
