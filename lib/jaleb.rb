# = Jaleb
# Author:: Hasan Basheer - 2017
require "uri"
require_relative "jaleb/version"
require_relative "jaleb/data"
require_relative "jaleb/model"
require_relative "jaleb/string"
require_relative "jaleb/nokogiri"


module Jaleb  
  LIBRARY_PATH       = File.join(File.dirname(__FILE__), 'jaleb')
  MODEL_PATH         = File.join(LIBRARY_PATH, 'models')
  
  # Module Methods
  class << self    
    # Fetch information based on url
    def fetch(url) 
      # Look for model based on url
      model_class = Jaleb::Model.identify(url)

      # Use Base class for fallback
      model_class = Jaleb::Model::Base unless model_class
      
      data = Jaleb::Data.read(url)

      product = model_class.new
      product.parse(data)

      # Save url
      product.url = url
      
      return product
    end
    

    # get array of models syms
    def models
      models = Array.new
      Dir[File.join(File.dirname(__FILE__), "jaleb", "models", "*.rb")].each do |f|
        model = File.basename(f, ".rb").to_sym
        models << model unless model == :base
      end 
      return models
    end 

    # get array of model classes
    #   Jaleb.model_classes = [Amazon, Ebay, ThinkGeek]
    def model_classes
      models = Array.new
      Dir[File.join(File.dirname(__FILE__), "jaleb", "models", "*.rb")].each do |f|
        filename = File.basename(f, ".rb")
        models << ["Jaleb", "Model", filename.camelize].join("::").constantize unless filename == "base"
      end 
      return models
    end 
  end



  # Autoload CLI
  module CLI
    autoload :Utility, File.join(CLI_PATH, 'utility')
  end

  # Autoload Models
  module Model
    autoload :Base, File.join(MODEL_PATH, "base")
    for model in Jaleb.models
      autoload model.to_s.camelize.to_sym, File.join(MODEL_PATH, model.to_s)
    end
  end     
end