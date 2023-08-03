class AddSaleFieldsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :on_sale, :boolean
    add_column :products, :sale_price, :decimal
  end
end
