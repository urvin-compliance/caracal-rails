# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'caracal/rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'caracal-rails'
  spec.version       = Caracal::Rails::VERSION
  spec.authors       = ['John Dugan']
  spec.email         = ['jpdugan@gmail.com']
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = 'https://github.com/ibpinc/caracal-rails'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'appraisal',  '~> 1.0.0'
  spec.add_development_dependency 'bundler',    '~> 1.6'
  spec.add_development_dependency 'rake'
end
