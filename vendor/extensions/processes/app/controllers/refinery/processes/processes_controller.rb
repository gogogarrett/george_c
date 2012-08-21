module Refinery
  module Processes
    class ProcessesController < ::ApplicationController

      before_filter :find_all_processes
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @process in the line below:
        present(@page)
      end

      def show
        @process = Process.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @process in the line below:
        present(@page)
      end

    protected

      def find_all_processes
        @processes = Process.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/processes").first
      end

    end
  end
end
