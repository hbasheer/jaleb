# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Jaleb/version'

Gem::Specification.new do |spec|
  spec.name          = "Jaleb"
  spec.version       = Jaleb::VERSION
  spec.authors       = ["Hasan Basheer"]
  spec.email         = ["hasanbasher1989@gmail.com"]

  spec.summary       = %q{Easily fetch product information from third party websites such as Amazon, Souq, eBay, etc.}
  spec.homepage      = "https://github.com/hbasheer/jaleb"
  spec.license       = "MIT"



  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
