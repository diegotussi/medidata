FactoryBot.define do
  factory :glucose_measure do
    value { 1.5 }
    date { "2018-10-26 17:44:36" }
    fasting { false }
    profile { nil }
  end
end
