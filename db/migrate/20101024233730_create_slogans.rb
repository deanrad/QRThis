class CreateSlogans < ActiveRecord::Migration
  def self.up
    create_table :slogans do |t|
      t.integer :user_id
      t.text :text

      t.timestamps
    end
    
    create_table :renderings do |t|
      t.integer :qrcode_id
      t.integer :slogan_id
      
      t.integer :ecc
      t.integer :size
    end
  end

  def self.down
    drop_table :qrcode_slogans
    drop_table :slogans
  end
end
