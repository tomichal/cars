class BrandsController < ApplicationController
  
  def show
    @brand = Brand.find(params[:id])
  end
  
  
end