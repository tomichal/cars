class BrandsController < ApplicationController
  
  def show
    @brand = Brand.find(params[:id])
    
    #@graph_data = Brandwatch.graph_data(@brand)
    @graph = Graph.find_by_brand_id(@brand.id)
    
  end
  
  def new
    artist_name = params[:artist_name]
    
    @brand = Brandwatch.brand(artist_name)
    Brandwatch.graph_data(@brand)
    
    redirect_to brand_path(@brand)
  end
  
end