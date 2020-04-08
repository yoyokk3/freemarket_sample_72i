FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"苗字"}
    last_name             {"名前"}
    first_name_kana       {"みょうじ"}
    last_name_kana        {"なまえ"}
    birthday_year         {"0000"}
    birthday_manth        {"0"}
    birthday_day          {"0"}
  end

end