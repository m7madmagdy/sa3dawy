require 'rails_helper'

RSpec.describe "source_pages/index", type: :view do
  before(:each) do
    assign(:source_pages, [
      SourcePage.create!(
        name: "Name",
        url: "Url",
        source: nil
      ),
      SourcePage.create!(
        name: "Name",
        url: "Url",
        source: nil
      )
    ])
  end

  it "renders a list of source_pages" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Url".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
