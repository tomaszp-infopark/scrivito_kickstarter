require 'rails_helper'

require 'generator_spec/test_case'
require 'rails/generators/test_case'
require 'generators/cms/widget/image/image_generator.rb'

describe Cms::Generators::Widget::ImageGenerator do
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
              file 'image_widget.css'
            end
          end
        end

        directory 'views' do
          directory 'image_widget' do
            file 'show.html.erb'
            file 'details.html.erb'
            file 'thumbnail.html.erb'
          end
        end

        directory 'models' do
          file 'image_widget.rb' do
            contains 'class ImageWidget < Widget'
          end
        end
      end

      directory 'cms' do
        directory 'migrate' do
          migration 'image_widget'
        end
      end
    }
  end
end
