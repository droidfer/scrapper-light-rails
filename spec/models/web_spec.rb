require 'rails_helper'

RSpec.describe Web, type: :model do
  
  it 'valid web' do
    expect(FactoryBot.build(:web)).to be_valid
  end

  it 'Invalid web with nil url' do
    web_nil = FactoryBot.build(:web, url: nil)
    expect(web_nil).to_not be_valid
  end

  it 'Invalid web with wrong url format' do
    web_nil = FactoryBot.build(:web, url: 'www.google.com') #a valid URL will be including http:// to that string
    expect(web_nil).to_not be_valid
  end

  it 'display_name on process is the url' do
    web = FactoryBot.build(:web)
    expect(web.display_name).to eq(web.url)
  end

  it 'display_name on finished_at is the name' do
    web = FactoryBot.build(:web, finished_at: DateTime.now.to_date)
    expect(web.display_name).to eq(web.name)
  end

  it 'display_name on finished_at with nil name is No Title: URL' do
    web = FactoryBot.build(:web, finished_at: DateTime.now.to_date, name: nil)
    expect(web.display_name).to eq("No Title: #{web.url}")
  end

  it 'display_total on process is in progress' do
    web = FactoryBot.build(:web)
    expect(web.display_total).to eq("in progress")
  end

  it 'display_total status fail is error' do
    web = FactoryBot.build(:web, status: 2, finished_at: DateTime.now.to_date)
    expect(web.display_total).to eq("error")
  end

  it 'display_total status success is total' do
    web = FactoryBot.build(:web, status: 1, finished_at: DateTime.now.to_date, total: 5)
    expect(web.display_total).to eq(web.total)
  end

end
