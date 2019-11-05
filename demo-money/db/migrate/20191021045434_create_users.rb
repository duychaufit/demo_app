class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :fullname
      t.string :password
      t.integer :permission

      t.timestamps
    end
  end
end
