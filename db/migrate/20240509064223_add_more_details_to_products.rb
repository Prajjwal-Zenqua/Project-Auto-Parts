class AddMoreDetailsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :part_number, :string
    add_column :products, :stock_quantity, :integer
  end
end
