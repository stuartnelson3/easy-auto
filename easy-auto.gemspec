# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easy-auto/version'

Gem::Specification.new do |spec|
  spec.name          = "easy-auto"
  spec.version       = EasyAuto::VERSION
  spec.authors       = ["Stuart Nelson"]
  spec.email         = ["stuartnelson3@gmail.com"]
  spec.description   = %q{Easy access to git commands}
  spec.summary       = %q{Use the command line to simplify interacting with git}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "octokit"
end
