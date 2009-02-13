require 'hpricot'
#require 'open-uri'
require "httparty"

require 'net/http'

require "cgi"


# class Brand
#   
#   attr_reader :name, :id, :industry
#   
#   def initialize(options)
#     @name = options["name"]
#     @id = options["id"]
#     @industry = options["industry"]
#   end
# 
# end


class Brandwatch
  
  USERNAME = 'mack.hashup@brandwatch.net' 
  PASSWORD = 'password'
  ROOTURL = 'app.brandwatch.net'
  
  include HTTParty
  
  base_uri 'app.brandwatch.net'

  def self.authenticate

    Net::HTTP.start(ROOTURL) {|http|
      req = Net::HTTP::Get.new("/j_acegi_security_check?j_username=#{USERNAME}&j_password=#{PASSWORD}")
      response = http.request(req)
      cookie = response.response['set-cookie'].split(';')[0]
      return {"Cookie" => cookie}
    }
  end

  headers :Cookie => Brandwatch.authenticate

  def self.industry_brands(industry, prefix)
    options = { :query => {:prefix => prefix, :industries => industry}, :headers => @headers }
    post('/brandlist', options)
  end

  def self.brands(text)
    options = { :query => {:prefix => text}, :headers => @headers, :headers => @headers }
    post('/brandlist', options)
  end
  
  def self.brand_exists?(brand)
    all_brands = industry_brands('music', brand)
    
    
    actual_brands = all_brands['page']['brands']
    return false unless actual_brands
    
    return actual_brands.has_key?('brand')      
  end
  
  def self.brands_exist?(brand_1, brand_2)
    brand_exists?(brand_1) && brand_exists?(brand_2)
  end
 
  def self.brand(brand_name)
    all_brands = {}
    
    if brand_exists?(brand_name)
      all_brands = industry_brands('music', brand_name)
      
      
      brand_params = all_brands["page"]["brands"]["brand"]
      brand = Brand.create({
        :brand_id => brand_params["id"],
        :name => brand_params["name"],
        :industry => brand_params["industry"]
      })
      
      return brand
    end

    return nil
  end
  
   def self.trends(brand)
     options = { 
       "query" => {
         "brandID" => brand.id,
         "from-day" => '1',
         'to-day' => '28',
         'from-month' => '1',
         'to-month' => '2'
       },
       
       :headers => authenticate
     }
     
    puts "Options: #{options.inspect}"
     
    trend_response = post('/onebrandtopicsgraphdata', options)
    trend_data = TrendData.new(trend_response)
    trend_data
   end

  def self.metrics(brand)
    options = {
      "query" => {
        "brandID" => brand.id,
        "startDate" => "01-01-2008",
        "endDate" => "01-02-2008"
      },
       
      :headers => authenticate
    }
    
    puts "Options: #{options.inspect}"
    
    response = post('/onebrandmetricstable', options)
    response
  end

  def self.graph_data(brand)
    options = {
      "query" => {
        "id" => brand.brand_id,
        "from-day" => '1',
        'to-day' => '28',
        'from-month' => '1',
        'to-month' => '2'
      },
      
      :headers => authenticate
    }
    
    response = post('/onebrandgraphdata', options)
    graph_data = GraphData.new(response)
    graph_data
  end

  
end


