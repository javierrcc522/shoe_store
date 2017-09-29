class CreateStoresBrands < ActiveRecord::Migration[5.1]
  def change
    #order alphabetically
    create_table(:stores_brands) do |t|
      t.column(:brand_id, :integer)
      t.column(:store_id, :integer)
    end
  end
end
