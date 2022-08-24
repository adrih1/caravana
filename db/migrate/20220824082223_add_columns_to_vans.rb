class AddColumnsToVans < ActiveRecord::Migration[7.0]
  def change
    add_column :vans, :title, :string
    add_column :vans, :capacity, :integer
  end
end
