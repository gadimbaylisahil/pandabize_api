class CreateOptionValues < ActiveRecord::Migration[5.2]
  def change
    create_table :option_values do |t|
      t.string :name, null: false
      t.references :option, index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
