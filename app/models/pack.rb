class Pack < ApplicationRecord
    has_one_attached :image

    validates :product_name, :company_name, :price, presence: true
    validates :is_publish, exclusion: {in:[nil]}

    scope :published, -> {Pack.where(is_publish: true)}
    scope :unpublished, -> {Pack.where(is_publish: false)}

    has_many :carts, dependent: :destroy
    has_many :users, through: :carts
    has_many :order_items, dependent: :destroy
    has_many :orders, through: :order_items
end
