# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weibo_api/version'

Gem::Specification.new do |spec|
  spec.name          = "weibo_api"
  spec.version       = WeiboApi::VERSION
  spec.authors       = ["Vincent Zhu"]
  spec.email         = ["zhu1230@gmail.com"]

  spec.summary       = %q{The gem communicate with weibo api on top of OAUTH2}
  spec.description   = %q{Able to fetch tweets/info from specific account}
  spec.homepage      = "http://github.com/zhu1230"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'oauth2'
  spec.add_runtime_dependency 'hashie'
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'awesome_print'
end
