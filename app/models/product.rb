class Product < ActiveRecord::Base
  extend ActiveSupport::Memoizable

  belongs_to :vendor
  
  # JSON deserialize
  def printable_areas
    return unless areas = self.attributes['printable_areas']
    JSON.load( areas )
  end
  memoize :printable_areas
  
  def printable_area_names
    printable_areas ? printable_areas.keys : []
  end
end
