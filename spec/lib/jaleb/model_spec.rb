require 'spec_helper'

describe Jaleb::Model do
  describe "identify" do
    it "should return the model when a valid url is used" do 
      expect(described_class.identify(FactoryGirl.build(:amazon).url)).to  eq(Jaleb::Model::Amazon)
    end 

    it "should return nil when using an unsupported domain" do
      expect(described_class.identify(FactoryGirl.build(:invalid).url)).to be_nil 
    end

    # for model in Jaleb.model_classes
    #   it "should return #{model} sym when using a #{model} domain" do
    #     described_class.identify(FactoryGirl.build(model).url).should == model
    #   end 
    # end     
  end
end  
