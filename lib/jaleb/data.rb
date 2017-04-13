require "nokogiri"
require "open-uri"


module Jaleb
  # this class is responsible for fetching and parsing data 
  class Data
 	# Get read url and get data object
  	def self.read(url )
      opt= {}
      opt['User-Agent'] = 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36'
      response = open(url, opt)
  	  doc = ::Nokogiri::HTML(response.read)
  	   # Save contents of URL/Remote File for debugging
      response.rewind
      last_response_file = File.expand_path(File.join("..", "..", "last_response"), File.dirname(__FILE__))
      File.new(last_response_file, "w+").write(response.read)
  	  return doc	
  	end
  
  end
end
