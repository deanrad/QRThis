class Template < ActiveRecord::Base
  has_many :merges
  
  def filepath
    "#{RAILS_ROOT}/templates/#{self.path}"
  end
  
  # TODO move Template#merge into offline processing
  def merge(qrcode)
    merge_record = self.merges.build( :qrcode => qrcode )
    
    templ = Magick::Image.read(self.filepath).first

    # TODO work out a problem with Magick::Image.read( qrcode.contents ) - it prefers to only read from a file ??
    qr = Magick::Image.from_blob( qrcode.contents ).first
    
    draw = Magick::Draw.new()

    composite_image = Magick::Image.new( templ.columns, templ.rows)

    # Composite template, then qr, into this draw object, then draw the draw into a new composite image
    draw.composite( 0, 0, templ.columns, templ.rows, templ) #Magick::OverCompositeOp )
    
    draw.composite( self.offset_left, self.offset_top, qr.columns, qr.rows, qr )
    draw.draw(composite_image)

    merge_filepath = "#{RAILS_ROOT}/public/images/merges/#{merge_record.file_path}.png"    
    composite_image.write(merge_filepath)

    merge_filepath
  end
end
