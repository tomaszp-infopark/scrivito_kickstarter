require 'rails_helper'

require 'generator_spec/test_case'
require 'rails/generators/test_case'
require 'generators/cms/widget/slideshare/slideshare_generator.rb'

describe Cms::Generators::Widget::SlideshareGenerator do
  include GeneratorSpec::TestCase

  destination File.expand_path('../../../../tmp/generators', __FILE__)

  before do
    prepare_destination
    run_generator
  end

  it 'creates files' do
    expect(destination_root).to have_structure {
      directory 'app' do
        directory 'views' do
          directory 'slideshare_widget' do
            file 'show.html.erb'
            file 'details.html.erb'
            file 'thumbnail.html.erb'
          end
        end

        directory 'models' do
          file 'slideshare_widget.rb' do
            contains 'class SlideshareWidget < Widget'
          end
        end
      end

      directory 'cms' do
        directory 'migrate' do
          migration 'slideshare_widget'
        end
      end
    }
  end
end
