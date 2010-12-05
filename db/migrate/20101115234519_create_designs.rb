class CreateDesigns < ActiveRecord::Migration
  def self.up
    create_table :designs do |t|
      t.string :path
      t.string :mime_type
      t.integer :height
      t.integer :width
      t.integer :offset_left
      t.integer :offset_top
      t.integer :dpi

      t.timestamps
    end
    
    create_table :merges do |t|
      t.integer :qrcode_id
      t.integer :design_id
      t.string  :path
    end
    
  end

  def self.down
    drop_table :designs
  end
end
