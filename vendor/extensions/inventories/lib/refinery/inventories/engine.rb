module Refinery
  module Inventories
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Inventories

      engine_name :refinery_inventories

      initializer "register refinerycms_inventories plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "inventories"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.inventories_admin_inventories_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/inventories/inventory'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Inventories)
      end
    end
  end
end
