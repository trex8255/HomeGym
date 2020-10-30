ActiveAdmin.register Pack do

  scope :all
  scope :published
  scope :unpublished

  index do
    
    selectable_column
    id_column

    column :image do |pack|
      if pack.image.attached?
        image_tag url_for(pack.image), class: "small_img"
      else
        "No image found"
    end
    end
    column :product_name
    column :company_name
    column :desc
    column :price do |pack|
      number_to_currency(pack.price)
    end
    column :is_publish
    
    actions
    end

    batch_action :publish do |ids|
      @packs = Pack.where(id: ids)

      @packs.each do |pack|
        pack.update(is_publish: true)
      end
      redirect_back(fallback_location: root_path)
    end

    batch_action :unpublish do |ids|
      @packs = Pack.where(id: ids)

      @packs.each do |pack|
        pack.update(is_publish: false)
      end
      redirect_back(fallback_location: root_path)
    end


 form do |f|
  f.inputs do
    f.input :image, as: :file
    f.input :product_name
    f.input :company_name
    f.input :desc
    f.input :price, hint: "After tax"
    f.input :is_publish
  end
  f.actions
end

show do
attributes_table do
row :id
row :image do |pack|
  if pack.image.attached?
    image_tag url_for(pack.image), class: "small_img"
  else
    "No image found"
end
end
row :product_name
row :company_name
row :desc
row :price do |pack|
  number_to_currency(pack.price)
end
row :is_publish

end
end

  
end
