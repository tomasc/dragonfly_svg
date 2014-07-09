# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dragonfly_svg/version'

Gem::Specification.new do |spec|
  spec.name          = "dragonfly_svg"
  spec.version       = DragonflySvg::VERSION
  spec.authors       = ["Tomas Celizna"]
  spec.email         = ["tomas.celizna@gmail.com"]
  spec.summary       = %q{Dragonfly analyser and processor for SVGs.}
  spec.description   = %q{Dragonfly analyser and processor for SVGs.}
  spec.homepage      = "https://github.com/tomasc/dragonfly_svg"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "dragonfly", "~> 1.0.5"
  spec.add_dependency "nokogiri", "~> 1.6.2.1"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
