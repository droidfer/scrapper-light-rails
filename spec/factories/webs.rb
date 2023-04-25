FactoryBot.define do
  factory :web do
    name { "Web_#{SecureRandom.alphanumeric}" } # For uniqueness, create random web name
    url { "http://web#{SecureRandom.alphanumeric}.com" } # For uniqueness, create random web url
  end
end