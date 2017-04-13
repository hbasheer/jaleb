require "spec_helper"

RSpec.describe Jaleb do
 describe "models" do 
    it "should return an array of symbols" do
     models = Jaleb.models
     expect(models.is_a?(Array)).to be true
    end
  end

  describe "model_classes" do 
    it "should return an array of classes" do
     models = described_class.model_classes
     expect(models.is_a?(Array)).to be true
     expect(models.first.class).to be Class
     
    end
  end

  it "has a version number" do
    expect(Jaleb::VERSION).not_to be nil
  end

end
