require 'spec_helper'

describe(Store) do
  it { should have_and_belong_to_many(:brands)}

  it("validates presence of description") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
  end

  it("ensures the length of description is at most 100 characters") do
    store = Store.new({:name => "a".*(101)})
    expect(store.save()).to(eq(false))
  end

  it('prevents duplicate entries') do
    Store.create({:name => 'store'})
    store = Store.new({:name => 'store'})
    expect(store.save()).to(eq(false))
  end

  it("converts the names to uppercase") do
    store = Store.create({:name => "store"})
    expect(store.name()).to(eq("Store"))
  end

end
