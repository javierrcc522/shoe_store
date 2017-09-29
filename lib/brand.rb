class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)

  validates(:brand, {:presence => true, :length => { :maximum => 100 }})

end
