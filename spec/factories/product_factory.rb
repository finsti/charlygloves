FactoryBot.define do

  sequence (:name) { |n| "Glove #{n}" }

  factory :product do
    name
  end
  
end
