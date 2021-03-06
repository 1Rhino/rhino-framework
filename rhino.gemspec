# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rhino/version'

Gem::Specification.new do |spec|
  spec.name          = "rhino-framework"
  spec.version       = Rhino::VERSION
  spec.authors       = ["Rhino"]
  spec.email         = ["buikhanh.bk@gmail.com"]
  spec.summary       = %q{Rhino - Ruby Web Framework}
  spec.description   = %q{This is Rack-based Ruby framework. I created it just for `Learning Ruby` and for `Fun`}
  spec.homepage      = "http://1rhino.github.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z -- lib/* bin/*`.split("\x0")
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.executables   = ['rhino']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "bundler", "~> 1.7"
  spec.add_runtime_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "erubis", "~> 2.7"
  spec.add_runtime_dependency "multi_json", "~> 1.11"
  spec.add_runtime_dependency "sqlite3", "~> 1.3"
  spec.add_development_dependency "test-unit", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "minitest", "~> 5.5"
  spec.add_development_dependency "rack-test", "~> 0.6"

end
