class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table(:brands) do |t|
      t.column(:brand, :string)
      t.column(:price, :integer)
    end
  end
end
