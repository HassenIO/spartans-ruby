# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Spartans/version'

Gem::Specification.new do |spec|
  spec.name          = "Spartans"
  spec.version       = Spartans::VERSION
  spec.authors       = ["Hassen Taidirt"]
  spec.email         = ["htaidirt@gmail.com"]
  spec.summary       = %q{Spartans API client for ruby lovers.}
  spec.description   = %q{Spartans helps you suggest what your users love. Use this gem to interract with Spartans API in a developper-friendly way.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "coveralls"

  spec.add_dependency "curb"
end
