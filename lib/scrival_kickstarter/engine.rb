module ScrivalKickstarter
  class Engine < ::Rails::Engine
    isolate_namespace ScrivalKickstarter

    config.generators do |generator|
      generator.test_framework :rspec, fixture: false
    end
  end
end
