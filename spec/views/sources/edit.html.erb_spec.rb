require 'rails_helper'

RSpec.describe "sources/edit", type: :view do
  let(:source) {
    Source.create!(
      name: "MyString",
      url: "MyString"
    )
  }

  before(:each) do
    assign(:source, source)
  end

  it "renders the edit source form" do
    render

    assert_select "form[action=?][method=?]", source_path(source), "post" do

      assert_select "input[name=?]", "source[name]"

      assert_select "input[name=?]", "source[url]"
    end
  end
end
