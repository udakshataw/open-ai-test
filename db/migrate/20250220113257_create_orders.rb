class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table "sales.orders" do |t|
      t.string :product_name
      t.decimal :price

      t.timestamps
    end
  end
end
