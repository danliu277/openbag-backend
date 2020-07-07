class CreateGame < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :genre
      t.decimal :sales_price
      t.decimal :vendor_cost
      t.integer :stock
      
      t.timestamps
    end
  end
end
