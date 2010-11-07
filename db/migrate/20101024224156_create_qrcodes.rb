class CreateQrcodes < ActiveRecord::Migration
  def self.up
    create_table :qrcodes do |t|
      t.text :md5
      t.text :contents_base64
      t.text :mime_type
      t.text :string_rep

      t.timestamps
    end
  end

  def self.down
    drop_table :qrcodes
  end
end
