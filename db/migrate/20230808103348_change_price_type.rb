class ChangePriceType < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :price, :string
  end
end
