class CreateVendor < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :address
      t.string :email
      
      t.timestamps
    end
  end
end
