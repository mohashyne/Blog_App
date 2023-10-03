FactoryBot.define do
  factory :comment do
    body { 'Sample comment body' }
    association :author, factory: :user # Assuming :user is the name of your user factory
    association :post
  end
end
