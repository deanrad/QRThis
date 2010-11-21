class Vendor < ActiveRecord::Base
  has_many :products
end
Dir["app/models/vendors/*.rb"].each{|v| require 'v'}