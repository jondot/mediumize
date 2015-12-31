# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mediumize/version'

Gem::Specification.new do |spec|
  spec.name          = "mediumize"
  spec.version       = Mediumize::VERSION
  spec.authors       = ["Dotan Nahum"]
  spec.email         = ["jondotan@gmail.com"]

  spec.summary       = %q{Turn your markdown style blog posts from Jekyll, middleman and others to Medium posts automatically.}
  spec.description   = %q{Turn your markdown style blog posts from Jekyll, middleman and others to Medium posts automatically.}
  spec.homepage      = "https://github.com/jondot/mediumize"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'nokogiri', '~> 1.6.7'
  spec.add_dependency 'redcarpet'
  spec.add_dependency 'rouge'
  spec.add_dependency 'medium-sdk-ruby', '~> 1.0.1'
  spec.add_dependency 'slop', '~> 4.2.1'
  spec.add_dependency 'colorize', '~> 0.7.7'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "minitest-vcr"
end
