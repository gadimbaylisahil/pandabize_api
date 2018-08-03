class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.string :sku
      t.integer :price_cents, default: 0, null: false
      t.references :bicycle, index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
