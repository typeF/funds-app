FactoryBot.define do
  factory :stock do
    symbol { Faker::Currency.code }
    function { Faker::Color.color_name }
    data { Faker::Json.shallow_json(width: 3, options: { key: 'Date.in_date_period', value: 'Number.decimal(l_digits:3, r_digits: 2)'}) }
  end
end