require "nokogiri"

module DragonflySvg
  module Processors
    class SetDimensions

      def call content, width, height
        doc = Nokogiri::XML(content.data)

        if svg_node = doc.xpath("//*[name()='svg']").first
          svg_node.set_attribute 'width', width unless width.nil?
          svg_node.set_attribute 'height', height unless height.nil?
        end

        content.update(doc.to_xml)
      end

    end
  end
end