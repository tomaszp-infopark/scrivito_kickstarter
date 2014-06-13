require 'rails_helper'

require 'generator_spec/test_case'
require 'generators/cms/widget/three_column/three_column_generator.rb'

describe Cms::Generators::Widget::ThreeColumnGenerator do
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
          directory 'three_column_widget' do
            file 'show.html.erb'
            file 'details.html.erb'
            file 'thumbnail.html.erb' do
              contains 'editing-icon-3cols'
            end
          end
        end

        directory 'models' do
          file 'three_column_widget.rb' do
            contains 'class ThreeColumnWidget < Widget'
          end
        end
      end

      directory 'cms' do
        directory 'migrate' do
          migration 'three_column_widget'
        end
      end
    }
  end
end
