module Jaleb module Model
    class Amazon < Jaleb::Model::Base # A regular expression for determining if a url comes from a specific service/website
      def self.regexp
        /amazon\.com/
      end
        
      # Parse data and look for object attributes to give to object    
      def parse(data)
        super(data)
        
        case doc
        when Nokogiri::HTML::Document
          # Get Name
          self.name = doc.css("h1#title").first_string 
          self.name = doc.xpath("string(//title)").split(" - ").first unless self.name
           
          # Get Description
          self.description = doc.css(".productDescriptionWrapper").first_string    
                
          # Get description from meta title if not found
          self.description = doc.xpath("//meta[@name='description']/@content").first_string if description.nil?
          
          # Get Price
          parse_price(doc.css("#actualPriceValue").first_string) 
          parse_price(doc.css("#priceblock_ourprice").first_string) unless self.price                  
          parse_price(doc.css("#priceblock_saleprice").first_string) unless self.price
          parse_price(doc.xpath("//span[contains(@id, 'price')]").first_string) unless self.price

          # Get Unqualified Price 
          parse_price(doc.xpath("//*[contains(@id, 'unqualifiedBuyBox')]//span").first_string) unless self.price

          # Get Used Price 
          parse_price(doc.xpath("//*[contains(@id, 'secondaryUsedAndNew')]//*[@class='price']").first_string) unless self.price


          # Get Images
          self.images = doc.xpath("//*[@data-action='main-image-click']//img").attribute_array
          self.images = doc.xpath("//*[@id='imageBlock']//img").attribute_array unless self.images

          # Get images for in-house products (kindle, etc.)
          self.images = doc.xpath("//*[@id='kib-ma-container-0']//img").attribute_array if self.images.empty?

          # Get images for third-party sellers
          self.images = doc.xpath("//*[@id='prodImageContainer']//img").attribute_array if self.images.empty?

          self.image = images.first
        end            
      end
    end
  end
end