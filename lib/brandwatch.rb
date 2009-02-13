require 'hpricot'
#require 'open-uri'
require "httparty"

require 'net/http'

require "cgi"



class Cookie
  
  #:Cookie=>"__utma=50810234.4250948930118037500.1234516806.1234516806.1234525337.2; __utmc=50810234; __utmz=50810234.1234525337.2.2.utmcsr=twitter.com|utmccn=(referral)|utmcmd=referral|utmcct=/home; JSESSIONID=E91E5FDE387E559DD61E959E903B2A8C; subscriptionsReturnUrl=/onebrand?from-day=13&from-month=1&to-day=12&to-month=2&id=201060&brandID=201060&; sort_myBrandsTable37=0,ASC; siteAnalysis37=0; sort_site-analysis-table37=0,ASC; currentTopicsTable137=topics-keyphrase,tab-keyphrase-newest,tab-person-longterm,tab-organisation-longterm,tab-location-longterm,tab-userCreated-all"
  
  def initialize(options)
    @options = options
  end
  
  def content
    "JSESSIONID=#{@options["set-cookie"]}"
  end
  
  # def to_hash
  #     {
  #       "jessionid=#{@options["set-cookie"]}"
  #     }
  #   end
  
  # def to_hash
  #    {
  #      "jessionid" => @options["set-cookie"].split('=')[1]
  #    }
  #  end
  
  def to_hash
    # cookie = CGI::Cookie.new("jessionid", @options["set-cookie"].split('=')[1]);
    #     cgi = CGI.new("html3")
    #     cgi.out( "cookie" => [cookie] ){
    #       cgi.html{
    #         "\nHTML content here"
    #       }
    #     }
    #     
    #     cookie
    
    {
      "Content-Type" => "text/xml",
      "Content-Length" => "300",
      "Cookie" => "jessionid=E43F2D362346F2EF708A0434C7373F3D%3B"
   }
  end
  
end

class Brand
  
  attr_reader :name, :id, :industry
  
  def initialize(options)
    @name = options["name"]
    @id = options["id"]
    @industry = options["industry"]
  end

end


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
      
      
      brand = Brand.new(all_brands["page"]["brands"]["brand"])
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
     
    post('/onebrandtopicsgraphdata', options)

   end

  
end


