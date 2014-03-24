require 'spec_helper'

require 'generator_spec/test_case'
require 'generators/cms/component/editing/editing_generator'

describe Cms::Generators::Component::EditingGenerator do
  include GeneratorSpec::TestCase

  destination File.expand_path('../../../../tmp/generators', __FILE__)

  before do
    prepare_destination
    prepare_environments
    run_generator
  end

  def prepare_environments
    environments_path = "#{destination_root}/config/environments"
    layouts_path = "#{destination_root}/app/views/layouts"
    config_path = "#{destination_root}/config"

    mkdir_p(environments_path)
    mkdir_p(layouts_path)
    mkdir_p(config_path)

    File.open("#{destination_root}/Gemfile", 'w')
    File.open("#{environments_path}/production.rb", 'a') { |f| f.write('Test::Application.configure do') }
    File.open("#{layouts_path}/application.html.haml", 'w') { |file| file.write("  %body{body_attributes(@obj)}\n") }
    File.open("#{config_path}/application.rb", 'w') { |file| file.write("# config.time_zone = 'Central Time (US & Canada)'") }
  end

  it 'creates files' do
    destination_root.should have_structure {
      directory 'app' do
        directory 'assets' do
          directory 'stylesheets' do
            directory 'editing' do
              file 'dialog.css'
              file 'edit_toggle.css'
            end

            file 'editing.css' do
              contains '*= require scrival_editors'
            end
          end

          directory 'javascripts' do
            directory 'editing' do
              file 'edit_toggle.js.coffee'
              file 'mediabrowser_filters.js.coffee'
            end

            file 'editing.js' do
              contains '//= require scrival_editors'
            end
          end
        end

        directory 'helpers' do
          file 'editing_helper.rb'
        end

        directory 'views' do
          directory 'layouts' do
            file '_edit_toggle.html.haml'

            file 'application.html.haml' do
              contains "    = render('layouts/edit_toggle', current_user: current_user)"
            end
          end

          directory 'mediabrowser' do
            directory 'thumbnails' do
              file 'blog_post.html.haml'
              file 'error_page.html.haml'
              file 'image.html.haml'
            end
          end
        end
      end

      directory 'config' do
        directory 'environments' do
          file 'production.rb' do
            contains 'config.assets.precompile += %w(editing.css editing.js)'
          end
        end

        file 'application.rb' do
          contains "config.time_zone = 'Berlin'"
        end
      end
    }
  end
end
