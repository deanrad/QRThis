class Slogan < ActiveRecord::Base
  has_many :renderings
  has_many :qrcodes, :through => :renderings do
    def create_with_options opts={}
      newqr = self.build(opts)

      opts[:text] ||= proxy_owner.text #the slogan's text
      opts[:size] ||= 6
      opts[:ecc] ||= 'q'
      
      generator = RQRCode::QRCode.new( opts[:text], :size => opts[:size].to_i, :level => opts[:ecc].to_sym)
      newqr.contents = generator.to_s
      newqr.save!
      proxy_owner.renderings.create(:qrcode_id => newqr.id)
      newqr
    end
  end
end
