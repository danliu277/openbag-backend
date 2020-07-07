class CreateEmployee < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.string :adress
      t.string :email
      
      t.timestamps
    end
  end
end
