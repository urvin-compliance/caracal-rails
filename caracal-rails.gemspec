# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'caracal/rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'caracal-rails'
  spec.version       = Caracal::Rails::VERSION
  spec.authors       = ['Trade Informatics', 'John Dugan']
  spec.email         = ['jpdugan@gmail.com']
  spec.summary       = %q{ Caracal::Rails makes using Caracal in Rails a no-brainer. }
  spec.description   = %q{ Caracal::Rails takes care of registering Microsoft Word output with Rails. Essentially, this involves registering the mime type, establishing a template handler for .docx formats, and establishing sane defaults for generating professional quality Word documents. }
  spec.homepage      = 'https://github.com/ibpinc/caracal-rails'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  
  spec.add_dependency 'rails'
  
  spec.add_development_dependency 'appraisal',        '~> 1.0'
  spec.add_development_dependency 'bundler',          '~> 1.6'
  spec.add_development_dependency 'rspec-rails',      '~> 3.0'
end
