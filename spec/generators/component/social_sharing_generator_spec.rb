require 'rails_helper'

require 'generator_spec/test_case'
require 'generators/cms/component/social_sharing/social_sharing_generator.rb'

describe Cms::Generators::Component::SocialSharingGenerator do
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
    expect(destination_root).to have_structure {
      directory 'app' do
        directory 'views' do
          directory 'layouts' do
            file '_social_sharing.html.erb'

            directory 'social_sharing' do
              file '_facebook.html.erb'
              file '_google.html.erb'
              file '_linkedin.html.erb'
              file '_twitter.html.erb'
            end
          end
        end
      end
    }
  end
end
