module Refinery
  module Processes
    class Process < Refinery::Core::BaseModel
      self.table_name = 'refinery_processes'

      attr_accessible :title, :description, :photo_id, :position

      acts_as_indexed :fields => [:title, :description]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
