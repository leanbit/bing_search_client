# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bing_search_client/version'

Gem::Specification.new do |spec|
  spec.name          = "bing_search_client"
  spec.version       = BingSearchClient::VERSION
  spec.authors       = ["Giacomo Macrì"]
  spec.email            = 'giacomo at leanbit dot it'

  spec.summary       = %q{Bing Search Ruby client for new v5 api}
  spec.description   = %q{A simple client to interact with Bing search API.}
  spec.homepage      = "https://github.com/leanbit/bing_search_client"
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 2.1'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 1.22"
end
