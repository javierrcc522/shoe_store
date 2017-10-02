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

  it('prevents duplicate entries') do
    Brand.create({:brand => 'Nike'})
    brand = Brand.new({:brand => 'Nike'})
    expect(brand.save()).to(eq(false))
  end

  # it("converts the first letter to uppercase") do
  #   brand = Brand.new({:brand => "nike"})
  #   brand.save()
  #   expect(brand.brand()).to(eq("Nike"))
  # end


end
