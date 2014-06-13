require 'rails_helper'

require 'generator_spec/test_case'
require 'rails/generators/test_case'
require 'generators/cms/widget/iframe/iframe_generator.rb'

describe Cms::Generators::Widget::IframeGenerator do
  include GeneratorSpec::TestCase

  destination File.expand_path('../../../../tmp/generators', __FILE__)

  before do
    prepare_destination
    prepare_environments
    run_generator
  end

  def prepare_environments
  end

  it 'creates files' do
    expect(destination_root).to have_structure {
      directory 'app' do
        directory 'assets' do
          directory 'stylesheets' do
            directory 'application' do
              file 'iframe_widget.css'
            end
          end

          directory 'javascripts' do
            directory 'editing' do
              file 'iframe_widget.js.coffee'
            end
          end
        end

        directory 'views' do
          directory 'iframe_widget' do
            file 'show.html.erb'
            file 'details.html.erb'
            file 'thumbnail.html.erb'
          end
        end

        directory 'models' do
          file 'iframe_widget.rb' do
            contains 'class IframeWidget < Widget'
          end
        end
      end

      directory 'cms' do
        directory 'migrate' do
          migration 'create_iframe_widget'
        end
      end
    }
  end
end
