FactoryBot.define do
  factory :note do
    title { "MyString" }
    body { "MyText" }
    user { nil }
  end
end
