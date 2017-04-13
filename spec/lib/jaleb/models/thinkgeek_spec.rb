require 'spec_helper'

describe Jaleb, :vcr do
  describe "fetch", :vcr do
    it "should fetch a thinkgeek product's information" do
      item = Jaleb.fetch(FactoryGirl.build(:thinkgeek).url)
      item.should_not be_nil
      item.image.should_not be_nil
      item.name.should_not be_nil       
      item.description.should_not be_nil 
    end   

    it "should fetch a thinkgeek product with price range" do
      item = Jaleb.fetch(FactoryGirl.build(:thinkgeek_with_price_range).url)
      item.should_not be_nil
      item.image.should_not be_nil
      item.name.should_not be_nil       
      item.description.should_not be_nil 
    end      
  end 
end 

describe Jaleb::Model::Thinkgeek, :vcr do
  describe "parse" do     
    context "with valid data" do
      it "should return correct model info" do 
        model = described_class.new
        model.parse Jaleb::Data.read(FactoryGirl.build(:thinkgeek).url)  
        model.name.should_not be_nil
        model.price.should_not be_nil                
        model.image.should_not be_nil        
      end       
    end
  end
end  
