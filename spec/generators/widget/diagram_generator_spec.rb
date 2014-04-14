require 'spec_helper'

require 'generator_spec/test_case'
require 'rails/generators/test_case'
require 'generators/cms/widget/diagram/diagram_generator.rb'

describe Cms::Generators::Widget::DiagramGenerator do
  include GeneratorSpec::TestCase

  destination File.expand_path('../../../../tmp/generators', __FILE__)

  before do
    prepare_destination
    run_generator
  end

  it 'creates files' do
    destination_root.should have_structure {
      directory 'app' do
        directory 'assets' do
          directory 'stylesheets' do
            directory 'application' do
              file 'diagram.css'
            end

            directory 'editing' do
              directory 'editors' do
                file 'diagram_editor.css'
              end
            end
          end

          directory 'javascripts' do
            directory 'application' do
              file 'diagram.js.coffee'
            end

            directory 'editing' do
              directory 'editors' do
                file 'diagram_editor.js.coffee'
              end
            end
          end
        end

        directory 'models' do
          file 'diagram_widget.rb' do
            contains 'class DiagramWidget < Widget'
          end
        end

        directory 'views' do
          directory 'diagram_widget' do
            file 'show.html.erb'
            file 'details.html.erb'
            file 'thumbnail.html.erb'
          end
        end
      end

      directory 'cms' do
        directory 'migrate' do
          migration 'diagram_widget'
        end
      end
    }
  end
end
