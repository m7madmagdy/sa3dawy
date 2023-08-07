require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  let(:product) {
    Product.create!(
      name: "MyString",
      price: "9.99",
      url: "MyString",
      image_url: "MyString",
      description: "MyText",
      source_page: nil
    )
  }

  before(:each) do
    assign(:product, product)
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(product), "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[url]"

      assert_select "input[name=?]", "product[image_url]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[source_page_id]"
    end
  end
end
