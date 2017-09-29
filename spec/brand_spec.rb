require 'spec_helper'

describe(Brand) do
  it { should have_and_belong_to_many(:stores)}

  it("validates presence of description") do
    brand = Brand.new({:brand => ""})
    expect(brand.save()).to(eq(false))
  end

  it("ensures the length of description is at most 100 characters") do
    brand1 = Brand.new({:brand => "a".*(101)})
    expect(brand1.save()).to(eq(false))
  end


end
