class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.string :name
      t.string :address
      t.string :email_address
      t.integer :age
      t.integer :salary
      t.integer :phone_no
      t.references :branch, index: true, foreign_key: true
    end
  end
end
