# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'luzvimin/version'

Gem::Specification.new do |gem|
  gem.name          = "luzvimin"
  gem.version       = Luzvimin::VERSION
  gem.authors       = ["Karren Javier"]
  gem.email         = ["karrenjavier@yahoo.com"]
  gem.description   = %q{Philippine geography gem listing all regions and provinces}
  gem.summary       = %q{Philippine geography gem listing all regions and provinces} 
  gem.homepage      = "http://kjavier.github.com/luzvimin"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec", "~> 2.6"
end
