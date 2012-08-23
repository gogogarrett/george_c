module Refinery
  module Inventories
    module Admin
      class InventoriesController < ::Refinery::AdminController

        crudify :'refinery/inventories/inventory', :xhr_paging => true

      end
    end
  end
end
