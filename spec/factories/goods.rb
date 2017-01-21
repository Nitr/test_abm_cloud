FactoryGirl.define do
  factory :good do
    sequence(:sku) { |n| "sku#{n}"}
    supplier
    sequence(:field1)
    sequence(:field2)
    sequence(:field3)
    sequence(:field4)
    sequence(:field5)
    price 10.0
  end
end
