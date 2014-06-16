require 'rake'
require 'rake/tasklib'

require 'scrivito_kickstarter/rake/cms_client'

module ScrivitoKickstarter
  module Rake
    class IntegrationTask < ::Rake::TaskLib
      def initialize
        namespace :test do
          task reset: :dotenv do
            reset_cms
          end

          desc 'Run Kickstarter Integration Tests'
          task integration: :dotenv do
            create_application
            create_configuration_files

            cd(app_path) do
              Bundler.with_clean_env do
                Dotenv.load

                bundle
                call_generators
                reset_cms
                migrate
                publish
              end
            end
          end

          task app: :dotenv do
            create_application
            create_configuration_files

            cd(app_path) do
              Bundler.with_clean_env do
                Dotenv.load

                bundle
                call_generators
              end
            end
          end
        end
      end

      private

      def create_application
        rm_rf(app_path)

        sh("rails new #{app_path} --skip-test-unit --skip-active-record --skip-bundle --template lib/scrivito_kickstarter/rake/template.rb")
      end

      def create_configuration_files
        path = File.join(app_path, '.env')
        File.open(path, 'w') do |file|
          file.write("SCRIVITO_TENANT=#{ENV['SCRIVITO_TENANT']}\n")
          file.write("SCRIVITO_API_KEY=#{ENV['SCRIVITO_API_KEY']}\n")
        end
      end

      def bundle
        sh('bundle --quiet')
      end

      def reset_cms
        CmsClient.new.reset_cms
      end

      def call_generators
        generators = [
          'cms:kickstart --examples',
          'cms:component:redirect',
          'cms:component:deployment --provider=opsworks',
          'cms:component:social_sharing',
          'cms:component:breadcrumbs',
          'cms:widget:accordion',
          'cms:widget:video',
          'cms:widget:youtube',
          'cms:widget:vimeo',
          'cms:widget:diagram',
          'cms:widget:flickr',
          'cms:widget:slider',
          'cms:widget:slideshare',
          'cms:widget:text_image',
          'cms:widget:iframe',
        ]
        generators.each do |generator|
          sh("rails generate #{generator}")
        end
      end

      def migrate
        sh('bundle exec rake cms:migrate')
      end

      def publish
        sh('bundle exec rake cms:migrate:publish')
      end

      def app_path
        File.expand_path('../../../../tmp/test_app', __FILE__)
      end
    end
  end
end
