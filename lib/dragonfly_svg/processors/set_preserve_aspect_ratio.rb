require 'nokogiri'

module DragonflySvg
  module Processors
    class SetPreserveAspectRatio

      def call content, value='xMinYMin meet'
        doc = Nokogiri::XML(content.data)

        if svg_node = doc.xpath("//*[name()='svg']").first
          svg_node.set_attribute 'preserveAspectRatio', value
        end

        content.update(doc.to_xml)
      end

    end
  end
end