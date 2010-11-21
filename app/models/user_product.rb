class UserProduct < ActiveRecord::Base
  belongs_to :user
  specifies_one :product
  specifies_one :merge
end
