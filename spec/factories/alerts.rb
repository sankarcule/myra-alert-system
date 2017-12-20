FactoryGirl.define do
  factory :alert do
    reference_id { Faker::Team.name }
    delay { 60 }
    description { 'Not yet completed' }
  end
end
