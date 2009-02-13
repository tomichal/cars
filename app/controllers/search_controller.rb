require 'net/http'
require 'hpricot'

class SearchController < ApplicationController
  def new
    @query = params[:q]
    
    uri = URI.parse("http://www.discogs.com/search?type=all&q=afx&f=xml&api_key=9ab68aec64")
    req = Net::HTTP::Get.new(uri.path)
    res = Net::HTTP.start(uri.host, uri.port) do |http|
      http.request(req)
    end
    


    
    

    raise res.body.inspect
    
  end
  
end
