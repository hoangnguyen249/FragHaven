class RenameProductCategoriesTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :product_categories, :categories_products
  end
end
