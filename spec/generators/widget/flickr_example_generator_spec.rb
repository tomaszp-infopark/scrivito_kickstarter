require 'spec_helper'

require 'generator_spec/test_case'
require 'rails/generators/test_case'
require 'generators/cms/widget/flickr/example/example_generator.rb'

describe Cms::Generators::Widget::Flickr::ExampleGenerator do
  include GeneratorSpec::TestCase

  destination File.expand_path('../../../../tmp/generators', __FILE__)

  before do
    prepare_destination
    run_generator
  end

  it 'creates files' do
    destination_root.should have_structure {
      directory 'cms' do
        directory 'migrate' do
          migration 'flickr_widget_example'
        end
      end
    }
  end
end
