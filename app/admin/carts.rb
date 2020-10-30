ActiveAdmin.register Cart do
belongs_to :user
  
index do
  selectable_column
  id_column
  column :quantity
  column :pack
  column "Total" do |cart|
    number_to_currency(cart.pack.price = cart.quantity)
end
actions
end
end