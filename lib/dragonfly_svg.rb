require 'dragonfly'
require 'dragonfly_svg/plugin'
require 'dragonfly_svg/version'

module DragonflySvg
  class UnsupportedFormat < RuntimeError; end
  class UnsupportedOutputFormat < RuntimeError; end

  SUPPORTED_FORMATS = %w[svg svgz svg.gz]
  SUPPORTED_OUTPUT_FORMATS = %w[svg]
end
