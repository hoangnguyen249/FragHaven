ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role, :street_address, :city, :postal_code, :province_id

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :street_address
    column :city
    column :province
    column :postal_code
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :role
      row :street_address
      row :city
      row :province
      row :postal_code
      row :created_at
    end
  end

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role
      f.input :street_address
      f.input :city
      f.input :province
      f.input :postal_code
    end
    f.actions
  end

  filter :email
  filter :role
  filter :street_address
  filter :city
  filter :province
  filter :postal_code
  filter :created_at
end
