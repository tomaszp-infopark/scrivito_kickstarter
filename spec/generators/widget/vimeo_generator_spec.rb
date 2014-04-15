require 'spec_helper'

require 'generator_spec/test_case'
require 'rails/generators/test_case'
require 'generators/cms/widget/vimeo/vimeo_generator.rb'

describe Cms::Generators::Widget::VimeoGenerator do
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
          directory 'vimeo_widget' do
            file 'show.html.erb'
            file 'details.html.erb'
            file 'thumbnail.html.erb'
          end
        end

        directory 'models' do
          file 'vimeo_widget.rb' do
            contains 'class VimeoWidget < Widget'
          end
        end
      end

      directory 'cms' do
        directory 'migrate' do
          migration 'vimeo_widget'
        end
      end
    }
  end
end
