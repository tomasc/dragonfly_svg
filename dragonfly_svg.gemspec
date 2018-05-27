
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dragonfly_svg/version'

Gem::Specification.new do |spec|
  spec.name          = 'dragonfly_svg'
  spec.version       = DragonflySvg::VERSION
  spec.authors       = ['Tomas Celizna']
  spec.email         = ['tomas.celizna@gmail.com']
  spec.summary       = 'Dragonfly analyser and processor for SVGs.'
  spec.description   = 'Dragonfly analyser and processor for SVGs.'
  spec.homepage      = 'https://github.com/tomasc/dragonfly_svg'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'dragonfly', '~> 1.0'
  spec.add_dependency 'nokogiri'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-reporters'
end
