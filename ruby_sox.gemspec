# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ruby_sox/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Erick Johnson"]
  gem.email         = ["ejohnson82@gmail.com"]
  gem.description   = "RubySox provides a ruby wrapper around Sox (Sound Exchange)"
  gem.summary       = "RubySox lets you manipulate music files"
  gem.homepage      = "http://github.com/eejjjj82/ruby_sox"

  gem.add_dependency "thor"

  gem.add_development_dependency "bundler"
  gem.add_development_dependency "rspec", "~>2.9"
  gem.add_development_dependency "cucumber"
  gem.add_development_dependency "aruba"
  gem.add_development_dependency "guard"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "guard-cucumber"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ruby_sox"
  gem.require_paths = ["lib"]
  gem.version       = RubySox::VERSION
end
