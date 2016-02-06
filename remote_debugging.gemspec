# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'remote_debugging/version'

Gem::Specification.new do |spec|
  spec.name          = "remote_debugging"
  spec.version       = RemoteDebugging::VERSION
  spec.authors       = ["Philipp Tessenow"]
  spec.email         = ["philipp@tessenow.org"]

  spec.summary       = %q{A generic backend to the chrome remote debugging API.}
  spec.description   = %q{Provides a backend stub to the chrome remote debugging API so that you can build a remote-debuggable thing.}
  spec.homepage      = "https://github.com/remote-debugging/remote_debugging"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'websocket-eventmachine-server'
  spec.add_runtime_dependency 'json'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
