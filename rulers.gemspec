# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rulers/version'

Gem::Specification.new do |spec|
  spec.name          = "rulers"
  spec.version       = Rulers::VERSION
  spec.authors       = ["Nicholas Case"]
  spec.email         = ["nicholascase@live.com"]
  spec.description   = %q{A Rack-based web framework like Rails}
  spec.summary       = %q{A Rack-based web framework like Rails that I wrote from scratch!}
  spec.homepage      = "https://github.com/SupahNickie/Rulers"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_runtime_dependency "rack"
  spec.add_runtime_dependency "erubis"
end
