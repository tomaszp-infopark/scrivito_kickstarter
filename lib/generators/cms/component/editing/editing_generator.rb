module Cms
  module Generators
    module Component
      class EditingGenerator < ::Rails::Generators::Base
        source_root File.expand_path('../templates', __FILE__)

        def install_gems
          gem('scrival_editors', path: '../../../scrival_editors')

          Bundler.with_clean_env do
            run('bundle --quiet')
          end
        end

        def create_common_files
          directory('app')
        end

        def set_timezone
          gsub_file(
            'config/application.rb',
            "# config.time_zone = 'Central Time (US & Canada)'",
            "config.time_zone = 'Berlin'"
          )

          log(:info, "set timezone to 'Berlin'")
        end

        def update_production_environment
          data = []

          data << '# Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)'
          data << '  config.assets.precompile += %w(editing.css editing.js)'
          data << ''

          data = data.join("\n")

          environment(data, env: :production)

          log(:environment, 'production: config.assets.precompile += %w(editing.css editing.js)')
        end

        def add_menu_bar_to_layout
          file = 'app/views/layouts/application.html.haml'
          insert_point = "  %body{body_attributes(@obj)}\n"

          data = []

          data << "    = render('layouts/menubar', current_user: current_user)\n"
          data << ''

          data = data.join("\n")

          insert_into_file(file, data, after: insert_point)
        end

        private

        def editor
          options[:editor]
        end
      end
    end
  end
end
