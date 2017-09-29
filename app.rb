require("bundler/setup")
require 'pry'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

# index
get('/') do
  @brands = Brand.all()
  @stores = Store.all()
  erb(:index)
end

## brand table one
get('/create_brand') do
  @brands = Brand.all()
  @stores = Store.all()
  erb(:index)
end

post('/create_brand') do
  brand = params['brand']
  price = params['price']
  brand = Brand.create({:brand => brand, :price => price})
  @brands = Brand.all().sort_by {|brand| brand.price}
  @stores = Store.all()
  erb(:index)
end
### end of brand table

## store table two
get('/create_store') do
  @brands = Brand.all()
  @stores = Store.all()
  erb(:index)
end

post('/create_store') do
  name = params['name']
  store = Store.create({:name => name})
  @stores = Store.all().sort_by {|brand| store.name}
  @brands = Brand.all()
  erb(:index)
end
## end of table two
