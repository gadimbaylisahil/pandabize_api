class CreateSingleOptionValues < ActiveRecord::Migration[5.2]
  def change
    create_table :single_option_values do |t|
      t.references :option_value, index: true, foreign_key: true, null: false
      t.references :variant, index: true, foreign_key: true, null: false
    end
  end
end
