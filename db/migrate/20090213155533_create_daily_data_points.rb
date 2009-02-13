class CreateDailyDataPoints < ActiveRecord::Migration
  def self.up
    
    create_table :graphs do |t|
      t.integer :brand_id
      t.string :start_date
      t.string :end_date
    end
      
    
    create_table :daily_data_points do |t|
      t.integer :graph_id
      t.string :date
      t.string :end_date
      t.string :mean_bw
      t.string :no_resources
      t.string :total_bw
      
      t.timestamps
    end
  end

  def self.down
    drop_table :graphs
    drop_table :daily_data_points
  end
end
