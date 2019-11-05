class ModifiedUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :del, :integer
  end
end
