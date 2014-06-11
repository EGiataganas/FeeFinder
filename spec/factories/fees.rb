# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :name do |n|
    "FeeTest#{n}"
  end

  factory :fee do
    name
    amount 1233
  end
end