FactoryBot.define do

  factory :address do
    first_name            {"苗字"}
    last_name             {"名前"}
    first_name_kana       {"みょうじ"}
    last_name_kana        {"なまえ"}
    postal_code           {"00000000"}
    prefectures           {"東京都"}
    municipality          {"abc市"}
    house_number          {"abc番地"}
    apartment_name        {"abc"}
    call_number           {"0000000000"}
  end

end