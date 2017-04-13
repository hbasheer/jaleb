module Jaleb
  module Model
    class << self
      #Detect model by url
      def identify(url)
        if url =~ ::URI.regexp
          uri = ::URI::parse(url)
          host = uri.host
          match_model = nil 
           for model in Jaleb.model_classes 
             match_model = model if host =~ model.regexp
           end
           return match_model

        else
          raise AgrumentError , "not a url"
        end
      end
    end
  end
end