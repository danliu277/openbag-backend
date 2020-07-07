class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.integer :customer_id
      t.integer :game_id
      t.integer :employee_id
      t.integer :quantity
    end
  end
end
