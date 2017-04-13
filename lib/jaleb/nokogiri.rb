require "cgi"

module Jaleb
  # This contains helper methods for Nokogiri interactions
  module Nokogiri
    module HTML
      module Document
         
      end # Document
    end # HTML
    
    module XML
      module NodeSet
        # get string from first nodeset model
        def first_string
          node = first
          case node
          # xml/html element?
          when ::Nokogiri::XML::Element 
            return node.content.sanitize
          # xml/html attribute?
          when ::Nokogiri::XML::Attr
            return node.value.sanitize
          end
        end          
        
        # convert nodeset models to an array of hashes
        #   @doc.xpath("//img")).attribute_array # => [{:element => "img", :src => ".../someimage.png"}]
        def attribute_array
          a = Array.new
          each do |node|
            temp_hash = Hash.new 
            case node 
            when ::Nokogiri::XML::Element
              temp_hash[:element] = node.name
              node.attributes.each do |key, value|
                case value
                when ::Nokogiri::XML::Attr
                  temp_hash[key.to_sym] = value.value.sanitize
                end 
              end
            end 
            a << temp_hash            
          end
          return a          
        end 
      end # Nodeset
    end # XML 
  end # Nokogiri 
end # Jaleb

::Nokogiri::HTML::Document.send(:include, ::Jaleb::Nokogiri::HTML::Document)
::Nokogiri::XML::NodeSet.send(:include, ::Jaleb::Nokogiri::XML::NodeSet)  