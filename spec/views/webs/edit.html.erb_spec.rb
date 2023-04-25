require 'rails_helper'

RSpec.describe "webs/edit", type: :view do
  let(:web) {
    Web.create!(
      name: "MyString",
      url: "MyString",
      total: 1
    )
  }

  before(:each) do
    assign(:web, web)
  end

  it "renders the edit web form" do
    render

    assert_select "form[action=?][method=?]", web_path(web), "post" do

      assert_select "input[name=?]", "web[name]"

      assert_select "input[name=?]", "web[url]"

      assert_select "input[name=?]", "web[total]"
    end
  end
end
