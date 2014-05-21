module ScrivitoKickstarter
  module Rake
    ConfigurationHelper = Struct.new(:target_path) do
      def copy
        config_path = File.expand_path('../../../../config', __FILE__)
        file_name = 'scrivito.yml'
        source_path = File.join(config_path, file_name)

        if File.exist?(source_path)
          FileUtils.cp(source_path, target_path)
        end
      end
    end
  end
end
