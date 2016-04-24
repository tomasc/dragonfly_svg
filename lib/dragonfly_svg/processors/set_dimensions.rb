require 'nokogiri'

module DragonflySvg
  module Processors
    class SetDimensions
      def call(content, width, height)
        SetAttribute.new.call(content, "//*[name()='svg']", 'width', width) if width
        SetAttribute.new.call(content, "//*[name()='svg']", 'height', height) if height
        content
      end
    end
  end
end
