require 'spec_helper'

require 'generator_spec/test_case'
require 'generators/cms/widget/maps/google_maps/google_maps_generator.rb'

describe Cms::Generators::Widget::Maps::GoogleMapsGenerator do
  include GeneratorSpec::TestCase

  destination File.expand_path('../../../../tmp/generators', __FILE__)

  before do
    prepare_destination
    prepare_environments
    run_generator
  end

  def prepare_environments
    paths = {
      layout: "#{destination_root}/app/views/layouts",
    }

    paths.each do |_, path|
      mkdir_p(path)
    end

    File.open("#{paths[:layout]}/application.html.erb", 'w') { |f| f.write("    <%= javascript_include_tag('application') %>\n") }
  end

  it 'creates files' do
    destination_root.should have_structure {
      directory 'app' do
        directory 'assets' do
          directory 'stylesheets' do
            directory 'application' do
              file 'google_maps_widget.css'
            end

            directory 'editing' do
              file 'google_maps_widget.css'
            end
          end

          directory 'javascripts' do
            directory 'application' do
              file 'google_maps_widget.js.coffee'
            end

            directory 'editing' do
              file 'google_maps_widget.js.coffee'
            end
          end
        end

        directory 'views' do
          directory 'google_maps_widget' do
            no_file 'details.html.erb'
            file 'show.html.erb'
            file 'thumbnail.html.erb'
          end

          directory 'layouts' do
            file 'application.html.erb' do
                contains "    <%= javascript_include_tag('//maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places') %>"
            end
          end
        end

        directory 'models' do
          file 'google_maps_widget.rb' do
            contains 'class GoogleMapsWidget < Widget'
          end
        end
      end

      directory 'cms' do
        directory 'migrate' do
          migration 'google_maps_widget'
        end
      end
    }
  end
end
