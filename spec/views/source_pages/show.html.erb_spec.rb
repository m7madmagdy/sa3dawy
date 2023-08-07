require 'rails_helper'

RSpec.describe "source_pages/show", type: :view do
  before(:each) do
    assign(:source_page, SourcePage.create!(
      name: "Name",
      url: "Url",
      source: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(//)
  end
end
