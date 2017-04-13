# Jaleb

Jaleb is a cross-website product information fetcher by a product's url.

## Features 

* No third-party API access required (good for websites that don't even have API access) 
* Uses nokogiri for data parsing

## Supported Websites

* [Amazon](http://www.amazon.com) 
* [eBay](http://www.ebay.com)
* [Etsy](http://www.etsy.com) 
* [game.co.uk](http://www.game.co.uk)
* [Newegg](http://www.newegg.com)
* [ThinkGeek](http://www.thinkgeek.com)
* [Souq](http://www.Souq.com)



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'Jaleb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Jaleb

## Usage

### API

```ruby
require "jaleb"

product  = Jaleb.fetch "http://www.amazon.com/Avenir-Deluxe-Unicycle-20-Inch-Wheel/dp/B00165Q9F8"

product.name # => "Avenir Deluxe Unicycle (20-Inch Wheel)"

product.description # => "A wonderful unicycle"

product.images.count # => 1
product.image # => {:src => "http://ecx.images-amazon.com/images/I/41b3TNb3uCL._SL500_AA300_.jpg", :alt => "Picture of Unicycle"}
product.image.src # => "http://ecx.images-amazon.com/images/I/41b3TNb3uCL._SL500_AA300_.jpg"

product.price # => #<Money cents:500 currency:USD>
product.price.to_f # => 5.0
product.price.format # => "$5.00"  
product.price.currency.symbol # => "$"

# Get Raw Nokogiri Document
product.doc.class.name # => Nokogiri::HTML::Document

# Get list of supported websites/services
Jaleb.models # => [:amazon, :ebay, :etsy, :thinkgeek, ...]
```



## Attributes

The following attributes/method are available for a product:

* `name` - (String) The name of the product
* `description` - (String) The product's description
* `price` - (Money) A [Money](https://github.com/RubyMoney/money) object representing the product's price. This makes converting exchange rates and math functionality easy to use.
* `image` - (Hash) The main image of the product, if available. This is a hash containing standard HTML attributes: `src`, `alt`, `width`, `height`, etc.
* `images` - (Array) An array of product images.
* `doc` - The raw `Nokogiri::HTML::Document` object for the product. You can use this to pull other stuff from the product's page.


## Contributing

If you make any changes to fletcher, be sure to run the test suite before creating any pull requests.

	bundle install
	bundle exec rspec spec/

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

