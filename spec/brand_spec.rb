require 'spec_helper'

describe(Brand) do
  it { should have_and_belong_to_many(:stores)}

  it("validates presence of description") do
    brand = Brand.new({:brand => ""})
    expect(brand.save()).to(eq(false))
  end

  it("ensures the length of description is at most 100 characters") do
    brand = Brand.new({:brand => "a".*(101)})
    expect(brand.save()).to(eq(false))
  end

  it("converts the names to uppercase") do
    brand = Brand.create({:brand => "nike"})
    expect(brand.brand()).to(eq("NIKE"))
  end


end
