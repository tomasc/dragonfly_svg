require "nokogiri"

module DragonflySvg
  module Processors
    class SetViewBox

      def call content, min_x, min_y, width, height
        doc = Nokogiri::XML(content.data)

        value = [min_x, min_y, width, height].map(&:to_s).join(' ')

        if svg_node = doc.xpath("//*[name()='svg']").first
          svg_node.set_attribute 'viewBox', value
        end

        content.update(doc.to_xml)
      end

    end
  end
end