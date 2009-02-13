class CreateBrands < ActiveRecord::Migration
  def self.up
    create_table :brands do |t|
      t.string :brand_id
      t.string :name
      t.string :industry
      
      t.timestamps
    end
  end

  def self.down
    drop_table :brands
  end
end
