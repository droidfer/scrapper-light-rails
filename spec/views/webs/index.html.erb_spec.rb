require 'rails_helper'

RSpec.describe "webs/index", type: :view do
  before(:each) do
    assign(:webs, [
      Web.create!(
        name: "Name",
        url: "Url",
        total: 2
      ),
      Web.create!(
        name: "Name",
        url: "Url",
        total: 2
      )
    ])
  end

  it "renders a list of webs" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Url".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
