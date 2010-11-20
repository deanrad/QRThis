class Vendor < ActiveRecord::Base
end
Dir['vendor/*.rb'].each{|v| require 'v'}