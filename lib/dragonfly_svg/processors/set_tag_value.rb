require 'nokogiri'

module DragonflySvg
  module Processors
    class SetTagValue
      def call(content, xpath, value)
        raise UnsupportedFormat unless content.ext
        raise UnsupportedFormat unless SUPPORTED_FORMATS.include?(content.ext.downcase)

        doc = Nokogiri::XML(content.data)
        doc.xpath(xpath).each do |node|
          node.inner_html = value
        end

        content.update(doc.to_xml, 'name' => 'temp.svg')
      end
    end
  end
end
