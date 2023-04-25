require 'rails_helper'

RSpec.describe Weblink, type: :model do
  it 'valid weblink' do
    expect(FactoryBot.build(:weblink)).to be_valid
  end

  it 'display_name on nil name is No Name: URL' do
    weblink = FactoryBot.build(:weblink, name: nil)
    expect(weblink.display_name).to eq("No Name: #{weblink.url}")
  end

  it 'display_name on nil name is nameL' do
    weblink = FactoryBot.build(:weblink)
    expect(weblink.display_name).to eq("#{weblink.name}")
  end
  
end
