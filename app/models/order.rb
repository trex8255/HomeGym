class Order < ApplicationRecord
  belongs_to :user
  
  has_many :order_items, dependent: :destroy
  has_many :packs, through: :order_items
  
  enum status: [:before_payment, :processed, :completed, :failed]


  def product_price
    result = 0
    self.order_items.each do |order_item|
    result+=order_item.quantity*order_item.pack.price
    end
    return result
  end

  def shipping_fee
    if self.product_price > 500
      result = 0
  else
      result = 80
  end
    return result
  end

  def total_price
    result = self.shipping_fee + self.product_price
    return result
  end

end
