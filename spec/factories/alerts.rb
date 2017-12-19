FactoryGirl.define do
  factory :alert do
    reference_id { 1 }
    delay { 20 }
    description { 'Not yet completed' }
  end
end
