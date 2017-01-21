FactoryGirl.define do
  factory :supplier do
    sequence(:code) { |n| "s#{n}" }
    sequence(:name) { |n| "Supplier_#{n}"}
  end
end
