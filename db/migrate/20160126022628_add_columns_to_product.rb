class AddColumnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :name, :string
    add_column :products, :description, :string
    add_column :products, :category, :string
    add_column :products, :sku, :string
    add_column :products, :wholesale, :decimal
    add_column :products, :retail, :decimal
  end
end
