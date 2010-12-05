class Merge < ActiveRecord::Base
  specifies_one :qrcode
  specifies_one :design
  
  has_many :user_products
  
  def md5
    Digest::MD5.hexdigest("design#{design.id}-qrcode#{qrcode.id}")
  end
  
  def file_path
    "design#{design.id}-qrcode#{qrcode.id}"
  end
end