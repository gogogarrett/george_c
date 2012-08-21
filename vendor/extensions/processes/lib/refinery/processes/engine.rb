module Refinery
  module Processes
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Processes

      engine_name :refinery_processes

      initializer "register refinerycms_processes plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "processes"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.processes_admin_processes_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/processes/process'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Processes)
      end
    end
  end
end
