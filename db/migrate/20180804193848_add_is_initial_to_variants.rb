class AddIsInitialToVariants < ActiveRecord::Migration[5.2]
  def change
    add_column :variants, :is_initial, :boolean, default: false, null: false
  end
end
