class User < ActiveRecord::Base
  has_many :slogans
  has_many :user_products
end
