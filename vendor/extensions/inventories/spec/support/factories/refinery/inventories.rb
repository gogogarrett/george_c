
FactoryGirl.define do
  factory :inventory, :class => Refinery::Inventories::Inventory do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

