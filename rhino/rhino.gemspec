# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rhino/version'

Gem::Specification.new do |spec|
  spec.name          = "rhino"
  spec.version       = Rhino::VERSION
  spec.authors       = ["rhino"]
  spec.email         = ["18hino@gmail.com"]
  spec.summary       = %q{Rhino - Ruby Web Framework}
  spec.description   = %q{This is Rails-like, Rack based framework}
  spec.homepage      = "http://1rhino.github.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_runtime_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit", "~> 3.0"
  spec.add_development_dependency "minitest", "~> 5.5"
  spec.add_development_dependency "rack-test", "~> 0.6"

end
