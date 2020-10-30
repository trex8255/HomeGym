class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :pack

  def verified_save
    sample_carts = self.user.carts
    remain_cart = sample_carts.find_by(pack_id: self.pack_id)

    if remain_cart.present?
      sum_quantity = remain_cart.quantity + self.quantity.to_i

      remain_cart.update(quantity: sum_quantity)
    else

      self.save
    end
  end
end
