require 'nokogiri'

module DragonflySvg
  module Analysers
    class SvgProperties
      def call(content)
        return {} unless content.ext
        return {} unless SUPPORTED_FORMATS.include?(content.ext.downcase)
        return {} unless doc = Nokogiri::XML(content.data)
        return {} unless node = doc.xpath("//*[name()='svg']").first

        {
          'format' => content.ext.to_s,
          'width' => width(node).to_f,
          'height' => height(node).to_f,
          'id' => id(node)
        }
      end

      private

      def viewBox(node)
        node.get_attribute('viewBox').to_s.split(/\s+/)
      end

      def width(node)
        node.get_attribute('width') || viewBox(node)[2]
      end

      def height(node)
        node.get_attribute('height') || viewBox(node)[3]
      end

      def id(node)
        node.get_attribute('id')
      end
    end
  end
end
