require 'rails_helper'

require 'generator_spec/test_case'
require 'rails/generators/test_case'
require 'generators/cms/kickstart/kickstart_generator'

describe Cms::Generators::KickstartGenerator do
  include GeneratorSpec::TestCase

  destination File.expand_path('../../../tmp/generators', __FILE__)

  before do
    prepare_destination
    prepare_environments
    run_generator
  end

  def prepare_environments
    paths = {
      config_path: "#{destination_root}/config",
      environments_path: "#{destination_root}/config/environments",
      javascripts_path: "#{destination_root}/app/assets/javascripts",
    }

    paths.each do |_, path|
      mkdir_p(path)
    end


    File.open("#{destination_root}/Gemfile", 'w')
    File.open("#{destination_root}/.gitignore", 'w')
    File.open("#{paths[:javascripts_path]}/editing.js", 'w')
    File.open("#{paths[:config_path]}/secrets.yml", 'w') { |file| file.write("development:\n") }

    File.open("#{paths[:config_path]}/application.rb", 'w') do |file|
      file.write("# config.time_zone = 'Central Time (US & Canada)'")
    end

    File.open("#{paths[:environments_path]}/production.rb", 'w') do |file|
      file.write('Rails.application.configure do')
    end
  end

  it 'creates files' do
    expect(destination_root).to have_structure {
      directory 'config' do
        file 'secrets.yml' do
          contains '  scrivito:'
          contains "    tenant: <%= ENV['SCRIVITO_TENANT'] %>"
          contains "    api_key: <%= ENV['SCRIVITO_API_KEY'] %>"
        end

        file 'application.rb' do
          contains "config.time_zone = 'Berlin'"
        end

        directory 'environments' do
          file 'production.rb' do
            contains '  config.assets.precompile += %w(editing.css editing.js)'
          end
        end

        directory 'initializers' do
          file 'scrivito.rb'
        end
      end

      directory 'cms' do
        directory 'migrate' do
          migration 'kickstart.rb'
        end
      end

      directory 'lib' do
        directory 'scrivito_kickstarter' do
          file 'cms_definitions.rb'
        end
      end

      directory 'app' do
        directory 'assets' do
          directory 'javascripts' do
            file 'application.js'
            file 'editing.js'
          end

          directory 'stylesheets' do
            file 'application.css'
            file 'editing.css'
          end
        end

        directory 'concerns' do
          file 'authentication.rb'
          file 'authorization.rb'
          file 'edit_mode_detection.rb'
          file 'exception_handling.rb'
        end

        directory 'controllers' do
          file 'application_controller.rb'
          file 'cms_controller.rb'
          file 'content_page_controller.rb'
          file 'error_page_controller.rb'
          file 'homepage_controller.rb'
          file 'login_page_controller.rb'
          file 'search_page_controller.rb'
        end

        directory 'helpers' do
          file 'application_helper.rb'
          file 'editing_helper.rb'
        end

        directory 'models' do
          file 'content_page.rb'
          file 'error_page.rb'
          file 'homepage.rb'
          file 'image.rb'
          file 'login_page.rb'
          file 'null_user.rb'
          file 'obj.rb'
          file 'root.rb'
          file 'search_page.rb'
          file 'user.rb'
          file 'video.rb'
          file 'widget.rb'
        end

        directory 'views' do
          directory 'cms' do
            file 'index.html.erb'
          end
        end
      end

      file 'Gemfile' do
        contains 'gem "dotenv-rails"'
      end

      file '.env' do
        contains 'SCRIVITO_TENANT='
        contains 'SCRIVITO_API_KEY='
      end
    }
  end
end
