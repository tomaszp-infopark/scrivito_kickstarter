require 'spec_helper'

require 'generator_spec/test_case'
require 'generators/cms/component/blog/blog_generator'

describe Cms::Generators::Component::BlogGenerator do
  include GeneratorSpec::TestCase

  destination File.expand_path('../../../../tmp/generators', __FILE__)

  before do
    prepare_destination
    prepare_environments
    run_generator
  end

  def prepare_environments
    paths = {
      layout: "#{destination_root}/app/views/layouts",
      javascripts: "#{destination_root}/app/assets/javascripts",
    }

    paths.each do |_, path|
      mkdir_p(path)
    end

    File.open("#{destination_root}/Gemfile", 'w')
    File.open("#{paths[:layout]}/application.html.erb", 'w') { |f| f.write("<link href=\"/favicon.ico\" rel=\"shortcut icon\" />\n") }
    File.open("#{paths[:javascripts]}/editing.js", 'w') { |file| file.write("\n//= require_self") }
  end

  it 'create files' do
    destination_root.should have_structure {
      directory 'app' do
        directory 'models' do
          file 'blog.rb' do
            contains 'class Blog < Obj'
          end

          file 'blog_post.rb' do
            contains 'class BlogPost < Obj'
          end
        end

        directory 'views' do
          directory 'blog' do
            file 'index.html.erb'
            file 'details.html.erb'
            file 'thumbnail.html.erb'
            file 'index.atom.builder'
            file '_comment_count.html.erb'
            file '_discovery.html.erb'
            file '_latest_blog_posts.html.erb'
            file '_pagination.html.erb'
            file '_post.html.erb'
            file '_short_post.html.erb'
            file '_useful_links.html.erb'
          end

          directory 'blog_post' do
            file 'index.html.erb'
            file 'details.html.erb'
            file '_comments.html.erb'
            file '_gravatar.html.erb'
            file '_main_content.html.erb'
            file '_pagination.html.erb'
            file '_published_at.html.erb'
            file '_published_by.html.erb'
            no_file 'thumbnail.html.erb'
          end

          directory 'layouts' do
            file 'application.html.erb' do
              contains "    <%= render('blog/discovery', page: @obj) %>"
            end
          end
        end

        directory 'controllers' do
          file 'blog_controller.rb'
          file 'blog_post_controller.rb'
        end

        directory 'assets' do
          directory 'images' do
            file 'feed-icon.svg'
          end

          directory 'javascripts' do
            directory 'editing' do
              file 'blog.js.coffee'
            end
          end
        end
      end

      file 'Gemfile' do
        contains 'gem "gravatar_image_tag"'
        contains 'gem "momentjs-rails"'
      end

      directory 'cms' do
        directory 'migrate' do
          migration 'blog.rb'
        end
      end
    }
  end
end
