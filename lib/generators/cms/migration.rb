module Cms
  module Generators
    module Migration
      def self.included(base)
        base.send(:include, ::Rails::Generators::Migration)
        base.send(:extend, ClassMethods)
      end

      module ClassMethods
        def next_migration_number(dirname)
          max = current_migration_number(Rails.root + 'cms/migrate').to_i
          timestamp = [Time.now.utc.strftime("%Y%m%d%H%M%S"), "%.14d"].max.to_i

          while max >= timestamp do
            timestamp += 1
          end

          timestamp
        end
      end
    end
  end
end
