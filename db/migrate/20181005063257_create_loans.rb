class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
    	t.string :type
      t.float :amount
      t.float :rate
      t.float :time
      t.refrence :user, index: true, foreign_key: true
      t.refrence :bank, index: true, foreign_key: true
    end
  end
end
