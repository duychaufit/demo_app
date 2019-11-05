class Addcolumn < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :example, :string
  end
end
