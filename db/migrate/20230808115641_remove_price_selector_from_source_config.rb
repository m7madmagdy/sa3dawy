class RemovePriceSelectorFromSourceConfig < ActiveRecord::Migration[7.0]
  def change
    remove_column :source_configs, :price_selector, :string
  end
end
