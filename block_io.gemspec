# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'block_io/version'

Gem::Specification.new do |spec|
  spec.name          = "block_io"
  spec.version       = BlockIo::VERSION
  spec.authors       = ["Atif Nazir"]
  spec.email         = ["a@block.io"]
  spec.summary       = %q{An easy to use Dogecoin, Bitcoin, Litecoin wallet API by Block.io. Sign up required at Block.io.}
  spec.description   = %q{This Ruby Gem is the official reference client for the Block.io payments API. To use this, you will need the Dogecoin, Bitcoin, or Litecoin API key(s) from Block.io. Go ahead, sign up :)}
  spec.homepage      = "https://block.io/api/simple/ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 0"
  spec.add_development_dependency "minitest", ">= 5.4.2"
  spec.add_runtime_dependency "httpclient", "~> 2.4", '>= 2.4.0'
  spec.add_runtime_dependency "json", "~> 1.8", '>= 1.8.1'
  spec.add_runtime_dependency "connection_pool", "~> 2.0", '>= 2.0.0'
  spec.add_runtime_dependency "ffi", '~> 1.9', '>= 1.9.3'
end
