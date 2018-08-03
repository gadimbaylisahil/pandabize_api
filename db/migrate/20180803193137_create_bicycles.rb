class CreateBicycles < ActiveRecord::Migration[5.2]
  def change
    create_table :bicycles do |t|
      t.text :name, null: false
      t.text :description, null: false
	    t.timestamps
    end
  end
end
