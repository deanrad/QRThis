class Rendering < ActiveRecord::Base
  belongs_to :qrcode
  belongs_to :slogan
  
  def options
    # TODO store and return rendering options for realz
    [
      ['leave notes', true],
      ['see visits', true],
    ]
  end
end