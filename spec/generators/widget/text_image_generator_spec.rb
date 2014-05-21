require 'spec_helper'

require 'generator_spec/test_case'
require 'rails/generators/test_case'
require 'generators/cms/widget/text_image/text_image_generator.rb'

describe Cms::Generators::Widget::TextImageGenerator do
  include GeneratorSpec::TestCase

  destination File.expand_path('../../../../tmp/generators', __FILE__)

  before do
    prepare_destination
    run_generator
  end

  it 'creates files' do
    destination_root.should have_structure {
      directory 'app' do
        directory 'views' do
          directory 'text_image_widget' do
            file 'show.html.erb'
            file 'details.html.erb'
            file 'thumbnail.html.erb'
          end
        end

        directory 'models' do
          file 'text_image_widget.rb' do
            contains 'class TextImageWidget < Widget'
          end
        end
      end

      directory 'cms' do
        directory 'migrate' do
          migration 'text_image_widget'
        end
      end
    }
  end
end
