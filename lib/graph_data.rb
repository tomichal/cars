class GraphData
  
  attr_reader :options
  
  def initialize(options, brand)
    @options = options
    save_to_db
    
  end
  
  def save_to_db
    graph = Graph.create(:brand_id => brand.id)
    
    data_points.each do |point|
      DailyDataPoint.create({
        :graph_id => graph.id
        :date => point["date"],
        :mean_bw => point["meanBW"],
        :total_bw => point["totalBW"],
        :no_resources => point["noResources"]
      })
    end
  end
  
end