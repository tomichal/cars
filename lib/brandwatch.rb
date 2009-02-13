require 'hpricot'
#require 'open-uri'
require "httparty"

require 'net/http'

class Cookie
  
  #:Cookie=>"__utma=50810234.4250948930118037500.1234516806.1234516806.1234525337.2; __utmc=50810234; __utmz=50810234.1234525337.2.2.utmcsr=twitter.com|utmccn=(referral)|utmcmd=referral|utmcct=/home; JSESSIONID=E91E5FDE387E559DD61E959E903B2A8C; subscriptionsReturnUrl=/onebrand?from-day=13&from-month=1&to-day=12&to-month=2&id=201060&brandID=201060&; sort_myBrandsTable37=0,ASC; siteAnalysis37=0; sort_site-analysis-table37=0,ASC; currentTopicsTable137=topics-keyphrase,tab-keyphrase-newest,tab-person-longterm,tab-organisation-longterm,tab-location-longterm,tab-userCreated-all"
  
  def initialize(options)
    @options = options
  end
  
  def content
    "JSESSIONID=#{@options["set-cookie"]}"
  end
  
end

class Brandwatch
  
  USERNAME = 'mack.hashup@brandwatch.net' 
  PASSWORD = 'password'
  ROOTURL = 'app.brandwatch.net'
  
  include HTTParty
  
  base_uri 'app.brandwatch.net'
  # basic_auth 'mack.hashup@brandwatch.net', 'password'
  #headers :Cookie=>"__utma=50810234.4250948930118037500.1234516806.1234516806.1234525337.2; __utmc=50810234; __utmz=50810234.1234525337.2.2.utmcsr=twitter.com|utmccn=(referral)|utmcmd=referral|utmcct=/home; JSESSIONID=E91E5FDE387E559DD61E959E903B2A8C; subscriptionsReturnUrl=/onebrand?from-day=13&from-month=1&to-day=12&to-month=2&id=201060&brandID=201060&; sort_myBrandsTable37=0,ASC; siteAnalysis37=0; sort_site-analysis-table37=0,ASC; currentTopicsTable137=topics-keyphrase,tab-keyphrase-newest,tab-person-longterm,tab-organisation-longterm,tab-location-longterm,tab-userCreated-all"

  def self.authenticate
   #open("http://#{ROOTURL}/j_acegi_security_check?j_username=#{USERNAME}&j_password=#{PASSWORD}").to_yaml
    # File.open('mystery_file', ).
    
    
#    Net::HTTP.get ROOTURL, "/j_acegi_security_check?j_username=#{USERNAME}&j_password=#{PASSWORD}"
    Net::HTTP.start(ROOTURL) {|http|
      req = Net::HTTP::Get.new("/j_acegi_security_check?j_username=#{USERNAME}&j_password=#{PASSWORD}")
      response = http.request(req)
      #puts response.to_yaml
      @cookie = Cookie.new(response)
      return @cookie
    }
    
    
    
  end

  headers :Cookie => Brandwatch.authenticate

  def self.brands(text)
    options = { :query => {:prefix => text}, :headers => @headers }
    # puts options.to_yaml
    post('/brandlist', options)
  end
  
  def self.brand_exists?(brand)
    all_brands = brands(brand)
    #puts "ALL brands: #{all_brands.to_yaml}"
    
    
    actual_brands = all_brands['page']['brands']
    return false unless actual_brands
    
    return actual_brands.has_key?('brand')      
  end
  
  # def self.authenticate
  #    options = { :query => { :j_username => USERNAME, :j_password => PASSWORD } }
  #    
  #    
  #    
  #    #response = get('/j_acegi_security_check', options)
  #    #puts response.code, response.body, response.headers.inspect
  # 
  #  end
  #  
  
  
end


