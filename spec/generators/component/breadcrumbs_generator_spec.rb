require 'rails_helper'

require 'generator_spec/test_case'
require 'generators/cms/component/breadcrumbs/breadcrumbs_generator'

describe Cms::Generators::Component::BreadcrumbsGenerator do
  include GeneratorSpec::TestCase

  destination File.expand_path('../../../../tmp/generators', __FILE__)

  before do
    prepare_destination
    prepare_environments
    run_generator
  end

  def prepare_environments
    paths = {
      layout_path: "#{destination_root}/app/views/layouts",
      models_path: "#{destination_root}/app/models",
    }

    paths.each do |_, path|
      mkdir_p(path)
    end

    File.open("#{paths[:layout_path]}/application.html.erb", 'w') { |f| f.write("      <div class=\"content\">\n") }
    File.open("#{paths[:models_path]}/obj.rb", 'w') { |f| f.write("class Obj\nend") }
  end

  it 'create files' do
    expect(destination_root).to have_structure {
      directory 'app' do
        directory 'models' do
          file 'obj.rb' do
            contains '  def show_breadcrumbs?'
            contains '  def breadcrumbs'
          end
        end

        directory 'views' do
          directory 'layouts' do
            file '_breadcrumbs.html.erb'

            file 'application.html.erb' do
              contains "            <%= render('layouts/breadcrumbs', page: @obj) %>"
            end
          end
        end
      end
    }
  end
end
