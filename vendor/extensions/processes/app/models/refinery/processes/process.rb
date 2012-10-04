module Refinery
  module Processes
    class Process < Refinery::Core::BaseModel
      self.table_name = 'refinery_processes'

      attr_accessible :title, :description, :photo_id, :position

      acts_as_indexed :fields => [:title, :description]

      validates :title, :presence => true, :uniqueness => true
      validates_length_of :description, :minimum => 5, :maximum => 500, :allow_blank => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
