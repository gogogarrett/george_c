require 'refinerycms-core'

module Refinery
  autoload :GalleriesGenerator, 'generators/refinery/galleries_generator'

  module Galleries
    require 'refinery/galleries/engine'
    autoload :Tab, 'refinery/galleries/tabs'

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
