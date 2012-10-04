module Refinery
  module Inventories
    class Inventory < Refinery::Core::BaseModel
      self.table_name = 'refinery_inventories'

      attr_accessible :title, :description, :details, :price, :address, :image_id, :positionm

      acts_as_indexed :fields => [:title, :description, :details, :price, :address]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :image, :class_name => '::Refinery::Image'
    end
  end
end
