class BrandsController < ApplicationController
  
  def show
    @brand = Brand.find(params[:id])
    
    #@graph_data = Brandwatch.graph_data(@brand)
    @graph = Graph.find_by_brand_id(@brand.id)
    
  end
  
  def new
    artist_name = params[:artist_name]
    
    if Brandwatch.brand_exists?(artist_name)
    
      @brand = Brandwatch.brand(artist_name)
      Brandwatch.graph_data(@brand)
      
      redirect_to brand_path(@brand)
    else
      flash[:error] = "SORRY, that brand aint covered by brandwatch"
      redirect_to artists_path
    end
  end
  
end