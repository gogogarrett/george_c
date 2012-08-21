
FactoryGirl.define do
  factory :process, :class => Refinery::Processes::Process do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

