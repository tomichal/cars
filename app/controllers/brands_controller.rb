class BrandsController < ApplicationController
  
  def show
    @brand = Brand.find(params[:id])
    
    @graph_data = Brandwatch.graph_data(@brand)
    
    raise @graph_data.inspect
  end
  
  
end