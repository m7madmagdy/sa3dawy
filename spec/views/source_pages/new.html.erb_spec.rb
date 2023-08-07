require 'rails_helper'

RSpec.describe "source_pages/new", type: :view do
  before(:each) do
    assign(:source_page, SourcePage.new(
      name: "MyString",
      url: "MyString",
      source: nil
    ))
  end

  it "renders new source_page form" do
    render

    assert_select "form[action=?][method=?]", source_pages_path, "post" do

      assert_select "input[name=?]", "source_page[name]"

      assert_select "input[name=?]", "source_page[url]"

      assert_select "input[name=?]", "source_page[source_id]"
    end
  end
end
