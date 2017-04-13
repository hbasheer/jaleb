require 'spec_helper'

describe Jaleb, :vcr do
  describe "fetch", :vcr do
    it "should return correct product info" do
      product = Jaleb.fetch FactoryGirl.build(:newegg).url
    end
  end 
end 

describe Jaleb::Model::Newegg, :vcr do
  describe "parse", :vcr do
    context "with valid data" do
      it "should return correct product info" do
        product = described_class.new
        product.parse Jaleb::Data.read(FactoryGirl.build(:newegg).url)
        product.name.should_not be_nil
        #product.description.should_not be_nil
        #product.price.should_not be_nil
        product.images.should_not be_empty
        product.image.should_not be_nil
        product.image.src.should_not be_nil
      end       
    end
  end
end