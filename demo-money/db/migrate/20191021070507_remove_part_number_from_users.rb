class RemovePartNumberFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :xxxx, :string
  end
end
