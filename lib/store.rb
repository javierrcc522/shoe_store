class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, {:presence => true, :length => { :maximum => 100 }})
  validates(:name, uniqueness: { case_sensitive: false })
  before_save(:uppercase)

private
  def uppercase
    array = self.name.split
    array.each do | i |
      i.capitalize!
    end
    self.name = array.join(' ')
  end
end
