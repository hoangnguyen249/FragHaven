# app/admin/product.rb

ActiveAdmin.register Product do
  permit_params :name, :description, :price, :quantity, :categories, images: []

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :quantity
    column :image do |product|
      if product.images.attached?
        image_tag(product.images.first, height: '50px')
      else
        "No Image"
      end
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :price
      row :quantity
      row :image do |product|
        if product.images.attached?
          image_tag(product.images.first, height: '100px')
        else
          "No Image"
        end
      end
      row :categories
      row :created_at
    end
  end

  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :description
      f.input :price
      f.input :quantity
      f.input :images, as: :file, input_html: { multiple: true }
      f.input :category_ids, as: :select, collection: Category.all, label: 'Category'
    end
    f.actions
  end

  filter :name
  filter :category
  filter :price
  filter :quantity
  filter :image
end
