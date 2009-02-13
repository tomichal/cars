class Graph < ActiveRecord::Base
  
  belongs_to :brand
  has_many :daily_data_points
  
end