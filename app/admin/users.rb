ActiveAdmin.register User do
  index do
  selectable_column
  id_column
  column :email

  
  actions do |user|
    link_to "Check the Cart", admin_user_carts_path(user.id)
  end
end
end
