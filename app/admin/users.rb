ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :role
      row :created_at
    end
  end

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role
    end
    f.actions
  end

  filter :email
  filter :role
  filter :created_at
end
