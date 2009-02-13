require 'rubygems'
require 'httparty'

class Search
  include HTTParty
  format :xml
  
  base_uri 'developer.echonest.com'

  def self.get_query(query)
    options = {
      :query => {
        :api_key => 'JJGW9AYXEC1K6QEYI',
        :query => URI.encode(query),
        :rows => 15,
        :version => 3
      }
    }
    
    get "/api/search_tracks", options    
  end
end
