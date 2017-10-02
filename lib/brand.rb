class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:brand, {:presence => true, :length => { :maximum => 100 }})
  validates(:price, :presence => true)
  validates(:brand, uniqueness: { case_sensitive: false })
  before_save(:uppercase)


private
  def uppercase
    array = self.brand.split
    array.each do | i |
      i.capitalize!
    end
    self.brand = array.join(' ')
  end
end
