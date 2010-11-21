class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.integer :vendor_id
      t.integer :retail_price
      t.string :printable_areas

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
