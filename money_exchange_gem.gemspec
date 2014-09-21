# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'money_exchange_gem/version'

Gem::Specification.new do |spec|
  spec.name          = "money_exchange_gem"
  spec.version       = MoneyExchangeGem::VERSION
  spec.authors       = ["Mateusz Palyz"]
  spec.email         = ["m.palyz@pilot.co"]
  spec.summary       = "money exchange gem"
  spec.description   = "money exchange gem"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
