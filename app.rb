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

#Store page (dont change!)
get('/store/:id') do
  @store = Store.find(params[:id])
  @brands = Brand.all()
  @unused_brands = @brands - @store.brands
  erb(:store_info)
end

post('/add_sot/:id') do
  store = Store.find(params[:id])
  brands = Brand.all
  brand_ids = params['brand_ids']
  #joining ingredients and brands
  brand_ids.each do |brand_id|
    store.brands.push(Brand.find(brand_id))
  end
  redirect "/store/#{store.id}"
end

patch("/store/:id") do
  rename = params.fetch('rename')
  @store = Store.find(params.fetch("id").to_i())
  #renaming store
  @store.update({:name => rename})
  @store = Store.all()
  redirect '/'
end

delete("/store/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @store.delete
  @stores = Store.all()
  redirect "/"
end

#end of the store page
