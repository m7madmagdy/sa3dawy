require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      name: "MyString",
      price: "9.99",
      url: "MyString",
      image_url: "MyString",
      description: "MyText",
      source_page: nil
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[url]"

      assert_select "input[name=?]", "product[image_url]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[source_page_id]"
    end
  end
end
