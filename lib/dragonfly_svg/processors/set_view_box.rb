require 'nokogiri'

module DragonflySvg
  module Processors
    class SetViewBox
      def call(content, min_x, min_y, width, height)
        value = [min_x, min_y, width, height].map(&:to_s).join(' ')
        SetAttribute.new.call(content, "//*[name()='svg']", 'viewBox', value)
      end
    end
  end
end
