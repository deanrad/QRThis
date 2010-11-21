class CreateUserProducts < ActiveRecord::Migration
  def self.up
    create_table :user_products do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :merge_id
      t.string :product_options

      t.timestamps
    end
  end

  def self.down
    drop_table :user_products
  end
end
