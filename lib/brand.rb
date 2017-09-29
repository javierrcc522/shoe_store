class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:brand, {:presence => true, :length => { :maximum => 100 }})
  before_save(:uppercase_description)

  private
    def uppercase_description
      self.brand=(brand().upcase())
    end
end
