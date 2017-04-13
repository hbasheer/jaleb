require "spec_helper"
require "hashie"

FactoryGirl.define do
  factory :base, :class => Jaleb::Model::Base  do
    url "http://www.example.com"  
  end

  factory :sample, :parent => :base  do
    url "http://www.example.com"
    name "Sample Model"
    description "This is a sample description."
    raw_price "$5.00"   
  end

  factory :invalid, :parent => :base do
    url "http://invalid"
  end  

  factory :valid, :parent => :base do
    url "http://www.amazon.com/Kindle-Fire-Amazon-Tablet/dp/B0051VVOB2"
    title_xpath "//div[@class='titleSection']"
    images_xpath "//ul[@class='a-unordered-list']//img"
  end

  factory :unsupported, :parent => :base do 
    url "http://hbasheer.github.io/"
  end

  # Example Model: Philips Wake-up light
  factory :amazon, :parent => :base do
    url "http://www.amazon.com/gp/product/B0093162RM/"
  end

  # Create multiple amazon models, since markup varies greatly between products
  factory :amazon2, :parent => :base do
    url "http://www.amazon.com/gp/product/B000P4W3LU/"
  end
  
  # Model for Kindle Fire, which has very different markup
  factory :amazon3, :parent => :base do
    url "http://www.amazon.com/gp/product/B00BWYQ9YE"
  end

  # Skull Replica, Yet another type of markup
  factory :amazon4, :parent => :base do
    url "http://www.amazon.com/Life-Size-Human-Skull-Replica-Reproduction/dp/B005DEE96E"
  end

  # A book with kindle versions
  factory :amazon5, :parent => :base do 
    url "http://www.amazon.com/dp/037575721X"
  end

  # This may need to be updated if the item is expired/deleted
  factory :ebay, :parent => :base do
    url "http://www.ebay.com/itm/Unicycle-20-Silver-Chrome-Unicycles-Wheel-Cycling-Outdoor-Sports-Fitness-New-/310729787186?pt=LH_DefaultDomain_0&hash=item4858f04732"
  end

  factory :newegg, :parent => :base do
    url "http://www.newegg.com/Product/Product.aspx?Item=N82E16817111471"
  end

  factory :thinkgeek, :parent => :base do
    url "http://www.thinkgeek.com/geektoys/plush/e7f8/"
  end

  # ThinkGeek Product with hyphenated price range
  factory :thinkgeek_with_price_range, :parent => :base do
    url "http://www.thinkgeek.com/product/f131/?pfm=tshirts-apparel_newest_f131_1"
  end 

  factory :etsy, :parent => :base do
    url "https://www.etsy.com/listing/523582313/zelda-amiibo-cards-full-collection"
  end

  factory :googleshopping, :parent => :base do
    url "http://www.google.com/products/catalog?hl=en&q=xbox+360&um=1&ie=UTF-8&tbm=shop&cid=6970582693578667145&sa=X&ei=-UAuUOi7G4P80QX8hYHwDA"
  end
  
  factory :gamecouk, :parent => :base do
    url "http://www.game.co.uk/en/rise-of-nightmares-kinect-compatible-93535"
  end
  
  factory :playcom, :parent => :base do
    url "http://www.play.com/DVD/DVD/4-/14805648/-/Product.html"
  end

  factory :steam, :parent=> :base do
    url "http://store.steampowered.com/app/212580/"
  end

  # Game with Age Check
  factory :steam_agecheck, :parent=> :base do
    url "http://store.steampowered.com/app/214931/"
  end

  factory :souq, :parent => :base do
    url "http://saudi.souq.com/sa-ar/%D8%B3%D8%A7%D8%B9%D8%A9-%D9%83%D8%B1%D9%88%D9%86%D9%88%D8%AC%D8%B1%D8%A7%D9%81-%D9%85%D9%86-%D8%AA%D9%8A-%D9%81%D8%A7%D9%8A%D9%81-%D9%84%D9%84%D8%B1%D8%AC%D8%A7%D9%84-h3378g-g-82338500490/u/"
  end
end