require 'hpricot'
require 'open-uri'
require "httparty"

class Brandwatch
  
  USERNAME = 'mack.hashup@brandwatch.net' 
  PASSWORD = 'password'
  ROOTURL = 'app.brandwatch.net'
  
  include HTTParty
  
  base_uri 'app.brandwatch.net'
  # basic_auth 'mack.hashup@brandwatch.net', 'password'
  headers :Cookie=>"__utma=50810234.4250948930118037500.1234516806.1234516806.1234525337.2; __utmc=50810234; __utmz=50810234.1234525337.2.2.utmcsr=twitter.com|utmccn=(referral)|utmcmd=referral|utmcct=/home; JSESSIONID=E91E5FDE387E559DD61E959E903B2A8C; subscriptionsReturnUrl=/onebrand?from-day=13&from-month=1&to-day=12&to-month=2&id=201060&brandID=201060&; sort_myBrandsTable37=0,ASC; siteAnalysis37=0; sort_site-analysis-table37=0,ASC; currentTopicsTable137=topics-keyphrase,tab-keyphrase-newest,tab-person-longterm,tab-organisation-longterm,tab-location-longterm,tab-userCreated-all"

  def self.brands(text)
    options = { :query => {:prefix => text}, :headers => @headers }
    # puts options.to_yaml
    post('/brandlist', options)
  end
  
  def self.find_brand(brand)
    all_brands = brands(brand)
    puts "ALL brands: #{all_brands.to_yaml}"
    
    actual_brands = all_brands['page']['brands']
    actual_brands.each_pair do |key, value|
      puts "Key: #{key}, Value: #{value}"
    end
    
  end
  
  # def self.authenticate
  #     file = open("http://#{ROOTURL}/j_acegi_security_check?j_username=#{USERNAME}&j_password=#{PASSWORD}")
  #     File.open('mystery_file', ).
  #     
  #   end
  
  # def brandlist
  #       
  # end
  
  
  
  
  
  
end
