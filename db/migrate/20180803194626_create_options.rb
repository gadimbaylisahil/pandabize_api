class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string :name, null: false
      t.references :bicycle, index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
