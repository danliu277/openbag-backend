class CreatePurchaseorder < ActiveRecord::Migration[6.0]
  def change
    create_table :purchaseorders do |t|
      t.integer :game_id
      t.integer :employee_id
      t.integer :vendor_id
      t.integer :quantity
      t.decimal :cost
      
      t.timestamps
    end
  end
end
