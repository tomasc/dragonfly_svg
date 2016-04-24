require 'nokogiri'

module DragonflySvg
  module Processors
    class SetPreserveAspectRatio
      def call(content, value = 'xMinYMin meet')
        SetAttribute.new.call(content, "//*[name()='svg']", 'preserveAspectRatio', value)
      end
    end
  end
end
