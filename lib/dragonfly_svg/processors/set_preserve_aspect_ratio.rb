require 'nokogiri'

module DragonflySvg
  module Processors
    class SetPreserveAspectRatio
      def call(content, value = 'xMinYMin meet')
        raise UnsupportedFormat unless SUPPORTED_FORMATS.include?(content.ext)
        
        SetAttribute.new.call(content, "//*[name()='svg']", 'preserveAspectRatio', value)
      end
    end
  end
end
