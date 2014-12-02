require "nokogiri"

module DragonflySvg
  module Analysers
    class SvgProperties

      def call content
        node = svg_node(content)

        {
          width: node.get_attribute('width').to_f,
          height: node.get_attribute('height').to_f,
          id: node.get_attribute('id'),
          aspect_ratio: node.get_attribute('width').to_f / node.get_attribute('height').to_f
        }
      end

      private # =============================================================

      def svg_node content
        return unless doc = Nokogiri::XML(content.data)
        doc.xpath("//*[name()='svg']").first
      end

    end
  end
end