require 'dragonfly'
require 'dragonfly_svg/plugin'
require 'dragonfly_svg/version'

module DragonflySvg
  class UnsupportedFormat < RuntimeError; end

  SUPPORTED_FORMATS = %w[svg svgz svg.gz]
end
