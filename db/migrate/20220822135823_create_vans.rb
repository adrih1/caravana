class CreateVans < ActiveRecord::Migration[7.0]
  def change
    create_table :vans do |t|
      t.text :description
      t.string :color
      t.string :location
      t.integer :price_per_day
      t.string :brand
      t.integer :mileage
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
