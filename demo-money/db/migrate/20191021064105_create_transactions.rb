class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :debtorid
      t.integer :creditorid
      t.integer :amount
      t.datetime  :datedebt
      t.integer :status
      t.text  :note
      t.integer :del
      t.timestamps
    end
  end
end
