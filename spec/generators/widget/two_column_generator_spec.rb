require 'spec_helper'

require 'generator_spec/test_case'
require 'generators/cms/widget/two_column/two_column_generator.rb'

describe Cms::Generators::Widget::TwoColumnGenerator do
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
          directory 'two_column_widget' do
            file 'show.html.erb'
            file 'details.html.erb'
            file 'thumbnail.html.erb' do
              contains 'editing-icon-2cols'
            end
          end
        end

        directory 'models' do
          file 'two_column_widget.rb' do
            contains 'class TwoColumnWidget < Widget'
          end
        end
      end

      directory 'cms' do
        directory 'migrate' do
          migration 'two_column_widget'
        end
      end
    }
  end
end
