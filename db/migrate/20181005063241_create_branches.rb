class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.integer :code
      t.string :address
      t.integer :phone_no
      t.references :bank, index: true, foreign_key: true
    end
  end
end
