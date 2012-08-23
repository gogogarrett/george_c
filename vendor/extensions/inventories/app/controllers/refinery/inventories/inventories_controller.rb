module Refinery
  module Inventories
    class InventoriesController < ::ApplicationController

      before_filter :find_all_inventories
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @inventory in the line below:
        present(@page)
      end

      def show
        @inventory = Inventory.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @inventory in the line below:
        present(@page)
      end

    protected

      def find_all_inventories
        @inventories = Inventory.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/inventories").first
      end

    end
  end
end
