FactoryBot.define do
  factory :weblink do
    name { "weblink_#{SecureRandom.alphanumeric}" } # For uniqueness, create random web name
    url { "http://weblink#{SecureRandom.alphanumeric}.com" } # For uniqueness, create random web url
    web
  end
end