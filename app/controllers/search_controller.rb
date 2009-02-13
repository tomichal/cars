require 'net/http'
require 'hpricot'

class SearchController < ApplicationController
  def new
    @query = params[:q]
    
    response = Search.get_query(@query)
    
    render :json => response['response']['results']['doc']
  end
  
end
