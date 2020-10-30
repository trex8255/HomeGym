class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :status, default: 0
      t.string :name
      t.string :email
      t.string :post_code
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
