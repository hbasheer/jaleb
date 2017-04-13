module Jaleb
  module Model
    class Souq < Jaleb::Model::Base
      # A regular expression for determining if a url comes from a specific service/website
      def self.regexp
        /souq\.com/
      end
        
      # Parse data and look for object attributes to give to object    
      def parse(data)
        super(data)
        
        case doc
        when Nokogiri::HTML::Document
          # Get Name
          self.name = doc.xpath("//meta[@property='og:title']/@content").first_string

          # Get Description
          self.description = doc.xpath("//meta[@property='og:description']/@content").first_string
  
          # Get Price
          raw_price = doc.css('h3.price').first_string
          parse_price(raw_price.gsub(/,/, "")) if raw_price
          
          # Get Images
          self.images = [{:src => doc.xpath("//meta[@property='og:image']/@content").first_string}] 
          self.image = images.first
        end            
      end
    end
  end
end