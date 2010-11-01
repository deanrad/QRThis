require 'RMagick'
require 'rqrcode'

module RQRCode
  class QRCode
    def save_as(filename, module_size = 4)
      canvas = draw(module_size)
	  canvas.write(filename)
    end

    def to_s(module_size = 4, image_format = 'png')
      canvas = draw(module_size)
      canvas.format = image_format
      canvas.to_blob
    end

    def draw(module_size = 4)
      length = self.modules.size
      width = module_size * length
      dx = module_size * 4
      
      canvas = Magick::Image.new(width + 2* dx, width + 2 * dx, Magick::HatchFill.new('white'))    
      gc = Magick::Draw.new
      
      gc.stroke_opacity(0)
      gc.fill('black')
      
      row_cnt, col_cnt = 0, 0
      self.modules.each() { |col|
        row_cnt = 0
        col.each() { |row|
          if row
            point_tl_x, point_tl_y = dx + row_cnt * module_size,     dx + col_cnt * module_size
            point_br_x, point_br_y = point_tl_x + module_size,  point_tl_y + module_size
            gc.rectangle point_tl_x, point_tl_y, point_br_x, point_br_y
          end
          row_cnt += 1
        }
        col_cnt += 1
      }
      gc.draw(canvas)
      canvas
    end
  end
end
