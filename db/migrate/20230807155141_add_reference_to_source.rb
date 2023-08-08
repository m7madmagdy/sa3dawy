class AddReferenceToSource < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :source, null: false, foreign_key: true
  end
end
