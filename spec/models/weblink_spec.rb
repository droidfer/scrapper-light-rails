require 'rails_helper'

RSpec.describe Weblink, type: :model do
  it 'valid weblink' do
    expect(FactoryBot.build(:weblink)).to be_valid
  end
end
