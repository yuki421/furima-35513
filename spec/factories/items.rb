FactoryBot.define do
  factory :item do
    item_name           {Faker::Lorem.words}
    description         {Faker::Lorem.sentence}
    category_id         {1}
    item_status_id      {1}
    delivery_charge_id  {1}  
    delivery_day_id     {1}
    prefecture_id       {1}
    price               {1000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test_code.png'), filename: 'test_code.png')
    end
  end
end
