ActiveAdmin.register Product do
  permit_params :name, :description, :price, :quantity, :category_ids, images: []

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
    column :categories
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

  controller do
    def create
      @product = Product.new(permitted_params[:product])
      @product.user = current_user

      if @product.save
        redirect_to admin_product_path(@product), notice: 'Product was successfully created.'
      else
        render :new
      end
    end
  end
  filter :name
  filter :description
  filter :price
  filter :quantity
  filter :images
  filter :category_ids
end
