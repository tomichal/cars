class GraphData
  
  attr_reader :options
  
  def initialize(options, brand)
    @options = options
    @brand = brand
    save_to_db
    
  end
  
  def save_to_db
    graph = Graph.create(:brand_id => @brand.id)
    
    #raise @options.inspect
    brand_data = @options["brandData"]
    brand = brand_data["brand"][0]
    #raise brand.inspect
    
    days = brand["day"]
    
    
    days.each do |day|        
      DailyDataPoint.create({
         :graph_id => graph.id,
         :date => day["date"],
        :mean_bw => day["meanBW"],
         :total_bw => day["totalBW"],
         :no_resources => day["noResources"]
       })
      
    end
    
   
  end
  
end