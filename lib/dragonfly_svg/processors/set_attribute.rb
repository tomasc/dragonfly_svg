require 'nokogiri'

module DragonflySvg
  module Processors
    class SetAttribute
      def call(content, xpath, attribute_name, value)
        raise UnsupportedFormat unless SUPPORTED_FORMATS.include?(content.ext)

        doc = Nokogiri::XML(content.data)
        doc.xpath(xpath).each do |node|
          node.set_attribute attribute_name, value
        end

        content.update(doc.to_xml, 'name' => 'temp.svg')
      end
    end
  end
end
