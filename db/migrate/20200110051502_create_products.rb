class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :imageUrl
      t.integer :price_cents
      t.string :gender
      t.string :stripe_plan_name

      t.timestamps
    end
  end
end
