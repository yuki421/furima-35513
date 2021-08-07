FactoryBot.define do
  factory :order_address do
    prefecture_id       {1}
    city                {"東京都千代田区"}
    street_number       {"千代田1-1-1"}
    building            {"柳ビル101"}
    postal_code         {"110-0011"}
    phone               {"09012123434"}
    token               {"tok_abcdefghijk00000000000000000"}
  end
end

