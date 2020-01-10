class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.integer :token
      t.string :charge_id
      t.string :error_message
      t.string :customer_id
      t.integer :payment_gateway

      t.timestamps
    end
  end
end
