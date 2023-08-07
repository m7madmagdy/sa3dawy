require 'rails_helper'

RSpec.describe "source_pages/edit", type: :view do
  let(:source_page) {
    SourcePage.create!(
      name: "MyString",
      url: "MyString",
      source: nil
    )
  }

  before(:each) do
    assign(:source_page, source_page)
  end

  it "renders the edit source_page form" do
    render

    assert_select "form[action=?][method=?]", source_page_path(source_page), "post" do

      assert_select "input[name=?]", "source_page[name]"

      assert_select "input[name=?]", "source_page[url]"

      assert_select "input[name=?]", "source_page[source_id]"
    end
  end
end
