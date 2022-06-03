FactoryBot.define do
  factory :order_deliverie do
    postal_code    { '123-4567'}
    prefecture_id  { Faker::Number.between(from: 2, to: 48)}
    citys          { '中央区'}
    address        { '中央1-5'}
    building_name  { 'スカイタワー'}
    phone          { '01012345678'}
  end
end
