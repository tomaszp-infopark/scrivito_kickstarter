module ScrivitoKickstarter
  class Engine < ::Rails::Engine
    isolate_namespace ScrivitoKickstarter

    config.generators do |generator|
      generator.test_framework :rspec, fixture: false
    end
  end
end
