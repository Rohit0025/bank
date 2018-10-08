class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
    	t.string :operation
    	t.string :date
    	t.integer :amount
    	t.refrences :atm, index: true, foreign_key: true
    	t.refrences :account, index: true, foreign_key: true
    end
  end
end