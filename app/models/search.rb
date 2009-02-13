require 'rubygems'
require 'httparty'

class Search
  include HTTParty
  format :xml
  
  base_uri 'www.discogs.com'

  def self.get_query(api_key, query)
    options = {
      :query => {
        :api_key => api_key,
        :type => 'all',
        :f => 'xml',
        :q => query        
      },
      :headers => { 'Accept-Encoding', 'gzip'}
    }
    
    get "/search", options
  end
end
