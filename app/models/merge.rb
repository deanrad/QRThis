class Merge < ActiveRecord::Base
  belongs_to :qrcode
  belongs_to :template
  
  def md5
    Digest::MD5.hexdigest("template#{template.id}-qrcode#{qrcode.id}")
  end
end