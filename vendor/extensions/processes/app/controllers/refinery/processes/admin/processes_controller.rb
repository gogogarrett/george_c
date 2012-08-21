module Refinery
  module Processes
    module Admin
      class ProcessesController < ::Refinery::AdminController

        crudify :'refinery/processes/process', :xhr_paging => true

      end
    end
  end
end
