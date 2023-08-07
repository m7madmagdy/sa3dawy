class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :url
      t.string :image_url
      t.text :description
      t.belongs_to :source_page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
