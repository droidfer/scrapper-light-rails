require 'rails_helper'

RSpec.describe "webs/new", type: :view do
  before(:each) do
    assign(:web, Web.new(
      name: "MyString",
      url: "MyString",
      total: 1
    ))
  end

  it "renders new web form" do
    render

    assert_select "form[action=?][method=?]", webs_path, "post" do

      assert_select "input[name=?]", "web[name]"

      assert_select "input[name=?]", "web[url]"

      assert_select "input[name=?]", "web[total]"
    end
  end
end
