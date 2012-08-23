require 'refinerycms-core'

module Refinery
  autoload :InventoriesGenerator, 'generators/refinery/inventories_generator'

  module Inventories
    require 'refinery/inventories/engine'
    autoload :Tab, 'refinery/inventories/tabs'

    class << self
      attr_writer :root
      attr_writer :tabs

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def tabs
        @tabs ||= []
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end

