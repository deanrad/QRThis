class ActiveRecord::Base
  class << self
    # Useful synonyms 
    alias :refers_to      :belongs_to
    alias :references     :belongs_to
    alias :references_one :belongs_to
    alias :specifies      :belongs_to
    alias :specifies_one  :belongs_to
  end
end