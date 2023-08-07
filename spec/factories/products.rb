FactoryBot.define do
  factory :product do
    name { "MyString" }
    price { "9.99" }
    url { "MyString" }
    image_url { "MyString" }
    description { "MyText" }
    source_page { nil }
  end
end
