require 'spec_helper'

require 'generator_spec/test_case'
require 'rails/generators/test_case'
require 'generators/cms/widget/accordion/accordion_generator.rb'

describe Cms::Generators::Widget::AccordionGenerator do
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
    destination_root.should have_structure {
      directory 'app' do
        directory 'assets' do
          directory 'javascripts' do
            directory 'editing' do
              file 'accordion_widget.js.coffee'
            end
          end
        end

        directory 'views' do
          directory 'accordion_widget' do
            file 'show.html.haml'
            file 'thumbnail.html.haml'
            no_file 'details.html.haml'
          end

          directory 'accordion_panel_widget' do
            file 'show.html.haml'
            file 'thumbnail.html.haml'
            file 'details.html.haml'
          end
        end

        directory 'models' do
          file 'accordion_widget.rb' do
            contains 'class AccordionWidget < Widget'
          end

          file 'accordion_panel_widget.rb' do
            contains 'class AccordionPanelWidget < Widget'
          end
        end
      end

      directory 'cms' do
        directory 'migrate' do
          migration 'accordion_widget'
        end
      end
    }
  end
end
