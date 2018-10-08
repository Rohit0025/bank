class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
    	t.string :name
    	t.string :address
    	t.integer :phone_no
    end
  end
end
