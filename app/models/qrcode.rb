class Qrcode < ActiveRecord::Base
  
  has_many :renderings
  has_many :slogans, :through => :renderings
  
  def contents
    self.contents_base64 && Base64.decode64( self.contents_base64) 
  end
  def contents= c
    self.contents_base64 = c && Base64.encode64(c)
  end
end
