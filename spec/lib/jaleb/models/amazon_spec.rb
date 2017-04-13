require 'spec_helper'

describe Jaleb, :vcr do
  describe "fetch", :vcr do
    it "should fetch amazon product" do
      item = Jaleb.fetch(FactoryGirl.build(:amazon).url)
      expect(item).not_to be_nil
      expect(item.name).not_to be_nil
      #expect(item.description).not_to be_nil
    end   
  end 
end 

def amazon_check(url)
  model = described_class.new
  model.parse Jaleb::Data.read(url)
  expect(model.name.empty?).not_to be true
  expect(model.description).not_to be true 
  expect(model.price).not_to be true 
  expect(model.image).not_to be true            
end

describe Jaleb::Model::Amazon do
  describe "parse", :vcr do
    context "with valid data" do
      %w{amazon amazon2 amazon3 amazon4}.each do |name|
        it "should fetch valid info for #{name}" do 
          amazon_check(FactoryGirl.build(name.to_sym).url)
        end         
      end 
    end
  end
end  
