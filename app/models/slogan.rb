class Slogan < ActiveRecord::Base
  has_many :renderings
  has_many :qrcodes, :through => :renderings
end
