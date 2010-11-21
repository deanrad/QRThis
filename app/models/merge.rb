class Merge < ActiveRecord::Base
  specifies_one :qrcode
  specifies_one :template
  
  has_many :user_products
  
  def md5
    Digest::MD5.hexdigest("template#{template.id}-qrcode#{qrcode.id}")
  end
  
  def file_path
    "template#{template.id}-qrcode#{qrcode.id}"
  end
end