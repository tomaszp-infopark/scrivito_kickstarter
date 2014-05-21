require 'spec_helper'

require 'generator_spec/test_case'
require 'rails/generators/test_case'
require 'generators/cms/widget/text/text_generator.rb'

describe Cms::Generators::Widget::TextGenerator do
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
          directory 'text_widget' do
            file 'show.html.erb'
            no_file 'details.html.erb'
            file 'thumbnail.html.erb'
          end
        end

        directory 'models' do
          file 'text_widget.rb' do
            contains 'class TextWidget < Widget'
          end
        end
      end

      directory 'cms' do
        directory 'migrate' do
          migration 'text_widget'
        end
      end
    }
  end
end
