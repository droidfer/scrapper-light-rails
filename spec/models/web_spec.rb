require 'rails_helper'

RSpec.describe Web, type: :model do
  
  it 'valid web' do
    expect(FactoryBot.build(:web)).to be_valid
  end

  it 'Invalid web with nil url' do
    company_min = FactoryBot.build(:web, url: nil)
    expect(company_min).to_not be_valid
  end

end
