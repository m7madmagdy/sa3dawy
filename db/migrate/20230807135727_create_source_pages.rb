class CreateSourcePages < ActiveRecord::Migration[7.0]
  def change
    create_table :source_pages do |t|
      t.string :name
      t.string :url
      t.belongs_to :source, null: false, foreign_key: true

      t.timestamps
    end
  end
end
