# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ruby_sox/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Erick Johnson"]
  gem.email         = ["ejohnson82@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.add_dependency "thor"

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
