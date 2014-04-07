require 'rake'
require 'rake/tasklib'
require 'yaml'

module ScrivalKickstarter
  module Rake
    class TravisTask < ::Rake::TaskLib
      def initialize
        desc 'Turn configuration variables into travis secure environment variables'

        task :travis_encrypt do
          travis_encrypt
        end

        task travis: ['spec', 'test:integration']
      end

      private

      def travis_encrypt
        if %x{which travis}.empty?
          puts 'Please make sure to install the travis command line client with
            `gem install travis` and then run the rake task again.'

          return
        end

        configuration = {
          'SCRIVAL_TENANT' => scrival_config['tenant'],
          'SCRIVAL_API_KEY' => scrival_config['api_key'],
        }

        contributor = %x(whoami).strip

        puts "Please add the following to your .travis.yml file:\n\n"
        puts "# #{contributor}'s credentials"

        Bundler.with_clean_env do
          configuration.map do |key, value|
            token = %x{travis encrypt #{key}=#{value}}

            puts "- secure: #{token}"
          end
        end
      end

      def scrival_config
        YAML.load_file('config/scrival.yml')
      end
    end
  end
end
