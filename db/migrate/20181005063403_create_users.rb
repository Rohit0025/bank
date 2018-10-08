class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :marital_status
    	t.string :adderss
      t.string :date_of_birth
      t.integer :age
      t.integer :contact_no
    end
  end
end