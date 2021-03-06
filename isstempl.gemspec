# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'isstempl/version'

Gem::Specification.new do |spec|
  spec.name          = "isstempl"
  spec.version       = Isstempl::VERSION
  spec.authors       = ["tbpgr"]
  spec.email         = ["tbpgr@tbpgr.jp"]
  spec.summary       = %q{Generate GitHub Issue template.}
  spec.description   = %q{Generate GitHub Issue template from Issuetempl}
  spec.homepage      = "https://github.com/tbpgr/isstempl"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'thor', '~> 0.18.1'
  spec.add_runtime_dependency 'activemodel'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 2.14.1'
  spec.add_development_dependency 'simplecov'
end
