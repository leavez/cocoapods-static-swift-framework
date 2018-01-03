# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-static-swift-framework/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-static-swift-framework'
  spec.version       = CocoapodsStaticSwiftFramework::VERSION
  spec.authors       = ['leavez']
  spec.email         = ['gaojiji@gmail.com']
  spec.description   = %q{use static framework for Swift}
  spec.summary       = %q{use static framework for Swift for cocoapods when use_frameworks!}
  spec.homepage      = 'https://github.com/leavez/cocoapods-static-swift-framework'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
