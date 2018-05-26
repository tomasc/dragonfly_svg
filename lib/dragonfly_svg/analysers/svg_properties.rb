require 'nokogiri'

module DragonflySvg
  module Analysers
    class SvgProperties
      def call(content)
        return {} unless SUPPORTED_FORMATS.include?(content.ext)
        return {} unless doc = Nokogiri::XML(content.data)
        return {} unless node = doc.xpath("//*[name()='svg']").first

        {
          'format' => content.ext.to_s,
          'width' => node.get_attribute('width').to_f,
          'height' => node.get_attribute('height').to_f,
          'id' => node.get_attribute('id')
        }
      end
    end
  end
end
