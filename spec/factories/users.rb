FactoryBot.define do
  gimei = Gimei.name
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name { Gimei.last.kanji }
    first_name { Gimei.first.kanji }
    furigana_family_name { Gimei.last.katakana }
    furigana_first_name { Gimei.first.katakana }
    birthdate { Faker::Date.backward }
  end
end
