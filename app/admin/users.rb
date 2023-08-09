ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation
  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end
  show do
    attributes_table do
      row :id
      row :email
      row :created_at
    end
  end
  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
    end
    f.actions
  end
  filter :email
  filter :created_at


end